Class {
	#name : #CreateObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'validationObserver'
	],
	#category : #'Validationsensor-Tests'
}

{ #category : #tests }
CreateObjectTest >> test_create_object_with_validation_error [

	self should: [ ObjectForCreationTest newInvalid ]
		  raise: Error 
		  whoseDescriptionIncludes:  'Validation failed with errors:'
		  description: 'Expected error didn''t happenend'

]

{ #category : #tests }
CreateObjectTest >> test_create_object_without_validation_error [

	self shouldnt: [ ObjectForCreationTest newValid ] 
	     raise: Error
]
