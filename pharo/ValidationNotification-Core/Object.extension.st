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

	ValidationAnnoucer announce: (ValidationErrorAnnouncement newForError: aValidationError 
																		   issuedBy: self).
]

{ #category : #'*ValidationNotification-Core' }
Object >> validate: aValidationBlock [

	aValidationBlock value: self.
]
