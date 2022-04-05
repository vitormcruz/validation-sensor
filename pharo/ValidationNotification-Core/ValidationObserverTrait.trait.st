"
ValidationObserverTrait
"
Trait {
	#name : #ValidationObserverTrait,
	#category : 'ValidationNotification-Core'
}

{ #category : #'as yet unclassified' }
ValidationObserverTrait >> errorIssued: validationErrorAnnouncement [
	
	self subclassResponsibility.
]
