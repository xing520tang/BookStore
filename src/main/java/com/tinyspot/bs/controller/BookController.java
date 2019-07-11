package com.tinyspot.bs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.service.BookServce;

/**
 * 和book有关的请求
 * @author tinyspot
 *
 */
@Controller
public class BookController {
	@Autowired
	BookServce bookService;
	/**
	 * 返回所有书本的信息
	 * @return
	 */
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	@ResponseBody
	public Msg getPage(@RequestParam(value = "pn",defaultValue = "1")Integer pn) {
		System.out.println("BookController-->getPage******");
		//引入pageheler分页插件
		//在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 12);
		//startpage后面紧跟的查询是一个分页查询
		List<Book> books = bookService.getAllBrief();
		//使用pageinfo包装查询出来的数据，第二个参数是连续显示的页数
		PageInfo pageInfo = new PageInfo(books, 5);
				
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 返回id为bId的书本的详情
	 * 返回json
	 * @param bId
	 * @return
	 */
	@RequestMapping(value="/bookDetail", method = RequestMethod.GET)
	@ResponseBody
	public Msg getBookDetail(@RequestParam(value = "bId")Integer bId) {
		System.out.println("BookController-->getBookDetail******bId:"+bId);
		Book book = bookService.getBookDetail(bId);
		if(book == null) {
			Msg msg = Msg.fail();
			msg.setMsg("没有该书本");
			return msg;
		}
		return Msg.success().add("bookInfo", book);
	}
}
