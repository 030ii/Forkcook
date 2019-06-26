package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.BoardDao1;

@Service
public class BoardService {
	@Autowired
	private BoardDao1 dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
}
