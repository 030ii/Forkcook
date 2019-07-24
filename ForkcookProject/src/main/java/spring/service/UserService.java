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
	
	public int getUsertype1TotalCount()
	{
		return dao.getUsertype1TotalCount();
	}

	public int getUsertype2TotalCount()
	{
		return dao.getUsertype2TotalCount();
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
	
	public List<UserDto> userMypage(int num){
		return dao.userMypage(num);
	}
	
	public int userUpdate(UserDto dto){
		return dao.userUpdate(dto);
	}
	
	public int passCheck(String pass)
	{
		return dao.passCheck(pass);
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
	
}