Class {
	#name : #ValidationErrorAnnouncementTest,
	#superclass : #TestCase,
	#category : #'ValidationSensor-Tests'
}

{ #category : #tests }
ValidationErrorAnnouncementTest >> test_isError [

	self assert: ValidationErrorNotification new isError.
]
