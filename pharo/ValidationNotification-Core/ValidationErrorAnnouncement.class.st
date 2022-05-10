Class {
	#name : #ValidationErrorAnnouncement,
	#superclass : #ValidationAnnouncement,
	#instVars : [
		'errorMessage',
		'issuer'
	],
	#category : #'ValidationNotification-Core'
}

{ #category : #'instance creation' }
ValidationErrorAnnouncement class >> newForError: aString issuedBy: anObject [

	^ self new forError: aString 
				  issuedBy: anObject.
]

{ #category : #'instance creation' }
ValidationErrorAnnouncement class >> newForError: aString issuedBy: anObject withProps: props [

	^ self new forError: aString 
				  issuedBy: anObject 
				  withProps: props.
]

{ #category : #accessing }
ValidationErrorAnnouncement >> context [
	^ properties
	
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
ValidationErrorAnnouncement >> forError: aString issuedBy: anObject withProps: props [

	errorMessage := aString.
	issuer := anObject.
	self properties: props.
	
]

{ #category : #converting }
ValidationErrorAnnouncement >> isError [

	^ true
]

{ #category : #accessing }
ValidationErrorAnnouncement >> issuer [
	^ issuer
]
