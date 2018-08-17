package org.mycompany;

public class OrderItem {
	
	
	Integer itemid;
	Integer quantity;
	String location;
	String method; //USPS, FEDEX, UPS,AIR, Economy
	Integer referenceid;
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public Integer getReferenceid() {
		return referenceid;
	}
	public void setReferenceid(Integer referenceid) {
		this.referenceid = referenceid;
	}
	
	
	
}
