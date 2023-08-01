Class {
	#name : #ValidationSensorClassTest,
	#superclass : #TestCase,
	#category : #'ValidationSensor-Tests'
}

{ #category : #running }
ValidationSensorClassTest >> setUp [
	super setUp.
	
	Smalltalk garbageCollect. 
]

{ #category : #'tests - registration' }
ValidationSensorClassTest >> test_2_registered_validation_observer_and_still_used [

	| validationObserver validationObserver2 |
	
	validationObserver := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	validationObserver2 := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	self assert: ValidationSensor observers size equals: 2.
]

{ #category : #'tests - registration' }
ValidationSensorClassTest >> test_N_registered_validation_observer_and_remove_all [

	| validationObserver validationObserver2 validationObserver3 |
	
	validationObserver := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	validationObserver2 := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	validationObserver3 := TestObserver new. "Hold instance so that GC cannot reclaim it."
	ValidationSensor removeAllObservers.
	self assert:	ValidationSensor observers isEmpty.
]

{ #category : #'tests - registration' }
ValidationSensorClassTest >> test_N_registered_validation_observer_and_still_used [

	| validationObserver validationObserver2 validationObserver3 |
	
	validationObserver := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	validationObserver2 := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	validationObserver3 := TestObserver newRegistered. "Hold instance so that GC cannot reclaim it."
	self assert: ValidationSensor observers size equals: 3.
]

{ #category : #tests }
ValidationSensorClassTest >> test_new_show_error [

	self should: [ ValidationSensor new ] 
		raise: Error
	  whoseDescriptionIncludes:  'Do not use ''new'', use my class methods instead' 
		description: 'Did not raised error as expected'
]

{ #category : #'tests - registration' }
ValidationSensorClassTest >> test_registered_validation_observer_and_still_used [

	| validationObserver |
	
	validationObserver := TestObserver newRegistered.
	self assertBlock: [ ValidationSensor observers isNotEmpty ].
]

{ #category : #'tests - registration' }
ValidationSensorClassTest >> test_registered_validation_observer_but_unused [

	TestObserver newRegistered.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ValidationSensor observers isEmpty ] forAtMost: 1 second asMilliSeconds.
]

{ #category : #tests }
ValidationSensorClassTest >> test_resetSoleInstance [

	| previousInstance newInstance |
	
	previousInstance := ValidationSensor soleInstanceForTest.
	ValidationSensor resetSoleInstance.
	newInstance := ValidationSensor soleInstanceForTest.
	
	self assert: newInstance class equals: ValidationSensor.
	self deny: newInstance identicalTo: previousInstance.
]

{ #category : #tests }
ValidationSensorClassTest >> test_soleInstance_should_render_an_error [

	self should: [ ValidationSensor soleInstance ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You should not use my instance, use my class messages instead' ].
]

{ #category : #'tests - unregistration' }
ValidationSensorClassTest >> test_unregister_All_observers [

	| validationObserver1 validationObserver2 validationObserver3 |
	
	validationObserver1 := TestObserver newRegistered. 
	validationObserver2 := TestObserver newRegistered. 
	validationObserver3 := TestObserver newRegistered. 
	ValidationSensor removeAllObservers.
	self assertBlock: [ ValidationSensor observers isEmpty ].
]

{ #category : #'tests - unregistration' }
ValidationSensorClassTest >> test_unregister_N_observers [

	| validationObserver1 validationObserver2 validationObserver3 |
	
	validationObserver1 := TestObserver newRegistered. 
	validationObserver2 := TestObserver newRegistered. 
	validationObserver3 := TestObserver newRegistered. 
	ValidationSensor removeValidationObserver: validationObserver1.
	ValidationSensor removeValidationObserver: validationObserver2.
	ValidationSensor removeValidationObserver: validationObserver3.
	self assertBlock: [ ValidationSensor observers isEmpty ].
]

{ #category : #'tests - unregistration' }
ValidationSensorClassTest >> test_unregister_observer [

	| validationObserver |
	
	validationObserver := TestObserver newRegistered. 
	ValidationSensor removeValidationObserver: validationObserver.
	self assertBlock: [ ValidationSensor observers isEmpty ].
]

{ #category : #'tests - registration' }
ValidationSensorClassTest >> test_validation_observer_registration_in_different_threads [

	| validationObserver result |
	
	validationObserver := TestObserver newRegistered.
	
	[ result := ValidationSensor observers isEmpty ] forkAndWait.

	
   self assert: result 
			description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
			
	self assert: (ValidationSensor observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.
]
