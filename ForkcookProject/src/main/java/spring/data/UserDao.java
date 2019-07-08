package spring.data;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao extends SqlSessionDaoSupport {
	 @Autowired
	 
	public int getTotalCount()
	{
		int n=getSqlSession().selectOne("user.userTotalCount");
		return n;
	}
	
	public void insertUser(UserDto dto)
	{
		getSqlSession().insert("user.userInsert",dto);
	}
	public void insertUser2(UserDto dto)
	{
		getSqlSession().insert("user.userInsert2",dto);
	}
	
	public UserDto userLogin(UserDto dto)
	{
		return getSqlSession().selectOne("user.userLogin",dto);
	}
	
	/*//로그인체크
	public boolean loginCheck(UserDto dto){
		String name = getSqlSession().selectOne("user.loginCheck", dto);
		return (name == null) ? false:true;
	}
	//로그인정보
	public UserDto viewUser(UserDto dto){
		return getSqlSession().selectOne("user.viewUser", dto);
	}
	//로그아웃
	public void logout(HttpSession session){}*/
	
	
}