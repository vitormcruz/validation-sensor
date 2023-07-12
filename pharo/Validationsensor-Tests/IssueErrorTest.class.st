Class {
	#name : #IssueErrorTest,
	#superclass : #TestCase,
	#instVars : [
		'validationObserver'
	],
	#category : #'Validationsensor-Tests'
}

{ #category : #running }
IssueErrorTest >> setUp [
	super setUp.
	
	validationObserver := TestObserver newRegistered.
]

{ #category : #tests }
IssueErrorTest >> test_issue_N_errors [

	self issueError: 'error message'.
	self issueError: 'error message2'.
	self issueError: 'error message3'.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message' 'error message2' 'error message3')
]

{ #category : #tests }
IssueErrorTest >> test_issue_error [

	self issueError: 'error message'.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message')
]

{ #category : #tests }
IssueErrorTest >> test_issue_error_in_group_validation [

	| errorsFromGroup |
	
	self validationGroup: 'Validate Entity1' 
		  do: [ 
		  		self issueError: 'error message'.
		  		self issueError: 'error message2'.
		  		self issueError: 'error message3'.
		  		self issueError: 'error message4'.
		  ].
	
	errorsFromGroup := validationObserver errors select: [ :err | (err propAt: #validationGroup) = 'Validate Entity1' ].
	
	self assertCollection: (errorsFromGroup collect: #errorMessage) 
		  includesAll:	#('error message' 'error message2' 'error message3' 'error message4').
]

{ #category : #tests }
IssueErrorTest >> test_issue_error_with_prop [

	self issueError: 'error message' withProps: { #field->'name' }.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message').
			
	self assert: (validationObserver errors first propAt: #field) equals: 'name'.
]

{ #category : #tests }
IssueErrorTest >> test_issue_error_with_props [

	self issueError: 'error message' withProps: { #field->'name'. #ctx1->'something'. #ctx2->'something2' }.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message').
			
	self assert: (validationObserver errors first propAt: #field) equals: 'name'.
	self assert: (validationObserver errors first propAt: #ctx1) equals: 'something'.
	self assert: (validationObserver errors first propAt: #ctx2) equals: 'something2'.
]
