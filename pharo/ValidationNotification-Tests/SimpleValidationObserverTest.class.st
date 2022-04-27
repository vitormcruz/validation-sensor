Class {
	#name : #SimpleValidationObserverTest,
	#superclass : #TestCase,
	#instVars : [
		'simpleValidationObserver'
	],
	#category : #'ValidationNotification-Tests'
}

{ #category : #running }
SimpleValidationObserverTest >> setUp [
	super setUp.
	
	simpleValidationObserver := TestObserver new.
	
]

{ #category : #tests }
SimpleValidationObserverTest >> test_errors_with_no_notification [

	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #tests }
SimpleValidationObserverTest >> test_errors_with_non_error_notification [

	| validationAnnMock |
	
	validationAnnMock := MockObject new on: #isError respond: false.
	ValidationAnnouncement announcer announce: validationAnnMock.
	self assert: simpleValidationObserver errors isEmpty
]
