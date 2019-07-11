package com.tinyspot.bs.bean;

public class TRole {
    private Byte rId;

    private String rName;
    
    

    public TRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TRole(Byte rId, String rName) {
		super();
		this.rId = rId;
		this.rName = rName;
	}

	public Byte getrId() {
        return rId;
    }

    public void setrId(Byte rId) {
        this.rId = rId;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName == null ? null : rName.trim();
    }
}