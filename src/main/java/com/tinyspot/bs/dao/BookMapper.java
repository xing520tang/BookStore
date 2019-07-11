package com.tinyspot.bs.dao;

import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.BookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookMapper {
    long countByExample(BookExample example);

    int deleteByExample(BookExample example);

    int deleteByPrimaryKey(Integer bId);

    int insert(Book record);

    int insertSelective(Book record);

    List<Book> selectByExample(BookExample example);

    Book selectByPrimaryKey(Integer bId);
    
    /**
     *    查询所有书本的简要信息
     * @return
     */
    List<Book> selectBriefByExample();
    
    /**
     * 查询id为bid的书本的库存量
     * @param bId
     * @return
     */
    Integer selectBookStockById(@Param("bId")Integer bId);

    int updateByExampleSelective(@Param("record") Book record, @Param("example") BookExample example);

    int updateByExample(@Param("record") Book record, @Param("example") BookExample example);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
}