"
ValidationObserverTrait
"
Trait {
	#name : #TValidationObserver,
	#category : #'ValidationNotification-Core'
}

{ #category : #'error-notification' }
TValidationObserver >> compliedMandatoryObligation: mandatoryValidationName from: subject withinContext: aDictionary [

	self subclassResponsibility.
]

{ #category : #accessing }
TValidationObserver >> errorArray [

	self subclassResponsibility.
]

{ #category : #'announcement handling' }
TValidationObserver >> handleAnnouncer: announcement [

	self subclassResponsibility. 
]

{ #category : #initialization }
TValidationObserver >> initialize [

	super initialize.
	ValidationAnnouncement addValidationObserver: self.


]

{ #category : #testing }
TValidationObserver >> isValidationSuccessful [

	self subclassResponsibility.
]

{ #category : #'error-notification' }
TValidationObserver >> mandatoryObligation: mandatoryValidationName issuedFrom: subject withinContext: aDictionary [

	self subclassResponsibility.
]
