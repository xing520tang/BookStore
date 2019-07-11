package com.tinyspot.bs.bean;

import java.util.Date;

public class User {
    private Integer uId;

    private String uNickname;

    private String uPhone;

    private String uPassword;

    private String uAddress;

    private Byte uRId;

    private Byte uState;

    private Date uRegisterDate;
    
    

    public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Integer uId, String uNickname, String uPhone, String uPassword, String uAddress, Byte uRId, Byte uState,
			Date uRegisterDate) {
		super();
		this.uId = uId;
		this.uNickname = uNickname;
		this.uPhone = uPhone;
		this.uPassword = uPassword;
		this.uAddress = uAddress;
		this.uRId = uRId;
		this.uState = uState;
		this.uRegisterDate = uRegisterDate;
	}

	public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuNickname() {
        return uNickname;
    }

    public void setuNickname(String uNickname) {
        this.uNickname = uNickname == null ? null : uNickname.trim();
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone == null ? null : uPhone.trim();
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword == null ? null : uPassword.trim();
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress == null ? null : uAddress.trim();
    }

    public Byte getuRId() {
        return uRId;
    }

    public void setuRId(Byte uRId) {
        this.uRId = uRId;
    }

    public Byte getuState() {
        return uState;
    }

    public void setuState(Byte uState) {
        this.uState = uState;
    }

    public Date getuRegisterDate() {
        return uRegisterDate;
    }

    public void setuRegisterDate(Date uRegisterDate) {
        this.uRegisterDate = uRegisterDate;
    }

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uNickname=" + uNickname + ", uPhone=" + uPhone + ", uPassword=" + uPassword
				+ ", uAddress=" + uAddress + ", uRId=" + uRId + ", uState=" + uState + ", uRegisterDate="
				+ uRegisterDate + "]";
	}
    
    
}