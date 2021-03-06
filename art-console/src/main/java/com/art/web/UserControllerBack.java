package com.art.web;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.art.pojo.User;
import com.art.service.UserServiceBack;
import com.art.util.EUDataGridResult;

@Controller
public class UserControllerBack {
	@Autowired(required=true)
	UserServiceBack userServiceBack;
	
	@RequestMapping("userlist")
	@ResponseBody
	public EUDataGridResult getUserList(Integer page, Integer rows)
	{	
			EUDataGridResult result = userServiceBack.getUserList(page, rows);
			return result;
		
	}
	@RequestMapping("/")
	public String showIndex() {
		return "manager";
	}
	@RequestMapping("/{page}")
	public String showpage(@PathVariable String page) {
		return page;
	}
	@RequestMapping(value ="restUserDelete")//��̨
	@ResponseBody
	public int deleteUsers(Integer[] ids)
	{	
		int i = 0;	
		for(Integer id:ids)
			{
				i+= userServiceBack.deleteItemById(id);
			}
		if(i==ids.length)
		{
			return 1;
		}
			return 0;
	}
	@RequestMapping(value ="restuserupdate")
	@ResponseBody
	public User updata(long money,String upassword,Integer uid,String uname,String birthday,String sex,String tel,String qq,String email) throws ParseException
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
		userServiceBack.update(u);
		return u;
	}
	@RequestMapping("usersaveback")
	@ResponseBody
	public int insertUser(User user)
	{
		
		user.setUpassword(DigestUtils.md5DigestAsHex(user.getUpassword().getBytes()));
		int i = userServiceBack.insert(user);
		return i ;
	}
	
}

