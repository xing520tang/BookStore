package com.tinyspot.bs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.BookExample;
import com.tinyspot.bs.bean.BookExample.Criteria;
import com.tinyspot.bs.dao.BookMapper;

@Service
public class BookServce {
	@Autowired
	BookMapper bookMapper;

	/**
	 * 得到所有书本的简略信息
	 * 只包含bId,bName,bPrice,bDiscount,bPicture
	 * @return
	 */
	public List<Book> getAllBrief() {
		System.out.println("BookService-->getAllBrief****");
		// TODO Auto-generated method stub
		return bookMapper.selectBriefByExample();
	}

	/**
	 * 根据书本id查询书本
	 * @param bId
	 * @return
	 */
	public Book getBookDetail(Integer bId) {
		// TODO Auto-generated method stub
		System.out.println(bookMapper.selectByPrimaryKey(bId));
		return bookMapper.selectByPrimaryKey(bId);
	}
	
	
	/**
	 * 根据商店id查书本信息
	 * @param sId
	 * @return
	 */
	public List<Book> getBooksBySId(Integer sId){
		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andBSIdEqualTo(sId);
		List<Book> bookList = bookMapper.selectByExample(example );
		//bookMapper.selectByPrimaryKey(bId)
		return bookList;
	}

}
