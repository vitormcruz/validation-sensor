Class {
	#name : #TestObserver,
	#superclass : #Object,
	#traits : 'ValidationObserverTrait',
	#classTraits : 'ValidationObserverTrait classTrait',
	#category : 'ValidationNotification-Tests'
}

{ #category : #'as yet unclassified' }
TestObserver >> validationStarted: announcement [

	Transcript show: announcement asString; cr.
]
