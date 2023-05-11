"
ValidationObserverTrait
"
Trait {
	#name : #TValidationObserver,
	#category : #'ValidationNotification-Core'
}

{ #category : #'announcement handling' }
TValidationObserver >> handleValidationAnn: announcement [

	self subclassResponsibility. 
]

{ #category : #initialization }
TValidationObserver >> initializeValidationObserver [

	ValidationSensor addValidationObserver: self.


]

{ #category : #testing }
TValidationObserver >> isValidationSuccessful [

	self subclassResponsibility.
]
