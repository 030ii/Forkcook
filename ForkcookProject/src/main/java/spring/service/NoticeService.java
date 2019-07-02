package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.NoticeDao;
import spring.data.NoticeDto;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
	
	public void insertNotice(NoticeDto dto)
	{
		dao.insertnotice(dto);
	}
	
	public List<NoticeDto> getList(int start,int end)
	{
		return dao.getList(start, end);
	}
	
	

	
	public NoticeDto getData(int num)
	{
		return dao.getData(num);
	}
	
	
	
	public void noticeDelete(int num)
	{	
		dao.noticeDelete(num);
	}
	
	public void noticeUpdate(NoticeDto dto)	
	{
		dao.noticeUpdate(dto);
	}





}
