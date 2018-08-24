package org.mycompany;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;
import org.springframework.stereotype.Component;

@Component
public class CamelRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {
		
		from("mqtt:bar?subscribeTopicName=notification&host=tcp://ec2-54-152-6-204.compute-1.amazonaws.com:1883")
			.log("From notification --> ${body}")
			.unmarshal().json(JsonLibrary.Jackson)
			.log("Orderid --> ${body[orderid]}")
			.to("sql:SELECT "
					+ "B.itemid as itemId, "
					+ "B.parentitemid as parentItemId, "
					+ "B.name, "
					+ "B.msrp, "
					+ "B.saleprice as salePrice, "
					+ "B.upc, "
					+ "B.categorypath as categoryPath, "
					+ "B.shortdescription as shortDescription, "
					+ "B.longdescription as longDescription, "
					+ "B.thumbnailimage as thumbnailImage, "
					+ "B.mediumimage as mediumImage, "
					+ "B.largeimage as largeImage, "
					+ "B.producttrackingurl as productTrackingUrl "
					+ " FROM PREORDER A, DISPLAYITEM B WHERE B.parentitemid = A.productid AND A.orderid = :#${body[orderid]}?dataSource=dataSource")
			.bean(DataService.class, "createData(${body})")
			.marshal().json(JsonLibrary.Jackson)
			.log("${body}")
			.to("mqtt:bar?publishTopicName=bestmart&host=tcp://ec2-18-219-8-205.us-east-2.compute.amazonaws.com:1883")
		;
		
		
		
		
		/**from("timer://foo?period=1000")
			.setBody().constant("{\"orderid\": \"5\"}")
			//.log("To notification --> ${body}")
			.to("mqtt:bar?publishTopicName=notification&host=tcp://broker-amq-mqtt:1883")
		;*/
	}

}
