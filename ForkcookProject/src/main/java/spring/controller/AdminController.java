package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/admin/main.do")	
	public String mainGo(){
		return "admin.tiles"; // tiles name 반환
	}
}
