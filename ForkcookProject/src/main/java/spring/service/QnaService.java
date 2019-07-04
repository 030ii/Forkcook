package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.QnaDao;
import spring.data.QnaDto;

@Service
public class QnaService {
	
	@Autowired
	private QnaDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
	public void insertQna(QnaDto dto)
	{
		dao.insertqna(dto);
	}
	
	public List<QnaDto> getList(int start,int end)
	{
		return dao.getList(start, end);
	}
	
	public QnaDto getData(int num)
	{
		return dao.getData(num);
	}
	
	
	
	public void qnaDelete(int num)
	{
		dao.qnaDelete(num);
	}
	
	public void qnaUpdate(QnaDto dto)	
	{
		dao.qnaUpdate(dto);
	}
}