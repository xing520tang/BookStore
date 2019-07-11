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
}
