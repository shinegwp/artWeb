package com.art.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.portal.service.ParentService;

@Controller
public class ParentController {

	@Autowired
	ParentService parentService;
	
	@RequestMapping(value ="getParentList",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getParentListByPage(int page,int rows)
	{
		return parentService.getParentListByPage(page,rows);
	}
}
