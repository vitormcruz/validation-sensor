Class {
	#name : #ApplicationValidationNotifier,
	#superclass : #Object,
	#category : 'ValidationNotification-Core'
}

{ #category : #adding }
ApplicationValidationNotifier class >> addValidationObserver: validationObserver [

	ValidationAnnouncement subclasses do: [ :subclass | 
		self announcer weak when: subclass send: subclass defaultSelectorListener to: validationObserver.
	].
]

{ #category : #accessing }
ApplicationValidationNotifier class >> announcer [

	^ ProcessLocalObservers value
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> complyMandatoryObligationNamed: aString for: aSubjectObject inContextOf: aDictionary [
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> executeValidation: validation namingIt: validationName [
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> finishValidation [
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> issueError: aString forSubject: anObject inContextOf: aDictionary [
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> issueError: anErrorString forSubject: anObject inContextOf: aDictionary asAnInstantValidationNamed: aNameString [
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> issueMandatoryObligationNamed: aString forSubject: anObject inContextOf: aDictionary [
]

{ #category : #accessing }
ApplicationValidationNotifier class >> observers [

	^ Set newFrom: ((self announcer subscriptions subscriptions) collect: #subscriber).
]

{ #category : #removing }
ApplicationValidationNotifier class >> removeAllObservers [
]

{ #category : #removing }
ApplicationValidationNotifier class >> removeObserver: validationObserver [
]

{ #category : #'validation execution' }
ApplicationValidationNotifier class >> startValidationNamed: validationName [
]
