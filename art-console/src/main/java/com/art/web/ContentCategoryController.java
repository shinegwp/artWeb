
package com.art.web;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.ArtContentCategory;
import com.art.service.ContentCategoryService;
import com.art.util.EUTreeNode;
import com.art.util.ArtResult;


/**
 * 内容分类管理
 * <p>Title: ContentCategoryController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年9月8日上午9:23:41
 * @version 1.0
 */
@Controller
public class ContentCategoryController {

	@Autowired
	private ContentCategoryService contentCategoryService;
	
	@RequestMapping("contentcategorylist")
	@ResponseBody
	public List<EUTreeNode> getContentCatList(@RequestParam(value="id", defaultValue="0")Long parentId) {
		
		List<EUTreeNode> list = contentCategoryService.getCategoryList(parentId);
		return list;
	}
	
	@RequestMapping("contentcategorycreate")
	@ResponseBody
	public ArtResult createContentCategory(Long parentId, String name) {
		ArtResult result = contentCategoryService.insertContentCategory(parentId, name);
		return result;
	}
	
	@RequestMapping("contentcategoryupdate")
	@ResponseBody
	public String updateContentCategory(Long id, String name) {
		System.out.println("nb"+id);
		ArtContentCategory acc = contentCategoryService.selectById(id);
		acc.setName(name);
		contentCategoryService.updateNameById(acc);
		return "content-category";
	}
}
