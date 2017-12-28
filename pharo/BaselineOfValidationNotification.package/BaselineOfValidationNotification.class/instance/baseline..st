baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'github://vitormcruz/st_validation_notification/pharo'.
		
		spec project: 'LangExtensions Core' with: [ spec repository: 'github://vitormcruz/st_langextensions/pharo'; baseline: 'LangExtensions'; load: 'core' ].
		
		spec package: 'ValidationNotification' with: [ spec requires: 'LangExtensions Core' ]. 
		spec package: 'ValidationNotification-Tests' with: [ spec requires: 'ValidationNotification' ].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationNotification');
			  group: 'tests' with: #('ValidationNotification-Tests')
			
	].
		
