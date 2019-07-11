package com.tinyspot.bs.bean;

public class OrderInfo {
	private Integer bId;
	private String bName;
	private String bPicture;
	private Float bDiscount;
	private Float bPrice;
	private Short oNum;
	
	
	public Integer getbId() {
		return bId;
	}
	public void setbId(Integer bId) {
		this.bId = bId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbPicture() {
		return bPicture;
	}
	public void setbPicture(String bPicture) {
		this.bPicture = bPicture;
	}
	
	public Float getbDiscount() {
		return bDiscount;
	}
	public void setbDiscount(Float bDiscount) {
		this.bDiscount = bDiscount;
	}
	public Float getbPrice() {
		return bPrice;
	}
	public void setbPrice(Float bPrice) {
		this.bPrice = bPrice;
	}
	public Short getoNum() {
		return oNum;
	}
	public void setoNum(Short oNum) {
		this.oNum = oNum;
	}
	@Override
	public String toString() {
		return "OrderInfo [bId=" + bId + ", bName=" + bName + ", bPicture=" + bPicture + ", bDiscount=" + bDiscount
				+ ", bPrice=" + bPrice + ", oNum=" + oNum + "]";
	}
	
	
}
