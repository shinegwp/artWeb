package com.art.sso.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.art.mapper.UserMapper;
import com.art.pojo.User;
import com.art.pojo.UserExample;
import com.art.pojo.UserExample.Criteria;
import com.art.sso.service.UserServiceLogin;
import com.art.util.ArtResult;
/**
 * @time 18.4.27
 * @author 高位鹏
 * @describe  对User表数据校验方法的实现。
 */


@Service
public class UserServiceImplLogin implements UserServiceLogin {
	@Autowired
	private UserMapper userMapper;
	@Override
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

}
