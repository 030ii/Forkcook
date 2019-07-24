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
	
	public List<CartDto> getList(int num){
		return dao.getList(num);
	}
	
	public void cartUpdate(CartDto dto){
		dao.cartUpdate(dto);
	}
	
	public void countUpdatePlus(CartDto dto){
		dao.countUpdatePlus(dto);
	}
	
	public void countUpdateMinus(CartDto dto){
		dao.countUpdateMinus(dto);
	}
	
	public CartDto countSelect(int num)
	{
		return dao.countSelect(num);
	}
	
	public void insertCart(CartDto dto){
		dao.insertCart(dto);
	}
	
	public int getMenuCount(CartDto dto)
	{
		return dao.getMenuCount(dto);
	}
	
	public void insertCartDetail(CartDto dto){
		dao.insertCartDetail(dto);
	}
	
	public void cartDelete(int num){
		dao.cartDelete(num);
	}

}
