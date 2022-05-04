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

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_N_error_notification [

	ValidationAnnouncer announce: ValidationErrorAnnouncement new.
   ValidationAnnouncer announce: ValidationErrorAnnouncement new.
	ValidationAnnouncer announce: ValidationErrorAnnouncement new.
	self assert: simpleValidationObserver errors size equals: 3.
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_N_non_error_notification [

	ValidationAnnouncer announce: StubNonErrorValAnn new.
	ValidationAnnouncer announce: StubNonErrorValAnn new.
	ValidationAnnouncer announce: StubNonErrorValAnn new.
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_no_notification [

	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_non_error_notification [

	ValidationAnnouncer announce: StubNonErrorValAnn new.
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_one_error_notification [

	ValidationAnnouncer announce: ValidationErrorAnnouncement new.
	self assert: simpleValidationObserver errors size equals: 1.
]
