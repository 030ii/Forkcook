package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController1 {
	@RequestMapping("/main.do")	
	public String mainGo(){
		return "main.tiles"; // tiles name 반환
	}
}
