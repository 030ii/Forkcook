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
	
	public List<CartDto> getList(){
		return dao.getList();
	}
}
