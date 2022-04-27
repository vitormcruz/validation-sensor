"
I am used to make validations announcements (`ValidationAnnouncement`) through an `Announcer` stored in a `ProcessLocalVariable`. That way each process or 
different context will have a different validation announcer so that validations made in different executions flows can be separated from each other.


"
Class {
	#name : #ValidationAnnoucerProcessLocal,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #accessing }
ValidationAnnoucerProcessLocal class >> soleInstance [
	
	self error: 'You should not use my instance, Use my class messages instead'.
]

{ #category : #accessing }
ValidationAnnoucerProcessLocal >> value [

	^ super value ifNil: [ 
		self value: Announcer new.
		self value
	].

]
