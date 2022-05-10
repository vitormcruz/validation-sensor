Class {
	#name : #SimpleValidationObserverTest,
	#superclass : #TestCase,
	#instVars : [
		'simpleValidationObserver'
	],
	#category : #'ValidationNotification-Tests'
}

{ #category : #'tests - support' }
SimpleValidationObserverTest >> nonErrorValNotification [

	| mock |
	
	mock := ValidationAnnouncement new.
   mock stub isError willReturn: false.
	^ mock
]

{ #category : #running }
SimpleValidationObserverTest >> setUp [
	super setUp.
	
	simpleValidationObserver := TestObserver new.
	
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_N_error_notification [

	| valAnn1 valAnn2 valAnn3 |
	
	valAnn1 := ValidationErrorAnnouncement new.
	valAnn2 := ValidationErrorAnnouncement new.
	valAnn3 := ValidationErrorAnnouncement new.

	ValidationAnnouncer announce: valAnn1.
	ValidationAnnouncer announce: valAnn2.
	ValidationAnnouncer announce: valAnn3.
	self assert: simpleValidationObserver errors size equals: 3
]

{ #category : #tests }
SimpleValidationObserverTest >> test_errors_with_N_non_error_notification [

	ValidationAnnouncer announce: self nonErrorValNotification.
	ValidationAnnouncer announce: self nonErrorValNotification.
	ValidationAnnouncer announce: self nonErrorValNotification.
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_no_notification [

	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_non_error_notification [

	ValidationAnnouncer announce: (self nonErrorValNotification).
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_one_error_notification [

	ValidationAnnouncer announce: ValidationErrorAnnouncement new.
	self assert: simpleValidationObserver errors size equals: 1.
]
