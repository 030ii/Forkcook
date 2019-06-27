package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository  //xml 에 자동 등록
public class BoardDao extends SqlSessionDaoSupport{
	public int getTotalCount(){
		int n=getSqlSession().selectOne("board.boardTotalCount");
		return n;
	}
	
	public void insertBoard(BoardDto dto){
		getSqlSession().insert("board.boardInsert",dto);
	}
	
	public List<BoardDto> getList(int start,int end){
		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("board.boardPagingList",map);
	}
	
	public void updateReadCount(int num){
		getSqlSession().update("boardUpdateReadcount",num);
	}
	
	public BoardDto getData(int num){
		return getSqlSession().selectOne("boardSelectData",num); // 바로 리턴해도 됨 
	}
	
	public void boardUpdate(BoardDto dto){
		getSqlSession().update("boardUpdate",dto);
	}
	
	public void boardDelete(int num){
		getSqlSession().delete("boardDelete",num);
	}
}
