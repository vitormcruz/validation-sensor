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
TValidationObserver >> initialize [

	super initialize.
	ValidationAnnoucer addValidationObserver: self.


]

{ #category : #testing }
TValidationObserver >> isValidationSuccessful [

	self subclassResponsibility.
]
