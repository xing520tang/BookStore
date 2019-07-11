package com.tinyspot.bs.dao;

import com.tinyspot.bs.bean.BOrderInfo;
import com.tinyspot.bs.bean.Order;
import com.tinyspot.bs.bean.OrderExample;
import com.tinyspot.bs.bean.OrderInfo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    long countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(Integer oId);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer oId);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    /**
     * 查询订单和书本信息
     * @param oBId oUId
     * @return
     */
    OrderInfo selectOrderAndBookByOBIdAndOUId(@Param("oBId") Integer oBId, @Param("oUId")Integer oUId);
    
    /**
     * 查询商家所要知道的订单列表
     * @return
     */
    //List<BOrderInfo> selectBOrderInfoByUIdAnd();
    
}