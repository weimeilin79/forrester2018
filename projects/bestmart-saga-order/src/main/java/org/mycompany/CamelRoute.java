package org.mycompany;

import org.apache.camel.Exchange;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.SagaPropagation;
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
	        .contextPath("/bestmart")
	        // turn on swagger api-doc
	        .apiContextPath("/api-doc")
	        .apiProperty("api.title", "User API")
	        .apiProperty("api.version", "1.0.0");

		rest("/order").description("Order service")
        	.consumes("application/json")
        	.produces("application/json")
		.post("/{custid}/{productid}/{quantity}/{orderamt}").description("Order Product from Inventory")
		.param()
	    	.type(RestParamType.path)
	        .name("custid")
	        .dataType("integer")
	        .required(true)
	        .description("Customer ID")
	    .endParam()
	    .param()
	    	.type(RestParamType.path)
	        .name("productid")
	        .dataType("integer")
	        .required(true)
	        .description("Product ID")
	    .endParam()
	    .param()
	    	.type(RestParamType.path)
	        .name("quantity")
	        .dataType("integer")
	        .required(true)
	        .description("Total Order Quantity")
	    .endParam()
	    .param()
	    	.type(RestParamType.path)
	        .name("orderamt")
	        .dataType("integer")
	        .required(true)
	        .description("Total Order Amount")
	    .endParam()
       	.responseMessage().code(200).message("Data successfully returned").endResponseMessage()
        .to("direct://order")
		;
		
		from("direct:order")
			.saga()
				.propagation(SagaPropagation.SUPPORTS)
				.option("orderid", header("orderid"))
				.log("Order #${header.orderid}")
				.removeHeaders("Camel*")
				.setHeader(Exchange.HTTP_METHOD, constant(org.apache.camel.component.http4.HttpMethods.POST))
				.toD("http4://bestmart-accounting-bestmart.apps.662a.openshift.opentlc.com/bestmart/order/${headers.custid}/${headers.orderamt}?bridgeEndpoint=true") // <-- action 1
				.log("${body}")
				//.removeHeader("CamelHttp*")
				//.setHeader(Exchange.HTTP_METHOD, constant(org.apache.camel.component.http4.HttpMethods.POST))
				//.to("http4://bestmart-inventory-bestmart.apps.662a.openshift.opentlc.com/bestmart/inventory/1/{productid}/{quantity}?bridgeEndpoint=true") // <-- action 2
				//.log("${body}")
				.log("Order done")
				;
		;
        
	}

}
