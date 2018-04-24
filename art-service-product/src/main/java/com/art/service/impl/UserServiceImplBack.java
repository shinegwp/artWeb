package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.UserMapper;
import com.art.pojo.User;
import com.art.pojo.UserExample;
import com.art.service.UserServiceBack;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
@Service
public class UserServiceImplBack implements UserServiceBack {
	@Autowired 
    private UserMapper userMapper;
	@Autowired
	private JedisPool jedisPool;
	
	public boolean itemAddTest(){
		Jedis jedis = jedisPool.getResource();
		jedis.set("num", "5");
		System.out.println("jedis测试成功+" + jedis.incr("num"));
		return false;
		
	}
	
	public EUDataGridResult getUserList(int page, int rows) {
		UserExample example = new UserExample();
		
		PageHelper.startPage(page, rows);
		List<User> list = userMapper.selectByExample(example);
		
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	public int deleteItemById(Integer id) {
		int i = userMapper.deleteByPrimaryKey(id);
		return i;
	}
	
	public int update(User user) {
		int i = userMapper.updateByPrimaryKeySelective(user);
		System.out.println(i);
		return i;
	}
	public int insert(User user) {
		System.out.println(user);
		int i = userMapper.insert(user);
		return i;
	}

}
