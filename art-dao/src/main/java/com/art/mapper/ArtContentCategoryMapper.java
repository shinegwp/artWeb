package com.art.mapper;


import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.art.pojo.ArtContentCategory;
import com.art.pojo.ArtContentCategoryExample;

public interface ArtContentCategoryMapper {
    int countByExample(ArtContentCategoryExample example);

    int deleteByExample(ArtContentCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ArtContentCategory record);

    int insertSelective(ArtContentCategory record);

    List<ArtContentCategory> selectByExample(ArtContentCategoryExample example);

    ArtContentCategory selectByPrimaryKey(Long id);
    
    int updateNameById(ArtContentCategory acc);

    int updateByExampleSelective(@Param("record") ArtContentCategory record, @Param("example") ArtContentCategoryExample example);

    int updateByExample(@Param("record") ArtContentCategory record, @Param("example") ArtContentCategoryExample example);

    int updateByPrimaryKeySelective(ArtContentCategory record);

    int updateByPrimaryKey(ArtContentCategory record);
}