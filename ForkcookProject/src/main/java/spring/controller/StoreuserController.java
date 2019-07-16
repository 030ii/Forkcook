package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.StoreuserDto;
import spring.service.StoreuserService;

@Controller
public class StoreuserController {
	@Autowired
	private StoreuserService service;
	 
	// 관리자 -> 가맹점 회원 관리 페이지로 이동
	@RequestMapping("/admin/storeuser/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount(); 		
		List<StoreuserDto> list = service.getList(); 		
	
		model.addObject("totalCount", totalCount); 		
		model.addObject("list", list); 					
		
		model.setViewName("/admin/admin/storeuser"); 	
		return model;
	}
	
	// 관리자 -> 가맹점 회원 관리 -> 가맹점 회원 추가(등록) 페이지로 이동 
	@RequestMapping("/admin/storeuser/insertform.do")
	public ModelAndView writeform(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/admin/storeuserform");
		return model;
	}	
	
	//아이디 중복확인
	@RequestMapping(value = "/admin/storeuser/idCheck.do", method = RequestMethod.GET)
	public @ResponseBody String postIdCheck(HttpServletRequest req,@RequestParam("id") String id){
		int n = service.idCheck(id);
		int result = 0;
		if(n >= 1) {
			result = 1;
		}
		System.out.println(result);
		return "{\"exist\":"+result+"}";
		
	}
	
	// 관리자 -> 가맹점 회원 관리 -> DB에 가맹점 회원 추가한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/storeuser/insert.do",method=RequestMethod.POST)
	public String write(@ModelAttribute StoreuserDto dto){
		service.insertStoreuser(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 가맹점 회원 관리 -> 가맹점 회원 정보 수정 페이지로 이동
	@RequestMapping("/admin/storeuser/updateform.do")
	public ModelAndView updateform(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		StoreuserDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.setViewName("/admin/admin/storeuserupdateform");
		return model;
	}	
	
	// 관리자 -> 가맹점 회원 관리 -> DB에 가맹점 회원 정보 수정한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/storeuser/update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute StoreuserDto dto){
		service.storeuserUpdate(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 가맹점 회원 관리 -> DB에 가맹점 회원 삭제하고 목록으로 redirect
	@RequestMapping("/admin/storeuser/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		service.storeuserDelete(num);
		return "redirect:list.do"; // 목록 새로고침
	}	
}
