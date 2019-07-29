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

import spring.data.StoreDto;
import spring.data.StoreuserDto;
import spring.service.StoreService;
import spring.service.StoreuserService;

@Controller
public class StoreuserController {
	@Autowired
	private StoreuserService suservice;
	
	@Autowired
	private StoreService sservice;
	 
	// 관리자 -> 가맹점 회원 관리 페이지로 이동
	@RequestMapping("/admin/storeuser/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		
		int totalCount = suservice.getTotalCount(); 		
		List<StoreuserDto> list = suservice.getList(); 		
	
		model.addObject("totalCount", totalCount); 		
		model.addObject("list", list); 					
		
		model.setViewName("/admin/admin/storeuser"); 	
		return model;
	}
	
	// 관리자 -> 가맹점 회원 관리 -> 가맹점 회원 추가(등록) 페이지로 이동 
	@RequestMapping("/admin/storeuser/insertform.do")
	public ModelAndView writeform(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/admin/storeuserform");
		return model;
	}	
	
	//아이디 중복확인
	@RequestMapping(value = "/admin/storeuser/idCheck.do", method = RequestMethod.GET)
	public @ResponseBody String postIdCheck(HttpServletRequest req,@RequestParam("id") String id){
		int n = suservice.idCheck(id);
		int result = 0;
		if(n >= 1) {
			result = 1;
		}
		System.out.println(result);
		return "{\"exist\":"+result+"}";
		
	}
	
	// 가맹점명 리스트 불러오기
//	@RequestMapping(value="/admin/storeuser/getSname.do",produces="application/json;charset=utf8",method=RequestMethod.GET)
//	public @ResponseBody String getSname(HttpServletRequest req, @RequestParam("sarea") String sarea){
//		List<String> list = sservice.getStoreNameList(sarea);
//		return "{\"result\":'"+list+"'}";
//	}
	@RequestMapping(value="/admin/storeuser/getSname.do",produces="application/json;charset=utf8",method=RequestMethod.GET)
	public @ResponseBody String getSname(HttpServletRequest req, @RequestParam("sarea") String sarea){
		List<StoreDto> list = sservice.getStoreNameList(sarea);
		
//		String strJson="{\"result\":["
//				+ "{\"name\":\"name1\",\"num\":\"num1\"},"
//				+ "{\"name\":\"name2\",\"num\":\"num2\"},"
//				+ "{\"name\":\"name3\",\"num\":\"num3\"}]}";
		
		String strJson="{\"result\":[";
		for(StoreDto sdto : list){
			strJson += "{\"num\":\""+ sdto.getNum() +"\",\"name\":\""+ sdto.getName() +"\"},";
		}
		
		strJson=strJson.substring(0,strJson.length()-1); // 마지막 쉼표 제거
		strJson+="]}";
		
		return strJson;
	}
	
	
	
	// 관리자 -> 가맹점 회원 관리 -> DB에 가맹점 회원 추가한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/storeuser/insert.do",method=RequestMethod.POST)
	public String write(@ModelAttribute StoreuserDto dto){
		suservice.insertStoreuser(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 가맹점 회원 관리 -> 가맹점 회원 정보 수정 페이지로 이동
	@RequestMapping("/admin/storeuser/updateform.do")
	public ModelAndView updateform(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		StoreuserDto dto=suservice.getData(num);
		model.addObject("dto",dto);
		model.setViewName("/admin/admin/storeuserupdateform");
		return model;
	}	
	
	// 관리자 -> 가맹점 회원 관리 -> DB에 가맹점 회원 정보 수정한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/storeuser/update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute StoreuserDto dto){
		suservice.storeuserUpdate(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 가맹점 회원 관리 -> DB에 가맹점 회원 삭제하고 목록으로 redirect
	@RequestMapping("/admin/storeuser/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		suservice.storeuserDelete(num);
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 로그아웃
	@RequestMapping("/admin/storeuser/logout.do")
	public String logout(HttpSession session){		
		//session.removeAttribute("id"); 세션변수 개별삭제
		session.invalidate();//세션 정보 초기화
		
		return "redirect:/admin/main.do";
	}
}
