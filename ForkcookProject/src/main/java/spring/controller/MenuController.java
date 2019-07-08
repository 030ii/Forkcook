package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.MenuDto;
import spring.data.NoticeDto;
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
		
		if(mainadmin.equals("main")) {
			model.setViewName("/main/menu/menulist");
		}
		else if(mainadmin.equals("admin")) {
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
	
	// 관리자 -> 메뉴 관리 -> 메뉴 추가 페이지로 이동 
	@RequestMapping("/admin/menu/writeform.do")
	public ModelAndView writeform(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/admin/menuform");
		return model;
	}	
	
	// 관리자 -> 메뉴 관리 -> 메뉴 추가하기 
	@RequestMapping(value="/admin/menu/write.do",method=RequestMethod.POST)
	public String write(@ModelAttribute MenuDto dto){
		service.insertMenu(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 메뉴 관리 -> 메뉴 수정 페이지로 이동
	@RequestMapping("/admin/menu/updateform.do")
	public ModelAndView updateform(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		MenuDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.setViewName("/admin/admin/menuupdateform");
		return model;
	}	
	
	// 관리자 -> 메뉴 관리 -> 메뉴 수정하기 
	@RequestMapping(value="/admin/menu/update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute MenuDto dto){
		service.menuUpdate(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 메뉴 관리 -> 삭제하기
	@RequestMapping("/admin/menu/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		service.menuDelete(num);
		return "redirect:list.do"; // 목록 새로고침
	}	

}
