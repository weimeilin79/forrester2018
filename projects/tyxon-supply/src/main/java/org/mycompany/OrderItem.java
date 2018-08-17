package org.mycompany;

public class OrderItem {

	Integer itemid;
	String itemname;
	Integer quantity;
	Delivery delivery;
	String placeby;
	String associate_tracker_id;
	
	
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Delivery getDelivery() {
		return delivery;
	}
	public void setDelivery(String location) {
		Delivery delivery = new Delivery();
		delivery.setLocation(location);
		
		this.delivery = delivery;		
	}
	public String getPlaceby() {
		return placeby;
	}
	public void setPlaceby(String placeby) {
		this.placeby = placeby;
	}
	public String getAssociate_tracker_id() {
		return associate_tracker_id;
	}
	public void setAssociate_tracker_id(String associate_tracker_id) {
		this.associate_tracker_id = associate_tracker_id;
	}
	
	
	
}
