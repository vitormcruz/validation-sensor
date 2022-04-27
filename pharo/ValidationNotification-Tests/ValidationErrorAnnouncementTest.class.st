Class {
	#name : #ValidationErrorAnnouncementTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #tests }
ValidationErrorAnnouncementTest >> test_isError [

	self assert: ValidationErrorAnnouncement new isError.
]
