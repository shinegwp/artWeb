package com.art.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.ArtContent;
import com.art.rest.service.ContentService;
import com.art.util.ExceptionUtil;
import com.art.util.ArtResult;




@Controller
//@RequestMapping("/content")
public class ContentController {

	@Autowired
	private ContentService contentService;
	
	@RequestMapping("contentlist/{contentCategoryId}")
	@ResponseBody
	public ArtResult getContentList(@PathVariable Long contentCategoryId) {
		try {
			List<ArtContent> list = contentService.getContentList(contentCategoryId);
			return ArtResult.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return ArtResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
	
}