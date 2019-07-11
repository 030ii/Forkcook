package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.ReviewDto;
import spring.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	

	// TODO : 추후에는 없애고 메뉴 상세페이지 밑에 리뷰 목록 붙일 것임
	// 일반 -> 메뉴 리뷰 페이지로 이동
	@RequestMapping("/main/review/review.do")
	public ModelAndView review(){
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount();
		List<ReviewDto> list = service.getList();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.setViewName("/main/menu/review");
		return model;
	}
	
	//review 등록
	@RequestMapping("/main/review/insert.do")
	public String readData(@ModelAttribute ReviewDto dto)
	{
		service.reviewInsert(dto);

		return "redirect:review.do";
	}
	
	//review삭제 (user&관리자)
	@RequestMapping("/{mainadmin}/review/delete.do")
	public String delete(@PathVariable String mainadmin,@RequestParam int num){
		
		service.reviewDelete(num);
		
		if(mainadmin.equals("main")) { // 일반 모드일 경우 
			return "redirect:review.do";
		}
		else if(mainadmin.equals("admin")) { // 관리자 모드일 경우
			return "redirect:list.do";
		}
		return mainadmin;
	}

	//관리자 >> review목록 출력
	@RequestMapping("/admin/review/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
					
		int totalCount = service.getTotalCount();
		// review 리스트 가져오기
		List<ReviewDto> list = service.getList();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.setViewName("/admin/admin/review");
			
		return model;
		}
	
}
