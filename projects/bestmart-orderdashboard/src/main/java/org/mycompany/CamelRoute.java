package org.mycompany;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;
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

		rest("/product").description("Dashboard REST service")
        .consumes("application/json")
        .produces("application/json")
        .get("/fiveminstats").description("Provide five minutes data")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://fiveminstats")
        .get("/channel").description("Provide Channel Stats")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://channel")
		.get("/add").description("Add Order")
        	.to("direct://insert");
		//.get("/all").description("Find user by ID")
		// .param().name("id").description("The ID of the user").dataType("integer").endParam()
    
		//Get Last 5 mins of data
		from("direct://fiveminstats")
			.setHeader("timenow").simple(" ${date:now-5m:yyyy-MM-dd HH:mm:ss}")
			.log(LoggingLevel.INFO, "${headers.timenow}")
			.to("sql:select productcategory as PRODUCTCATEGORY, sum(orderamt) as AMT, date_trunc('minute',purchasetime) as timestamp FROM PRODUCTORDER GROUP BY productcategory,timestamp ORDER BY timestamp desc?dataSource=dataSource")
			.bean(SalesReportBean.class, "setGraphList");
		
		from("direct://channel")
			
			.to("sql:select productcategory as PRODUCTCATEGORY, sum(orderamt) as AMT FROM PRODUCTORDER GROUP BY productcategory?dataSource=dataSource")
		;
		
		// TODO Auto-generated method stub
		from("direct://insert")
		.setBody().simple("Test")
		.to("sql:INSERT INTO PRODUCTORDER(orderid, productname, productcategory, orderamt) VALUES (4, 'someproduct', 'Electronics & Office', 600)?dataSource=dataSource");

	}

}
