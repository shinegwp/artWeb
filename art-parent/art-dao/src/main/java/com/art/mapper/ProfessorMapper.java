package com.art.mapper;

import com.art.pojo.Professor;
import com.art.pojo.ProfessorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProfessorMapper {
    int countByExample(ProfessorExample example);

    int deleteByExample(ProfessorExample example);

    int deleteByPrimaryKey(Integer pid);

    int insert(Professor record);

    int insertSelective(Professor record);

    List<Professor> selectByExampleWithBLOBs(ProfessorExample example);

    List<Professor> selectByExample(ProfessorExample example);

    Professor selectByPrimaryKey(Integer pid);

    int updateByExampleSelective(@Param("record") Professor record, @Param("example") ProfessorExample example);

    int updateByExampleWithBLOBs(@Param("record") Professor record, @Param("example") ProfessorExample example);

    int updateByExample(@Param("record") Professor record, @Param("example") ProfessorExample example);

    int updateByPrimaryKeySelective(Professor record);

    int updateByPrimaryKeyWithBLOBs(Professor record);

    int updateByPrimaryKey(Professor record);
}