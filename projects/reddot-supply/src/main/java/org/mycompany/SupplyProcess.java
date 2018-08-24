package org.mycompany;

public class SupplyProcess {
	
	public Response start(Integer productid, Integer amt) {
		Response response = new Response();
		response.setStatus("DONE");
		response.setAmt(amt);
		response.setProductid(productid);
		return response;
		
	}

}
