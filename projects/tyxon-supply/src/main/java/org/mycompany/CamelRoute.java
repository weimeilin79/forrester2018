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
	        .contextPath("/tyxon")
	        .dataFormatProperty("prettyPrint", "true")
	        .enableCORS(true)
	        // turn on swagger api-doc
	        .apiContextPath("/api-doc")
	        .apiProperty("api.title", "User API")
	        .apiProperty("api.version", "1.0.0");

		rest()
        .put("/order/v1")
            .description("Order for Delivery version one")
            .param()
                .name("body")
                .type(RestParamType.body)
                .required(false)
                .description("Order Item Detail")
            .endParam()
            .to("direct:order1")
        .put("/order/v2")
            .description("Order for Delivery version two")
            .param()
                .name("body")
                .type(RestParamType.body)
                .required(false)
                .description("Order Item Detail")
            .endParam()
            .to("direct:order2");
		
		//Gives Back Date
		from("direct:order1")
		.bean(SupplyProcess.class, "start");
		
		from("direct:order2")
			.bean(SupplyProcess.class, "start");
       
		
	}

}
