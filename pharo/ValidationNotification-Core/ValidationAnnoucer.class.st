"
I am used to make validations announcements (`ValidationAnnouncement`) through an `Announcer` stored in a `ProcessLocalVariable`. That way each process or 
different context will have a different validation announcer so that validations made in different executions flows can be separated from each other.


"
Class {
	#name : #ValidationAnnoucer,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #adding }
ValidationAnnoucer class >> addValidationObserver: validationObserver [

	ValidationAnnouncement subclasses do: [ :announcement | 
		(soleInstance value) weak when: announcement 
								  send: #errorIssued: 
								  to: validationObserver.
	].
]

{ #category : #accessing }
ValidationAnnoucer class >> announce: validationAnnouncement [

	soleInstance value announce: validationAnnouncement.
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> complyMandatoryObligationNamed: aString for: aSubjectObject inContextOf: aDictionary [
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> executeValidation: validation namingIt: validationName [
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> finishValidation [
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> issueError: aString forSubject: anObject inContextOf: aDictionary [
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> issueError: anErrorString forSubject: anObject inContextOf: aDictionary asAnInstantValidationNamed: aNameString [
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> issueMandatoryObligationNamed: aString forSubject: anObject inContextOf: aDictionary [
]

{ #category : #'instance creation' }
ValidationAnnoucer class >> new [

	"New will not return an instance as it should be used only to create my sole instance that should be used internally only"
	
	soleInstance ifNotNil: [ ^ self ].
	soleInstance := super new.
]

{ #category : #accessing }
ValidationAnnoucer class >> observers [

	^ Set newFrom: ((soleInstance value subscriptions subscriptions) collect: #subscriber).
]

{ #category : #removing }
ValidationAnnoucer class >> removeAllObservers [
]

{ #category : #removing }
ValidationAnnoucer class >> removeObserver: validationObserver [
]

{ #category : #'class initialization' }
ValidationAnnoucer class >> resetSoleInstance [

	soleInstance := nil.
	self new.
]

{ #category : #testing }
ValidationAnnoucer class >> soleInstance [
	
	self error: 'You should not use my instance, use my class messages instead'.
]

{ #category : #'validation execution' }
ValidationAnnoucer class >> startValidationNamed: validationName [
]

{ #category : #inheriting }
ValidationAnnoucer >> installValue: anObject intoForked: newProcess from: ownerProcess [

	newProcess psValueAt: index put: Announcer new.
]

{ #category : #accessing }
ValidationAnnoucer >> value [

	^ super value ifNil: [ 
		self value: Announcer new.
		super value.
	].

]
