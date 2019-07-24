package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.data.StoreuserDto;
import spring.data.UserDto;
import spring.service.UserService;

@Controller
public class MainController {
	@RequestMapping("/main/main.do")	
	public String mainGo(Model model,HttpSession session){
		UserDto user = (UserDto) session.getAttribute("loginInfo"); 
		model.addAttribute("udto", user);
		return "main.tiles"; // tiles name 반환
	}
}
