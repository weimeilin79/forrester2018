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
	        .contextPath("/reddot")
	        .dataFormatProperty("prettyPrint", "true")
	        .enableCORS(true)
	        // turn on swagger api-doc
	        .apiContextPath("/api-doc")
	        .apiProperty("api.title", "User API")
	        .apiProperty("api.version", "1.0.0");

		rest()
        .put("/order")
            .description("Order for Delivery version one")
            .param()
                .name("body")
                .type(RestParamType.body)
                .required(false)
                .description("Order Item Detail")
            .endParam()
            .to("direct:order1");
        
		
		
		from("direct:order1")
			.log("itemid --> ${body[itemid]} ${body[amt]} ")
			.setHeader("itemid").simple("${body[itemid]}")
			.setHeader("amt").simple("${body[amt]}")
			.to("sql:SELECT update_inventory('C',:#${body[itemid]} ,:#${body[amt]})?dataSource=dataSource")
			.bean(SupplyProcess.class, "start(${headers.itemid}, ${headers.amt})")
			;
		
		
       
		
	}

}
