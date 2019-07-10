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
	private ReqnaService service;
	@RequestMapping("/admin/qna/reqnaform.do")
	public ModelAndView form(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		ReqnaDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.setViewName("/admin/admin/reqnaform");
		return model;
	}
	
	@RequestMapping(value="/admin/qna/write.do",method=RequestMethod.POST)
	public String readData(@ModelAttribute ReqnaDto dto,
			@RequestParam String pageNum)
	{
		service.reqnaInsert(dto);
		return "redirect:list.do";
	}
	
	@RequestMapping("/admin/qna/reqnaupdate.do")
	public ModelAndView reqnaupdateForm(@RequestParam int num,@RequestParam String pageNum)
	{
		ModelAndView model=new ModelAndView();
		ReqnaDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.addObject("pageNum", pageNum);
		model.setViewName("/admin/admin/reqnaupdate");
		return model;
	}
	
	@RequestMapping(value="/admin/qna/update.do",method=RequestMethod.POST)
	public String reqnaUpdate(@ModelAttribute ReqnaDto dto,@RequestParam String pageNum)
	{
		service.reqnaUpdate(dto);
		return "redirect:content.do?num="+dto.getNum()+"&pageNum="+pageNum;
	}
}
