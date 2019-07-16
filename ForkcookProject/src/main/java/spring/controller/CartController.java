package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping(value="/main/cart/update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute CartDto dto){
		service.countUpdate(dto);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="/main/cart/insert.do",method=RequestMethod.GET)
	public String write(@ModelAttribute CartDto dto){
		service.insertCart(dto);
		return "redirect:list.do";
	}
	
	@RequestMapping("/main/cart/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		service.cartDelete(num);
		return "redirect:list.do";
	}	
}
