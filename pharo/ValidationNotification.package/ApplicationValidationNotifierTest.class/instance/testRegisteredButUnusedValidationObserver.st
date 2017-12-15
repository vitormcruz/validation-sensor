tests
testRegisteredButUnusedValidationObserver

	ApplicationValidationNotifier addValidationObserver: TestObserver new.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ApplicationValidationNotifier observers isEmpty ] forAtMost: 1000