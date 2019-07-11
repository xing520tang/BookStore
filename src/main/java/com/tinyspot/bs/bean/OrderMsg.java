package com.tinyspot.bs.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用于返回符合bootstraptable格式的json信息
 * @author tinyspot
 *
 */
public class OrderMsg {
	public static int SUCCESS = 100;
	public static int FAIL = 200;
	//状态码：100-成功，200-失败
	private int code;
	//提示信息
	private String msg;
	//用户要返回给浏览器的数据
	//private Map<String, Object> rows = new HashMap<String, Object>();
	private List<Object> rows = new ArrayList<Object>();
	
	//总的记录数
	private int total;
	
	public static OrderMsg success() {
		OrderMsg result = new OrderMsg();
		result.setCode(100);
		result.setMsg("处理成功！");
		result.setTotal(1);
		return result;
	}
	
	public static OrderMsg fail() {
		OrderMsg result = new OrderMsg();
		result.setCode(200);
		result.setMsg("处理失败！");
		result.setTotal(1);
		return result;
	}
	
	/**
	 * 一个添加方法，用于附加map的方法
	 * @param key
	 * @param value
	 * @return
	 */
	public OrderMsg add(Object value) {
		System.out.println("OrderMsg: "+value);
		this.rows.add(value);
		System.out.println("OrderMsgSize: "+this.rows.size());
		//this.rows.put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	
	
	public List<Object> getRows() {
		return rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

//	public Map<String, Object> getRows() {
//		return rows;
//	}
//
//	public void setRows(Map<String, Object> rows) {
//		this.rows = rows;
//	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

//	@Override
//	public String toString() {
//		return "OrderMsg [code=" + code + ", msg=" + msg + ", rows=" + rows + ", total=" + total + "]";
//	}

	@Override
	public String toString() {
		return "OrderMsg [code=" + code + ", msg=" + msg + ", rows=" + rows + ", total=" + total + "]";
	}

	
}
