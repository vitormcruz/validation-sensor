Class {
	#name : #ValidationErrorNotification,
	#superclass : #ValidationNotification,
	#instVars : [
		'errorMessage',
		'issuer'
	],
	#category : #'ValidationNotification-Core'
}

{ #category : #'instance creation' }
ValidationErrorNotification class >> newForError: aString issuedBy: anObject [

	^ self new forError: aString 
				  issuedBy: anObject.
]

{ #category : #'instance creation' }
ValidationErrorNotification class >> newForError: aString issuedBy: anObject withProps: props [

	^ self new forError: aString 
				  issuedBy: anObject 
				  withProps: props.
]

{ #category : #accessing }
ValidationErrorNotification >> context [
	^ properties
	
]

{ #category : #accessing }
ValidationErrorNotification >> errorMessage [
	^ errorMessage
]

{ #category : #'instance creation' }
ValidationErrorNotification >> forError: aString issuedBy: anObject [

	errorMessage := aString.
	issuer := anObject.
	
	
]

{ #category : #'instance creation' }
ValidationErrorNotification >> forError: aString issuedBy: anObject withProps: props [

	errorMessage := aString.
	issuer := anObject.
	self properties: props.
	
]

{ #category : #converting }
ValidationErrorNotification >> isError [

	^ true
]

{ #category : #accessing }
ValidationErrorNotification >> issuer [
	^ issuer
]
