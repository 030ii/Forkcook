package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController {
	@RequestMapping("/menu/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/menu/menulist");
		return model;
	}
}
