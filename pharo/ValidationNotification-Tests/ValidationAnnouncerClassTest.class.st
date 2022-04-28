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
	
	self assertCollection:  (valObserver errors collect: #errorMessage)
		   hasSameElements: #('One Error').
	
]

{ #category : #tests }
ValidationAnnouncerClassTest >> test_new_return_self [

	self assert: ValidationAnnoucer new equals: ValidationAnnoucer.
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_registered_validation_observer_and_still_used [

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	self assertBlock: [ ValidationAnnoucer observers isNotEmpty ].
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_registered_validation_observer_but_unused [

	TestObserver new.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ValidationAnnoucer observers isEmpty ] forAtMost: 1 second asMilliSeconds.
]

{ #category : #tests }
ValidationAnnouncerClassTest >> test_resetSoleInstance [

	| previousInstance newInstance |
	
	previousInstance := ValidationAnnoucer soleInstanceForTest.
	ValidationAnnoucer resetSoleInstance.
	newInstance := ValidationAnnoucer soleInstanceForTest.
	
	self assert: newInstance class equals: ValidationAnnoucer.
	self deny: newInstance identicalTo: previousInstance.
]

{ #category : #tests }
ValidationAnnouncerClassTest >> test_soleInstance_should_render_an_error [

	self should: [ ValidationAnnoucer soleInstance ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You should not use my instance, use my class messages instead' ].
]

{ #category : #'tests - registration' }
ValidationAnnouncerClassTest >> test_validation_observer_registration_in_different_threads [

	| validationObserver result |
	
	validationObserver := TestObserver new.
	
	[ result := ValidationAnnoucer observers isEmpty ] forkAndWait.

	
   self assert: result description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
	self assert: (ValidationAnnoucer observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.
]
