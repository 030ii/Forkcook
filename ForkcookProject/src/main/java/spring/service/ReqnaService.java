package spring.service;

import java.util.List;

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
	
	public void reqnaInsert(ReqnaDto reqdto)
	{
		dao.reqnaInsert(reqdto);
	}
	
	public ReqnaDto getData(int reqnum)
	{
		return dao.getData(reqnum);
	}
	
	public void reqnaUpdate(ReqnaDto reqdto)	
	{
		dao.reqnaUpdate(reqdto);
	}
	
	public void reqnaDelete(int reqnum)
	{
		dao.reqnaDelete(reqnum);
	}
	
	public List<ReqnaDto> getReqnaList(int reqnum){
		
		return dao.getReqnaList(reqnum);
	}
}
