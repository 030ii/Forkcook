package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController {
	@RequestMapping("/store/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/store/storelist");
		return model;
	}
	@RequestMapping("/store/detail.do")
	public ModelAndView detail(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/store/storedetail");
		return model;
	}
	@RequestMapping("/partner/partnerqna.do")
	public ModelAndView partnerqna(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/partner/partnerqna");
		return model;
	}
	@RequestMapping("/order/order.do")
	public ModelAndView order(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/order/order");
		return model;
	}
}
