package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	//TODO : 회원가입 이동
	
	//로그인페이지
	@RequestMapping("/user/login.do")
	public String login(){
		
		return "/user/login";  
	}
	
	//로그인하기 버튼 클릭->로그인되고 메인으로 포워드(일단 loginsuccess로 이동,나중에수정)
	@RequestMapping("/user/logingo.do")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("/user/loginsuccess");
		
		return model;
	}
	
	//회원가입폼으로 이동
	@RequestMapping("/user/signup.do")
	public String signup(){
		
		return "/user/signup";  
	}
	
	//회원가입폼에서 완료페이지로
	@RequestMapping("/user/signupform.do")
	public ModelAndView signupform()
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("/user/signupsuccess");
		
		return model;
	}
	
	//마이페이지로 이동
		@RequestMapping("/user/mypage.do")
		public String mypg(){
			
			return "/user/mypage";  
		}
		
	//로그아웃
		@RequestMapping("/user/logout.do")
		public String logout(){
					
			return "/layout/main";
		}
}
