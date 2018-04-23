package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ProfessorMapper;
import com.art.pojo.Parent;
import com.art.pojo.ParentExample;
import com.art.pojo.Professor;
import com.art.pojo.ProfessorExample;
import com.art.pojo.ProfessorExample.Criteria;
import com.art.pojo.ProfessorExample.Criterion;
import com.art.service.ProfessorService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ProfessorServiceImpl implements ProfessorService{
@Autowired
ProfessorMapper professormapper;
	public List<Professor> getNewProfessor() {
		ProfessorExample example = new ProfessorExample();
	      example.setOrderByClause("updated");
	      PageHelper.startPage(1, 4);
		List<Professor> plist = professormapper.selectByExample(example);	
		for(Professor p:plist)
		{
			System.out.println(p);
		}
		
		return plist;
	}
	public Professor getProfessorById(Integer pid) {
		Professor professor = professormapper.selectByPrimaryKey(pid);
		return professor;
	}
	public PageInfo getProfessorListByPage(Integer pageno) {
		ProfessorExample example = new ProfessorExample();
		 //example.createCriteria();
		PageHelper.startPage(pageno, 5);
		List<Professor> professors = professormapper.selectByExample(example);
		for(Professor p:professors)
		{
			System.out.println("---"+p);
		}
		
     
  		PageInfo<Professor> pageInfo = new PageInfo<Professor>(professors);
  		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+pageInfo);
     	
		
		return pageInfo;
	}
	public int saveProfessor(Professor pro) {
		int i = professormapper.insertSelective(pro);
		return i;
	}
	public Professor getProfessorByTel(String username) {
		ProfessorExample example = new ProfessorExample();
		Criteria criteria = example.createCriteria();
		criteria.andTelEqualTo(username);
		List<Professor> professors = professormapper.selectByExample(example);
		Professor pro = null;
		if(professors.equals(null))
		{
			return pro;
		}
		else{
			return professors.get(0);
		}
		
	}
	public int update(Professor pro) {
		int i = professormapper.updateByPrimaryKeySelective(pro);
		return i;
	}
	public EUDataGridResult getProfessorListByPage(int parseInt, int parseInt2) {
		PageHelper.startPage(parseInt, parseInt2); 
		ProfessorExample example = new ProfessorExample() ;
		List<Professor> plist = professormapper.selectByExample(example );
		PageInfo<Professor> p=new PageInfo<Professor>(plist);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
	
		
		return result;
	}
	

}
