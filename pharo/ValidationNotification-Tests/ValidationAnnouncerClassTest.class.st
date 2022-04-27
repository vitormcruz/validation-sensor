Class {
	#name : #ValidationAnnouncerClassTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #'tests - issuing errors' }
ValidationAnnouncerClassTest >> test_issue_one_error [

	| valObserver |
	
	valObserver := TestObserver new.
	
	self issueError: 'One Error'.
	
	self assertCollection:  valObserver errorArray 
		   hasSameElements: {{'One Error'. self. Dictionary new.}}.
	
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_registered_validation_observer_and_still_used [

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	ValidationAnnouncement addValidationObserver: TestObserver new.
	self assertBlock: [ ValidationAnnouncement observers isNotEmpty ].
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_registered_validation_observer_but_unused [

	ValidationAnnouncement addValidationObserver: TestObserver new.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ValidationAnnouncement observers isEmpty ] forAtMost: 1 second asMilliSeconds.
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_validation_observer_registration_in_different_threads [

	| validationObserver result |
	
	validationObserver := TestObserver new.
	ValidationAnnouncement addValidationObserver: validationObserver.
	
	[ result := ValidationAnnouncement observers isEmpty ] forkAndWait.

	
   self assert: result description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
	self assert: (ValidationAnnouncement observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.
]
