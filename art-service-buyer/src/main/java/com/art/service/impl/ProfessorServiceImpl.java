package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ProfessorMapper;
import com.art.pojo.Professor;
import com.art.pojo.ProfessorExample;
import com.art.pojo.ProfessorExample.Criteria;
import com.art.service.ProfessorService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ProfessorServiceImpl implements ProfessorService{
@Autowired
ProfessorMapper professorMapper;
	public List<Professor> getNewProfessor() {
		ProfessorExample example = new ProfessorExample();
	      example.setOrderByClause("updated");
	      PageHelper.startPage(1, 4);
		List<Professor> plist = professorMapper.selectByExample(example);	
		for(Professor p:plist)
		{
			System.out.println(p);
		}
		
		return plist;
	}
	public Professor getProfessorById(Integer pid) {
		Professor professor = professorMapper.selectByPrimaryKey(pid);
		return professor;
	}
	public PageInfo<Professor> getProfessorListByPage(Integer pageno) {
		ProfessorExample example = new ProfessorExample();
		 //example.createCriteria();
		PageHelper.startPage(pageno, 5);
		List<Professor> professors = professorMapper.selectByExample(example);
		for(Professor p:professors)
		{
			System.out.println("---"+p);
		}
		
     
  		PageInfo<Professor> pageInfo = new PageInfo<Professor>(professors);
  		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+pageInfo);
     	
		
		return pageInfo;
	}
	
	public Professor getProfessorByTel(String username) {
		ProfessorExample example = new ProfessorExample();
		Criteria criteria = example.createCriteria();
		criteria.andTelEqualTo(username);
		List<Professor> professors = professorMapper.selectByExample(example);
		Professor pro = null;
		if(professors.equals(null))
		{
			return pro;
		}
		else{
			return professors.get(0);
		}
		
	}
	
	public EUDataGridResult getProfessorListByPage(int parseInt, int parseInt2) {
		PageHelper.startPage(parseInt, parseInt2); 
		ProfessorExample example = new ProfessorExample() ;
		List<Professor> plist = professorMapper.selectByExample(example );
		PageInfo<Professor> p=new PageInfo<Professor>(plist);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
	
		
		return result;
	}
	public int saveProfessor(Professor pro) {//ǰ��̨����
		int i = professorMapper.insertSelective(pro);
		return i;
	}
	//***********************��̨****************************************************************8
	public int update(Professor pro) {//��̨
		int i = professorMapper.updateByPrimaryKeySelective(pro);
		return i;
	}
}
