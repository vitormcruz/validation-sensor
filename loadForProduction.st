Metacello new
	repository: 'tonel://pharo';
	baseline: 'ValidationSensor';
	onConflict: [ :ex :pa :pb | ex useIncoming ];
	onUpgrade: [ :ex | ex useIncoming ];
	onDowngrade: [ :ex | ex useLoaded ];
	load: #(core)
