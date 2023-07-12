Class {
	#name : #TestObserver,
	#superclass : #SimpleErrorValidationObserver,
	#category : #'Validationsensor-Tests'
}

{ #category : #accessing }
TestObserver >> reset [
	
	validationNotifications removeAll.
]
