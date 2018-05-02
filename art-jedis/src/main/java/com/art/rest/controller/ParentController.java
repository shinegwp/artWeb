package com.art.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.ArtContent;
import com.art.pojo.Parent;
import com.art.rest.service.ContentService;
import com.art.rest.service.ParentService;
import com.art.util.ExceptionUtil;
import com.art.util.ArtResult;




@Controller
//@RequestMapping("/content")
public class ParentController {

	@Autowired
	private ParentService parentService;
	
	@RequestMapping("parentlist/{page}/{rows}")
	@ResponseBody
	public ArtResult getParentList(@PathVariable int page,@PathVariable int rows) {
		try {
			ArtResult result = parentService.getParentListByPage(page, rows);
			System.out.println("rest artresult="+result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return ArtResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
	
}