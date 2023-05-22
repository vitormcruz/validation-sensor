"
I represent an object created in an invalid state. 

I store the object created with the errors reported so that my clients can inspect both:

| invalidObjectHolder |

invalidObjectHolder := InvalidObjectHolder forObject: 1 withErrors: #('error').
invalidObjectHolder errors. ""Inspect errors so that it can be shown on screen or logged.""

""Get the object created but that got some validation problem. 
Clients my attempt to recover from failure.""
invalidObjectHolder underliyngObject. 


I also play as the object atempted to be created only to signal errors for users that try to use it.
"
Class {
	#name : #ErrorObject,
	#superclass : #Object,
	#instVars : [
		'errors',
		'invalidObject'
	],
	#category : #'ValidationNotification-Core'
}

{ #category : #'instance creation' }
ErrorObject class >> forObject: anObject withErrors: aCollection [ 

	^ super new invalidObject: anObject; 
					errors: aCollection.
]

{ #category : #'as yet unclassified' }
ErrorObject >> commaSeparatedErros [

	^ ', ' join: (errors collect: #errorMessage)
]

{ #category : #'as yet unclassified' }
ErrorObject >> creationFailed [

	^ true.
]

{ #category : #accessing }
ErrorObject >> errors [
	^ errors clone.
]

{ #category : #accessor }
ErrorObject >> errors: aCollection [ 

	errors := aCollection.
]

{ #category : #'as yet unclassified' }
ErrorObject >> failOnCreationFailed [

	ValidationError signal: 'Validation failed with errors: ', self commaSeparatedErros
]

{ #category : #accessing }
ErrorObject >> invalidObject [
	^ invalidObject
]

{ #category : #accessors }
ErrorObject >> invalidObject: anObject [ 

	invalidObject := anObject.
]
