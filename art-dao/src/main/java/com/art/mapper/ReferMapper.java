package com.art.mapper;

import com.art.pojo.Refer;
import com.art.pojo.ReferExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReferMapper {
    int countByExample(ReferExample example);

    int deleteByExample(ReferExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Refer record);

    int insertSelective(Refer record);

    List<Refer> selectByExample(ReferExample example);

    Refer selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Refer record, @Param("example") ReferExample example);

    int updateByExample(@Param("record") Refer record, @Param("example") ReferExample example);

    int updateByPrimaryKeySelective(Refer record);

    int updateByPrimaryKey(Refer record);
}