package com.art.web;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.art.pojo.Car;
import com.art.pojo.Item;
import com.art.pojo.User;
import com.art.service.ItemService;
import com.art.service.UserService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
@SessionAttributes("user") //往session里存【//取userid @SessionAttributes("userid")  ,@ModelAttribute("userid")int uid】

public class UserController {

	@Autowired
	private UserService userservice;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ItemService itemservice;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login( String username,String password,ModelMap map ,HttpServletResponse response) throws UnsupportedEncodingException
	{	System.out.println("登陆功能！"+username+"=="+password);
//		String []usernameAndPassword = str.split(",");
//		String username = usernameAndPassword[1];
//		String password = usernameAndPassword[0];
	    
		User user = userservice.getUserByTel(username);
		
		String msg ="error";
		if(user!=null)
		{System.out.println(user.getUname());
			if(user.getUpassword().equals(password))
			{    map.put("user", user);
			SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
			 Cookie cookieuid = new Cookie("uid",String.valueOf(user.getUid())); 
			 Cookie cookiebir = new Cookie("birthday",simpledate.format(user.getBirthday()));
			 Cookie cookieema = new Cookie("email",user.getEmail());
			 Cookie cookieqq = new Cookie("qq",user.getQq());
			 Cookie cookiesex = new Cookie("sex",URLEncoder.encode(user.getSex(), "UTF-8"));
			 Cookie cookietel = new Cookie("tel",user.getTel());
			 Cookie cookieuide = new Cookie("uidentification",user.getUidentification());
			 Cookie cookieuname = new Cookie("uname",URLEncoder.encode(user.getUname(), "UTF-8"));
			 Cookie cookiepass = new Cookie("upassword",user.getUpassword());
			 Cookie cookiemon = new Cookie("money",user.getMoney());
			 response.addCookie(cookieuid);
			 response.addCookie(cookiebir);
			 response.addCookie(cookieema);
			 response.addCookie(cookieqq);
			 response.addCookie(cookiesex); 
			 response.addCookie(cookiesex);
			 response.addCookie(cookietel);
			 response.addCookie(cookieuide);
			 response.addCookie(cookieuname);
			 response.addCookie(cookiepass);
			 response.addCookie(cookiemon);
				 msg = "successful";
				 
				 
				return msg;
			}
			return msg;
		}
		else
		{
			return msg;
		}
	}
	@RequestMapping("/regis")
	@ResponseBody
	public String register(String username,String tel,String password1,String password2,String ident)
	{
		String uusername = username;
		String utel = tel;
		String pas = password1;
		String ide = ident;
		if((password1!="")&&(password2!=""))
		{
			if(!password1.equals(password2))
			{
				return "false";
			}	
			else
			{ 
				if(username==""||tel==""||ident=="")
				{
					return "false";
				}
				else
				{
					User user = new User();
					user.setUid(null);
					user.setTel(utel);
					user.setUidentification(ide);
					user.setUname(uusername);
					user.setUpassword(pas);
						int i = userservice.insertOneUser(user);
						return "successful";
				}
				 
				
			}
		}
	else    
		{ 
		  return "false";
		}
	}
	@RequestMapping("userlist")
	@ResponseBody
	public EUDataGridResult getUserList(Integer page, Integer rows)
	{	
			EUDataGridResult result = userservice.getUserList(page, rows);
			return result;
		
	}
	
	@RequestMapping(value ="restUserDelete",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public int deleteUsers(Integer[] ids)
	{	System.out.println("删除");
		int i = 0;	
		for(Integer id:ids)
			{
				i+= userservice.deleteItemById(id);
			}
		if(i==ids.length)
		{
			return 1;
		}
			return 0;
	}
	@RequestMapping(value ="restuserupdate")
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
	   userservice.update(u);
		return u;
	}
	
	@RequestMapping("usersave")
	@ResponseBody
	public int insertUser(User user)
	{
		int i = userservice.insert(user);
		return i ;
	}
	@RequestMapping("getUserById")
	@ResponseBody
	public String getUser(Integer uid)
	{   SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
		User u = userservice.getUserById(uid);
		Date d = u.getBirthday();
		String date = simpledate.format(d);
		TaotaoResult result = new TaotaoResult();
		result.setMsg(date);
		result.setData(u);
			JSONObject json = JSONObject.fromObject(result);
		
		return json.toString() ;
	}
	@RequestMapping("pay")
	@ResponseBody
	public String reduceMoney(HttpServletResponse response,HttpServletRequest request,String money,String uid) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException
	{  User u = userservice.getUserById(Integer.parseInt(uid));
	    u.setMoney(String.valueOf(Integer.parseInt(u.getMoney())-Integer.parseInt(money)));
	    
		int i = userservice.reduceMoney(u);
		if(i==1)
		{List<Item> list = new ArrayList<Item>();
			Cookie[] cookies = request.getCookies();
			 ObjectMapper om = new ObjectMapper();     
		       Car buyerCart = null;
		       if (null != cookies && cookies.length > 0) {
		            for (Cookie cookie : cookies) {
		                //
		                if ("car".equals(cookie.getName())) {
		                    //购物车 对象 与json字符串互转
		                	
		                    buyerCart = om.readValue(URLDecoder.decode(cookie.getValue(), "utf-8"), Car.class);
		                    list = buyerCart.getItems();
		                   
		                    break;
		                }
		            }
		        }
		       for(Item item:list)
		       {
		    	   int j = itemservice.InstockItem(item.getId());//给商品下架；
		    	 
		    	   buyerCart.setItems(new ArrayList<Item>());//将购物车清空
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
	
}
