package org.mycompany;

public class OrderService {
	
	
	public OrderStatus genStatus(String custid, String orderamt, String status) {
		OrderStatus ordertstatus = new OrderStatus();
		
		ordertstatus.setAmt(orderamt);
		ordertstatus.setCustid(custid);
		ordertstatus.setStatus(status);
		
		return ordertstatus;
	}
	
	

}
