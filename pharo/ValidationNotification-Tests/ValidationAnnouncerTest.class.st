Class {
	#name : #ValidationAnnouncerTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #tests }
ValidationAnnouncerTest >> test_isInheritable [

	self assert: ValidationAnnoucerProcessLocal isInheritable.
]

{ #category : #tests }
ValidationAnnouncerTest >> test_new_return_self [

	self assert: ValidationAnnoucerProcessLocal new equals: ValidationAnnoucerProcessLocal.
]

{ #category : #tests }
ValidationAnnouncerTest >> test_resetSoleInstance [

	| previousInstance newInstance |
	
	previousInstance := ValidationAnnoucerProcessLocal soleInstanceForTest.
	ValidationAnnoucerProcessLocal resetSoleInstance.
	newInstance := ValidationAnnoucerProcessLocal soleInstanceForTest.
	
	self assert: newInstance class equals: ValidationAnnoucerProcessLocal.
	self deny: newInstance identicalTo: previousInstance.
]

{ #category : #tests }
ValidationAnnouncerTest >> test_soleInstance_should_render_an_error [

	self should: [ ValidationAnnoucerProcessLocal soleInstance ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You should not use my instance, use my class messages instead' ].
]
