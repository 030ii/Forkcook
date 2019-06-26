package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository  //xml 에 자동 등록
public class BoardDao extends SqlSessionDaoSupport{
	public int getTotalCount(){
		int n=getSqlSession().selectOne("board.boardTotalCount");
		return n;
	}
}
