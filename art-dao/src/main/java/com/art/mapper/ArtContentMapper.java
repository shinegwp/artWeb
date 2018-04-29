package com.art.mapper;

import com.art.pojo.ArtContent;
import com.art.pojo.ArtContentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArtContentMapper {
    int countByExample(ArtContentExample example);

    int deleteByExample(ArtContentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ArtContent record);

    int insertSelective(ArtContent record);

    List<ArtContent> selectByExampleWithBLOBs(ArtContentExample example);

    List<ArtContent> selectByExample(ArtContentExample example);

    ArtContent selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ArtContent record, @Param("example") ArtContentExample example);

    int updateByExampleWithBLOBs(@Param("record") ArtContent record, @Param("example") ArtContentExample example);

    int updateByExample(@Param("record") ArtContent record, @Param("example") ArtContentExample example);

    int updateByPrimaryKeySelective(ArtContent record);

    int updateByPrimaryKeyWithBLOBs(ArtContent record);

    int updateByPrimaryKey(ArtContent record);
}