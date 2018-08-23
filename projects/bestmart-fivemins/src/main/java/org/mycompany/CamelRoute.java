package org.mycompany;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.jackson.JacksonDataFormat;
import org.apache.camel.model.dataformat.JsonLibrary;
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
	        .bindingMode(RestBindingMode.auto)
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
            
         .put("/add")
         	.to("direct://addfromPut")
         .post("/add")
         	.param().type(RestParamType.formData).name("custid").dataType("string").description("Customer Id").endParam()
         	.param().type(RestParamType.formData).name("itemid").dataType("string").description("Product Id").endParam()
         	.param().type(RestParamType.formData).name("orderamt").dataType("int").description("Order Id").endParam()
         	.param().type(RestParamType.formData).name("itemquantity").dataType("int").description("Quantity of ordered Product").endParam()
         	.param().type(RestParamType.formData).name("pickupdate").dataType("string").description("Order Pickup date").endParam()
         	.to("direct://addfromPost")
         ;
         
		
		from("direct://channel")
			.to("sql:select productcategory, sum(orderamt) as amt FROM PREORDER GROUP BY productcategory?dataSource=dataSource")
		;
		
		from("direct://orderid")
			.setBody().simple("${headers.orderid}")
			.convertBodyTo(Integer.class)
			.to("sql:select * FROM PREORDER where orderid=:#${body}?dataSource=dataSource")
		;
		
		from("direct://today")
			.setHeader("timenow").simple(" ${date:now-10H:yyyy-MM-dd HH:mm:ss}")
			.log(LoggingLevel.INFO, "${headers.timenow}")
			.to("sql:select * FROM PREORDER where pickupdate > CAST (:#timenow AS DATE)?dataSource=dataSource")
		;
		
		
		
		from("direct://addfromPut")
			.log("${body}")
			.log("ITEM ID:  ORDER AMT: ${body[orderamt]} PICKUP DATE : ${body[pickupDate]}")
			
			/*.to("sql:INSERT INTO PREORDER(orderid, productid, productname, productcategory, orderamt, pickupdate)" + 
					"SELECT max(C.orderid)+1, :#${body[item][id]}, A.productname, B.productcategory, :#${body[orderamt]}, :#${body[pickupDate]}" + 
					"FROM PRODUCT A, " + 
					"PRODUCTCATEGORY B, " + 
					"PREORDER C" + 
					"WHERE A.categoryid = B.categoryid " + 
					"AND A.productid = :#${body[item][id]} " + 
					"GROUP BY b.productcategory, A.productname;?dataSource=dataSource")*/
			.log("addfromPut -> ${body}")
		;
		
		
		
	}

}
