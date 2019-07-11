package com.tinyspot.bs.bean;

import java.util.Date;

public class Book {
    private Integer bId;

    private Integer bSId;

    private Integer bBcId;

    private String bName;

    private Float bPrice;

    private Float bDiscount;

    private Short bStock;

    private String bAuthor;

    private String bPress;

    private Date bPubDate;

    private String bPicture;

    private Byte bState;
    

    public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(Integer bId, Integer bSId, Integer bBcId, String bName, Float bPrice, Float bDiscount, Short bStock,
			String bAuthor, String bPress, Date bPubDate, String bPicture, Byte bState) {
		super();
		this.bId = bId;
		this.bSId = bSId;
		this.bBcId = bBcId;
		this.bName = bName;
		this.bPrice = bPrice;
		this.bDiscount = bDiscount;
		this.bStock = bStock;
		this.bAuthor = bAuthor;
		this.bPress = bPress;
		this.bPubDate = bPubDate;
		this.bPicture = bPicture;
		this.bState = bState;
	}

	public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public Integer getbSId() {
        return bSId;
    }

    public void setbSId(Integer bSId) {
        this.bSId = bSId;
    }

    public Integer getbBcId() {
        return bBcId;
    }

    public void setbBcId(Integer bBcId) {
        this.bBcId = bBcId;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName == null ? null : bName.trim();
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

    public Short getbStock() {
        return bStock;
    }

    public void setbStock(Short bStock) {
        this.bStock = bStock;
    }

    public String getbAuthor() {
        return bAuthor;
    }

    public void setbAuthor(String bAuthor) {
        this.bAuthor = bAuthor == null ? null : bAuthor.trim();
    }

    public String getbPress() {
        return bPress;
    }

    public void setbPress(String bPress) {
        this.bPress = bPress == null ? null : bPress.trim();
    }

    public Date getbPubDate() {
        return bPubDate;
    }

    public void setbPubDate(Date bPubDate) {
        this.bPubDate = bPubDate;
    }

    public String getbPicture() {
        return bPicture;
    }

    public void setbPicture(String bPicture) {
        this.bPicture = bPicture == null ? null : bPicture.trim();
    }

    public Byte getbState() {
        return bState;
    }

    public void setbState(Byte bState) {
        this.bState = bState;
    }

	@Override
	public String toString() {
		return "Book [bId=" + bId + ", bSId=" + bSId + ", bBcId=" + bBcId + ", bName=" + bName + ", bPrice=" + bPrice
				+ ", bDiscount=" + bDiscount + ", bStock=" + bStock + ", bAuthor=" + bAuthor + ", bPress=" + bPress
				+ ", bPubDate=" + bPubDate + ", bPicture=" + bPicture + ", bState=" + bState + "]";
	}
    
    
}