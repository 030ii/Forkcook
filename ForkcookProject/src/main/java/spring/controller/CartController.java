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
	public ModelAndView cartlist(){
		ModelAndView model=new ModelAndView();
		
		int totalCount = service.getTotalCount();
		List<CartDto> list = service.getList();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list",list);
		
		model.setViewName("/main/user/cart");
		return model;
	}
	
	//장바구니 수량
	@RequestMapping(value="/main/cart/updatemplus.aj", method=RequestMethod.GET)
	public @ResponseBody String countPlus(
			HttpServletRequest req, 
			@RequestParam("num") int num,
			@RequestParam("mnum") int mnum
			)
	{
		CartDto dtobefore = new CartDto();
		dtobefore.setNum(num);
		dtobefore.setMnum(mnum);
		service.countUpdate(dtobefore); // mcount(수량), mtotalcount(메뉴별 총 금액) 증가
		
		CartDto dtoafter =service.countSelect(num); // 증가된 mcount(수량), mtotalcount(메뉴별 총 금액) 가져오기
		int mcount = dtoafter.getMcount();
		String mtotalprice = dtoafter.getMtotalprice();
		
		return "{\"mcount\":"+mcount+",\"mtotalprice\":"+mtotalprice+"}";
	}
	
	@RequestMapping(value="/main/cart/insert.do",method=RequestMethod.GET)
	public String write(@RequestParam int unum, @RequestParam int mnum, @RequestParam String mtotalprice){
		CartDto dto = new CartDto();
		dto.setUnum(unum);
		dto.setMnum(mnum);
		dto.setMtotalprice(mtotalprice);
		service.insertCart(dto);
		return "redirect:list.do";
	}
	
	// 삭제
	@RequestMapping("/main/cart/delete.do")
	public String delete(@RequestParam int num){
		System.out.println(num);

		CartDto dto = new CartDto();
		dto.setNum(num);
		System.out.println(num);
		
		service.cartDelete(num);
		return "redirect:list.do";
	}
	
	//체크박스 체크한것 삭제
	@RequestMapping("/main/cart/chkdelete.do")
	public String chkdelete(@RequestParam String nums)
	{
		//컴마로 분리
		String []dels=nums.split(",");
		for(String nn:dels)
		{
			int num=Integer.parseInt(nn);
			service.cartDelete(num);
		}
		
		return "redirect:list.do";
	}
}
