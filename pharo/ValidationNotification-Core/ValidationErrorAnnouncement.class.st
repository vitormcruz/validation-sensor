Class {
	#name : #ValidationErrorAnnouncement,
	#superclass : #ValidationAnnouncement,
	#instVars : [
		'errorMessage',
		'issuer',
		'context'
	],
	#category : #'ValidationNotification-Core'
}

{ #category : #'instance creation' }
ValidationErrorAnnouncement class >> newForError: aString issuedBy: anObject [

	^ self new forError: aString 
				  issuedBy: anObject.
]

{ #category : #'instance creation' }
ValidationErrorAnnouncement class >> newForError: aString issuedBy: anObject withinContext: context [

	^ self new forError: aString 
				  issuedBy: anObject 
				  withinContext: context.
]

{ #category : #accessing }
ValidationErrorAnnouncement >> context [
	^ context
	
]

{ #category : #accessing }
ValidationErrorAnnouncement >> errorMessage [
	^ errorMessage
]

{ #category : #'instance creation' }
ValidationErrorAnnouncement >> forError: aString issuedBy: anObject [

	errorMessage := aString.
	issuer := anObject.
	
]

{ #category : #'instance creation' }
ValidationErrorAnnouncement >> forError: aString issuedBy: anObject withinContext: aContext [

	errorMessage := aString.
	issuer := anObject.
	context := aContext.
	
]

{ #category : #converting }
ValidationErrorAnnouncement >> isError [

	^ true
]

{ #category : #accessing }
ValidationErrorAnnouncement >> issuer [
	^ issuer
]
