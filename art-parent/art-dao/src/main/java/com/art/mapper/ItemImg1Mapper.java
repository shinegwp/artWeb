package com.art.mapper;

import com.art.pojo.ItemImg1;
import com.art.pojo.ItemImg1Example;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemImg1Mapper {
    int countByExample(ItemImg1Example example);

    int deleteByExample(ItemImg1Example example);

    int insert(ItemImg1 record);

    int insertSelective(ItemImg1 record);

    List<ItemImg1> selectByExample(ItemImg1Example example);

    int updateByExampleSelective(@Param("record") ItemImg1 record, @Param("example") ItemImg1Example example);

    int updateByExample(@Param("record") ItemImg1 record, @Param("example") ItemImg1Example example);
}