package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao extends SqlSessionDaoSupport{

	public int getTotalCount(){
		return getSqlSession().selectOne("review.reviewTotalCount");
	}
	
	public List<ReviewDto> getList(){
		return getSqlSession().selectList("review.reviewList");
	}
	
	public void reviewDelete(int num){
		getSqlSession().delete("review.reviewDelete",num);
	}
	
	public void reviewInsert(ReviewDto dto)
	{
		getSqlSession().insert("review.reviewInsert",dto);
	}
}
