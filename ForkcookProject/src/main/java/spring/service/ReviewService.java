package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.ReviewDao;
import spring.data.ReviewDto;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDao dao;
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public int getMenuCount(int mnum)
	{
		return dao.getMenuCount(mnum);
	}
	
	public List<ReviewDto> getListAdmin(){
		return dao.getListAdmin();
	}
	
	public List<ReviewDto> getListUser(int mnum){
		return dao.getListUser(mnum);
	}
	
	public ReviewDto getData(int num)
	{
		return dao.getData(num);
	}
	
	public void reviewDelete(int num){
		dao.reviewDelete(num);
	}
	
	public void reviewInsert(ReviewDto dto){
		dao.reviewInsert(dto);
	}
	
	public void reviewUpdate(ReviewDto dto){
		dao.reviewUpdate(dto);
	}

}
