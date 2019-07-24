package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CartDto;
import spring.service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService service;
	
	@RequestMapping("/main/cart/list.do")
	public ModelAndView cartlist(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		
		int totalCount = service.getTotalCount();
		List<CartDto> list = service.getList(num);
		
		model.addObject("totalCount", totalCount);
		model.addObject("list",list);
		
		model.setViewName("/main/user/cart");
		return model;
	}
	
	//장바구니 수량 plus
	@RequestMapping(value="/main/cart/updateplus.aj", method=RequestMethod.GET)
	public @ResponseBody String countPlus(
			HttpServletRequest req, 
			@RequestParam("num") int num,
			@RequestParam("mnum") int mnum
			)
	{
		CartDto dtobefore = new CartDto();
		dtobefore.setNum(num);
		dtobefore.setMnum(mnum);
		service.countUpdatePlus(dtobefore); // mcount(수량), mtotalcount(메뉴별 총 금액) 증가
		
		CartDto dtoafter =service.countSelect(num); // 증가된 mcount(수량), mtotalcount(메뉴별 총 금액) 가져오기
		int mcount = dtoafter.getMcount();
		String mtotalprice = dtoafter.getMtotalprice();
		
		return "{\"mcount\":"+mcount+",\"mtotalprice\":"+mtotalprice+"}";
	}
	
	//장바구니 수량 minus
		@RequestMapping(value="/main/cart/updateminus.aj", method=RequestMethod.GET)
		public @ResponseBody String countMinus(
				HttpServletRequest req, 
				@RequestParam("num") int num,
				@RequestParam("mnum") int mnum
				)
		{
			CartDto dtobefore = new CartDto();
			dtobefore.setNum(num);
			dtobefore.setMnum(mnum);
			service.countUpdateMinus(dtobefore); // mcount(수량), mtotalcount(메뉴별 총 금액) 감소
			
			CartDto dtoafter =service.countSelect(num); // 증가된 mcount(수량), mtotalcount(메뉴별 총 금액) 가져오기
			int mcount = dtoafter.getMcount();
			String mtotalprice = dtoafter.getMtotalprice();
			
			return "{\"mcount\":"+mcount+",\"mtotalprice\":"+mtotalprice+"}";
		}
	
	//메뉴 list -> 장바구니 담기
	@RequestMapping(value="/main/cart/insert.do",method=RequestMethod.GET)
	public String insertcart(
			@RequestParam int unum, 
			@RequestParam int mnum, 
			@RequestParam String mtotalprice){
		
		CartDto dto = new CartDto();
		dto.setUnum(unum);
		dto.setMnum(mnum);
		dto.setMtotalprice(mtotalprice);
		
		int cnum=0;
		try{
			cnum = service.getMenuCount(dto); //해당메뉴가 장바구니 있는지 없는지 검사해서 insert or update
		}catch(Exception e){
			cnum = 0; // cnum에 null 들어감 방지
		}
		if(cnum == 0){ // 장바구니에 아직 없으면 새로 추가
			service.insertCart(dto);
		} else { // 장바구니에 이미 있으면 update
			dto.setNum(cnum);
			service.countUpdatePlus(dto);
		}

		return "redirect:list.do?num="+unum;
	}
	
	//메뉴detail -> 장바구니 담기
	@RequestMapping(value="/main/menu/insertdetail.do",method=RequestMethod.GET)
	public String insertdetail(
			@RequestParam int unum, 
			@RequestParam int mnum,
			@RequestParam int mcount, 
			@RequestParam String mtotalprice){
		
		CartDto dto = new CartDto();
		dto.setUnum(unum);
		dto.setMnum(mnum);
		dto.setMcount(mcount);
		dto.setMtotalprice(mtotalprice);
		
		int cnum=0;
		try{
			cnum = service.getMenuCount(dto); //해당메뉴가 장바구니 있는지 없는지 검사해서 insert or update
		}catch(Exception e){
			cnum = 0; // cnum에 null 들어감 방지
		}
		if(cnum == 0){ // 장바구니에 아직 없으면 새로 추가
			service.insertCart(dto);
		} else { // 장바구니에 이미 있으면 update
			dto.setNum(cnum);
			service.cartUpdate(dto);
		}
		return "redirect:list.do?num="+unum;
	}
		
	// 삭제
	@RequestMapping("/main/cart/delete.do")
	public String delete(@RequestParam int cnum, @RequestParam int unum){
		service.cartDelete(cnum);
		return "redirect:list.do?num="+unum;
	}
	
	//체크박스 체크한것 삭제
	@RequestMapping("/main/cart/chkdelete.do")
	public String chkdelete(@RequestParam String nums, @RequestParam int unum)
	{
		//컴마로 분리
		String []dels=nums.split(",");
		for(String nn:dels)
		{
			int num=Integer.parseInt(nn);
			service.cartDelete(num);
		}
		
		return "redirect:list.do?num="+unum;
	}
}
