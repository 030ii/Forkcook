package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.OrderDao;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
}
