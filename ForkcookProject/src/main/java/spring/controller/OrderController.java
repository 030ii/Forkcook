package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	// 관리자 -> 주문 관리 -> 주문 목록 페이지로 이동
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
	
	// 관리자 -> 주문 관리 -> 주문 상세보기 페이지로 이동
	@RequestMapping("/admin/order/content.do")
	public ModelAndView content(@RequestParam String ordernum){
		ModelAndView model = new ModelAndView();
		
		
		OrderDto ld = service.getListData(ordernum); // 기본 주문 정보 데이터 가져오기
		List<OrderDto> md = service.getMenuData(ordernum); // 메뉴 주문 정보 데이터 가져오기
		
		model.addObject("ld",ld);
		model.addObject("md",md);
		model.setViewName("/admin/admin/ordercontent");
		return model;
	}
	
	// 관리자 -> 주문 관리 -> DB에 메뉴 삭제하고 목록으로 redirect
	@RequestMapping("/admin/order/delete.do")
	public String delete(@RequestParam String ordernum){
		// 삭제
		service.orderDelete(ordernum);
		return "redirect:list.do"; // 목록 새로고침
	}	
}
