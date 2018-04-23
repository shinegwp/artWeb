package com.art.web;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.art.pojo.Item;
import com.art.pojo.ItemImg1;
import com.art.pojo.ItemImg2;
import com.art.pojo.ShippingAddress;
import com.art.service.ItemImg1Service;
import com.art.service.ItemImg2Service;
import com.art.service.ItemService;

import com.art.util.Detail;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ItemController {
	@Autowired
	ItemService itemservice;
	
	@Autowired
	ItemImg1Service itemimg1service;
	
	@Autowired
	ItemImg2Service itemimg2service;
	
	
	
	
	@RequestMapping("/firstShowlist")
	@ResponseBody
	public String firstShowlist(String pageno)
	{   System.out.println("----------------------================================================================================-----------");
		List<Item> list = itemservice.getFirstShowItemsByPage(Integer.parseInt(pageno),"1");
		
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		return jsonArray.toString();
	}
	
	@RequestMapping(value ="/getOneItem",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOneItem(String id)
	{   System.out.println("----------------------================================================================================-----------");
	Item  list = itemservice.getItemById(Integer.parseInt(id));
		System.out.println(list);
		JSONObject jsonobject= JSONObject.fromObject(list);
		
		return jsonobject.toString();
	}


	@RequestMapping(value ="/gotoSpecialDet",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public ModelAndView gotoSpecialDet(String pid) 
	{  
		Map<String, String> map = new HashMap();
		map.put("pid", pid);
		return new ModelAndView("special_detail", map);

	}
	@RequestMapping(value ="/gotoSaleSpecialDet",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public ModelAndView gotoSaleSpecialDet(String pid) 
	{  
		Map<String, String> map = new HashMap();
		map.put("pid", pid);
		return new ModelAndView("sale_special_detail", map);

	}
	@RequestMapping(value ="/gotoTimeSpecialDet",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public ModelAndView gotoTimeSpecialDet(String pid) 
	{  
		Map<String, String> map = new HashMap();
		map.put("pid", pid);
		return new ModelAndView("time_special_detail", map);

	}
	@RequestMapping(value ="getSpecialDetailList",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemByPageAndPid(String pid,String page,String rows) 
	{  System.out.println("====================================getItemByParentId================================================");
	
	    EUDataGridResult result = itemservice.getItemByParentId(Integer.parseInt(pid),Integer.parseInt(page), Integer.parseInt(rows));
	   
	    JSONObject jsonarray = JSONObject.fromObject(result);
		
		
		return jsonarray.toString();

	}
	@RequestMapping(value ="getSpecialDetailListOrderBySale",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSaleOrderItemByPageAndPid(String pid,String page,String rows) 
	{  System.out.println("====================================getItemByParentId================================================");
	
	    EUDataGridResult result = itemservice.getItemByParentIdOrderBySale(Integer.parseInt(pid),Integer.parseInt(page), Integer.parseInt(rows));
	   
	    JSONObject jsonarray = JSONObject.fromObject(result);
		
		
		return jsonarray.toString();

	}
	@RequestMapping(value ="getSpecialDetailListOrderByCreated",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getTimeOrderItemByPageAndPid(String pid,String page,String rows) 
	{  System.out.println("====================================getItemByParentId================================================");
	
	    EUDataGridResult result = itemservice.getItemByParentIdOrderByCreated(Integer.parseInt(pid),Integer.parseInt(page), Integer.parseInt(rows));
	   
	    JSONObject jsonarray = JSONObject.fromObject(result);
		
		
		return jsonarray.toString();

	}
	
	@RequestMapping(value ="/getNewItem",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String  getNewItem() throws ParseException
	{ 	System.out.println("========8888888888888888===");
		List<Item> list = itemservice.getnewItems();
//	    SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd"); 
//  for(int k=0;k<list.size();k++)
//  {
//	  for(int z=0;z<list.size()-1-k;z++)
//	  {  // System.out.println(simple.parse(simple.format(list.get(z).getSaleDate())).after(simple.parse(simple.format(list.get(z+1).getSaleDate()))));
//		  if(simple.parse(simple.format(list.get(z).getCreated())).before(simple.parse(simple.format(list.get(z+1).getCreated()))))
//				  {
//			  Item temp = list.get(z);
//			  
//			  list.set(z, list.get(z+1));
//			  list.set( z+1, temp);
//				  }
//	  }
//	  
//  }
//
		System.out.println(list);
		JSONArray jsonarray = JSONArray.fromObject(list);
		return jsonarray.toString();
		
		
	}
	//��ϲ����������ȡItem�б�
	@RequestMapping(value ="/getItemBylikeCountOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemBylikeCountOrder() 
	{  System.out.println("====================================getItemById================================================");
	    
		   return JSONArray.fromObject(itemservice.getlikeCount()).toString();
	   



	}
	@RequestMapping(value ="/getItemBytimeOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemByTimeOrderAndpage(String page,String rows) 
	{  System.out.println("====================================getItemById================================================");
	    
		   return JSONObject.fromObject(itemservice.getItemTimeOrder(Integer.parseInt(page),Integer.parseInt(rows))).toString();
	   



	}
	@RequestMapping(value ="/getItemBylikenumOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemBylikenumOrder(String page,String rows) 
	{  System.out.println("===================================getItemBySaleCountOrder================================================");
	    System.out.println("getItemBySaleCountOrder"+page+"---"+rows);
	    EUDataGridResult result = itemservice.getItemBylikenumOrder(Integer.parseInt(page),Integer.parseInt(rows));
		   return JSONObject.fromObject(result).toString();

	}
	@RequestMapping(value ="/getItemBySaleCountOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemBySaleCountOrder(String page,String rows) 
	{  System.out.println("===================================getItemBySaleCountOrder================================================");
	    System.out.println("getItemBySaleCountOrder"+page+"---"+rows);
	    EUDataGridResult result = itemservice.getSaleCountOrder(Integer.parseInt(page),Integer.parseInt(rows));
		   return JSONObject.fromObject(result).toString();

	}

	@RequestMapping("/getDetail")
	@ResponseBody
	public ModelAndView getDetail(String id) 
	{ System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&77");
		System.out.println("getDetail="+id);
	   Detail detail = new Detail();
	    Item item = itemservice.getItemById(Integer.parseInt(id));
	    List<ItemImg1> itemimg1list = itemimg1service.getItemImg1ById(Integer.parseInt(id));
	    List<ItemImg2> itemimg2list = itemimg2service.getItemImg2ById(Integer.parseInt(id));
		detail.setItem(item);
		detail.setImg1(itemimg1list);
		detail.setImg2(itemimg2list);
		JSONObject jsonobject = JSONObject.fromObject(detail);
		Map<String,String> map = new HashMap<String,String>();
		map.put("detail", jsonobject.toString());
		return new ModelAndView("pro_detail",map);
	
	}
	@RequestMapping("/getfirstShowlist")
	@ResponseBody
	public String getfirstShowlist() 
	{ 
		Detail detail = new Detail();
	    List<Item> items = itemservice.getFirstShowItemsByFirstShow(String.valueOf(1));
	    JSONArray jsonarray = JSONArray.fromObject(items);
		return jsonarray.toString();
	
	}
	
	
	@RequestMapping(value="itemsave", method=RequestMethod.POST)
	@ResponseBody
	private int createItem(String title,String price,String desc,String ownerId) throws Exception {
		//TaotaoResult result = itemService.createItem(item, desc, itemParams);
		System.out.println("itemsave"+desc);
		Item item = new Item();
		item.setTitle(title);
		item.setPrice(Long.decode(price));
		item.setOwnerId(Integer.parseInt(ownerId));
		item.setDescription(desc);
		System.out.println(desc.replaceAll("<img[^>]*/>", ""));
	//����desc
		//String desc = "�ر�ĺã��߹��޲�Ҫ�����<img src='/art/upload/shadouyou/1.jpg' alt='' />grssrg<img src='/art/upload/shadouyou/2.jpg' alt='' /><img src='/art/upload/shadouyou/3.jpg' alt='' /><img src='/art/upload/shadouyou/4.jpg' alt='' />rfsg'";
//		List<Integer> begin = new ArrayList<Integer>();
//		List<Integer> end = new ArrayList<Integer>();
//		List<String> img = new ArrayList<String>();
//		String str = "";
//		char[] c = desc.toCharArray();
//		
//		if(desc.contains("img"))
//		{
//			for(int i=0;i<c.length;i++)
//			{
//				if(String.valueOf(c[i]).equals("<"))
//				{
//					System.out.println("<"+c[i]+"===================="+i);
//					begin.add(i);
//				}
//				if(String.valueOf(c[i]).equals("/")&&String.valueOf(c[i+1]).equals(">"))
//				{
//					System.out.println("/>"+c[i]+"== "+i);
//					end.add(i+1);
//				}
//			}
//			System.out.println(begin);
//			System.out.println(end);
//		}
//		
//		//��img��ֵ
//		
//		for(int j=0;j<begin.size();j++)
//		{
//			img.add(desc.substring(begin.get(j),end.get(j)+1));
//		}
//		
//		//��str��ֵ
//		System.out.println("//"+desc);
//		if(begin.size()>0&&!desc.equals(null))
//		{
//			str = desc.substring(0,begin.get(0));
//			for(int k=0;k<begin.size();k++)
//			{ if(k!=begin.size()-1)
//			{
//				str+=desc.substring(end.get(k)+1,begin.get(k+1));
//			}else
//			{
//				str+=desc.substring(end.get(k)+1);
//			}
//				
//			}
//			
//			
//		}
//		else
//		{
//			str = desc;
//		}
//		System.out.println("str="+str);
//		//�õ�ͼƬ��ַ
//		 String imgAdd[] = new String[img.size()];
//		for(int z=0;z<img.size();z++)
//		{
//			String [] strArray = img.get(z).split("\"");
//			imgAdd[z] = strArray[1];
//		}
		
		System.out.println(item);
		int i = itemservice.insertItem(item);
		System.out.println(item);
		System.out.println(i);
		return i;
	}

	
	@RequestMapping(value ="itemlist",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemList(Integer page, Integer rows) {
		System.out.println("getItemList(---------------------------");
		EUDataGridResult result = itemservice.getItemList(page, rows);
		
		return JSONObject.fromObject(result).toString();
	}

	@RequestMapping(value="restiteminstock", method=RequestMethod.POST)
	@ResponseBody
	public int itemInstock(Integer[] ids)
	{System.out.println("itemInstock----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
	 int i = 0;	
	 for(Integer id:ids)
		{
			i+= itemservice.InstockItem(id);
		}
	if(i==ids.length)
	{
		return 1;
	}
		return 0;
	}
	@RequestMapping(value="restitemreshelf", method=RequestMethod.POST)
	@ResponseBody
	public int itemReshelf(Integer[] ids)
	{
		int i = 0;	
		for(Integer id:ids)
			{
				i+= itemservice.ReshelfItem(id);
			}
		if(i==ids.length)
		{
			return 1;
		}
			return 0;
	}
	@RequestMapping(value="restitemqueryitemdesc")
	@ResponseBody
	public TaotaoResult edit(Integer id)
	{   System.out.println("�༭"+id);
		TaotaoResult result = new TaotaoResult();
		Item item = itemservice.getItemById(id);
		System.out.println(item);
		if(item!=null)
		{
			result.setData(item);
			result.setStatus(200);
		}
		return result;
	}
	@RequestMapping(value="restitemdelete")
	@ResponseBody
	public int delete(Integer[] ids)
	{
		int i = 0;	
		for(Integer id:ids)
			{
				i+= itemservice.deleteItemById(id);
			}
		if(i==ids.length)
		{
			return 1;
		}
			return 0;
	}
	@RequestMapping("/gotojiesuan")
	@ResponseBody
	public ModelAndView getShippingAddressByUid(String id) 
	{ 
		Item item = itemservice.getItemById(Integer.parseInt(id));
		JSONObject jsonobject = JSONObject.fromObject(item);
		Map<String,String> map = new HashMap<String,String>();
		map.put("item", jsonobject.toString());
		ModelAndView mv = new ModelAndView();
		mv.addAllObjects(map);
		mv.setViewName("jiesuan");
		return mv;
	
	}
}

