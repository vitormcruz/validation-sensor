"
I store a local process list of validation observers interested in validation issues made at that specific line of execution.
"
Class {
	#name : #ProcessLocalObservers,
	#superclass : #ProcessLocalVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #accessing }
ProcessLocalObservers >> value [

	^ super value ifNil: [ 
		self value: Announcer new.
		self value
	].

]
