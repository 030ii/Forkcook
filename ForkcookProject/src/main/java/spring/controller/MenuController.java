package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.MenuDto;
import spring.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService service;
	
	@RequestMapping("/{mainadmin}/menu/list.do")
	public ModelAndView list(@PathVariable String mainadmin){
		ModelAndView model = new ModelAndView();
				
		// 메뉴 리스트 가져오기
		List<MenuDto> list = service.getList();
	
		model.addObject("list", list);
		System.out.println(mainadmin);
		
		if(mainadmin.equals("main")) {
			System.out.println("1111111111111");
			model.setViewName("/main/menu/menulist");
		}
		else if(mainadmin.equals("admin")) {
			System.out.println("2222222222222");
			model.setViewName("/admin/admin/menu");
		}
		
		return model;
	}

	@RequestMapping("/main/menu/detail.do")
	public String content(Model model,@RequestParam int num){
      //데이타 가져오기
      MenuDto dto=service.getData(num);
      //model 에 저장
      model.addAttribute("dto", dto);    
      return "/main/menu/menudetail";
	}
	
	@RequestMapping("/main/menu/review.do")
	public ModelAndView review(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/menu/review");
		return model;
	}	
}
