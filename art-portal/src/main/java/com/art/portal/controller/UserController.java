package com.art.portal.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
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
import com.art.util.ArtResult;

import net.sf.json.JSONObject;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ItemService itemservice;
	
	/**
	 * @describe 通过user的id查询用户
	 * @param uid（用户id）
	 * @return 把用户的生日赋给TaotaoResult的msg,用户
	 */
	@RequestMapping("getUserById")
	@ResponseBody
	public String getUser(Integer uid)//通过user的id查询user返回一个Taotaoresul的字符串
	{   SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
		User u = userService.getUserById(uid);
		Date d = u.getBirthday();
		String date = simpledate.format(d);
		ArtResult result = new ArtResult();//Taotaoresult带着user对象u和生日的字符串形式d返回前台
		result.setMsg(date);
		result.setData(u);
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
	
	/**
	 * @describe 付款的时候减钱
	 * 待完善
	 */
	@RequestMapping("payOne")
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
		                    		                	
		                    buyerCart = om.readValue(URLDecoder.decode(cookie.getValue(), "utf-8"), Car.class);
		                    list = buyerCart.getItems();
		                   
		                    break;
		                }
		            }
		        }
		       for(Item item:list)
		       {
		    	   int j = itemservice.InstockItem(item.getId());
		    	   buyerCart.setItems(new ArrayList<Item>());
		    	   Writer w = new StringWriter();
				   om.writeValue(w, buyerCart);
				   Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
		       }
		}
		ArtResult result = new ArtResult();
		result.setStatus(i);;
		result.setMsg(u.getMoney());
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
	/**
	 * @describe 付款的时候减钱
	 * 待完善
	 */
	@RequestMapping("pay")
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
		                    		                	
		                    buyerCart = om.readValue(URLDecoder.decode(cookie.getValue(), "utf-8"), Car.class);
		                    list = buyerCart.getItems();
		                   
		                    break;
		                }
		            }
		        }
		       for(Item item:list)
		       {
		    	   int j = itemservice.InstockItem(item.getId());
		    	 
		    	   buyerCart.setItems(new ArrayList<Item>());
		    	    Writer w = new StringWriter();
					 om.writeValue(w, buyerCart);
					 Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
		       }
		}
		ArtResult result = new ArtResult();
		result.setStatus(i);;
		result.setMsg(u.getMoney());
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
//********************************************************************************************************************************
	/**
	 * @describe 保存用户
	 * @param User类型的user
	 * @return 是否插入成功
	 */
	@RequestMapping("usersave")//保存用户
	@ResponseBody
	public int insertUser(User user)
	{
		int i = userService.insert(user);
		return i ;
	}
	
	@RequestMapping(value ="restuserupdatefront")
	@ResponseBody
	public User updata(String money,String upassword,Integer uid,String uname,String birthday,String sex,String tel,String qq,String email) throws ParseException
	{  System.out.println(money);
	    DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");	  
		User u = new User();
		u.setUid(uid);
	    u.setUpassword(upassword);
	    if(birthday!=null)
	    {
	    	u.setBirthday(fmt.parse(birthday));
	    }
		u.setUname(uname);
		u.setSex(sex);
		u.setTel(tel);
		u.setQq(qq);
		u.setEmail(email);
		u.setMoney(money);
		System.out.println("updata"+u);
		userService.update(u);
		return u;
	}
}
