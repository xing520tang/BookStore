package com.tinyspot.bs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.bean.Order;
import com.tinyspot.bs.bean.OrderInfo;
import com.tinyspot.bs.bean.OrderMsg;
import com.tinyspot.bs.bean.Role;
import com.tinyspot.bs.service.MainService;
import com.tinyspot.bs.service.OrderService;

/**
 * 处理和订单有关的请求
 * @author tinyspot
 *
 */
@Controller
public class OrderController {
	@Autowired
	MainService mainService;
	@Autowired
	OrderService orderService;
	/**
	 * 添加购物车，传入书本id，返回添加成功与否信息
	 * 返回1表示添加成功
	 * 2表示库存不足
	 * 3表示保存失败
	 * 4表示传进来的书本参数为0或负数
	 * @param bId
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "addCart", method = RequestMethod.GET)
	@ResponseBody
	public Msg addCart(@RequestParam("bId") Integer bId, @RequestParam("bNum")Short bNum, HttpServletRequest req) {
		System.out.println("OrderController-->addCart******bId: "+bId);
		Role role = mainService.getRole(req.getSession()); //先判断是否登录
		Msg msg = Msg.success();
		if(role.getIdentity() == Role.ANONYMOUS) {//匿名用户
			msg.setCode(Msg.FAIL);
			msg.setMsg("亲，您还没有登录呢~");
			return msg;
		}else if(role.getIdentity() == Role.ORDINARY) {//普通用户
			int code = orderService.saveCart(bId, bNum, req.getSession().getAttribute("uId"));
			msg.setCode(Msg.FAIL);
			switch(code) {
				case 1: msg.setCode(Msg.SUCCESS);msg.setMsg("添加成功~");break;
				case 2: msg.setMsg("书本库存不足啦~");break;
				case 3: msg.setMsg("很遗憾，添加购物车失败");break;
				case 4: msg.setMsg("请检查购买数量");break;
			}
			return msg;
		}else {//商家或管理员
			msg.setCode(Msg.FAIL);
			msg.setMsg("该账号不能添加购物车哦~");
		}
		return msg;
	}
	
	/**
	 *返回购物车数据的json格式
	 * @return
	 */
	@RequestMapping(value = "getCartDate", method = RequestMethod.GET)
	@ResponseBody
	public OrderMsg getCartDate(HttpServletRequest req) {
		List<OrderInfo> allCartDate = orderService.getAllCartDate((Integer)req.getSession().getAttribute("uId"));
		OrderMsg msg = OrderMsg.success();
		for (OrderInfo order : allCartDate) {//订单插入ordermsg，返回json
			System.out.println("cardate: "+order);
			msg.add(order);
		}
		if(allCartDate.size() < 1) {
			msg.setCode(OrderMsg.FAIL);
			return msg;
		}
		return msg;
	}
}
