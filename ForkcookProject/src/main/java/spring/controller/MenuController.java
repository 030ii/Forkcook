package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController {
	@RequestMapping("/menu/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/menu/menulist");
		return model;
	}
	
	@RequestMapping("/menu/detail.do")
	public ModelAndView detail(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/menu/menudetail");
		return model;
	}
	
	@RequestMapping("/menu/review.do")
	public ModelAndView review(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/menu/review");
		return model;
	}
	
	
	
	
	
}
