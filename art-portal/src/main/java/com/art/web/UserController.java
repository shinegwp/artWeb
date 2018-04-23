package com.art.web;

import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.art.pojo.Car;
import com.art.pojo.Item;
import com.art.pojo.User;
import com.art.service.ItemService;
import com.art.service.UserService;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
@SessionAttributes("user") //��session��桾//ȡuserid @SessionAttributes("userid")  ,@ModelAttribute("userid")int uid��

public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ItemService itemservice;
	
	
	@RequestMapping("getUserById")
	@ResponseBody
	public String getUser(Integer uid)
	{   SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
		User u = userService.getUserById(uid);
		Date d = u.getBirthday();
		String date = simpledate.format(d);
		TaotaoResult result = new TaotaoResult();
		result.setMsg(date);
		result.setData(u);
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
	@RequestMapping("payOne")//֧��һ����Ʒ
	@ResponseBody
	public String reduceOneMoney(HttpServletResponse response,HttpServletRequest request,String money,String uid) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException
	{   User u = userService.getUserById(Integer.parseInt(uid));
	    u.setMoney(String.valueOf(Integer.parseInt(u.getMoney())-Integer.parseInt(money)));
		int i = userService.reduceMoney(u);
		if(i==1)
		{List<Item> list = new ArrayList<Item>();
			Cookie[] cookies = request.getCookies();
			 ObjectMapper om = new ObjectMapper();     
		       Car buyerCart = null;
		       if (null != cookies && cookies.length > 0) {
		            for (Cookie cookie : cookies) {
		                //
		                if ("car".equals(cookie.getName())) {
		                    //���ﳵ ���� ��json�ַ�����ת
		                	
		                    buyerCart = om.readValue(URLDecoder.decode(cookie.getValue(), "utf-8"), Car.class);
		                    list = buyerCart.getItems();
		                   
		                    break;
		                }
		            }
		        }
		       for(Item item:list)
		       {
		    	   int j = itemservice.InstockItem(item.getId());//����Ʒ�¼ܣ�
		    	 
		    	   buyerCart.setItems(new ArrayList<Item>());//�����ﳵ���
		    	    Writer w = new StringWriter();
					 om.writeValue(w, buyerCart);
					 Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
		       }
		}
		TaotaoResult result = new TaotaoResult();
		result.setStatus(i);;
		result.setMsg(u.getMoney());
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
	@RequestMapping("pay")//֧�����ﳵ�����Ʒ
	@ResponseBody
	public String reduceMoney(HttpServletResponse response,HttpServletRequest request,String money,String uid) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException
	{   User u = userService.getUserById(Integer.parseInt(uid));
	    u.setMoney(String.valueOf(Integer.parseInt(u.getMoney())-Integer.parseInt(money)));
		int i = userService.reduceMoney(u);
		if(i==1)
		{List<Item> list = new ArrayList<Item>();
			Cookie[] cookies = request.getCookies();
			 ObjectMapper om = new ObjectMapper();     
		       Car buyerCart = null;
		       if (null != cookies && cookies.length > 0) {
		            for (Cookie cookie : cookies) {
		                //
		                if ("car".equals(cookie.getName())) {
		                    //���ﳵ ���� ��json�ַ�����ת
		                	
		                    buyerCart = om.readValue(URLDecoder.decode(cookie.getValue(), "utf-8"), Car.class);
		                    list = buyerCart.getItems();
		                   
		                    break;
		                }
		            }
		        }
		       for(Item item:list)
		       {
		    	   int j = itemservice.InstockItem(item.getId());//����Ʒ�¼ܣ�
		    	 
		    	   buyerCart.setItems(new ArrayList<Item>());//�����ﳵ���
		    	    Writer w = new StringWriter();
					 om.writeValue(w, buyerCart);
					 Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
		       }
		}
		TaotaoResult result = new TaotaoResult();
		result.setStatus(i);;
		result.setMsg(u.getMoney());
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
//********************************************************************************************************************************
	
	@RequestMapping("usersave")//ǰ��̨����
	@ResponseBody
	public int insertUser(User user)
	{
		int i = userService.insert(user);
		return i ;
	}
}
