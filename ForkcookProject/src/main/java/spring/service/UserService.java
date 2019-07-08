package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.UserDao;
import spring.data.UserDto;

@Service
public class UserService {
	
	UserDao UserDao;
	
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
	
	public void insertUser2(UserDto dto)
	{
		dao.insertUser2(dto);
	}
	
	public UserDto userLogin(UserDto dto)
	{
		return dao.userLogin(dto);
	}
	
	public UserDto userLogin2(UserDto dto)
	{
		return dao.userLogin2(dto);
	}

	public int idCheck(String id)
	{
		return dao.idCheck(id);
	}
	
	//이 밑으로는 관리자 페이지
	public List<UserDto> getList(){
		return dao.getList();
	}
	
	public void userDelete(int num){
		dao.userDelete(num);
	}
	
	public UserDto getData(int num){
		return dao.getData(num);
	}
	
	public void userUpdate(UserDto dto){
		dao.userUpdate(dto);
	}
}