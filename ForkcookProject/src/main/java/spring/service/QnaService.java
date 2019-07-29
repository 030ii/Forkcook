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
	public void qnaInsert(QnaDto qdto)
	{
		dao.qnaInsert(qdto);
	}
	
	public List<QnaDto> getList(int start,int end)
	{
		return dao.getList(start, end);
	}
	public List<QnaDto> getList2()
	{
		return dao.getList2();
	}
	
	public QnaDto getData(int num)
	{
		return dao.getData(num);
	}
	
	public void qnaDelete(int num)
	{
		dao.qnaDelete(num);
	}

	public void qnastateUpdate1(int qnum)
	{
		dao.qnastateUpdate1(qnum);
	}
	
	public void qnastateUpdate2(int qnum)
	{
		dao.qnastateUpdate2(qnum);
	}
	
	public void qnaUpdate(QnaDto qdto)	
	{
		dao.qnaUpdate(qdto);
	}

}