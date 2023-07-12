Class {
	#name : #ValidationNotification,
	#superclass : #Announcement,
	#instVars : [
		'#properties => WriteOnceSlot'
	],
	#category : #'ValidationSensor-Core'
}

{ #category : #initialization }
ValidationNotification >> initialize [
	
	self class initializeSlots: self.
	super initialize.
	properties := Dictionary new.
]

{ #category : #converting }
ValidationNotification >> isError [

	self subclassResponsibility.
]

{ #category : #access }
ValidationNotification >> propAt: aSymbol [

	^ properties at: aSymbol ifAbsent: [ ^ nil ].
]

{ #category : #accessing }
ValidationNotification >> properties: props [

	properties addAll: props asDictionary.
]
