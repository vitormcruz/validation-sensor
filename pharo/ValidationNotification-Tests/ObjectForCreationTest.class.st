Class {
	#name : #ObjectForCreationTest,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationNotification-Tests'
}

{ #category : #'instance creation' }
ObjectForCreationTest class >> newInvalid [

	^ self newValidating: [ :new | new doSomethingInvalid ].

]

{ #category : #'instance creation' }
ObjectForCreationTest class >> newValid [

	^ self newValidating: [ :new | new doSomethingValid ].

]

{ #category : #'pseudo actions' }
ObjectForCreationTest >> doSomethingInvalid [

	self issueError: 'ababababa'.
]

{ #category : #'pseudo actions' }
ObjectForCreationTest >> doSomethingValid [


]
