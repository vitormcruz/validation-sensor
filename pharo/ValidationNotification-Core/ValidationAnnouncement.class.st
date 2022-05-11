Class {
	#name : #ValidationAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'#properties => WriteOnceSlot'
	],
	#category : #'ValidationNotification-Core'
}

{ #category : #initialization }
ValidationAnnouncement >> initialize [
	
	self class initializeSlots: self.
	super initialize.
	properties := Dictionary new.
]

{ #category : #converting }
ValidationAnnouncement >> isError [

	self subclassResponsibility.
]

{ #category : #access }
ValidationAnnouncement >> propAt: aSymbol [

	^ properties at: aSymbol ifAbsent: [ ^ nil ].
]

{ #category : #accessing }
ValidationAnnouncement >> properties: props [

	properties addAll: props asDictionary.
]
