Extension { #name : #Object }

{ #category : #'*ValidationSensor-Core' }
Object >> issueError: aValidationError [

	self issueError: aValidationError withProps: Dictionary new.
]

{ #category : #'*ValidationSensor-Core' }
Object >> issueError: aValidationError withProps: props [ 

	ValidationSensor announce: (ValidationErrorNotification newForError: aValidationError 
																		       issuedBy: self
																		       withProps: (props , ValidationContextPropertiesDynVar value)).
]

{ #category : #'*ValidationSensor-Core' }
Object class >> myDefaultValidationObserverClass [

	"Uses by SimpleErrorValidationObserver default. Implement me to customize it 
	The return should be a validation observer class that registers itself as an observer throght it `new` method.
	"

	^ SimpleErrorValidationObserver .
]

{ #category : #'*ValidationSensor-Core' }
Object class >> newValidating: aCreationBlock [

	"Return the new creted object provided by the block if Ok ar raises an error with all the validations errors issueds.
	
	I pass a new clean instance to the block that can be ignored, but the block should 
	return the new object already configured.
	"

	| newObject validationObserver |
	
	validationObserver := self myDefaultValidationObserverClass newRegistered.
	newObject := aCreationBlock cull: self basicNew initialize.
	validationObserver onValidationError: [ ValidationError signal: 'Validation failed with errors: ', validationObserver commaSeparatedErros ].
	^ newObject.
]

{ #category : #'*ValidationSensor-Core' }
Object >> startValidationSensor [
	
	^ SimpleErrorValidationObserver newRegistered.	
]

{ #category : #'*ValidationSensor-Core' }
Object >> validationGroup: aString do: aFullBlockClosure [ 

	ValidationContextPropertiesDynVar value: { #validationGroup -> 'Validate Entity1' } asDictionary
								                during: aFullBlockClosure
]
