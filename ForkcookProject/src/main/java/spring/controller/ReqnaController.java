package spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.ReqnaDto;
import spring.service.QnaService;
import spring.service.ReqnaService;

@Controller
public class ReqnaController {
	@Autowired
	private ReqnaService reqservice;
	
	@Autowired
	private QnaService qservice;
	
	@RequestMapping("/admin/qna/reqform.do")
	public ModelAndView form(@RequestParam int qnum,@RequestParam int pageNum){
		ModelAndView model=new ModelAndView();
		model.addObject("qnum",qnum);
		model.addObject("pageNum",pageNum);
		model.setViewName("/admin/admin/reqnaform");
		return model;
	}
	
	@RequestMapping(value="/admin/qna/reqwrite.do",method=RequestMethod.POST)
	public String reqnawrite(@ModelAttribute ReqnaDto reqdto,@RequestParam int pageNum)
	{
		int qnum = reqdto.getQnum();
		System.out.println(qnum);
		reqservice.reqnaInsert(reqdto);
		qservice.qnastateUpdate(qnum);
		return "redirect:content.do?num="+qnum+"&pageNum="+pageNum;
	}
	
	@RequestMapping("/admin/qna/requpdate.do")
	public ModelAndView reqnaupdateForm(@RequestParam int num,@RequestParam String pageNum)
	{
		System.out.println("2222222222");
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
		System.out.println("--------------1");
		reqservice.reqnaUpdate(reqdto);
		return "redirect:content.do?num="+reqdto.getQnum()+"&pageNum="+pageNum;
	}
	
	// 관리자 -> 답변삭제
	// /admin/qna/reqdelete.do	
	// return "redirect:content.do?num="+qnum+"&pageNum="+pageNum;
}
