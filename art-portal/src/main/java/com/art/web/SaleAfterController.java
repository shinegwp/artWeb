package com.art.web;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.SaleAfter;
import com.art.service.SaleAfterService;

import net.sf.json.JSONObject;

@Controller
public class SaleAfterController {
@Autowired
SaleAfterService saleAfterService;

@RequestMapping(value ="saveSaleAfter",produces = "text/html;charset=UTF-8")
@ResponseBody
public String saveSaleAfter(String describe,String formNum,String itemTitle,String summoney,String onemoney )
{
	SaleAfter saleafter = new SaleAfter();
	try {
		saleafter.setDescripte(new String(describe.getBytes("iso-8859-1"),"utf-8"));
		saleafter.setFormid(formNum);
		saleafter.setTitle(new String(itemTitle.getBytes("iso-8859-1"),"utf-8"));
		saleafter.setSummoney(summoney);
		saleafter.setOnemoney(onemoney);
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	int i = saleAfterService.save(saleafter);
	return JSONObject.fromObject(i).toString();
}
}
