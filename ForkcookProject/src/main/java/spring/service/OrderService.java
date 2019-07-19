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
	
	public int getNowTotalCount(int snum){
		return dao.getNowTotalCount(snum);
	}
	
	public int getReserveTotalCount(int snum){
		return dao.getReserveTotalCount(snum);
	}
	
	public int getFinishTotalCount(int snum){
		return dao.getFinishTotalCount(snum);
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

	public void orderUpdateState2(String ordernum){
		dao.orderUpdateState2(ordernum);
	}
	public void orderUpdateState3(String ordernum){
		dao.orderUpdateState3(ordernum);
	}
	public void orderUpdateState4(String ordernum){
		dao.orderUpdateState4(ordernum);
	}
	public void orderUpdateState7(String ordernum){
		dao.orderUpdateState7(ordernum);
	}
	public void orderUpdateState8(String ordernum){
		dao.orderUpdateState8(ordernum);
	}
}
