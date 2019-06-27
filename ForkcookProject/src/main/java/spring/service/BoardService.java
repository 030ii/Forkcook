package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.BoardDao;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
}
