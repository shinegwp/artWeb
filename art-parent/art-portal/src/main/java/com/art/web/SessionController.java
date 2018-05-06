package com.art.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.art.pojo.User;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;
@SessionAttributes("user")
@Controller
public class SessionController {

	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value ="getSessionUser",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String test( @ModelAttribute("user")User user,HttpServletRequest request  ) throws ParseException, UnsupportedEncodingException
	{System.out.println("getSession#######################################");
	System.out.println("getSession#######################################");
	System.out.println("getSession#######################################");
	Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组  
	SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
	User u = new User();
	if (null==cookies) {  
        System.out.println("没有cookie=========");  
    } else {  
        for(Cookie cookie : cookies){ 
        	if(cookie.getName().equals("uid"))
        	{
        		u.setUid(Integer.parseInt(cookie.getValue()));
        	}
        	if(cookie.getName().equals("birthday"))
        	{ 
        		Date d = simpledate.parse(cookie.getValue());
        		u.setBirthday(d);
        		
        	}
        	if(cookie.getName().equals("email"))
        	{
        		u.setEmail(cookie.getValue());
        	}
        	if(cookie.getName().equals("qq")) 
        	{
        		u.setQq(cookie.getValue());
        	}
        	if(cookie.getName().equals("sex"))
        	{
        		u.setSex(URLDecoder.decode(cookie.getValue(), "UTF-8"));
        	}
        	if(cookie.getName().equals("tel"))
        	{
        		u.setTel(cookie.getValue());
        	}
        	if(cookie.getName().equals("uidentification"))
        	{
        		u.setUidentification(cookie.getValue());
        	}
        	if(cookie.getName().equals("uname"))
        	{ 
        		
        		u.setUname(URLDecoder.decode(cookie.getValue(), "UTF-8"));
        	}
        	if(cookie.getName().equals("upassword"))
        	{
        		u.setUpassword(cookie.getValue());
        	}
            //System.out.println("name:"+cookie.getName()+",value:"+ cookie.getValue());  
        }  
    }  
	
	System.out.println(u);	
	Date d = u.getBirthday();
	String date = simpledate.format(d);
	TaotaoResult result = new TaotaoResult();
	result.setMsg(date);
	result.setData(u);
		JSONObject json = JSONObject.fromObject(result);
		System.out.println(json.toString());
		return json.toString();
	}
	
}
