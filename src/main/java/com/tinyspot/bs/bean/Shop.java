package com.tinyspot.bs.bean;

public class Shop {
    private Integer sId;

    private Integer sUId;

    private String sName;

    private String sDesc;

    private String sAddress;

    private Byte sState;
    
    

    public Shop(Integer sId, Integer sUId, String sName, String sDesc, String sAddress, Byte sState) {
		super();
		this.sId = sId;
		this.sUId = sUId;
		this.sName = sName;
		this.sDesc = sDesc;
		this.sAddress = sAddress;
		this.sState = sState;
	}

	public Shop() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getsUId() {
        return sUId;
    }

    public void setsUId(Integer sUId) {
        this.sUId = sUId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsDesc() {
        return sDesc;
    }

    public void setsDesc(String sDesc) {
        this.sDesc = sDesc == null ? null : sDesc.trim();
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public Byte getsState() {
        return sState;
    }

    public void setsState(Byte sState) {
        this.sState = sState;
    }

	@Override
	public String toString() {
		return "Shop [sId=" + sId + ", sUId=" + sUId + ", sName=" + sName + ", sDesc=" + sDesc + ", sAddress="
				+ sAddress + ", sState=" + sState + "]";
	}
    
    
}