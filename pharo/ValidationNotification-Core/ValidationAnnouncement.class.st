Class {
	#name : #ValidationAnnouncement,
	#superclass : #Announcement,
	#category : #'ValidationNotification-Core'
}

{ #category : #converting }
ValidationAnnouncement >> isError [

	self subclassResponsibility.
]
