"
I am used to make validations announcements (`ValidationAnnouncement`) through an `Announcer` stored in a `ProcessLocalVariable`. That way each process or 
different context will have a different validation announcer so that validations made in different executions flows can be separated from each other.


"
Class {
	#name : #ValidationAnnoucerProcessLocal,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #testing }
ValidationAnnoucerProcessLocal class >> isInheritable [
	^ true
]

{ #category : #'instance creation' }
ValidationAnnoucerProcessLocal class >> new [

	"New will not return an instance as it should be used only to create my sole instance that should be used internally only"

	soleInstance ifNotNil: [ ^ self ].
	soleInstance := super new.

]

{ #category : #'class initialization' }
ValidationAnnoucerProcessLocal class >> resetSoleInstance [

	soleInstance := nil.
	self new.
]

{ #category : #accessing }
ValidationAnnoucerProcessLocal class >> soleInstance [
	
	self error: 'You should not use my instance, use my class messages instead'.
]

{ #category : #accessing }
ValidationAnnoucerProcessLocal >> value [

	^ super value ifNil: [ 
		self value: Announcer new.
		self value
	].

]
