Class {
	#name : #ValidationAnnouncerClassTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #running }
ValidationAnnouncerClassTest >> setUp [
	super setUp.
	
	Smalltalk garbageCollect. 
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_2_registered_validation_observer_and_still_used [

	| validationObserver validationObserver2 |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	validationObserver2 := TestObserver new. "Hold instance so that GC cannot reclaim it."
	self assert: ValidationAnnouncer observers size equals: 2.
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_N_registered_validation_observer_and_remove_all [

	| validationObserver validationObserver2 validationObserver3 |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	validationObserver2 := TestObserver new. "Hold instance so that GC cannot reclaim it."
	validationObserver3 := TestObserver new. "Hold instance so that GC cannot reclaim it."
	ValidationAnnouncer removeAllObservers.
	self assert:	ValidationAnnouncer observers isEmpty.
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_N_registered_validation_observer_and_still_used [

	| validationObserver validationObserver2 validationObserver3 |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	validationObserver2 := TestObserver new. "Hold instance so that GC cannot reclaim it."
	validationObserver3 := TestObserver new. "Hold instance so that GC cannot reclaim it."
	self assert: ValidationAnnouncer observers size equals: 3.
]

{ #category : #'tests - issuing errors' }
ValidationAnnouncerClassTest >> test_issue_one_error [

	| valObserver |
	
	valObserver := TestObserver new.
	
	self issueError: 'One Error'.
	
	self assertCollection:  (valObserver errors collect: #errorMessage)
		   hasSameElements: #('One Error').
	
]

{ #category : #tests }
ValidationAnnouncerClassTest >> test_new_show_error [

	self should: [ ValidationAnnouncer new ] 
		raise: Error
	  whoseDescriptionIncludes:  'Do not use ''new'', use my class methods instead' 
		description: 'Did not raise error as expected'
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_registered_validation_observer_and_still_used [

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	self assertBlock: [ ValidationAnnouncer observers isNotEmpty ].
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_registered_validation_observer_but_unused [

	TestObserver new.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ValidationAnnouncer observers isEmpty ] forAtMost: 1 second asMilliSeconds.
]

{ #category : #tests }
ValidationAnnouncerClassTest >> test_resetSoleInstance [

	| previousInstance newInstance |
	
	previousInstance := ValidationAnnouncer soleInstanceForTest.
	ValidationAnnouncer resetSoleInstance.
	newInstance := ValidationAnnouncer soleInstanceForTest.
	
	self assert: newInstance class equals: ValidationAnnouncer.
	self deny: newInstance identicalTo: previousInstance.
]

{ #category : #tests }
ValidationAnnouncerClassTest >> test_soleInstance_should_render_an_error [

	self should: [ ValidationAnnouncer soleInstance ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You should not use my instance, use my class messages instead' ].
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_validation_observer_registration_in_different_threads [

	| validationObserver result |
	
	validationObserver := TestObserver new.
	
	[ result := ValidationAnnouncer observers isEmpty ] forkAndWait.

	
   self assert: result description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
	self assert: (ValidationAnnouncer observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.
]
