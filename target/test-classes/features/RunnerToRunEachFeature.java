import com.intuit.karate.junit5.Karate;

public class RunnerToRunEachFeature {
	
	@Karate.Test
	Karate getApiTest() {
		return Karate.run("getAPI").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate postApiTest() {
		return Karate.run("postAPICallWithRandomEmailData").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate putApiTest() {
		return Karate.run("updateUser").relativeTo(getClass());
	}
	
	
	@Karate.Test
	Karate deleteApiTest() {
		return Karate.run("deletAPI").relativeTo(getClass());
	}
	
	

}
