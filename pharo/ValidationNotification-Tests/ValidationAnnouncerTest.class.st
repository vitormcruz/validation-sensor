Class {
	#name : #ValidationAnnouncerTest,
	#superclass : #TestCase,
	#category : #'ValidationNotification-Tests'
}

{ #category : #tests }
ValidationAnnouncerTest >> test_soleIntance_should_render_an_error [

	self should: [ ValidationAnnoucerProcessLocal soleInstance ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You should not use my instance, Use my class messages instead' ].
]
