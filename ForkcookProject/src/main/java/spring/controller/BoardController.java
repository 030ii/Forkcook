package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		model.setViewName("/board/boardlist");
		return model;
	}	
}
