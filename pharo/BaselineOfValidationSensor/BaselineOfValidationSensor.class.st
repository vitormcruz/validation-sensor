Class {
	#name : #BaselineOfValidationSensor,
	#superclass : #BaselineOf,
	#category : #BaselineOfValidationSensor
}

{ #category : #baselines }
BaselineOfValidationSensor >> baseline: spec [ 
    
	<baseline>
        
    spec for: #'common' do: [
        spec blessing: #'baseline';
            baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
	             project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];

            baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.2' ];
		
            package: 'ValidationSensor-Core';
            package: 'ValidationSensor-Tests' with: [ spec requires: #('ValidationSensor-Core' 'Mocketry' 'Buoy-Tests') ].
		
        spec group: 'core' with: #('ValidationSensor-Core');
             group: 'tests' with: #('ValidationSensor-Tests')
			
	].
		

]
