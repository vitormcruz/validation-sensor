Class {
	#name : #ValidationErrorAnnouncement,
	#superclass : #ValidationAnnouncement,
	#category : 'ValidationNotification-Core-ValidationNotification-Core'
}

{ #category : #'as yet unclassified' }
ValidationErrorAnnouncement class >> defaultSelectorListener [

	^#errorIssued:

]
