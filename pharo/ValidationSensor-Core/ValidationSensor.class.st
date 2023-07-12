"
I am the main class of this framework and you can use me by my class side methods (never instanciate me!), for example:

```
ValidationSensor addValidationObserver: aValidationObserver
```

This will add aValidationObserver to my list of observers so that every validation notification will be delivered to it.
All operations occur at the execution line (thread, process, wharever), so notifications do not mix. Also All observer 
registration is week, i.e., meaning that if all pointers to an observer are loosed leaving it ready to be garbage collected. 
So you can register scope limited observers without concerning to remove it's registration:

```
doStuff

	| observer stuff |
	
	observer := AnObserver new.
	ValidationSensor addValidationObserver: observer
	
	... ""Do stuff""
	
	^ stuff ""when this method ends, observer pointer is released the AnObserver instance registered will 
				 be garbaged collected and removed from registration""
```

You can also explicitly remove an observer from observation:

```
ValidationSensor removeValidationObserver: aValidationObserver
```



"
Class {
	#name : #ValidationSensor,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationSensor-Core'
}

{ #category : #adding }
ValidationSensor class >> addValidationObserver: validationObserver [

	(soleInstance value) weak when: ValidationNotification 
									  send: #handleValidationAnn: 
									  to: validationObserver.
]

{ #category : #accessing }
ValidationSensor class >> announce: validationAnnouncement [

	soleInstance value announce: validationAnnouncement.
]

{ #category : #initialization }
ValidationSensor class >> initialize [ 

	self resetSoleInstance.
]

{ #category : #'instance creation' }
ValidationSensor class >> new [

	self error: 'Do not use ''new'', use my class methods instead'.
]

{ #category : #accessing }
ValidationSensor class >> observers [

	^ Set newFrom: ((soleInstance value subscriptions subscriptions) collect: #subscriber).
]

{ #category : #removing }
ValidationSensor class >> removeAllObservers [

	(soleInstance value) subscriptions reset.
]

{ #category : #removing }
ValidationSensor class >> removeValidationObserver: aValidationObserver [ 
	
	(soleInstance value) unsubscribe: aValidationObserver.
]

{ #category : #'class initialization' }
ValidationSensor class >> resetSoleInstance [

	soleInstance := super new.
]

{ #category : #testing }
ValidationSensor class >> soleInstance [
	
	self error: 'You should not use my instance, use my class messages instead'.
]

{ #category : #accessing }
ValidationSensor >> value [

	^ super value ifNil: [ 
		self value: Announcer new.
		super value.
	].

]
