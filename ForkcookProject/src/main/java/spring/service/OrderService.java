package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.OrderDao;
import spring.data.OrderDto;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
	
	public List<OrderDto> getList(){
		return dao.getList();
	}
	
	public OrderDto getListData(String ordernum){
		return dao.getListData(ordernum);
	}
	
	public List<OrderDto> getMenuData(String ordernum){
		return dao.getMenuData(ordernum);
	}
	
	public void orderDelete(String ordernum){
		dao.orderDelete(ordernum);
	}
}
