Class {
	#name : #SimpleValidationObserverTest,
	#superclass : #TestCase,
	#instVars : [
		'simpleValidationObserver'
	],
	#category : #'ValidationNotification-Tests'
}

{ #category : #'tests - support' }
SimpleValidationObserverTest >> nonErrorNotification [

	| mock |
	
	mock := ValidationNotification new.
   mock stub isError willReturn: false.
	^ mock
]

{ #category : #running }
SimpleValidationObserverTest >> setUp [
	super setUp.
	
	simpleValidationObserver := TestObserver newRegistered.
	
]

{ #category : #tests }
SimpleValidationObserverTest >> test_auto_registration [

	| registeredObserver |
	
	registeredObserver := SimpleErrorValidationObserver newRegistered.
	self assert: (ValidationSensor observers includes: registeredObserver). 
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_N_error_notification [

	| valAnn1 valAnn2 valAnn3 |
	
	valAnn1 := ValidationErrorNotification new.
	valAnn2 := ValidationErrorNotification new.
	valAnn3 := ValidationErrorNotification new.

	ValidationSensor announce: valAnn1.
	ValidationSensor announce: valAnn2.
	ValidationSensor announce: valAnn3.
	self assert: simpleValidationObserver errors size equals: 3
]

{ #category : #tests }
SimpleValidationObserverTest >> test_errors_with_N_non_error_notification [

	ValidationSensor announce: self nonErrorNotification.
	ValidationSensor announce: self nonErrorNotification.
	ValidationSensor announce: self nonErrorNotification.
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_no_notification [

	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_non_error_notification [

	ValidationSensor announce: (self nonErrorNotification).
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleValidationObserverTest >> test_errors_with_one_error_notification [

	ValidationSensor announce: ValidationErrorNotification new.
	self assert: simpleValidationObserver errors size equals: 1.
]
