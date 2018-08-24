package org.mycompany;

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

		rest("/inventory").description("Inventory service")
        .consumes("application/json")
        .produces("application/json")
        
        
        .post("/order/{partnerid}/{orderid}/{productid}/{amount}/{quantity}").description("Order Product from Inventory")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
           	.to("direct://order")
            
		
        .get("/status").description("Inventory Status")
           	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
            .to("direct://status");
		//.get("/all").description("Find user by ID")
		// .param().name("id").description("The ID of the user").dataType("integer").endParam()
    
		from("direct://order")
			.log("orderid -> [${headers.orderid}] productid -> [${headers.productid}] amount -> [${headers.amount}")
			.to("sql:INSERT INTO PARTNERS (partnerid, productid, orderamt, productcategory, productname) SELECT :#orderid, :#productid, :#amount, B.productcategory, A.productname  FROM PRODUCT A, PRODUCTCATEGORY B WHERE A.categoryid = B.categoryid AND A.productid = :#productid?dataSource=dataSource")
			.bean(InventoryService.class,"order")
			.log("${body}")
		;
		
		from("direct://status")
			.to("sql:select productcategory as PRODUCTCATEGORY, sum(orderamt) as AMT FROM PRODUCTORDER GROUP BY productcategory?dataSource=dataSource")
		;
		
		

	}

}
