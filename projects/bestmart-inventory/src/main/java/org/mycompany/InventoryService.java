package org.mycompany;

public class InventoryService {
	
	
	public Response order(String orderid, String productid, String quantity) {
		
		Response response = new Response();
		int random = (int )(Math.random() * 10 + 1);
		
		if (random > 3) {
			
			response.setStatus("Your Status");
			response.setStatuscode("200");
		}else {
			response.setStatus("Your Status");
			response.setStatuscode("500");
		}
		
		return response;
	}

}
