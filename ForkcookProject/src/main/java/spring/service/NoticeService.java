package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.NoticeDao;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
}
