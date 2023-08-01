Class {
	#name : #TestObserver,
	#superclass : #SimpleErrorValidationObserver,
	#category : #'ValidationSensor-Tests'
}

{ #category : #accessing }
TestObserver >> reset [
	
	validationNotifications removeAll.
]
