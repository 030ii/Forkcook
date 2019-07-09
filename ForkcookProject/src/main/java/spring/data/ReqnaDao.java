package spring.data;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReqnaDao extends SqlSessionDaoSupport {
	
	public int getTotalCount(){
		int n=getSqlSession().selectOne("reqna.reqnaTotalCount");
		return n;
	}
	
	public List<ReqnaDto> getList(int start,int end){
		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("reqna.reqnaPagingList",map);
	}
	
	public void reqnaInsert(ReqnaDto dto){
		getSqlSession().insert("reqna.reqnaInsert",dto);
	}
	
	
	public ReqnaDto getData(int num){
		return getSqlSession().selectOne("reqna.reqnaSelectData",num); // 바로 리턴해도 됨 
	}
	
	public void reqnaUpdate(ReqnaDto dto){
		getSqlSession().update("reqna.reqnaUpdate",dto);
	}
	public List<ReqnaDto> getQnaList(int qnum){
		
		return getSqlSession().selectList("reqna.reqnaSelectData2",qnum);
	}
}
