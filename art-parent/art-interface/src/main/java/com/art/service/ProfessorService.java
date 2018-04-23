package com.art.service;

import java.util.List;

import com.art.pojo.Professor;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageInfo;

public interface ProfessorService {
public List<Professor> getNewProfessor();

public Professor getProfessorById(Integer pid);

public PageInfo getProfessorListByPage(Integer pageno);

public int saveProfessor(Professor pro);

public Professor getProfessorByTel(String username);

public int update(Professor pro);

public EUDataGridResult getProfessorListByPage(int parseInt, int parseInt2);





}
