package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	//TODO : 회원가입 이동
	
	
	@RequestMapping("/member/form.do")
	public String form(){
		//tiles.xml 에 지정한대로 /web-inf/member/memberform.jsp 가 main 에 나타남다
		return "/member/memberform";  
	}
}
