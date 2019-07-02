package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.UserDao;
import spring.data.UserDto;
import spring.service.UserService;

@Controller
public class UserController {
	//TODO : 회원가입 이동
	
	@Autowired
	private UserService service;
	UserDao userDao;
	
	//로그인페이지
	@RequestMapping("/user/login.do")
	public ModelAndView login(){
		
		ModelAndView model=new ModelAndView();
		
		//db연결 확인위해 데이터 갯수 출력부분
		int totalCount;
		totalCount=service.getTotalCount();
		model.addObject("totalCount", totalCount);
		
		model.setViewName("/user/login");
		
		return model;
	}
	
	//비회원로그인
		@RequestMapping("/user/login2.do")
		public String login2(@ModelAttribute UserDto dto)
		{
			service.insertUser2(dto);
			
			return "/user/signupsuccess2";
		}
		
		/*//******로그인처리
	@RequestMapping("/user/loginCheck.do")
	public ModelAndView loginChc(@ModelAttribute UserDto dto, HttpSession session){
		boolean result = service.loginCheck(dto, session);
		ModelAndView model = new ModelAndView();
		if(result==true){//로그인성공
			model.setViewName("/user/loginsuccess");
			model.addObject("msg","success");
		}else{//로그인실패
			model.setViewName("user/loginfail");
			model.addObject("msg","failure");
		}
		return model;
	}
	
	//***********로그아웃
	@RequestMapping("/user/loginout.do")
	public ModelAndView logout(HttpSession session){
		service.logout(session);
		ModelAndView model = new ModelAndView();
		model.setViewName("user/logout.do");
		model.addObject("msg","logout");
		return model;
	}*/
		
	//로그인하기 버튼 클릭->로그인되고 메인으로 포워드(일단 loginsuccess로 이동,나중에수정)
	/*@RequestMapping("/user/login1.do")
	public String login1()
	{
		return "/user/loginsuccess";
	}*/
	
	//회원가입 약관으로 이동
	@RequestMapping("/user/membership.do")
	public String membership(){
		
		return "/user/membership";
	}
	
	//회원가입폼으로 이동
		@RequestMapping("/user/signup.do")
		public String signup(@ModelAttribute UserDto dto){
			
			return "/user/signup";  
		}
	
	//회원가입폼에서 완료페이지로
	@RequestMapping("/user/signupform.do")
	public String readData(@ModelAttribute UserDto dto)
	{
		service.insertUser(dto);
		
		return "/user/signupsuccess";
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