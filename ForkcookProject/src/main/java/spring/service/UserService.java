package spring.service;

import javax.servlet.http.HttpSession;

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
	
	public int userLogin()
	{
		return dao.userLogin();
	}
	
	//로그인체크
	public boolean loginCheck(UserDto dto, HttpSession session){
		boolean result = UserDao.loginCheck(dto);
		if (result) {//true일경우 세션에 등록
			UserDto dto2 = viewUser(dto);
			//세션 변수 등록
			session.setAttribute("id", dto2.getId());
			session.setAttribute("name", dto.getName());
		}
		return result;
	}
	//로그인 정보
	public UserDto viewUser(UserDto dto){
		return UserDao.viewUser(dto);
	}
	//회원 로그아웃
	public void logout(HttpSession session){
		//세션 변수 개별 삭제
		//session.removeAttribute("id");
		//세션 정보를 초기화 시킴
		session.invalidate();
	}

}