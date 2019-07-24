package spring.data;

import java.util.List;

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
	
	public UserDto userLogin2(UserDto dto)
	{
		return getSqlSession().selectOne("user.userLogin2",dto);
	}
	
	public int idCheck(String id)
	{
		int n=getSqlSession().selectOne("user.idCheck", id);
		return n;
	}
	
	public List<UserDto> userMypage(int num){
		return getSqlSession().selectList("user.userMypage",num);
	}
	
	public int userUpdate(UserDto dto){
		return getSqlSession().update("user.userUpdate",dto);
	}
	
	public int passCheck(String pass)
	{
		int n=getSqlSession().selectOne("user.passCheck", pass);
		return n;
	}
	
	//이 밑으로는 관리자 페이지
	public List<UserDto> getList(){
		return getSqlSession().selectList("user.userList");
	}
	
	public void userDelete(int num){
		getSqlSession().delete("user.userDelete",num);
	}
	
	public UserDto getData(int num){
		return getSqlSession().selectOne("user.userSelectData",num); 
	}
	
}