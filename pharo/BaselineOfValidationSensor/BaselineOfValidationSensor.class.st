Class {
	#name : #BaselineOfValidationSensor,
	#superclass : #BaselineOf,
	#category : #BaselineOfValidationSensor
}

{ #category : #baselines }
BaselineOfValidationSensor >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		
     spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.2' ].
		
		spec package: 'ValidationSensor-Core'.
		spec package: 'ValidationSensor-Tests' with: [ spec requires: #('ValidationSensor-Core' 'Mocketry') ].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationSensor-Core');
			  group: 'tests' with: #('ValidationSensor-Tests')
			
	].
		

]
