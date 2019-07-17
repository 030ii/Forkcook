package spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import spring.data.ReqnaDto;
import spring.service.ReqnaService;

@Controller
public class ReqnaController {
	@Autowired
	private ReqnaService reqservice;
	@RequestMapping("/admin/qna/reqform.do")
	public ModelAndView form(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		ReqnaDto reqdto=reqservice.getData(num);
		model.addObject("reqdto",reqdto);
		model.setViewName("/admin/admin/reqnaform");
		return model;
	}
	
	@RequestMapping(value="/admin/qna/reqwrite.do",method=RequestMethod.POST)
	public String readData(@ModelAttribute ReqnaDto reqdto)
	{
		reqservice.reqnaInsert(reqdto);
		return "redirect:list.do";
	}
	
	@RequestMapping("/admin/qna/requpdate.do")
	public ModelAndView reqnaupdateForm(@RequestParam int num,@RequestParam String pageNum)
	{
		ModelAndView model=new ModelAndView();
		ReqnaDto reqdto=reqservice.getData(num);
		model.addObject("reqdto",reqdto);
		model.addObject("pageNum", pageNum);
		model.setViewName("/admin/admin/reqnaupdate");
		return model;
	}
	
	@RequestMapping(value="/admin/qna/requpdate.do",method=RequestMethod.POST)
	public String reqnaUpdate(@ModelAttribute ReqnaDto reqdto,@RequestParam String pageNum)
	{
		reqservice.reqnaUpdate(reqdto);
		return "redirect:content.do?num="+reqdto.getQnum()+"&pageNum="+pageNum;
	}
}
