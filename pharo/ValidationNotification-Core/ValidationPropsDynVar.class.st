Class {
	#name : #ValidationPropsDynVar,
	#superclass : #DynamicVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #accessing }
ValidationPropsDynVar >> default [
	"Answer the default value for the variable. The default for the default value is nil."
	^ Dictionary new.
]
