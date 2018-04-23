package com.art.web;

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

@RequestMapping(value ="getCollectionListByPage",produces = "text/html;charset=UTF-8")
@ResponseBody
public String getControllerByPageAndUid(Integer uid,Integer page,Integer rows)
{
	System.out.println("controller");
	  EUDataGridResult clist = collectionService.getControllerByUidAndPage(uid, page, rows);
	  JSONObject json = JSONObject.fromObject(clist);
	  return json.toString();
}

@RequestMapping(value ="addCollection",produces = "text/html;charset=UTF-8")
@ResponseBody
public String addCollection(Integer uid,Integer id)
{System.out.println("addCollection");
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


}
