package org.mycompany;

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
	        .contextPath("/bestmart")
	        .dataFormatProperty("prettyPrint", "true")
	        .enableCORS(true)
	        // turn on swagger api-doc
	        .apiContextPath("/api-doc")
	        .apiProperty("api.title", "User API")
	        .apiProperty("api.version", "1.0.0");

		rest()
        .post("/order/{customerid}/{orderamt}")
            .description("Order for Accounting")
            .param()
            	.type(RestParamType.path)
                .name("customerid")
                .dataType("integer")
                .required(true)
                .description("Customer ID")
            .endParam()
            .param()
	        	.type(RestParamType.path)
	            .name("orderamt")
	            .dataType("integer")
	            .required(true)
	            .description("Total Order Amount")
	        .endParam()
            .to("direct:ordertransaction")
        .post("/cancel/{customerid}/{orderamt}")
            .description("Order for Accounting")
            .param()
            	.type(RestParamType.path)
                .name("customerid")
                .dataType("integer")
                .required(true)
                .description("Customer ID")
            .endParam()
            .param()
	        	.type(RestParamType.path)
	            .name("orderamt")
	            .dataType("integer")
	            .required(true)
	            .description("Total Order Amount")
	        .endParam()
            .to("direct:ordercancel")
		.get("/order/{customerid}")
	        .description("Get customer information")
	        .param()
	            .name("customerid")
	            .type(RestParamType.path)
	            .dataType("integer")
	            .required(true)
	            .description("Customer ID")
	        .endParam()
	        .to("direct:getcust")
	     .post("/payment/{customerid}/{orderamt}")  
		 	.param()
		     	.type(RestParamType.path)
		         .name("customerid")
		         .dataType("integer")
		         .required(true)
		         .description("Customer ID")
		    .endParam()
		    .param()
		     	.type(RestParamType.path)
		         .name("orderamt")
		         .dataType("integer")
		         .required(true)
		         .description("Total Order Amount")
		    .endParam()
	     	.to("direct:payment")
	     ;
		
		/*onException(Exception.class)
    	.maximumRedeliveries(1)
    	.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Problem with Order')")
    	.handled(true)
    	.markRollbackOnly()
    	;*/
		
		
		from("direct:getcust")
		.to("sql:select * from CUSTOMER WHERE custid =:#customerid")
    	.log("${body}");
		
		from("direct:ordertransaction")
        .transacted("PROPAGATION_REQUIRED")
        	.log("Processing message: ${body}")
        	.setHeader("message", body())
        	.to("sql:select * from CUSTOMER where custid =:#customerid")
        		.log("${body}")
        	.choice()
        		.when().simple("${body.size} <= 0")
        			.log("Customer not found")
        			.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Customer not found')")
        			
        		.otherwise()
		        	.bean(BonusPoint.class, "calculatePoint(${headers.orderamt})")
		        	.to("sql:select * from CUSTOMER where custid =:#customerid")
		        	.to("jms:creditlimit?requestTimeout=5000") 
		        	.choice()
		        		.when().jsonpath("$.[0][?(@.CREDITLIMIT > ${headers.orderamt})]")
		        			.log("New Points to add [${headers.orderamt}] with customer id [${headers.customerid}]")
		        			.to("sql:UPDATE CUSTOMER set point=(point+:#orderamt) WHERE custid =:#customerid")       	
		        			.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Order Success')")
		        		.otherwise()
		        			.log("Not sufficient credit limits")
		        			.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Not sufficient credit limits')")
		        	.endChoice()
		        
		        ;
			from("jms:creditlimit")
			.log("Banking start --> ${body}")
			.log("${body[0][CREDITCARDINFO]}")
			.to("sql:select * from CREDITLIMIT WHERE creditcardinfo =:#${body[0][CREDITCARDINFO]}")
			.choice()
				.when().simple("${body.size} <= 0")
					.log("sql:select 'NOT FOUND' as CREDITCARDINFO, 0 as CREDITLIMIT")
			.to("jms:creditlimit");
		
			from("direct:payment")
				.bean(OrderService.class, "pay(${headers.customerid},${headers.orderamt},'Payment Success')")
				.log("${body}")
			;
		
			from("direct:ordercancel")
				.to("sql:UPDATE CUSTOMER set point=(point-:#${body}) WHERE custid =:#customerid")  
			.log("${body}");
	}

}
