"
I am used to add context to a Validation throught properties, for example:

```
	self validationGroup: 'Validate Entity1' 
		  do: [ 
		  		self issueError: 'error message'.
		  		self issueError: 'error message2'.
		  		self issueError: 'error message3'.
		  		self issueError: 'error message4'.
		  ].
	
```

In this case, I am used in the `validationGroup:do:` to define a context named 'Validate Entity1', so that all validation errors issued inside the do: block will have a 'Validate Entity1' property defined.
"
Class {
	#name : #ValidationContextPropertiesDynVar,
	#superclass : #DynamicVariable,
	#category : #'ValidationNotification-Core'
}

{ #category : #accessing }
ValidationContextPropertiesDynVar >> default [
	"Answer the default value for the variable. The default for the default value is nil."
	^ Dictionary new.
]
