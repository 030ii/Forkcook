package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.StoreuserDao;
import spring.data.StoreuserDto;

@Service
public class StoreuserService {
	@Autowired
	private StoreuserDao dao;
	
	public StoreuserDto storeuserLogin(StoreuserDto dto){
		return dao.storeuserLogin(dto);
	}
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public int idCheck(String id)
	{
		return dao.idCheck(id);
	}
	
	public void insertStoreuser(StoreuserDto dto){
		dao.insertStoreuser(dto);
	}
	
	public List<StoreuserDto> getList(){
		return dao.getList();
	}
	
	public StoreuserDto getData(int num){
		return dao.getData(num);
	}
	
	public void storeuserUpdate(StoreuserDto dto){
		dao.storeuserUpdate(dto);
	}

	public void storeuserDelete(int num){
		dao.storeuserDelete(num);
	}
}