package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.UserMapper;
import com.art.pojo.Item;
import com.art.pojo.ItemExample;
import com.art.pojo.User;
import com.art.pojo.UserExample;
import com.art.pojo.UserExample.Criteria;
import com.art.service.UserService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {
    @Autowired 
    private UserMapper usermapper;
    
	public User getUserByTel(String tel) {
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andTelEqualTo(tel);
		List<User> list = usermapper.selectByExample(example);
		if(list != null && list.size() > 0)
		{
			User user = list.get(0);
			return user;
		}
		return null;
	}

	public int insertOneUser(User user) {
		int i = usermapper.insert(user);
		return i;
	}

	public EUDataGridResult getUserList(int page, int rows) {
		UserExample example = new UserExample();
		//鍒嗛〉澶勭悊
		PageHelper.startPage(page, rows);
		List<User> list = usermapper.selectByExample(example);
		//鍒涘缓涓�涓繑鍥炲�煎璞�
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//鍙栬褰曟�绘潯鏁�
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	public int deleteItemById(Integer id) {
		int i = usermapper.deleteByPrimaryKey(id);
		return i;
	}

	public int update(User user) {
		int i = usermapper.updateByPrimaryKeySelective(user);
		System.out.println(i);
		return i;
	}

	public int insert(User user) {
		System.out.println(user);
		int i = usermapper.insert(user);
		return i;
	}

	public User getUserById(Integer uid) {
		
		return usermapper.selectByPrimaryKey(uid);
	}

	public int reduceMoney(User u) {
		UserExample example = new UserExample() ;
		// TODO Auto-generated method stub
		return usermapper.updateByPrimaryKeySelective(u);
	}




}
