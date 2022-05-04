"
ValidationObserverTrait
"
Trait {
	#name : #TValidationObserver,
	#category : #'ValidationNotification-Core'
}

{ #category : #accessing }
TValidationObserver >> errorArray [

	self subclassResponsibility.
]

{ #category : #'announcement handling' }
TValidationObserver >> errorIssued: announcement [

	self subclassResponsibility. 
]

{ #category : #initialization }
TValidationObserver >> initializeValidationObserver [

	super initialize.
	ValidationAnnouncer addValidationObserver: self.


]

{ #category : #testing }
TValidationObserver >> isValidationSuccessful [

	self subclassResponsibility.
]
