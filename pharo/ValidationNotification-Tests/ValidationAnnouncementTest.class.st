Class {
	#name : #ValidationAnnouncementTest,
	#superclass : #TestCase,
	#instVars : [
		'validationObserver'
	],
	#category : #'ValidationNotification-Tests'
}

{ #category : #running }
ValidationAnnouncementTest >> setUp [
	super setUp.
	
	validationObserver := TestObserver new.
]

{ #category : #tests }
ValidationAnnouncementTest >> test_announce_N_errors [

	self issueError: 'error message'.
	self issueError: 'error message2'.
	self issueError: 'error message3'.
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message' 'error message2' 'error message3')
]

{ #category : #tests }
ValidationAnnouncementTest >> test_announce_error [

	self issueError: 'error message'.
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message')
]

{ #category : #tests }
ValidationAnnouncementTest >> test_announce_error_with_prop [

	self issueError: 'error message' withProps: { #field->'name' }.
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message').
			
	self assert: (validationObserver errors first propAt: #field) equals: 'name'.
]

{ #category : #tests }
ValidationAnnouncementTest >> test_announce_error_with_props [

	self issueError: 'error message' withProps: { #field->'name'. #ctx1->'something'. #ctx2->'something2' }.
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message').
			
	self assert: (validationObserver errors first propAt: #field) equals: 'name'.
	self assert: (validationObserver errors first propAt: #ctx1) equals: 'something'.
	self assert: (validationObserver errors first propAt: #ctx2) equals: 'something2'.
]
