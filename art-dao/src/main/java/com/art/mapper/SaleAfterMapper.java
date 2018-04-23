package com.art.mapper;

import com.art.pojo.SaleAfter;
import com.art.pojo.SaleAfterExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SaleAfterMapper {
    int countByExample(SaleAfterExample example);

    int deleteByExample(SaleAfterExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SaleAfter record);

    int insertSelective(SaleAfter record);

    List<SaleAfter> selectByExample(SaleAfterExample example);

    SaleAfter selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SaleAfter record, @Param("example") SaleAfterExample example);

    int updateByExample(@Param("record") SaleAfter record, @Param("example") SaleAfterExample example);

    int updateByPrimaryKeySelective(SaleAfter record);

    int updateByPrimaryKey(SaleAfter record);
}