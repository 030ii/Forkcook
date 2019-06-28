package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.UserDao;
import spring.data.UserDto;

@Service
public class UserService {
	@Autowired
	private UserDao dao;
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public void insertUser(UserDto dto)
	{
		dao.insertUser(dto);
	}
}