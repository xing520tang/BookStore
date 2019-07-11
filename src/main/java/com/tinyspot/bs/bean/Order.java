package com.tinyspot.bs.bean;

import java.util.Date;

public class Order {
    private Integer oId;

    private Integer oUId;

    private Integer oBId;

    private Short oNum;

    private Byte oState;

    private Date oDate;
    
    

    public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Integer oId, Integer oUId, Integer oBId, Short oNum, Byte oState, Date oDate) {
		super();
		this.oId = oId;
		this.oUId = oUId;
		this.oBId = oBId;
		this.oNum = oNum;
		this.oState = oState;
		this.oDate = oDate;
	}

	public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Integer getoUId() {
        return oUId;
    }

    public void setoUId(Integer oUId) {
        this.oUId = oUId;
    }

    public Integer getoBId() {
        return oBId;
    }

    public void setoBId(Integer oBId) {
        this.oBId = oBId;
    }

    public Short getoNum() {
        return oNum;
    }

    public void setoNum(Short oNum) {
        this.oNum = oNum;
    }

    public Byte getoState() {
        return oState;
    }

    public void setoState(Byte oState) {
        this.oState = oState;
    }

    public Date getoDate() {
        return oDate;
    }

    public void setoDate(Date oDate) {
        this.oDate = oDate;
    }

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", oUId=" + oUId + ", oBId=" + oBId + ", oNum=" + oNum + ", oState=" + oState
				+ ", oDate=" + oDate + "]";
	}
    
    
}