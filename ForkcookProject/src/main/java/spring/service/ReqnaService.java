package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.ReqnaDao;
import spring.data.ReqnaDto;

@Service
public class ReqnaService {

	@Autowired
	private ReqnaDao dao;
	
	public int getTotalCount(){
		return dao.getTotalCount();
	}
	
	public void reqnaInsert(ReqnaDto dto)
	{
		dao.reqnaInsert(dto);
	}
	
	public ReqnaDto getData(int num)
	{
		return dao.getData(num);
	}
	
	public void reqnaUpdate(ReqnaDto dto)	
	{
		dao.reqnaUpdate(dto);
	}
}
