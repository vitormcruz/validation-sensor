"
I am used to announce validations announcements (`ValidationAnnouncement`) and to register validations observers.

Every registration is week, i.e., when the process in execution ends all references to observers are loosed and can be garbaged collect. 

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

{ #category : #initialization }
ValidationAnnouncer class >> initialize [ 

	self resetSoleInstance.
]

{ #category : #'instance creation' }
ValidationAnnouncer class >> new [

	self error: 'Do not use ''new'', use my class methods instead'.
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

	soleInstance := super new.
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
