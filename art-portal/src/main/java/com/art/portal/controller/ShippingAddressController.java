package com.art.portal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.art.pojo.ShippingAddress;
import com.art.service.ShippingAddressService;
import com.art.util.JsonUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ShippingAddressController {
	@Autowired
	ShippingAddressService shippingAddressService;

	
	@RequestMapping(value ="/getShippingAddress",produces = "text/html;charset=UTF-8" )
@ResponseBody()
public String getShippingAddress(Integer uid)
{   
	List<ShippingAddress> sas = shippingAddressService.getShippingAddressByUid(uid);
	JSONArray jsonobject = JSONArray.fromObject(sas);
	return jsonobject.toString();
}
@RequestMapping(value ="/saveshoppingaddress",produces = "text/html;charset=UTF-8" )
@ResponseBody()
public String updata(Integer id,Integer uid,String sname,String stel,String addressDetail,String code,String city,String province,String area )
{  
	System.out.println("进入了saveshoppingaddress");
	ShippingAddress sa = new ShippingAddress();
       sa.setId(id);
       sa.setUid(uid);
       sa.setAddressDetail(addressDetail);
       sa.setSname(sname);
       sa.setStel(stel);
       sa.setCode(code);
       sa.setProvince(province);
       sa.setCity(city);
       sa.setArea(area);
	Integer i = shippingAddressService.updata(sa);
	System.out.println("controller"+i);
	JSONObject json =JSONObject.fromObject(i);
	return json.toString();
//	shippingaddressservice.update();
}
@RequestMapping(value ="/getShippAddressById",produces = "text/html;charset=UTF-8" )
@ResponseBody()
public String getShippingAddressById(Integer id)
{  ShippingAddress sa = shippingAddressService.getShippingAddressById(id);
  System.out.println("c"+sa);
  JSONObject json = JSONObject.fromObject(sa);
  System.out.println(json.toString());
	return json.toString();
}
@RequestMapping(value ="/deleteShippAddressById",produces = "text/html;charset=UTF-8" )
@ResponseBody()
public String deleteShippingAddressById(Integer id)
{ Integer i = shippingAddressService.deleteShippingAddressById(id);
  JSONObject json = JSONObject.fromObject(i);
  System.out.println(json.toString());
	return json.toString();
}
//根据传过来的UID获取收获地址并传给jiesuan.jsp
	@RequestMapping("getSAS")
	@ResponseBody
	public String getShippingAddressByUid(String uid) 
	{ System.out.println("nb");
		List<ShippingAddress> slist = shippingAddressService.getShippingAddressByUid(Integer.parseInt(uid));
		JSONArray jsonobject = JSONArray.fromObject(slist);
		
		return jsonobject.toString();
	
	}
	//把收货地址带到结算页面
		@RequestMapping("gotojiesuan")
		@ResponseBody
		public ModelAndView trasShippingAddressByUid(String uid,String totalprice) 
		{    System.out.println("总价============"+totalprice);
		
			 List<ShippingAddress> slist = shippingAddressService.getShippingAddressByUid(Integer.parseInt(uid));
			 Map<String,Object> map = new HashMap<String,Object>();
			 map.put("slist",slist);
			 ModelAndView mv =  new ModelAndView();
			 mv.setViewName("jiesuan");
			 mv.addAllObjects(map);
			return mv;
		
		}
		
		
		//创建订单
				
}
