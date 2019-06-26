package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GuestController {
	@RequestMapping("/guest/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/guest/guestlist");
		return model;
	}
}
