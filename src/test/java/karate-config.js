function fn() {
	var env = karate.env; // get system property 'karate.env'
							// karate.log('karate.env system)
	if (!env) {
		env = 'dev';
	}
	var config = {
		env : env,
		myVarName : 'hello karate',
		baseUrl : 'https://gorest.co.in',
		tokenID: '2370fbb5b7f62b9092320daa23c7e83aefaaf6a22a82f47bcf6da611770d70de'
	}
	if (env == 'dev') {
		// customize
		// e.g. config.foo = 'bar';

	} else if (env == 'e2e') {
		// customize
	}
	return config;
}