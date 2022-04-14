Class {
	#name : #ValidationAnnouncement,
	#superclass : #Announcement,
	#category : #'ValidationNotification-Core'
}

{ #category : #converting }
ValidationAnnouncement >> asValidationErrorRow [

	self subclassResponsibility.
]
