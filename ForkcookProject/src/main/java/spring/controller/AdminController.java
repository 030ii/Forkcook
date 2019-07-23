package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.StoreuserDto;
import spring.service.StoreuserService;

@Controller
public class AdminController {
	@Autowired
	private StoreuserService service;
	
	@RequestMapping("/admin/**/adminlogin.do")
	public String adminLogin(@ModelAttribute StoreuserDto dto,HttpSession session){
		StoreuserDto storeuser = service.storeuserLogin(dto);
		
		if(storeuser != null){//관리자 로그인 정보가 DB에 존재할경우
			session.setAttribute("adminLoginInfo", storeuser);
		} else { // 존재하지 않을 경우
			session.setAttribute("msg", "failure");
		}

		return "redirect:/admin/main.do";
		
		// 참고용) 관리자 세션 불러오기
		// StoreuserDto storeuser = (StoreuserDto) session.getAttribute("adminLoginInfo"); 
	}		
	
	@RequestMapping("/admin/main.do")	
	public String mainGo(){
		return "admin.tiles"; // tiles name 반환
	}
}
