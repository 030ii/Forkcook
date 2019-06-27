package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.BoardDto;
import spring.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;

	@RequestMapping("/board/list.do")
	public ModelAndView list(){
		ModelAndView model=new ModelAndView();

		int totalCount;//총 데이타 갯수

		totalCount=service.getTotalCount();

		model.addObject("totalCount",totalCount);
		model.setViewName("/service/boardlist");
		return model;
	}	

	@RequestMapping("/board/content.do")
	public ModelAndView content(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/boardcontent");
		return model;
	}
	
	@RequestMapping("/board/form.do")
	public ModelAndView form(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/boardform");
		return model;
	}
	
	@RequestMapping("/board/write.do")
	public ModelAndView write(){
		// TODO : 게시글 추가 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/boardcontent");
		return model;
	}
	
	@RequestMapping("/board/updateform.do")
	public ModelAndView updateform(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/boardupdateform");
		return model;
	}
	
	@RequestMapping("/board/update.do")
	public ModelAndView update(){
		// TODO : 게시글 수정 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/boardcontent");
		return model;
	}
	
	@RequestMapping("/board/delete.do")
	public ModelAndView delete(){
		// TODO : 게시글 삭제 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/boardlist");
		return model;
	}
}
