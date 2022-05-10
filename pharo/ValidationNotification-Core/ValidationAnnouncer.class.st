"
I am used to make validations announcements (`ValidationAnnouncement`) through an `Announcer` stored in a `ProcessLocalVariable`. That way each process or 
different context will have a different validation announcer so that validations made in different executions flows can be separated from each other.


"
Class {
	#name : #ValidationAnnouncer,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #adding }
ValidationAnnouncer class >> addValidationObserver: validationObserver [

	(soleInstance value) weak when: ValidationAnnouncement 
									  send: #handleValidationAnn: 
									  to: validationObserver.
]

{ #category : #accessing }
ValidationAnnouncer class >> announce: validationAnnouncement [

	soleInstance value announce: validationAnnouncement.
]

{ #category : #'instance creation' }
ValidationAnnouncer class >> new [

	"New will not return an instance as it should be used only to create my sole instance that should be used internally only"
	
	soleInstance ifNotNil: [ ^ self ].
	soleInstance := super new.
]

{ #category : #accessing }
ValidationAnnouncer class >> observers [

	^ Set newFrom: ((soleInstance value subscriptions subscriptions) collect: #subscriber).
]

{ #category : #removing }
ValidationAnnouncer class >> removeAllObservers [

	| ann |
	
	ann := (soleInstance value).
	ann subscriptions reset.
]

{ #category : #'class initialization' }
ValidationAnnouncer class >> resetSoleInstance [

	soleInstance := nil.
	self new.
]

{ #category : #testing }
ValidationAnnouncer class >> soleInstance [
	
	self error: 'You should not use my instance, use my class messages instead'.
]

{ #category : #inheriting }
ValidationAnnouncer >> installValue: anObject intoForked: newProcess from: ownerProcess [

	newProcess psValueAt: index put: Announcer new.
]

{ #category : #accessing }
ValidationAnnouncer >> value [

	^ super value ifNil: [ 
		self value: Announcer new.
		super value.
	].

]
