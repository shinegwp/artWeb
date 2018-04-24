package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.UserMapper;
import com.art.pojo.User;
import com.art.pojo.UserExample;
import com.art.pojo.UserExample.Criteria;
import com.art.service.UserService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class UserServiceImpl implements UserService {
    @Autowired 
    private UserMapper userMapper;
    @Autowired
    private JedisPool jedisPool;
    
    public void userJedisTest(){
    	Jedis jedis = jedisPool.getResource();
        jedis.set("userNum", "11");
        System.out.println("长度是:" + jedis.strlen("userNum"));
    }
    
	public User getUserByTel(String tel) {//前台
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andTelEqualTo(tel);
		List<User> list = userMapper.selectByExample(example);
		System.out.println(list);
		if(list != null && list.size() > 0)
		{
			User user = list.get(0);
			
			return user;
		}
		else{
			return null;
		}
		
	}

	public int insertOneUser(User user) {//
		int i = userMapper.insert(user);
		return i;
	}

	
	public int insert(User user) {//前后台都有
		System.out.println(user);
		int i = userMapper.insert(user);
		return i;
	}

	public User getUserById(Integer uid) {
		
		return userMapper.selectByPrimaryKey(uid);
	}

	public int reduceMoney(User u) {//
		UserExample example = new UserExample() ;
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(u);
	}




}
