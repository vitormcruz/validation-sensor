"
I autoregister me as a listener for errors and simply store all the errors issued.
"
Class {
	#name : #SimpleErrorValidationObserver,
	#superclass : #Object,
	#traits : 'TValidationObserver',
	#classTraits : 'TValidationObserver classTrait',
	#instVars : [
		'validationNotifications'
	],
	#category : #'ValidationSensor-Core'
}

{ #category : #'instance creation' }
SimpleErrorValidationObserver class >> newRegistered [

	^ self basicNew initializeRegisteringSelf.
]

{ #category : #'as yet unclassified' }
SimpleErrorValidationObserver >> commaSeparatedErros [

	^ ', ' join: (self errors collect: #errorMessage)
]

{ #category : #accessing }
SimpleErrorValidationObserver >> errors [
	"Return all current errors"
	
	^ validationNotifications clone.
]

{ #category : #'error handling' }
SimpleErrorValidationObserver >> failOnValidationError [
	
	self onValidationError: [ :errors | 	ValidationErrorException signalWithErrors: self errors ]
]

{ #category : #'announcement handling' }
SimpleErrorValidationObserver >> handleValidationAnn: validationAnnouncement [

	validationAnnouncement isError ifTrue: [ validationNotifications add: validationAnnouncement ].
]

{ #category : #initialization }
SimpleErrorValidationObserver >> initialize [

	validationNotifications := OrderedCollection new.
]

{ #category : #initialization }
SimpleErrorValidationObserver >> initializeRegisteringSelf [

	self initialize; initializeValidationObserver.
]

{ #category : #testing }
SimpleErrorValidationObserver >> isValidationSuccessful [

	^ self errors isEmpty.
]

{ #category : #testing }
SimpleErrorValidationObserver >> onValidationError: aBlockClosure [

	self isValidationSuccessful ifFalse: [ aBlockClosure cull: self errors ].


]

{ #category : #testing }
SimpleErrorValidationObserver >> onValidationSucess: aBlockClosure [

	self isValidationSuccessful ifTrue: aBlockClosure.


]

{ #category : #testing }
SimpleErrorValidationObserver >> onValidationSucess: aSucessBlockClosure onValidationError: anErrorBlockClosure [

	^ self isValidationSuccessful ifTrue: aSucessBlockClosure
			   							  ifFalse: [anErrorBlockClosure cull: self errors].
]
