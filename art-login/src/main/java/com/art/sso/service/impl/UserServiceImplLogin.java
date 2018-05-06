package com.art.sso.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.art.mapper.UserMapper;
import com.art.pojo.User;
import com.art.pojo.UserExample;
import com.art.pojo.UserExample.Criteria;
import com.art.sso.service.JedisClient;
import com.art.sso.service.UserServiceLogin;
import com.art.util.ArtResult;
import com.art.util.CookieUtils;
import com.art.util.JsonUtils;
/**
 * @time 18.4.27
 * @author 高位鹏
 * @describe  对User表数据校验方法的实现,注册功能的实现，登录功能的实现，通过token获取对象功能的实现。
 */


@Service
public class UserServiceImplLogin implements UserServiceLogin {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private JedisClient jedisClient;
	
	/**
	 * @describe 数据校验
	 * 
	 */
	public ArtResult checkDate(String content, Integer type) {
		//创建查询条件
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		
		//对数据进行校验  1，2，3 分别代表  uname  tel  email
		
		//对uname进行检验
		if (type == 1) {
			criteria.andUnameEqualTo(content);
		} else if (2 == type) {//电话校验
			criteria.andTelEqualTo(content);
		} else if (3 == type) {//Email校验
			criteria.andEmailEqualTo(content);
		}
		//执行查询
		List<User> list = userMapper.selectByExample(userExample);
		//对查询结果进行判断
		if (list == null || list.size() == 0) {
			return ArtResult.ok(true);
		}
		return ArtResult.ok(false);
	}
	
	/**
	 * @describe 注册功能
	 */
	public ArtResult createUser(User user) {
		//MD5加密
		user.setUpassword(DigestUtils.md5DigestAsHex(user.getUpassword().getBytes()));
		
		userMapper.insert(user);
		return ArtResult.ok();
	}

	
	
	/**
	 * @describe 登录功能
	 */
	public ArtResult userLogin(String uname, String upassword,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println(uname + upassword);
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(uname);
		List<User> list = userMapper.selectByExample(example);
		//如果没有此用户名
		if (null == list || list.size() == 0) {
			return ArtResult.build(400, "用户名或密码错误");
		}
		User user = list.get(0);
		//比对密码
		System.out.println(user.getBirthday());
		if (!DigestUtils.md5DigestAsHex(upassword.getBytes()).equals(user.getUpassword())) {
			return ArtResult.build(400, "用户名或密码错误");
		}
		//生成token
		String token = UUID.randomUUID().toString();
		//把用户信息写入redis
		jedisClient.set("REDIS_USER_SESSION:" + token, JsonUtils.objectToJson(user));
		//设置session的过期时间
		jedisClient.expire("REDIS_USER_SESSION:" + token, 18000);
		
		//添加写cookie的逻辑，cookie的有效期是关闭浏览器就失效。
		System.out.println(request.getRequestURI()+"shezhishi"+request.getContextPath());
		CookieUtils.setCookie(request, response, "TT_TOKEN", token);
		System.out.println(CookieUtils.getCookieValue(request, "TT_TOKEN")+"这是从页面中取得token");
		//返回token
		return ArtResult.ok(token);
	}

	/**
	 * @describe 通过token获取对象信息
	 */
	public ArtResult getUserByToken(String token) {
		
		
		//根据token从redis中查询用户信息
		String json = jedisClient.get("REDIS_USER_SESSION:" + token);
		System.out.println(json+"查用户信息");
		//判断是否为空
		if (StringUtils.isBlank(json)) {
			return ArtResult.build(400, "此session已经过期，请重新登录");
		}
		//更新过期时间
		jedisClient.expire("REDIS_USER_SESSION:" + token, 180);
		//返回用户信息
		if (JsonUtils.jsonToPojo(json, User.class).getBirthday()!=null) {
			return ArtResult.ok(JsonUtils.jsonToPojo(json, User.class),(new SimpleDateFormat("yyyy-MM-dd").format(JsonUtils.jsonToPojo(json, User.class).getBirthday())));
		}
		return ArtResult.ok(JsonUtils.jsonToPojo(json, User.class),"");
	}
    //退出登录
	public ArtResult outLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("我进推出方法了");
			System.out.println(request.getRequestURI());
			CookieUtils.deleteCookie(request, response, "TT_TOKEN");
			System.out.println("执行完毕");
			System.out.println(ArtResult.ok(new User()).toString());
			return ArtResult.ok(new User());
			
		}finally {
			System.out.println(ArtResult.ok(new User()));
		}
		
	}
}
