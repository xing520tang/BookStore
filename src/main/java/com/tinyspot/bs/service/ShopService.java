package com.tinyspot.bs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tinyspot.bs.bean.Order;
import com.tinyspot.bs.bean.OrderExample;
import com.tinyspot.bs.bean.Shop;
import com.tinyspot.bs.bean.ShopExample;
import com.tinyspot.bs.dao.ShopMapper;
import com.tinyspot.bs.bean.ShopExample.Criteria;

@Service
public class ShopService {
	@Autowired
	ShopMapper shopMapper;
	
	public List<Shop> getShopByIdUId(Integer uId) {
		ShopExample example = new ShopExample();
		Criteria criteria = example.createCriteria();//添加查询条件
		criteria.andSUIdEqualTo(uId);  //店铺的拥有者的id
		List<Shop> shopList = shopMapper.selectByExample(example);
		return shopList;
	}
	
	public int saveShopReturnSId(Shop shop) {
		int sId = 0;
		try {
			sId = shopMapper.insert(shop);
		}catch (Exception e) {
			sId = 0;
		}
		return sId;
	}

	/**
	 * 注册时判断店铺名称是否符合要求
	 * @param sName
	 * @return
	 */
	public boolean sNameIsValid(String sName) {
		if(sName==null || sName.equals(""))
			return false;
		if(sName.length() > 15)
			return false;
		if(sName.matches("^[A-Za-z\\u4e00-\\u9fa5]+$")) { //'店名只能是汉字或英文字母'
			return true;
		}
		return false;
	}

	/**
	 * 注册时判断店铺描述是否符合要求
	 * @param getsDesc
	 * @return
	 */
	public boolean sDescIsValid(String sDesc) {
		//描述可以为空
		if(sDesc==null || sDesc.equals(""))
			return true;
		if(sDesc.length() > 80)//最多80字
			return false;
		return true;
	}

	/**
	 * 注册时判断店铺详细地址是否符合要求
	 * @param parameter
	 * @return
	 */
	public boolean sAddrDetailIsValid(String sAddrDetail) {
		//详细地址可以为空
		if(sAddrDetail==null || sAddrDetail.equals(""))
			return true;
		if(sAddrDetail.length() > 30)//最多30字
			return false;
		return true;
	}
}
