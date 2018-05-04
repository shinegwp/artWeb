package com.art.portal.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.art.pojo.Car;
import com.art.pojo.Item;
import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormWithBLOBs;
import com.art.pojo.ShippingAddress;
import com.art.pojo.User;
import com.art.poral.pojo.CartItem;
import com.art.portal.service.CartService;
import com.art.service.OrderFormService;
import com.art.service.ShippingAddressService;
import com.art.service.UserService;
import com.art.util.EUDataGridResult;
import com.art.util.ArtResult;

import net.sf.json.JSONObject;

@Controller
public class OrderFormController {
	@Autowired
	OrderFormService orderFormService;
	@Autowired
	CartService cartService ;
	@Autowired
	UserService userService ;
	@Autowired
	ShippingAddressService shippingAddressService;
	/**
	 * @describe 分页查询订单
	 * @param uid 用户id
	 * @param page 页号
	 * @param rows 记录数
	 * @return
	 */
//	@RequestMapping(value ="getOrderFormListByPage",produces = "text/html;charset=UTF-8")
//	@ResponseBody()
//	public String OrderFormListByUidAndPage(Integer uid,Integer page,Integer rows)
//	{ System.out.println("controller");
//	  EUDataGridResult rlist = orderFormService.getOrderFormByUidAndPage(uid, page, rows);
//	  JSONObject json = JSONObject.fromObject(rlist);
//	  return json.toString();
//	}
//	
//	/**
//	 * @describe 分页查询得到申请售后的订单
//	 * @param uid 用户id
//	 * @param page 页号
//	 * @param rows 记录数
//	 * @param state 订单状态
//	 * @return
//	 * @throws UnsupportedEncodingException
//	 */
//	@RequestMapping(value ="getReturnListByPage",produces = "text/html;charset=UTF-8")
//	@ResponseBody()
//	public String getReturnOrderFormListByPage(Integer uid,Integer page,Integer rows,String state) throws UnsupportedEncodingException
//	{
//	  EUDataGridResult rlist = orderFormService.getReturnOrderFormListByPage(uid, page, rows,new String(state.getBytes("iso-8859-1"),"utf-8"));
//	  JSONObject json = JSONObject.fromObject(rlist);
//	  return json.toString();
//	}
//	@RequestMapping(value ="setState",produces = "text/html;charset=UTF-8")
//	@ResponseBody()
//	public String updateOrderFormListById(Integer id,String state)	  
//	{ int i =0;
//		try {
//		String sta =new String(state.getBytes("iso-8859-1"),"utf-8"); 
//		OrderForm orderform = new OrderForm();
//		orderform.setId(id);
//		orderform.setState(sta);
//			i = orderFormService.updateOrderFormById(orderform);
//			System.out.println(i);
//	} catch (UnsupportedEncodingException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//		
//		return JSONObject.fromObject(i).toString();
//	}
//	@RequestMapping(value ="getOrderFormById",produces = "text/html;charset=UTF-8")
//	@ResponseBody()
//	public String getReturnOrderFormListByPage(Integer id)
//	{ System.out.println("getReturnOrdercontroller");
//	OrderForm rlist = orderFormService.getOrderFormListById(id);
//	  JSONObject json = JSONObject.fromObject(rlist);
//	  return json.toString();
//	}
	@RequestMapping("creatOrderForm")
	@ResponseBody
	public ModelAndView creatOrderForm(String uid,String sid,HttpServletRequest request,HttpServletResponse response) 
	{   List<OrderFormWithBLOBs> orderformlist = new ArrayList<OrderFormWithBLOBs>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		//SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd");
		List<CartItem> ItemList = cartService.getCartItemList(request, response);
		System.out.println("OrderFoem查出的购物车商品"+ItemList);
         ShippingAddress shippingaddress = shippingAddressService.getShippingAddressById(Integer.parseInt(sid));
         OrderFormWithBLOBs orderform  = new OrderFormWithBLOBs ();
         orderform.setAddressDetail(shippingaddress.getAddressDetail());
         orderform.setProvince(shippingaddress.getProvince());
         orderform.setCity(shippingaddress.getCity());
         orderform.setArea(shippingaddress.getArea());
         orderform.setCode(shippingaddress.getCode());
         orderform.setPeopleName(shippingaddress.getSname());
         orderform.setTel(shippingaddress.getStel());
         orderform.setUid(Long.getLong(uid));
         orderform.setFormNum(sdf.format(new Date()));
         orderform.setTime(new Date());
         long total = 0;
         
         for(CartItem item:ItemList)
         {   System.out.println(item.getPrice());
        	total+=item.getPrice();
         }
         User u =userService.getUserById(Integer.parseInt(uid));
         if(u.getMoney()-total>0)
         {
        	 for(CartItem item:ItemList)
             {
            	 orderform.setUnitPrice(item.getPrice());
            	 orderform.setState("待支付");
            	 orderform.setItemId(item.getId());
            	 orderform.setMoney(total);
            	 orderform.setNum(item.getNum());
            	 orderFormService.creatOrderForm(orderform);
            	 orderformlist.add(orderform);
            	 orderform.setTime(new Date());
             }
            
             u.setMoney(u.getMoney()-total);
             userService.update(u);
             Map map = new HashMap<String,Object>();
    		 map.put("orderformlist", orderformlist);
    		 map.put("msg", "下单成功！");
    		 ModelAndView mv =  new ModelAndView();
    		 mv.setViewName("ordersuccess");
    		 mv.addAllObjects(map);
    		 return mv;
         }
         else
         {
        	 Map map = new HashMap<String,Object>();
    		 map.put("msg", "余额不足");
    		 ModelAndView mv =  new ModelAndView();
    		 mv.setViewName("ordersuccess");
    		 mv.addAllObjects(map);
    		 return mv;
         }
		 
		
	
	}
//	@RequestMapping(value ="addOrder",produces = "text/html;charset=UTF-8")
//	@ResponseBody()
//	public String addOrderForm(String uid,String peopleName,String tel,String address,String code,HttpServletRequest request,HttpServletResponse response) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException
//	{ System.out.println("99999999999999");
//	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
//	   Date date = new Date();	
//		Cookie[] cookies = request.getCookies();
//		 ObjectMapper om = new ObjectMapper(); 
//		 List<Item> list = new ArrayList<Item>();
//		 Car car = null;
//		
//		 ArtResult result = new ArtResult();
//		 result.setStatus(1);
//		 if (null != cookies && cookies.length > 0) {
//		for(Cookie c:cookies)
//		{
//			if("car".equals(c.getName()))
//					{
//				    car = om.readValue(URLDecoder.decode(c.getValue(), "utf-8"), Car.class);
//					}
//		}
//		if(car!=null)
//		{
//			 list = car.getItems();
//			 int sum = 0;
//			 for(Item item:list)
//			 {sum+=item.getPrice();
//				 OrderFormWithBLOBs orderform  = new OrderFormWithBLOBs();
//					orderform.setAddress(address);
//					orderform.setPeopleName(peopleName);
//					orderform.setTel(tel);
//					orderform.setCode(code);
//					orderform.setItemTitle(item.getTitle());
//					orderform.setItemImg(item.getImgAddress());
//					orderform.setUnitPrice(Integer.parseInt(String.valueOf(item.getPrice())));
//					orderform.setTime(date);
//					orderform.setFormNum(sdf.format(date));
//					orderform.setState("待支付");
//					orderform.setUid(Integer.parseInt(uid));
//					System.out.println(orderform);
//					int i = orderFormService.insert(orderform);
//					if(i==0)
//					{  result.setStatus(0);
//						break;
//					}
//					
//					
//			 }
//			 result.setMsg(String.valueOf(sum));
//		}
//		
//	 
//	}
//		 JSONObject json = JSONObject.fromObject(result);
//		  return json.toString();
//	
//	}
}
