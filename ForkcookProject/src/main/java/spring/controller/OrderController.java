package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 관리자&가맹점주 -> 주문 상세보기 -> 주문 상세보기 페이지로 이동
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
	
	// 관리자 -> 주문 삭제
	@RequestMapping(value="/admin/order/delete.do",method=RequestMethod.DELETE)
	@CrossOrigin
	public @ResponseBody void dataDelete(HttpServletRequest req,@RequestParam String ordernum){
		service.orderDelete(ordernum);
	}
	
	// 가맹점 -> 주문 상태 변경(2:조리중)
	// 가맹점 -> 주문 상태 변경(3:조리완료)
	// 가맹점 -> 주문 상태 변경(4:전달완료)
	// 사용자 -> 주문 상태 변경(7:사용자취소)
	// 가맹점 -> 주문 상태 변경(8:가맹점취소)
	@RequestMapping(value="/admin/order/update/{state}.do",method=RequestMethod.POST)
	@CrossOrigin
	public @ResponseBody void orderstate(@PathVariable String state, HttpServletRequest req,@RequestParam String ordernum){
		if(state.equals("state2")) service.orderUpdateState2(ordernum);
		else if(state.equals("state3")) service.orderUpdateState3(ordernum);
		else if(state.equals("state4")) service.orderUpdateState4(ordernum);
		else if(state.equals("state7")) service.orderUpdateState7(ordernum);
		else if(state.equals("state8")) service.orderUpdateState8(ordernum);
	}
	
}
