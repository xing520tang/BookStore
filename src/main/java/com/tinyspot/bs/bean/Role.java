package com.tinyspot.bs.bean;

public class Role {
	public static Integer ANONYMOUS = 0;//匿名用户
	public static Integer ORDINARY = 1;//普通用户
	public static Integer BUSINESS = 2;//商家
	public static Integer SUPER_ADMIN = 3;//超级管理员
	
	private Integer identity = Role.ANONYMOUS;

	public Integer getIdentity() {
		return identity;
	}

	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	
	public Role addIdentity(Integer identity) {
		this.identity = identity;
		return this;
	}

	@Override
	public String toString() {
		return "Role [identity=" + identity + "]";
	}
	
	
}
