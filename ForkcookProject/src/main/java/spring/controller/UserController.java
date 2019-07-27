package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("/main/user/login.do")
	public ModelAndView login(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/main/user/login");
		return model;
	}
	
	//비회원로그인(=로그인하면 비회원 회원가입)
	@RequestMapping("/main/user/login2.do")
	public ModelAndView login2(@ModelAttribute UserDto dto, HttpSession session)
	{
		ModelAndView model = new ModelAndView();
		UserDto user = service.userLogin2(dto);
		
		if(user != null){//비회원 로그인 정보가 DB에 존재할경우
			session.setAttribute("loginInfo", user);//세션저장
			model.setViewName("/main/user/loginsuccess2");//나중에 주문내역페이지로 이동
			}
			else {
				service.insertUser2(dto);//존재하지 않는 회원정보로 로그인시도할경우 회원가입시킴
				model.setViewName("/main/user/notuser");
			}
			return model;
	}
		
	//로그인하기 버튼 클릭->로그인되고 메인으로 포워드(일단 loginsuccess로 이동,나중에수정)
	@RequestMapping("/main/user/login1.do")
	public ModelAndView login1(@ModelAttribute UserDto dto, HttpSession session)
	{
		ModelAndView model = new ModelAndView();
		UserDto user = service.userLogin(dto);
		
		if(user != null){
			// 세션 저장 System.out.println(user.getName());
			session.setAttribute("loginInfo", user);//세션저장
			model.setViewName("redirect:/main/main.do");
			
			//return "redirect:/main/main.do";
		} else {
			model.addObject("msg", "failure");
			
			model.setViewName("/main/user/login");
			//return "redirect:/main/user/login.do";
		}

		return model;
	}
	
	//회원가입 약관으로 이동
	@RequestMapping("/main/user/membership.do")
	public String membership(){
		return "/main/user/membership";
	}
	
	//회원가입폼으로 이동
	@RequestMapping("/main/user/signup.do")
	public String signup(@ModelAttribute UserDto dto){
		return "/main/user/signup";  
	}
		
	//아이디 중복확인
	@RequestMapping(value = "/main/user/idCheck.do", method = RequestMethod.GET)
	public @ResponseBody String postIdCheck(HttpServletRequest req,@RequestParam("id") String id){
		int n = service.idCheck(id);
		int result = 0;
		if(n >= 1) {
			result = 1;
		}
		System.out.println("idresult:"+result);
		return "{\"exist\":"+result+"}";
		
	}
	
	//회원가입폼에서 완료페이지로
	@RequestMapping("/main/user/signupform.do")
	public String readData(@ModelAttribute UserDto dto)
	{
		service.insertUser(dto);
		return "/main/user/signupsuccess";
	}
		
	// 마이페이지 내 정보 출력
	@RequestMapping("/main/user/mypage.do")
	public ModelAndView myinfo(@RequestParam int num){
		ModelAndView model = new ModelAndView();
		List<UserDto> list = service.userMypage(num);
		model.addObject("list", list);
		model.setViewName("/main/user/mypage");
		return model;
	}
	
	//비번확인 페이지 > 정보수정페이지
	@RequestMapping("/main/user/passconfirm.do")
	public String passconfirm(){
				
		//session.removeAttribute("id"); 세션변수 개별삭제
		//session.invalidate();//세션 정보 초기화
		
		return "/main/user/mypagepass";
	}

	// 마이페이지 > 비번확인페이지
	@RequestMapping("/main/user/myinfoupdate.do")
	public ModelAndView mypage(@RequestParam int num){
		ModelAndView model = new ModelAndView();
		List<UserDto> list = service.userMypage(num);
		model.addObject("list", list);
		
		//session.setAttribute("loginInfo", list);//세션저장
		
		//model.addObject("udto",list);//값 보내기
		
		model.setViewName("/main/user/mypageupdate");
		return model;
	}
	
	//비번 확인 페이지 > 비번 맞는지 검사
	@RequestMapping(value = "/main/user/passCheck.do", method = RequestMethod.GET)
	public @ResponseBody String passCheck(
			HttpServletRequest req,@RequestParam("pass") String pass){
		int n = service.passCheck(pass);
		int result = 0;
		if(n >= 1) {
			result = 1;
		}
		System.out.println("result:"+result);
		return "{\"exist\":"+result+"}";
	}
	
	// 정보 수정페이지에서 수정하고 내정보목록으로
	@RequestMapping(value="/main/user/myupdatedone.do",method=RequestMethod.POST)
	public String myupdate(@ModelAttribute UserDto dto){
		
		service.userUpdate(dto);
		
		dto.getNum();
		//System.out.println(num);
		return "redirect:mypage.do?num="+dto.getNum();
	}
		
	//로그아웃
	@RequestMapping("/main/user/logout.do")
	public String logout(HttpSession session){
		//session.removeAttribute("id"); 세션변수 개별삭제
		session.invalidate();//세션 정보 초기화
		return "/main/user/logout";
	}
		
	//관리자 user관리
	@RequestMapping("/admin/user/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		
		int usertype1TotalCount = service.getUsertype1TotalCount(); 
		int usertype2TotalCount = service.getUsertype2TotalCount(); 	
		List<UserDto> list = service.getList();
	
		model.addObject("usertype1TotalCount", usertype1TotalCount);
		model.addObject("usertype2TotalCount", usertype2TotalCount);
		model.addObject("list", list);
		model.setViewName("/admin/admin/user");
			
		return model;
		}
		
	//관리자 user삭제
	@RequestMapping("/admin/user/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		service.userDelete(num);
		return "redirect:list.do"; // 목록 새로고침
	}
	
}