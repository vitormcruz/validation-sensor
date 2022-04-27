Extension { #name : #Object }

{ #category : #'*ValidationNotification-Core' }
Object >> creationFailed [
	^ false.
]

{ #category : #'*ValidationNotification-Core' }
Object >> failOnCreationFailed [

	"No error, do nothing"
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueError: aValidationError [

	self issueError: aValidationError 
		  withinContext: {} asDictionary
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueError: aValidationError withinContext: aContext [

	ValidationAnnouncement announcer announce: (ValidationErrorAnnouncement newForError: aValidationError 
																								 issuedBy: self 
																								 withinContext: aContext).
]

{ #category : #'*ValidationNotification-Core' }
Object >> validate: aValidationBlock [

	aValidationBlock value: self.
]
