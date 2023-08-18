Class {
	#name : #ObjectExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'validationObserver'
	],
	#category : #'ValidationSensor-Tests'
}

{ #category : #running }
ObjectExtensionsTest >> setUp [
	super setUp.
	
	validationObserver := TestObserver newRegistered.
]

{ #category : #'val sensing control test' }
ObjectExtensionsTest >> test_failOnValidationError [

	| validationSensor |
	
	validationSensor := self startValidationSensor.
	
	self issueError: 'error message'.
	self issueError: 'error message2'.
	self issueError: 'error message3'.
			
	self should: [ validationSensor failOnValidationError ] 
        raise: Error
		   withMessageText: 'Errors were found:', String cr,
									  'error message', String cr,
									  'error message2', String cr,
									  'error message3'
]

{ #category : #'issue error tests' }
ObjectExtensionsTest >> test_issue_N_errors [

	self issueError: 'error message'.
	self issueError: 'error message2'.
	self issueError: 'error message3'.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message' 'error message2' 'error message3')
]

{ #category : #'issue error tests' }
ObjectExtensionsTest >> test_issue_error [

	self issueError: 'error message'.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message')
]

{ #category : #'issue error tests' }
ObjectExtensionsTest >> test_issue_error_in_group_validation [

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

{ #category : #'issue error tests' }
ObjectExtensionsTest >> test_issue_error_with_prop [

	self issueError: 'error message' withProps: { #field->'name' }.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message').
			
	self assert: (validationObserver errors first propAt: #field) equals: 'name'.
]

{ #category : #'issue error tests' }
ObjectExtensionsTest >> test_issue_error_with_props [

	self issueError: 'error message' withProps: { #field->'name'. #ctx1->'something'. #ctx2->'something2' }.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message').
			
	self assert: (validationObserver errors first propAt: #field) equals: 'name'.
	self assert: (validationObserver errors first propAt: #ctx1) equals: 'something'.
	self assert: (validationObserver errors first propAt: #ctx2) equals: 'something2'.
]

{ #category : #'val sensing control test' }
ObjectExtensionsTest >> test_start_validation_sensor [

	| validationSensor |
	
	validationSensor := self startValidationSensor.
	
	self issueError: 'error message'.
	self issueError: 'error message2'.
	self issueError: 'error message3'.
	
	self assertCollection: (validationObserver errors collect: #errorMessage) 
		  includesAll:	#('error message' 'error message2' 'error message3')
]
