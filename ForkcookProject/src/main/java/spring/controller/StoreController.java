package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.StoreDto;
import spring.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	@RequestMapping("/main/store/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		
		//db연결 확인위해 데이터 갯수 출력부분
//		int totalCount;
//		totalCount=service.getTotalCount();
//		model.addObject("totalCount", totalCount);
		
		// 메뉴 리스트 가져오기
		List<StoreDto> list = service.getList();
		model.addObject("list", list);
		
		model.setViewName("/main/store/storelist");
		return model;
	}
	@RequestMapping("/main/store/detail.do")
	public String content(Model model,@RequestParam int num){
		//데이타 가져오기
	    StoreDto dto=service.getData(num);
	    //model 에 저장
	    model.addAttribute("dto", dto);   
	    return "/main/store/storedetail";
	}
}
