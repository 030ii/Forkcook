package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StoreuserDao extends SqlSessionDaoSupport {
	public int getTotalCount(){
		return getSqlSession().selectOne("storeuser.storeuserTotalCount");
	}
	
	public int idCheck(String id)
	{
		int n=getSqlSession().selectOne("storeuser.idCheck", id);
		return n;
	}
	
	public void insertStoreuser(StoreuserDto dto){
		getSqlSession().insert("storeuser.storeuserInsert",dto);
	}
	
	public List<StoreuserDto> getList(){
		return getSqlSession().selectList("storeuser.storeuserList");
	}
	
	public StoreuserDto getData(int num){
		return getSqlSession().selectOne("storeuser.storeuserSelectData",num); 
	}
	
	public void storeuserUpdate(StoreuserDto dto){
		getSqlSession().update("storeuser.storeuserUpdate",dto);
	}
	
	public void storeuserDelete(int num){
		getSqlSession().delete("storeuser.storeuserDelete",num);
	}
}

