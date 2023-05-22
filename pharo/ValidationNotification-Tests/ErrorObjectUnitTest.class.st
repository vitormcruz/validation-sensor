Class {
	#name : #ErrorObjectUnitTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #tests }
ErrorObjectUnitTest >> test_creationFailed_on_ErrorObject [

	self assert: ErrorObject new creationFailed.
]

{ #category : #tests }
ErrorObjectUnitTest >> test_creationFailed_on_Object [

	self deny: Object new creationFailed.
]
