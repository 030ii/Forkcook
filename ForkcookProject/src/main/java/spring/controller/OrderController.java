package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	
	//결제페이지에서 결제완료페이지로
	@RequestMapping("/order/orderform.do")
	public ModelAndView order(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/order/order");
		return model;
	}
	
	//결제페이지에서 결제완료페이지로
		@RequestMapping("/order/ordersuccess.do")
		public ModelAndView ordersuccess(){
			ModelAndView model = new ModelAndView();
			model.setViewName("/order/ordersuccess");
			return model;
		}
}
