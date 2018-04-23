package com.art.mapper;

import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormExample;
import com.art.pojo.OrderFormWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderFormMapper {
    int countByExample(OrderFormExample example);

    int deleteByExample(OrderFormExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrderForm orderform);

    int insertSelective(OrderFormWithBLOBs record);

    List<OrderFormWithBLOBs> selectByExampleWithBLOBs(OrderFormExample example);

    List<OrderForm> selectByExample(OrderFormExample example);

    OrderFormWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OrderFormWithBLOBs record, @Param("example") OrderFormExample example);

    int updateByExampleWithBLOBs(@Param("record") OrderFormWithBLOBs record, @Param("example") OrderFormExample example);

    int updateByExample(@Param("record") OrderForm record, @Param("example") OrderFormExample example);

    int updateByPrimaryKeySelective(OrderFormWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(OrderFormWithBLOBs record);

    int updateByPrimaryKey(OrderForm record);
}