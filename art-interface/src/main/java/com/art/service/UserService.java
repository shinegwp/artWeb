package com.art.service;

import com.art.pojo.User;
import com.art.util.EUDataGridResult;

public interface UserService {
	public User getUserByTel(String tel);
	public int insertOneUser(User user);
	public int insert(User user);
	public User getUserById(Integer uid);
	public int reduceMoney(User u) ;
	public void userJedisTest();//jedis的测试

}
