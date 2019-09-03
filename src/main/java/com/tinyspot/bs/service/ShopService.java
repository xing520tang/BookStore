package com.tinyspot.bs.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.bean.Order;
import com.tinyspot.bs.bean.OrderExample;
import com.tinyspot.bs.bean.Shop;
import com.tinyspot.bs.bean.ShopExample;
import com.tinyspot.bs.dao.BookMapper;
import com.tinyspot.bs.dao.ShopMapper;
import com.tinyspot.bs.bean.ShopExample.Criteria;
/*
 * 使用声明试事务
 * 1.开启事务管理功能，在根容器的xml中使用<tx:annotation-driven/>设置或者在配置类中使用@EnableTransactionManagement注解
 * 2.在事务方法上使用@Transactional注解
 * 3.在容器中注册事务管理器，可以在跟容器的xml中将DataSourceTransactionManager类注册到容器中，或者在配置类中将该类注册到容器中。
 * 该类可以对mybatis的事务进行管理
 */
@Service
public class ShopService {
	private static final Logger logger = LogManager.getLogger();
	
	@Autowired
	ShopMapper shopMapper;
	@Autowired
	BookMapper bookMapper;
	
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
	
	/**
	 * 保存书本的相关信息，并返回该条目的bId
	 * 如果插入失败，则返回0，表示操作未能成功
	 * @param book
	 * @return
	 */
	public int saveBookAndReturnBId(Book book) {
		try {
			bookMapper.insert(book);
		}catch (Exception e) {
			logger.error("插入书本异常：", e);
			return 0;
		}
		return book.getbId();
	}
	
	/**
	 * @Transactional<br>
	 * 保存书本的相应信息
	 * @param sId 店家sId
	 * @param book 书本基本信息
	 * @param pic 图片
	 * @param realPath 图片应该存储的路径
	 * 若失败会抛出异常，否则该方法不会抛出异常
	 */
	@Transactional //事务方法，因为里面有很多操作，需要都成功
	public void addBook(Book book, MultipartFile pic, String realPath) {
		//设置这本书的状态，一开始还未审核，未上架
		book.setbState((byte)0);
		//设置书本分类ID   ！！！！！！！！！！！！！
		book.setbBcId(1);
		//先保存book，然后得到bId，然后修改图片路径
		int bId = saveBookAndReturnBId(book);
		if(bId == 0) //如果bId=0则表明书本插入失败，为了让事务失败，则需要抛出异常,随意该方法外围需要try-catch
			throw new RuntimeException();
		
		String newName = bId + ".jpg";
		
		//得到bId后需要更新刚刚插入book表中的图片路径，注意是相对路径
		book.setbPicture("/imgs/book_imgs/" + newName); //更新图片地址
		bookMapper.updateByPrimaryKey(book);  //根据主键更新book
		
		//保存图片
		//根据得到的bId给书本命名然后更新图片路径名
		String path = realPath + newName;
		File newPic = new File(path); 
		try { 
			pic.transferTo(newPic); //存储
		} catch(Exception e) { 
			logger.error("存储图片失败", e); 
			throw new RuntimeException();  //直接抛出异常，回滚
		} 
		
	}



}
