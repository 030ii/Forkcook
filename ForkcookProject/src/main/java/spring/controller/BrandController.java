package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BrandController {
	// 페이지 이동 시 특별히 데이터 주고받기가 필요없을 때는
	// 이렇게 string으로 반환해도 됨.
	// 그래도 스프링에서 정석은 ModelAndView로 페이지 전환 하세요
	@RequestMapping("/brand/info.do")
	public String form(){
		//tiles.xml 에 지정한대로 /web-inf/member/memberform.jsp 가 main 에 나타남다
		return "/service/brandinfo";  
	}
}
