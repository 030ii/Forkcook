package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao extends SqlSessionDaoSupport {
	public int getTotalCount()
	{
		int n=getSqlSession().selectOne("user.userTotalCount");
		return n;
	}
	
	public void insertUser(UserDto dto)
	{
		getSqlSession().insert("user.userInsert",dto);
	}
}