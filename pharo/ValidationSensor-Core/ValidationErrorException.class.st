Class {
	#name : #ValidationErrorException,
	#superclass : #Error,
	#instVars : [
		'validationErrors'
	],
	#category : #'ValidationSensor-Core'
}

{ #category : #signalling }
ValidationErrorException class >> signalWithErrors: "ValidationErrorNotification" [ validationErrors

   self new validationErrors: validationErrors;
            signalDefaultMessage
]

{ #category : #'as yet unclassified' }
ValidationErrorException >> errorMessages [

	^ validationErrors collect: #errorMessage.
]

{ #category : #signaling }
ValidationErrorException >> signalDefaultMessage [

	self signal: 'Errors were found:', String cr, 
					  ((validationErrors collect: #errorMessage) 
								reduce: [ :err1 :err2 | err1, String cr, err2 ])
]

{ #category : #accessing }
ValidationErrorException >> validationErrors [

	^ validationErrors
]

{ #category : #accessing }
ValidationErrorException >> validationErrors: "ValidationErrorNotification" [ aValidationErrors

	validationErrors := aValidationErrors.
]
