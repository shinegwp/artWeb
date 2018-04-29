package com.art.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.ArtContent;
import com.art.pojo.Parent;
import com.art.rest.service.ContentService;
import com.art.rest.service.ParentService;
import com.art.util.ExceptionUtil;
import com.art.util.ArtResult;

public class ParentController {
	@Autowired
	private ParentService parentService;
	
	@RequestMapping("parentlist")
	@ResponseBody
	public ArtResult getParentListByPage(int page,int rows) {
		try {
			List<Parent> list = parentService.getParentListByPage(page,rows);
			return ArtResult.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return ArtResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
}
