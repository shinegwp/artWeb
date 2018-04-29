package com.art.sso.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.art.pojo.User;
import com.art.util.ArtResult;

/**
 * @time 18.4.27
 * @author 高位鹏
 * @describe 单点登录User表的数据校验
 */
public interface UserServiceLogin {

	ArtResult checkDate (String content, Integer type);
	
	ArtResult createUser (User user);
	
	ArtResult userLogin(String username, String password, HttpServletRequest request, HttpServletResponse response);

	ArtResult getUserByToken(String token);

}
