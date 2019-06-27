package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

	@RequestMapping("/cart/list.do")
	public ModelAndView cart(){
		ModelAndView model=new ModelAndView();
		
		model.setViewName("/user/cart");
		return model;
	}	
	
}
