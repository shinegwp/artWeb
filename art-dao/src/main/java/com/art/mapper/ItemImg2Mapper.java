package com.art.mapper;

import com.art.pojo.ItemImg2;
import com.art.pojo.ItemImg2Example;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemImg2Mapper {
    int countByExample(ItemImg2Example example);

    int deleteByExample(ItemImg2Example example);

    int insert(ItemImg2 record);

    int insertSelective(ItemImg2 record);

    List<ItemImg2> selectByExample(ItemImg2Example example);

    int updateByExampleSelective(@Param("record") ItemImg2 record, @Param("example") ItemImg2Example example);

    int updateByExample(@Param("record") ItemImg2 record, @Param("example") ItemImg2Example example);
}