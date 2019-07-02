package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository  //xml 에 자동 등록
public class NoticeDao extends SqlSessionDaoSupport{
	public int getTotalCount(){
		int n=getSqlSession().selectOne("notice.noticeTotalCount");
		return n;
	}
	
	public void insertnotice(NoticeDto dto){
		getSqlSession().insert("notice.noticeInsert",dto);
	}
	
	public List<NoticeDto> getList(int start,int end){
		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("notice.noticePagingList",map);
	}
	
	
	
	public void noticeUpdate(NoticeDto dto){
		getSqlSession().update("notice.noticeUpdate",dto);
	}
	
	public void noticeDelete(int num){
		getSqlSession().delete("notice.noticeDelete",num);
	}
	
	
	
	public NoticeDto getData(int num)
	{
		return getSqlSession().selectOne("notice.noticeSelectData",num);
	}

}
