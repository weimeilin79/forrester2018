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

		rest("/fivemins").description("Dashboard REST service")
        .consumes("application/json")
        .produces("application/json")
         .get("/channel").description("Get sum amounts for Channel")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://channel")
         .get("/{orderid}").description("Get order by ID")
         	.param().name("orderid").type(RestParamType.path).description("The ID of the order").dataType("string").endParam()
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://orderid")
         .get("/today").description("Find Today's order")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://today")
         ;
		
		from("direct://channel")
			.to("sql:select productcategory, sum(orderamt) as amt FROM PREORDER GROUP BY productcategory?dataSource=dataSource")
		;
		
		from("direct://orderid")
			.to("sql:select * as amt FROM PREORDER where orderid=:#orderid?dataSource=dataSource")
		;
		
		from("direct://today")
			.setHeader("timenow").simple(" ${date:now-1d:yyyy-MM-dd HH:mm:ss}")
			.log(LoggingLevel.INFO, "${headers.timenow}")
			.to("sql:select * as amt FROM PREORDER where pickupdate>:#timenow?dataSource=dataSource")
		;
		
		
	}

}
