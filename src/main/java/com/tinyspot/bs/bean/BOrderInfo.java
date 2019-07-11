package com.tinyspot.bs.bean;

import java.util.Date;

public class BOrderInfo {
	private Integer oId;
	private Byte oState;
	private Short oNum;
	private Date oDate;
	private Integer bId;
	private Float bPrice;
    private Float bDiscount;
    private String bName;
    private String bPicture;
    private String uPhone;
    private String uAddress;
    
    
	public Integer getbId() {
		return bId;
	}
	public void setbId(Integer bId) {
		this.bId = bId;
	}
	public Integer getoId() {
		return oId;
	}
	public void setoId(Integer oId) {
		this.oId = oId;
	}
	public Byte getoState() {
		return oState;
	}
	public void setoState(Byte oState) {
		this.oState = oState;
	}
	public Short getoNum() {
		return oNum;
	}
	public void setoNum(Short oNum) {
		this.oNum = oNum;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public Float getbPrice() {
		return bPrice;
	}
	public void setbPrice(Float bPrice) {
		this.bPrice = bPrice;
	}
	public Float getbDiscount() {
		return bDiscount;
	}
	public void setbDiscount(Float bDiscount) {
		this.bDiscount = bDiscount;
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
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	@Override
	public String toString() {
		return "BOrderInfo [oId=" + oId + ", oState=" + oState + ", oNum=" + oNum + ", oDate=" + oDate + ", bId=" + bId
				+ ", bPrice=" + bPrice + ", bDiscount=" + bDiscount + ", bName=" + bName + ", bPicture=" + bPicture
				+ ", uPhone=" + uPhone + ", uAddress=" + uAddress + "]";
	}

	
}
