package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao extends SqlSessionDaoSupport {
	public int getTotalCount(){
		return getSqlSession().selectOne("store.storeTotalCount");
	}
	
	public void insertStore(StoreDto dto){
		getSqlSession().insert("store.storeInsert",dto);
	}
	
	public List<StoreDto> getList(){
		return getSqlSession().selectList("store.storeList");
	}
	
	public StoreDto getData(int num){
		return getSqlSession().selectOne("store.storeSelectData",num); 
	}
	
	public void storeUpdate(StoreDto dto){
		getSqlSession().update("store.storeUpdate",dto);
	}
	
	public void storeDelete(int num){
		getSqlSession().delete("store.storeDelete",num);
	}
}

