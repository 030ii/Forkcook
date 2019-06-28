package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository  //xml 에 자동 등록
public class QnaDao extends SqlSessionDaoSupport{
	public int getTotalCount()
	{
		int n=getSqlSession().selectOne("service.qnaTotalCount");
		return n;
	}
	
	public void insertQna(QnaDto dto)
	{
		getSqlSession().insert("service.qnaInsert",dto);
	}
	
	public List<QnaDto> getList(int start,int end)
	{
		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("service.qnaPagingList",map);
	}
	
	public QnaDto getData(int num)
	{
		return getSqlSession().selectOne("qnaSelectData",num);
	}
	
	public void qnaUpdate(QnaDto dto)
	{
		getSqlSession().update("qnaUpdate",dto);
	}
	
	public void qnaDelete(int num)
	{
		getSqlSession().delete("service.qnaDelete",num);
	}
}