package com.art.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Collection;
import com.art.service.CollectionService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
public class CollectionController {
@Autowired
CollectionService collectionService;

/**
 * @describe 分页查询收藏的商品
 * @param uid 用户的id
 * @param page 页号
 * @param rows 记录数
 * @return EUDataGridResult 保存了查询后的Collection集合和页信息
 */
@RequestMapping(value ="getCollectionListByPage",produces = "text/html;charset=UTF-8")
@ResponseBody
public String getControllerByPageAndUid(Integer uid,Integer page,Integer rows)
{
	  EUDataGridResult clist = collectionService.getControllerByUidAndPage(uid, page, rows);
	  JSONObject json = JSONObject.fromObject(clist);
	  return json.toString();
}

/**
 * @describe 收藏商品
 * @param uid 用户id
 * @param id 商品id
 * @return TaotaoResult.status 1为添加成功
 */
@RequestMapping(value ="addCollection",produces = "text/html;charset=UTF-8")
@ResponseBody
public String addCollection(Integer uid,Integer id)
{
	TaotaoResult result = new TaotaoResult();
	  Collection coll = collectionService.getCollectionByIid(id);
	  System.out.println(coll);
	  if(!(coll==null))
	  {
		  result.setStatus(0);
	  }
	  else
	  {
		  Collection collection = new Collection();
		  collection.setIid(id);
		  collection.setUid(uid);
		  int i = collectionService.insert(collection);
		  if(i==0)
		  {
			  result.setStatus(2);
		  }
		  else
		  {
			  result.setStatus(1);  
		  }
		  
	  }
	  JSONObject json = JSONObject.fromObject(result);
	  return json.toString();
}
@RequestMapping(value ="test",produces = "text/html;charset=UTF-8")
public String test()
{
	System.out.println("测试");
	return null;
}

}
