package com.tinyspot.bs.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tinyspot.bs.bean.BOrderInfo;
import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.Order;
import com.tinyspot.bs.bean.OrderExample;
import com.tinyspot.bs.bean.OrderInfo;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.bean.OrderExample.Criteria;
import com.tinyspot.bs.dao.BookMapper;
import com.tinyspot.bs.dao.OrderMapper;
/**
 * 与订单有关的处理
 * @author tinyspot
 *
 */
@Service
public class OrderService {
	@Autowired
	BookMapper bookMapper;

	@Autowired 
	OrderMapper orderMapper;
	
	@Autowired
	BookServce bookService;
	
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	/**
	 * 保存购物车信息
	 * 返回1表示添加成功
	 * 2表示库存不足
	 * 3表示保存失败
	 * 4表示传进来的书本参数为0或负数
	 * @return
	 */
	public int saveCart(Integer bId, Short bNum, Object uId) {
		System.out.println("OrderService-->saveCart******bId: "+bId+" bNum:"+bNum);
		Integer stock = bookMapper.selectBookStockById(bId);
		if(stock < bNum) {	//书本库存不够
			return 2;
		}else if(stock < 1) {//bNum为0或者负数
			return 4;
		}
		//保存订单信息
		try {
			OrderExample example = new OrderExample();
			Criteria criteria = example.createCriteria();//添加查询条件
			criteria.andOBIdEqualTo(bId);
			criteria.andOUIdEqualTo((Integer)uId);
			List<Order> orderList = orderMapper.selectByExample(example);
			System.out.println("订单数量："+orderList.size()+"\n打印查询出来的order: "+orderList);
			if(orderList.size() > 0) {//表示已经存在相应的订单，那么只需要更新数量即可
				Order order = orderList.get(0);
				Short getoNum = order.getoNum();//得到之前的数量
				//更新数据
				orderMapper.updateByExampleSelective(new Order(null, (Integer)uId, bId, (short)(getoNum+bNum), (byte)2, new Date()), example);
			}else {//否则插入新订单
				orderMapper.insertSelective(new Order(null, (Integer)uId, bId, bNum, (byte)2, null));
			}
		}catch(Exception e) {
			e.printStackTrace();
			return 3;
		}
		return 1;
	}
	
	/**
	 * 返回用户id为uId的购物车数据
	 * @param attribute
	 */
	public List<OrderInfo> getAllCartDate(Integer uId) {
		OrderExample example = new OrderExample();
		Criteria criteria = example.createCriteria();//添加查询条件
		criteria.andOUIdEqualTo(uId);
		criteria.andOStateEqualTo((byte)2);//2表示是购物车数据
		List<Order> orderList = orderMapper.selectByExample(example);
		List<OrderInfo> orderInfos = new ArrayList<OrderInfo>();
		//打印一下所有加入购物车的数据
		for (Order order : orderList) {
			System.out.println(order);
			orderInfos.add(orderMapper.selectOrderAndBookByOBIdAndOUId(order.getoBId(), order.getoUId()));
		}
		return orderInfos;
	}
	
	/**
	 * 根据书本的id查询所有的订单，即某个店家的所有订单
	 * @param bId
	 * @return
	 */
	public List<Order> getOrdersByBId(Integer bId){
		OrderExample example = new OrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andOBIdEqualTo(bId);
		List<Order> orderList = orderMapper.selectByExample(example);
		return orderList;
	}
	
	/**
	 * 返回商家的订单列表信息
	 * @return
	 */
	public List<BOrderInfo> getAllBOrderInfo(Integer sId){
		List<BOrderInfo> bOrderInfos = new ArrayList<BOrderInfo>();
		List<Book> bookList = bookService.getBooksBySId(sId); //该店铺所拥有的的所有书本
		for (Book book : bookList) {
			//根据bId查找订单信息
			List<Order> orderList = orderService.getOrdersByBId(book.getbId());
			if(orderList==null || orderList.size()==0)
				continue;
			for (Order order : orderList) {
				BOrderInfo bOrderInfo = new BOrderInfo();
				//设置订单的书本信息
				bOrderInfo.setbName(book.getbName());
				bOrderInfo.setbDiscount(book.getbDiscount());
				bOrderInfo.setbPicture(book.getbPicture());
				bOrderInfo.setbPrice(book.getbPrice());
				bOrderInfo.setbId(book.getbId());
				//设置订单的基本信息
				bOrderInfo.setoDate(order.getoDate());
				bOrderInfo.setoId(order.getoId());
				bOrderInfo.setoNum(order.getoNum());
				bOrderInfo.setoState(order.getoState());
				//根据uId查找用户信息
				User user = userService.getUserByUId(order.getoUId());
				//设置订单对应用户的信息
				bOrderInfo.setuAddress(user.getuAddress());
				bOrderInfo.setuPhone(user.getuPhone());
				bOrderInfos.add(bOrderInfo);
			}
		}
		return bOrderInfos;
	}
	
	
	/**
	 * 根据书本的id和订单状态查询所有的订单，即某个店家的待处理订单
	 * @param bId
	 * @return
	 */
	public List<Order> getOrdersByBIdAndOState(Integer bId, byte oState){
		OrderExample example = new OrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andOBIdEqualTo(bId);
		criteria.andOStateEqualTo(oState);
		List<Order> orderList = orderMapper.selectByExample(example);
		return orderList;
	}
	
	/**
	 * 返回商家的待处理订单信息
	 * @return
	 */
	public List<BOrderInfo> getAllBOrderInfoToDo(Integer sId){
		List<BOrderInfo> bOrderInfos = new ArrayList<BOrderInfo>();
		List<Book> bookList = bookService.getBooksBySId(sId); //该店铺所拥有的的所有书本
		for (Book book : bookList) {
			//根据bId查找订单信息
			List<Order> orderList = orderService.getOrdersByBIdAndOState(book.getbId(), (byte)0);//0表示未发货的订单
			if(orderList==null || orderList.size()==0)
				continue;
			for (Order order : orderList) {
				BOrderInfo bOrderInfo = new BOrderInfo();
				//设置订单的书本信息
				bOrderInfo.setbName(book.getbName());
				bOrderInfo.setbDiscount(book.getbDiscount());
				bOrderInfo.setbPicture(book.getbPicture());
				bOrderInfo.setbPrice(book.getbPrice());
				bOrderInfo.setbId(book.getbId());
				//设置订单的基本信息
				bOrderInfo.setoDate(order.getoDate());
				bOrderInfo.setoId(order.getoId());
				bOrderInfo.setoNum(order.getoNum());
				bOrderInfo.setoState(order.getoState());
				//根据uId查找用户信息
				User user = userService.getUserByUId(order.getoUId());
				//设置订单对应用户的信息
				bOrderInfo.setuAddress(user.getuAddress());
				bOrderInfo.setuPhone(user.getuPhone());
				bOrderInfos.add(bOrderInfo);
			}
		}
		return bOrderInfos;
	}
}
