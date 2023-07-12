Class {
	#name : #ValidationErrorAnnouncementTest,
	#superclass : #TestCase,
	#category : #'Validationsensor-Tests'
}

{ #category : #tests }
ValidationErrorAnnouncementTest >> test_isError [

	self assert: ValidationErrorNotification new isError.
]
