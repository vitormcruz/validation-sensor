Extension { #name : #BlockClosure }

{ #category : #'*ValidationSensor-Core' }
BlockClosure >> failOnValidationError [

	| sensor |
	
	sensor := SimpleErrorValidationObserver newRegistered.	
	self value.
	sensor failOnValidationError.
]
