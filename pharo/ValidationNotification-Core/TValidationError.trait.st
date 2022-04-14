"
A validation error must be able to answer to the asString message.
"
Trait {
	#name : #TValidationError,
	#category : #'ValidationNotification-Core'
}

{ #category : #converting }
TValidationError >> asString [

	self subclassResponsibility.
]
