package org.mycompany;

import org.apache.camel.builder.RouteBuilder;
import org.springframework.stereotype.Component;

@Component
public class CamelRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {
		
		
		
		onException(Exception.class)
    	.maximumRedeliveries(1)
    	.handled(true)
    	//.to("file:target/messages?fileName=deadLetters.xml&fileExist=Append")
    	.markRollbackOnly()
    	;
		
		
		from("jms:creditlimit")
			
			.log("${body[0][CREDITCARDINFO]}")
			.to("sql:select * from CREDITLIMIT WHERE creditcardinfo =:#${body[0][CREDITCARDINFO]}")
			.choice()
				.when().simple("${body.size} <= 0")
					.log("sql:select 'NOT FOUND' as CREDITCARDINFO, 0 as CREDITLIMIT");
		
	}

}
