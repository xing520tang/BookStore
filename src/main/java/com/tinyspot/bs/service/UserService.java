package com.tinyspot.bs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tinyspot.bs.bean.Md5;
import com.tinyspot.bs.bean.Msg;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.bean.UserExample;
import com.tinyspot.bs.bean.UserExample.Criteria;
import com.tinyspot.bs.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	/**
	 * 根据手机号和密码验证是否存在某个用户
	 * 如果存在则直接返回User对象
	 * @param uPhone
	 * @param uPassword
	 * @return
	 */
	public User verify(String uPhone, String uPassword) {
		// TODO Auto-generated method stub
		System.out.println("verify******");
		System.out.println("uPhoneNumber:" + uPhone);
		System.out.println("uPassword:"+uPassword);
		Msg msg = Md5.getMd5(uPassword);
		User user = userMapper.selectByUPhoneAndUPassword(uPhone, uPassword);//根据用户名和密码的md5验证该用户是否存在
		System.out.println("user:" + user);
		if(user != null)
			return user;
		return null;
	}

	/**
	 * 根据用户id返回用户信息
	 * @param uId
	 * @return
	 */
	public User getUserByUId(Integer uId) {
		return userMapper.selectByPrimaryKey(uId);
	}

	
	/**
	 * 判断该电话是否已经被注册过
	 * @param getuPhone
	 */
	public boolean phoneIsUnique(String uPhone) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUPhoneEqualTo(uPhone);
		List<User> userList = userMapper.selectByExample(example );
		if(userList==null || userList.size()==0)
			return true;
		return false;
	}

	public boolean saveUser(User user) {
		try {
			userMapper.insert(user);
		}catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	
	public int saveUserReturnUId(User user) {
		int id = 0;
		try {
			id = userMapper.insert(user);
		}catch (Exception e) {
			// TODO: handle exception
			id = 0;
		}
		return id;
	}

	/**
	 * 根据用户id，有选择的更新
	 * @param user
	 */
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}
}
