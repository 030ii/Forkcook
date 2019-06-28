package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.NoticeDto;
import spring.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;

	@RequestMapping("/notice/list.do")
	public ModelAndView list(){
		ModelAndView model=new ModelAndView();

		int totalCount;//총 데이타 갯수

		totalCount=service.getTotalCount();

		model.addObject("totalCount",totalCount);
		model.setViewName("/service/noticelist");
		return model;
	}	

	@RequestMapping("/notice/content.do")
	public ModelAndView content(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/noticecontent");
		return model;
	}
	
	@RequestMapping("/notice/form.do")
	public ModelAndView form(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/noticeform");
		return model;
	}
	
	@RequestMapping("/notice/write.do")
	public ModelAndView write(){
		// TODO : 게시글 추가 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/noticecontent");
		return model;
	}
	
	@RequestMapping("/notice/updateform.do")
	public ModelAndView updateform(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/noticeupdateform");
		return model;
	}
	
	@RequestMapping("/notice/update.do")
	public ModelAndView update(){
		// TODO : 게시글 수정 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/noticecontent");
		return model;
	}
	
	@RequestMapping("/notice/delete.do")
	public ModelAndView delete(){
		// TODO : 게시글 삭제 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/noticelist");
		return model;
	}
}
