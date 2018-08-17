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
                .required(true)
                .description("Customer ID")
            .endParam()
            .param()
	        	.type(RestParamType.path)
	            .name("orderamt")
	            .required(true)
	            .description("Total Order Amount")
	        .endParam()
            .to("direct:transaction")
		.get("/order/{customerid}")
	        .description("Get customer information")
	        .param()
	            .name("customerid")
	            .type(RestParamType.path)
	            .required(true)
	            .description("Customer ID")
	        .endParam()
	        .to("direct:getcust");
		
		onException(Exception.class)
    	.maximumRedeliveries(1)
    	.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Problem with Order')")
    	.handled(true)
    	.markRollbackOnly()
    	;
		
		
		from("direct:getcust")
		.to("sql:select * from CUSTOMER WHERE custid =:#customerid")
    	.log("${body}");
		
		from("direct:transaction")
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
		        			.to("sql:UPDATE CUSTOMER set point=(point+:#${body}) WHERE custid =:#customerid")       	
		        			.to("sql:select * from CUSTOMER")
		        			.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Order Success')")
		        		.otherwise()
		        			.log("Not sufficient credit limits")
		        			.bean(OrderService.class, "genStatus(${headers.customerid},${headers.orderamt},'Not sufficient credit limits')")
		        	.endChoice()
		        
		        ;
				
		
		
	}

}
