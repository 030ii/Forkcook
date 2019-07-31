package spring.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CartDto;
import spring.data.MenuDto;
import spring.data.OrderDto;
import spring.data.StoreuserDto;
import spring.data.UserDto;
import spring.service.CartService;
import spring.service.OrderService;


//GET DATE & TIME IN ANY FORMAT
import java.util.Calendar;
import java.text.SimpleDateFormat;


@Controller
public class OrderController {
	@Autowired
	private OrderService oservice;
	
	@Autowired
	private CartService cservice;
	
	
	@RequestMapping("/main/order/order.do")
	public ModelAndView order(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/order/order");
		return model;
	}
	
	public static final String DATE_FORMAT_NOW = "yyyyMMddHHmmss";
	
	public static String now() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		return sdf.format(cal.getTime());
	}
	
	// 장바구니에서 결제페이지로
	@RequestMapping("/main/order/orderform.do")
	public ModelAndView orderform(HttpSession session){
		ModelAndView model = new ModelAndView();
		
		UserDto user = (UserDto) session.getAttribute("loginInfo"); 
		int unum = user.getNum();
		
		List<CartDto> list = cservice.getList(unum);
		int mytotalCount = cservice.getmyTotalCount(unum);
		int mytotalPrice = cservice.getmyTotalPrice(unum);
		
		model.addObject("list",list);
		model.addObject("mytotalCount", mytotalCount);
		model.addObject("mytotalPrice", mytotalPrice);
		
		model.setViewName("/main/order/order");
		return model;
	}
	
	//결제페이지에서 결제완료페이지로
	@RequestMapping("/main/order/ordersuccess.do")
	public ModelAndView ordersuccess(@ModelAttribute OrderDto dto, HttpSession session){
		ModelAndView model = new ModelAndView();
//		private String ordernum; --
//		private int unum; -- 
//		private int snum; -- 
//		private int mnum; ---
//		private int mcount;--
//		private String mtotalprice;--
//		private String ordertype;--
		
//		System.out.println("orderdateLocal:"+orderdateLocal);
		// HttpServletRequest request, 
		//orderdateLocal.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); // 2018-07-26 00:42:24
		//String orderdateLocal = request.getParameter("orderdateLocal");
		//LocalDateTime sightingDate = LocalDateTime.parse(orderdateLocal.replace("T"," "), DateTimeFormatter.ISO_DATE_TIME);
		System.out.println("ordernum : "+dto.getOrdernum()); // 만듬
		System.out.println("unum : "+dto.getUnum()); // 세션
		System.out.println("snum : "+dto.getSnum());// 가져옴
		System.out.println("mnum : "+dto.getMnum()); 
		System.out.println("mcount : "+dto.getMcount());
		System.out.println("mtotalprice : "+dto.getMtotalprice());
		System.out.println("ordertype : "+dto.getOrdertype()); // 가져옴
		
		
		System.out.println("now: " + now());
		
		UserDto user = (UserDto) session.getAttribute("loginInfo"); 
		int unum = user.getNum();
		dto.setUnum(unum);
		List<CartDto> clist = cservice.getList(unum);
		
		String ordernum = now()+unum;
		dto.setOrdernum(ordernum);
		
		//for문으로 clist 돌리면서 mnum, mcount, mtotalprice set 해주면서 insert하기
		for(CartDto c : clist){
			dto.setMnum(c.getMnum());
			dto.setMcount(c.getMcount());
			dto.setMtotalprice(c.getMtotalprice());
			// insert 문
			oservice.insertOrder(dto);
		}
		
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
	public ModelAndView list(@PathVariable String listpage, HttpSession session){
		StoreuserDto storeuser = (StoreuserDto) session.getAttribute("adminLoginInfo"); 
		int snum = storeuser.getSnum();
		
		int totalCount = oservice.getTotalCount();
		int nowTotalCount = oservice.getNowTotalCount(snum);
		int reserveTotalCount = oservice.getReserveTotalCount(snum);
		int finishTotalCount = oservice.getFinishTotalCount(snum);
		
		// 세션에 업데이트
		session.setAttribute("nowTotalCount", nowTotalCount);
		session.setAttribute("reserveTotalCount", reserveTotalCount);
		session.setAttribute("finishTotalCount", finishTotalCount);
		
		ModelAndView model = new ModelAndView();
		List<OrderDto> list = oservice.getList();
		
		if(listpage.equals("list")){ 				// 관리자용 -> 주문 관리
			model.setViewName("/admin/admin/order");
		} else if(listpage.equals("now")){ 			// 가맹점용 -> 현장주문 관리
			model.setViewName("/admin/partner/now");
		} else if(listpage.equals("reserve")){		// 가맹점용 -> 예약주문 관리
			model.setViewName("/admin/partner/reserve");
		} else if(listpage.equals("finish")){		// 가맹점용 -> 완료주문 관리
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
		
		OrderDto ld = oservice.getListData(ordernum); // 기본 주문 정보 데이터 가져오기
		List<OrderDto> md = oservice.getMenuData(ordernum); // 메뉴 주문 정보 데이터 가져오기
		
		model.addObject("ld",ld);
		model.addObject("md",md);
		model.setViewName("/admin/admin/ordercontent");
		return model;
	}
	
	// 관리자 -> 주문 삭제
	@RequestMapping(value="/admin/order/delete.do",method=RequestMethod.DELETE)
	@CrossOrigin
	public @ResponseBody void dataDelete(HttpServletRequest req,@RequestParam String ordernum){
		oservice.orderDelete(ordernum);
	}
	
	// 가맹점 -> 주문 상태 변경(2:조리중)
	// 가맹점 -> 주문 상태 변경(3:조리완료)
	// 가맹점 -> 주문 상태 변경(4:전달완료)
	// 사용자 -> 주문 상태 변경(7:사용자취소)
	// 가맹점 -> 주문 상태 변경(8:가맹점취소)
	@RequestMapping(value="/admin/order/update/{state}.do",method=RequestMethod.POST)
	@CrossOrigin
	public @ResponseBody void orderstate(@PathVariable String state, HttpServletRequest req,@RequestParam String ordernum){
		if(state.equals("state2")) oservice.orderUpdateState2(ordernum);
		else if(state.equals("state3")) oservice.orderUpdateState3(ordernum);
		else if(state.equals("state4")) oservice.orderUpdateState4(ordernum);
		else if(state.equals("state7")) oservice.orderUpdateState7(ordernum);
		else if(state.equals("state8")) oservice.orderUpdateState8(ordernum);
	}
	
}
