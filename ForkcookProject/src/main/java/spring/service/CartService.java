package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.CartDao;
import spring.data.CartDto;

@Service
public class CartService {

	@Autowired
	private CartDao dao;
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public List<CartDto> getList(){
		return dao.getList();
	}
	
	public void countUpdate(CartDto dto){
		dao.countUpdate(dto);
	}
	public CartDto countSelect(int num)
	{
		return dao.countSelect(num);
	}
	
	public void insertCart(CartDto dto){
		dao.insertCart(dto);
	}
	
	public void cartDelete(int num){
		dao.cartDelete(num);
	}
}
