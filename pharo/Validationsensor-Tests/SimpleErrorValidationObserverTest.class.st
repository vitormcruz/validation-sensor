Class {
	#name : #SimpleErrorValidationObserverTest,
	#superclass : #TestCase,
	#instVars : [
		'simpleValidationObserver'
	],
	#category : #'Validationsensor-Tests'
}

{ #category : #'tests - support' }
SimpleErrorValidationObserverTest >> nonErrorNotification [

	| mock |
	
	mock := ValidationNotification new.
   mock stub isError willReturn: false.
	^ mock
]

{ #category : #running }
SimpleErrorValidationObserverTest >> setUp [
	super setUp.
	
	simpleValidationObserver := TestObserver newRegistered.
	
]

{ #category : #tests }
SimpleErrorValidationObserverTest >> test_auto_registration [

	| registeredObserver |
	
	registeredObserver := SimpleErrorValidationObserver newRegistered.
	self assert: (ValidationSensor observers includes: registeredObserver). 
]

{ #category : #'tests - error notification' }
SimpleErrorValidationObserverTest >> test_errors_with_N_error_notification [

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
SimpleErrorValidationObserverTest >> test_errors_with_N_non_error_notification [

	ValidationSensor announce: self nonErrorNotification.
	ValidationSensor announce: self nonErrorNotification.
	ValidationSensor announce: self nonErrorNotification.
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleErrorValidationObserverTest >> test_errors_with_no_notification [

	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleErrorValidationObserverTest >> test_errors_with_non_error_notification [

	ValidationSensor announce: (self nonErrorNotification).
	self assert: simpleValidationObserver errors isEmpty
]

{ #category : #'tests - error notification' }
SimpleErrorValidationObserverTest >> test_errors_with_one_error_notification [

	ValidationSensor announce: ValidationErrorNotification new.
	self assert: simpleValidationObserver errors size equals: 1.
]

{ #category : #tests }
SimpleErrorValidationObserverTest >> test_isValidationSuccessfull_with_error [


	self assert: simpleValidationObserver isValidationSuccessful.
]

{ #category : #tests }
SimpleErrorValidationObserverTest >> test_isValidationSuccessfull_without_error [

	ValidationSensor announce: ValidationErrorNotification new.
	self deny: simpleValidationObserver isValidationSuccessful.
]
