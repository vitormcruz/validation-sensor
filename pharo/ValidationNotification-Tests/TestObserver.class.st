Class {
	#name : #TestObserver,
	#superclass : #SimpleValidationObserver,
	#category : #'ValidationNotification-Tests'
}

{ #category : #accessing }
TestObserver >> reset [
	
	validationNotifications removeAll.
]
