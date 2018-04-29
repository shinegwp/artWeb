package com.art.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.ArtContent;
import com.art.service.ContentService;
import com.art.util.EUDataGridResult;
import com.art.util.ArtResult;




/**
 * 内容管理Controller
 * <p>Title: ContentController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年9月8日上午11:13:52
 * @version 1.0
 */
@Controller
//@RequestMapping("/content")
public class ContentController {
	//content/query/list',queryParams:{categoryId:0}
	@Autowired
	private ContentService contentService;
	
	@RequestMapping("contentsave")
	@ResponseBody
	public ArtResult insertContent(ArtContent content) {
		ArtResult result = contentService.insertContent(content);
		return result;
	}
	
	@RequestMapping("contentquerylist")
	@ResponseBody
	public EUDataGridResult ContentQuery(Long categoryId,@RequestParam(value="page", defaultValue="1")int page,int rows) {
		System.out.println("=="+page+"=="+rows);
		EUDataGridResult eudgr = contentService.selectContentByCategoryIdAndPage(categoryId,page,rows);
		return eudgr;
	}
}
