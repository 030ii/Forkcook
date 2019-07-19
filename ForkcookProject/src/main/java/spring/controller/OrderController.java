package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//************************관리자용&가맹점용************************//
	// 관리자 -> 주문 관리(list.do) -> 주문 목록 페이지로 이동
	// 가맹점 -> 현장주문 관리(now.do) -> 현장주문 목록 페이지로 이동
	// 가맹점 -> 예약주문 관리(reserve.do) -> 예약주문 목록 페이지로 이동
	// 가맹점 -> 완료주문 관리(finish.do) -> 완료주문 목록 페이지로 이동
	//@RequestMapping("/admin/order/list.do")
	@RequestMapping("/admin/order/{listpage}")
	public ModelAndView list(@PathVariable String listpage){
		int totalCount = 0;
		int snum = 3; // TODO : 아직 가맹점 로그인 세션 저장을 안하므로 일단 임의로 snum을 3으로 세팅
		
		ModelAndView model = new ModelAndView();
		List<OrderDto> list = service.getList();
		
		if(listpage.equals("list")){ 				// 관리자용 -> 주문 관리
			totalCount = service.getTotalCount();
			model.setViewName("/admin/admin/order");
		} else if(listpage.equals("now")){ 			// 가맹점용 -> 현장주문 관리
			totalCount = service.getNowTotalCount(snum);
			model.setViewName("/admin/partner/now");
		} else if(listpage.equals("reserve")){		// 가맹점용 -> 예약주문 관리
			totalCount = service.getReserveTotalCount(snum);
			model.setViewName("/admin/partner/reserve");
		} else if(listpage.equals("finish")){		// 가맹점용 -> 완료주문 관리
			totalCount = service.getFinishTotalCount(snum);
			model.setViewName("/admin/partner/finish");
		}
		
		model.addObject("list",list);
		model.addObject("totalCount", totalCount);
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
	
	//************************가맹점용************************//
	// 가맹점 -> 현장 주문 관리 -> 주문 목록 페이지로 이동
//	@RequestMapping("/admin/now/list.do")
////	@RequestMapping (value = {"login.do", "login2.do"} )
//	public ModelAndView nowlist(){
//		
//		
////		requesturi
//		
//		ModelAndView model = new ModelAndView();
//		
//		// DB에서 데이터 가져오기
//		List<OrderDto> list = service.getList();
//
////		// 가져온 데이터 저장
//		model.addObject("totalCount", totalCount);
//		model.addObject("list",list);
//					
//		model.setViewName("/admin/partner/now");
//		return model;
//	}
}
