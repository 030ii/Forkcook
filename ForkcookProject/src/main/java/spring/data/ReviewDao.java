package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao extends SqlSessionDaoSupport{

	public int getTotalCount(){
		return getSqlSession().selectOne("review.reviewTotalCount");
	}
	
	public int getMenuCount(int mnum){
		return getSqlSession().selectOne("review.reviewMenuCount",mnum);
	}
	
	public List<ReviewDto> getListAdmin(){
		return getSqlSession().selectList("review.reviewListAdmin");
	}
	
	public List<ReviewDto> getListUser(int mnum){
		return getSqlSession().selectList("review.reviewListUser",mnum);
	}
	
	public List<ReviewDto> getListMypage(int unum){
		return getSqlSession().selectList("review.reviewListMypage",unum);
	}
	
	//전체데이타얻기
	public ReviewDto getData(int num)
	{
		return getSqlSession().selectOne("review.reviewAllData",num);
	}
		
	public void reviewDelete(int num){
		getSqlSession().delete("review.reviewDelete",num);
	}
	
	public void reviewInsert(ReviewDto dto)
	{
		getSqlSession().insert("review.reviewInsert",dto);
	}
	
	public void reviewUpdate(ReviewDto dto){
		getSqlSession().update("review.reviewUpdate",dto);
	}
}
