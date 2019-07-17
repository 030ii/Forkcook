package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("/main/cart/update.aj")
	public ModelAndView chu(@RequestParam int num)
	{
		System.out.println("num="+num);
		service.countUpdate(num);
		int mcount=service.countSelect(num);
		
		ModelAndView model=new ModelAndView();
		model.addObject("mcount",mcount);
		model.setViewName("user/cartdata");
		return model;
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
