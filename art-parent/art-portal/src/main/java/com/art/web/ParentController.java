package com.art.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Parent;
import com.art.service.ParentService;
import com.art.util.EUDataGridResult;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ParentController {

	@Autowired
	ParentService parentservice;
	

	@RequestMapping(value ="getParentList",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getParentImg(String page,String rows)
	{   System.out.println("getParentList");
	  EUDataGridResult ullist = parentservice.getParrentListByPage(Integer.parseInt(page), Integer.parseInt(rows));
	  JSONObject json = JSONObject.fromObject(ullist);
	  return json.toString();
	}
	@RequestMapping("/tospecialdetail")
	@ResponseBody
	public String special(@PathVariable String pid) {
		return "special_detail";
	}
}
