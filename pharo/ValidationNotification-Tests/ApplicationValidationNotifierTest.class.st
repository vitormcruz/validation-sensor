Class {
	#name : #ApplicationValidationNotifierTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #'tests - registration' }
ApplicationValidationNotifierTest >> test_registered_validation_observer_and_still_used [

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	ApplicationValidationNotifier addValidationObserver: TestObserver new.
	self assertBlock: [ ApplicationValidationNotifier observers isNotEmpty ].
]

{ #category : #'tests - registration' }
ApplicationValidationNotifierTest >> test_registered_validation_observer_but_unused [

	ApplicationValidationNotifier addValidationObserver: TestObserver new.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ApplicationValidationNotifier observers isEmpty ] forAtMost: 1 second asMilliSeconds.
]

{ #category : #'tests - registration' }
ApplicationValidationNotifierTest >> test_validation_observer_registration_in_different_threads [

	| validationObserver result |
	
	validationObserver := TestObserver new.
	ApplicationValidationNotifier addValidationObserver: validationObserver.
	
	[ result := ApplicationValidationNotifier observers isEmpty ] forkAndWait.

	
   self assert: result description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
	self assert: (ApplicationValidationNotifier observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.
]
