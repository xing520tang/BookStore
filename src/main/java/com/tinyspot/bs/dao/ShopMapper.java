package com.tinyspot.bs.dao;

import com.tinyspot.bs.bean.Shop;
import com.tinyspot.bs.bean.ShopExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShopMapper {
    long countByExample(ShopExample example);

    int deleteByExample(ShopExample example);

    int deleteByPrimaryKey(Integer sId);

    int insert(Shop record);

    int insertSelective(Shop record);

    List<Shop> selectByExample(ShopExample example);

    Shop selectByPrimaryKey(Integer sId);

    int updateByExampleSelective(@Param("record") Shop record, @Param("example") ShopExample example);

    int updateByExample(@Param("record") Shop record, @Param("example") ShopExample example);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
}