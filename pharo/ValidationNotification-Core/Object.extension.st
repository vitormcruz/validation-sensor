Extension { #name : #Object }

{ #category : #'*ValidationNotification-Core' }
Object >> creationFailed [
	^ false.
]

{ #category : #'*ValidationNotification-Core' }
Object >> failOnCreationFailed [

	"No error, do nothing"
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueError: aValidationError [

	self issueError: aValidationError withProps: Dictionary new.
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueError: aValidationError withProps: props [ 

	ValidationSensor announce: (ValidationErrorNotification newForError: aValidationError 
																		       issuedBy: self
																		       withProps: (props , ValidationPropsDynVar value)).
]

{ #category : #'*ValidationNotification-Core' }
Object >> validationGroup: aString do: aFullBlockClosure [ 

	ValidationPropsDynVar value: { #validationGroup -> 'Validate Entity1' } asDictionary
								 during: aFullBlockClosure
]
