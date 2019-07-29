package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.data.UserDto;

@Controller
public class MainController {
	@RequestMapping("/main/main.do")	
	public String mainGo(Model model,HttpSession session){
		UserDto user = (UserDto) session.getAttribute("loginInfo"); 
		model.addAttribute("udto", user);
		return "main.tiles"; // tiles name 반환
	}
}
