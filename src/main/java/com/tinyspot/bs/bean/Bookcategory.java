package com.tinyspot.bs.bean;

public class Bookcategory {
    private Integer bcId;

    private String bcName;

    
    
    public Bookcategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bookcategory(Integer bcId, String bcName) {
		super();
		this.bcId = bcId;
		this.bcName = bcName;
	}

	public Integer getBcId() {
        return bcId;
    }

    public void setBcId(Integer bcId) {
        this.bcId = bcId;
    }

    public String getBcName() {
        return bcName;
    }

    public void setBcName(String bcName) {
        this.bcName = bcName == null ? null : bcName.trim();
    }
}