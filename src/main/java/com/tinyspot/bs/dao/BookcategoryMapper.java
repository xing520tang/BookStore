package com.tinyspot.bs.dao;

import com.tinyspot.bs.bean.Bookcategory;
import com.tinyspot.bs.bean.BookcategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookcategoryMapper {
    long countByExample(BookcategoryExample example);

    int deleteByExample(BookcategoryExample example);

    int deleteByPrimaryKey(Integer bcId);

    int insert(Bookcategory record);

    int insertSelective(Bookcategory record);

    List<Bookcategory> selectByExample(BookcategoryExample example);

    Bookcategory selectByPrimaryKey(Integer bcId);

    int updateByExampleSelective(@Param("record") Bookcategory record, @Param("example") BookcategoryExample example);

    int updateByExample(@Param("record") Bookcategory record, @Param("example") BookcategoryExample example);

    int updateByPrimaryKeySelective(Bookcategory record);

    int updateByPrimaryKey(Bookcategory record);
}