package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MenuDao;
import spring.data.MenuDto;

@Service
public class MenuService {
	@Autowired
	private MenuDao dao;
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public void insertMenu(MenuDto dto){
		dao.insertMenu(dto);
	}
	
	public List<MenuDto> getList(){
		return dao.getList();
	}
	
	public MenuDto getData(int num){
		return dao.getData(num);
	}
	
	public void menuUpdate(MenuDto dto){
		dao.menuUpdate(dto);
	}

	public void menuDelete(int num){
		dao.menuDelete(num);
	}
}