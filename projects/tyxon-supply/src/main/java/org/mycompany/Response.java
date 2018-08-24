package org.mycompany;

public class Response {

	String status;
	Integer productid;
	Integer amt;
	String partnerid="B";

	public String getPartnerid() {
		return partnerid;
	}

	public void setPartnerid(String partnerid) {
		this.partnerid = partnerid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Integer getAmt() {
		return amt;
	}

	public void setAmt(Integer amt) {
		this.amt = amt;
	}
	
	
	
}
