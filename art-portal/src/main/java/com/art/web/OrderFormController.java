package com.art.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Car;
import com.art.pojo.Item;
import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormWithBLOBs;
import com.art.service.OrderFormService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
public class OrderFormController {
	@Autowired
	OrderFormService orderFormService;
	
	@RequestMapping(value ="getOrderFormListByPage",produces = "text/html;charset=UTF-8")
	@ResponseBody()
	public String OrderFormListByUidAndPage(Integer uid,Integer page,Integer rows)
	{ System.out.println("controller");
	  EUDataGridResult rlist = orderFormService.getOrderFormByUidAndPage(uid, page, rows);
	  JSONObject json = JSONObject.fromObject(rlist);
	  return json.toString();
	}
	
	
	@RequestMapping(value ="getReturnListByPage",produces = "text/html;charset=UTF-8")
	@ResponseBody()
	public String getReturnOrderFormListByPage(Integer uid,Integer page,Integer rows,String state) throws UnsupportedEncodingException
	{
	  EUDataGridResult rlist = orderFormService.getReturnOrderFormListByPage(uid, page, rows,new String(state.getBytes("iso-8859-1"),"utf-8"));
	  JSONObject json = JSONObject.fromObject(rlist);
	  return json.toString();
	}
	@RequestMapping(value ="setState",produces = "text/html;charset=UTF-8")
	@ResponseBody()
	public String updateOrderFormListById(Integer id,String state)	  
	{ int i =0;
		try {
		System.out.println("申请售后"+new String(state.getBytes("iso-8859-1"),"utf-8"));
		String sta =new String(state.getBytes("iso-8859-1"),"utf-8"); 
		OrderForm orderform = new OrderForm();
		orderform.setId(id);
		orderform.setState(sta);
			i = orderFormService.updateOrderFormById(orderform);
			System.out.println(i);
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		return JSONObject.fromObject(i).toString();
	}
	@RequestMapping(value ="getOrderFormById",produces = "text/html;charset=UTF-8")
	@ResponseBody()
	public String getReturnOrderFormListByPage(Integer id)
	{ System.out.println("getReturnOrdercontroller");
	OrderForm rlist = orderFormService.getOrderFormListById(id);
	  JSONObject json = JSONObject.fromObject(rlist);
	  return json.toString();
	}
	@RequestMapping(value ="addOrder",produces = "text/html;charset=UTF-8")
	@ResponseBody()
	public String addOrderForm(String uid,String peopleName,String tel,String address,String code,HttpServletRequest request,HttpServletResponse response) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException
	{ System.out.println("99999999999999");
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
	   Date date = new Date();	
		Cookie[] cookies = request.getCookies();
		 ObjectMapper om = new ObjectMapper(); 
		 List<Item> list = new ArrayList<Item>();
		 Car car = null;
		
		 TaotaoResult result = new TaotaoResult();
		 result.setStatus(1);
		 if (null != cookies && cookies.length > 0) {
		for(Cookie c:cookies)
		{
			if("car".equals(c.getName()))
					{
				    car = om.readValue(URLDecoder.decode(c.getValue(), "utf-8"), Car.class);
					}
		}
		if(car!=null)
		{
			 list = car.getItems();
			 int sum = 0;
			 for(Item item:list)
			 {sum+=item.getPrice();
				 OrderFormWithBLOBs orderform  = new OrderFormWithBLOBs();
					orderform.setAddress(address);
					orderform.setPeopleName(peopleName);
					orderform.setTel(tel);
					orderform.setCode(code);
					orderform.setItemTitle(item.getTitle());
					orderform.setItemImg(item.getImgAddress());
					orderform.setUnitPrice(Integer.parseInt(String.valueOf(item.getPrice())));
					orderform.setTime(date);
					orderform.setFormNum(sdf.format(date));
					orderform.setState("待支付");
					orderform.setUid(Integer.parseInt(uid));
					System.out.println(orderform);
					int i = orderFormService.insert(orderform);
					if(i==0)
					{  result.setStatus(0);
						break;
					}
					
					
			 }
			 result.setMsg(String.valueOf(sum));
		}
		
	 
	}
		 JSONObject json = JSONObject.fromObject(result);
		  return json.toString();
	
	}
}
