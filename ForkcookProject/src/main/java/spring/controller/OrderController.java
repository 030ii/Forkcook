package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.data.OrderDto;
import spring.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	@RequestMapping("/main/order/order.do")
	public ModelAndView order(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/order/order");
		return model;
	}
	
	//결제페이지에서 결제완료페이지로
	@RequestMapping("/main/order/orderform.do")
	public ModelAndView orderform(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/order/order");
		return model;
	}
	
	//결제페이지에서 결제완료페이지로
	@RequestMapping("/main/order/ordersuccess.do")
	public ModelAndView ordersuccess(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/order/ordersuccess");
		return model;
	}
	
	//************************관리자용************************//
	@RequestMapping("/admin/order/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		
		// DB에서 데이터 가져오기
		int totalCount = service.getTotalCount();
		List<OrderDto> list = service.getList();
		
		// 가져온 데이터 저장
		model.addObject("totalCount", totalCount);
		model.addObject("list",list);
		
		model.setViewName("/admin/admin/order");
		return model;
	}
}
