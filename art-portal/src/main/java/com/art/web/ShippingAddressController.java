package com.art.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.ShippingAddress;
import com.art.service.ShippingAddressService;

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
@RequestMapping(value ="/save",produces = "text/html;charset=UTF-8" )
@ResponseBody()
public String updata(Integer id,Integer uid,String address,String sname,String stel,String addressDetail,String code )
{   ShippingAddress sa = new ShippingAddress();
System.out.println(id==null);
if(!(id==null))
{
	sa.setId(id);
	
}
else
{
	sa.setId(null);
	sa.setUid(uid);
}   
    sa.setSname(sname);
    sa.setAddress(address);
    sa.setStel(stel);
    sa.setAddressDetail(addressDetail);
    sa.setCode(code);
	System.out.println("����id="+sa);
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
}
