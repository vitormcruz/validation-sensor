Class {
	#name : #TestObserver,
	#superclass : #SimpleErrorValidationObserver,
	#category : #'ValidationNotification-Tests'
}

{ #category : #accessing }
TestObserver >> reset [
	
	validationNotifications removeAll.
]
