"
ValidationObserverTrait
"
Trait {
	#name : #ValidationObserverTrait,
	#category : 'ValidationNotification-Core-ValidationNotification-Core'
}

{ #category : #'as yet unclassified' }
ValidationObserverTrait >> errorIssued: validationErrorAnnouncement [
	
	self subclassResponsibility.
]
