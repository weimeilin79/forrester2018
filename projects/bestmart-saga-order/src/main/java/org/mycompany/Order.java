package org.mycompany;

public class Order {
	
	Integer custid;
	Integer quantity;
	Integer orderamt;
	Item item;
	String pickupDate;
	
	public Integer getCustid() {
		return custid;
	}
	public void setCustid(Integer custid) {
		this.custid = custid;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getOrderamt() {
		return orderamt;
	}
	public void setOrderamt(Integer orderamt) {
		this.orderamt = orderamt;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public String getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}
	
	public String toString() {
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("custid :["+custid+"] \n");
		sb.append("quantity :["+quantity+"] \n");
		sb.append("orderamt :["+orderamt+"] \n");
		sb.append("item id :["+item.getId()+"] \n");
		sb.append("custid Name:["+item.getName()+"] \n");
		sb.append("pickupDate:["+pickupDate+"] \n");
		
		return sb.toString();
	}

}
