"
I autoregister me as a listener for errors and simply store all the errors issued.
"
Class {
	#name : #SimpleValidationObserver,
	#superclass : #Object,
	#traits : 'TValidationObserver',
	#classTraits : 'TValidationObserver classTrait',
	#instVars : [
		'validationNotifications'
	],
	#category : #'ValidationNotification-Core'
}

{ #category : #accessing }
SimpleValidationObserver >> errorArray [
	"Return all current errors as an array in the following format: {errorMessage. issuer. context.} "
	
	validationNotifications ifEmpty: [ ^ {  } ].
	^ validationNotifications collect: #asValidationErrorRow.
]

{ #category : #'announcement handling' }
SimpleValidationObserver >> errorIssued: validationAnnouncement [

	validationAnnouncement isError ifTrue: [ validationNotifications add: validationAnnouncement ].
]

{ #category : #accessing }
SimpleValidationObserver >> errors [
	"Return all current errors"
	
	^ validationNotifications clone.
]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> execute: aBlockClosureUnderValidation onValidationError: aBlockClosure [ 

	| result |
	
	result := aBlockClosureUnderValidation value.
	self onValidationSucess: [^ result ] 
		  onValidationError: [aBlockClosure value: self errors]
]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> execute: aBlockClosureUnderValidation onValidationSuccess: aSuccessBlockClosure onValidationError: anErrorBlockClosure [

	| result |
	
	result := aBlockClosureUnderValidation value.
	self onValidationSucess: [aSuccessBlockClosure cull: result] onValidationError: anErrorBlockClosure 
]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> initialize [

	self initializeValidationObserver.
	validationNotifications := OrderedCollection new.
]

{ #category : #testing }
SimpleValidationObserver >> isValidationSuccessful [

	^ self errorArray isEmpty.
]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> onValidationError: aBlockClosure [

	self isValidationSuccessful ifFalse: [aBlockClosure cull: self errorArray].


]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> onValidationSucess: aBlockClosure [

	self isValidationSuccessful ifTrue: aBlockClosure.


]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> onValidationSucess: aSucessBlockClosure onValidationError: anErrorBlockClosure [

	^ self isValidationSuccessful ifTrue: aSucessBlockClosure
			   							  ifFalse: [anErrorBlockClosure cull: self errors].
]
