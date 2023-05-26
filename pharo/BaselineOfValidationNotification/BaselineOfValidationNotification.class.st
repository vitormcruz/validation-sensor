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
		
     spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.1' ].
		
		spec package: 'ValidationNotification-Core'.
		spec package: 'ValidationNotification-Tests' with: [ spec requires: #('ValidationNotification-Core' 'Mocketry') ].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationNotification-Core');
			  group: 'tests' with: #('ValidationNotification-Tests')
			
	].
		

]
