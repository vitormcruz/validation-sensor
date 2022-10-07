Class {
	#name : #BaselineOfValidationNotification,
	#superclass : #BaselineOf,
	#category : #BaselineOfValidationNotification
}

{ #category : #baselines }
BaselineOfValidationNotification >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'github://vitormcruz/st_validation_notification:master/pharo'.
		
	   spec baseline: 'LangExtensions' with: [ spec repository: 'github://vitormcruz/sandbox-st:develop'; 
								 		 loads: #(core) ].

      spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.1' ].
		
		spec package: 'ValidationNotification-Core' with: [ spec requires: 'LangExtensions' ]. 
		spec package: 'ValidationNotification-Tests' with: [ spec requires: 'ValidationNotification-Core' ].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationNotification-Core');
			  group: 'tests' with: #('ValidationNotification-Tests')
			
	].
		

]
