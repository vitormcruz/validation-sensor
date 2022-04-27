Class {
	#name : #ValidationAnnouncement,
	#superclass : #Announcement,
	#category : #'ValidationNotification-Core'
}

{ #category : #adding }
ValidationAnnouncement class >> addValidationObserver: validationObserver [

	self subclasses do: [ :announcement | 
		self announcer weak when: announcement 
								 send: announcement defaultSelectorListener 
								 to: validationObserver.
	].
]

{ #category : #accessing }
ValidationAnnouncement class >> announcer [

	^ ValidationAnnoucerProcessLocal value
]

{ #category : #'validation execution' }
ValidationAnnouncement class >> complyMandatoryObligationNamed: aString for: aSubjectObject inContextOf: aDictionary [
]

{ #category : #'as yet unclassified' }
ValidationAnnouncement class >> defaultSelectorListener [

	^#errorIssued:

]

{ #category : #'validation execution' }
ValidationAnnouncement class >> executeValidation: validation namingIt: validationName [
]

{ #category : #'validation execution' }
ValidationAnnouncement class >> finishValidation [
]

{ #category : #'validation execution' }
ValidationAnnouncement class >> issueError: aString forSubject: anObject inContextOf: aDictionary [
]

{ #category : #'validation execution' }
ValidationAnnouncement class >> issueError: anErrorString forSubject: anObject inContextOf: aDictionary asAnInstantValidationNamed: aNameString [
]

{ #category : #'validation execution' }
ValidationAnnouncement class >> issueMandatoryObligationNamed: aString forSubject: anObject inContextOf: aDictionary [
]

{ #category : #accessing }
ValidationAnnouncement class >> observers [

	^ Set newFrom: ((self announcer subscriptions subscriptions) collect: #subscriber).
]

{ #category : #removing }
ValidationAnnouncement class >> removeAllObservers [
]

{ #category : #removing }
ValidationAnnouncement class >> removeObserver: validationObserver [
]

{ #category : #'validation execution' }
ValidationAnnouncement class >> startValidationNamed: validationName [
]

{ #category : #converting }
ValidationAnnouncement >> asValidationErrorRow [

	self subclassResponsibility.
]

{ #category : #converting }
ValidationAnnouncement >> isError [

	self subclassResponsibility.
]
