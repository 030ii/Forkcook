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
	
	public void reqnaInsert(ReqnaDto reqdto){
		getSqlSession().insert("reqna.reqnaInsert",reqdto);
	}
	
	
	public ReqnaDto getData(int reqnum){
		return getSqlSession().selectOne("reqna.reqnaSelectData",reqnum); // 바로 리턴해도 됨 
	}
	
	public void reqnaUpdate(ReqnaDto reqdto){
		getSqlSession().update("reqna.reqnaUpdate",reqdto);
	}
	
	public void reqnaDelete(int reqnum){
		getSqlSession().delete("reqna.reqnaDelete", reqnum);
	}
	
	public List<ReqnaDto> getReqnaList(int reqnum){
		
		return getSqlSession().selectList("reqna.reqnaSelectData2",reqnum);
	}
}
