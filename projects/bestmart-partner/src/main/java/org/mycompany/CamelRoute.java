package org.mycompany;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;
import org.apache.camel.model.rest.RestParamType;
import org.springframework.stereotype.Component;

@Component
public class CamelRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {
		
		restConfiguration()
	        .component("undertow")
	        .port(8080)
	        .bindingMode(RestBindingMode.json)
	        .dataFormatProperty("prettyPrint", "true")
	        .enableCORS(true)
	        // turn on swagger api-doc
	        .apiContextPath("/api-doc")
	        .apiProperty("api.title", "User API")
	        .apiProperty("api.version", "1.0.0");

		rest("/partners").description("Partner REST service")
        .consumes("application/json")
        .produces("application/json")
        .get("/all").description("Find all inventory")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://all")
        .get("/location/{locationid}").description("Fins by Location")
        	.param().name("locationid").type(RestParamType.path).description("The ID of the warehouse location").dataType("string").endParam()
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://location")
        ;
		//.get("/all").description("Find user by ID")
		// .param().name("id").description("The ID of the user").dataType("integer").endParam()
    
		//Get Last 5 mins of data
		from("direct://all")
			.to("sql:select * from PARTNERS?dataSource=dataSource");
		
		from("direct://location")
			.log(LoggingLevel.INFO, "${headers.locationid}")
			.to("sql:select * from PARTNERS where partnerid = :#locationid ?dataSource=dataSource");
		
		

	}

}
