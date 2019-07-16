package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.data.ReviewDto;
import spring.service.ReviewService;
import upload.util.SpringFileWriter;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	

	// TODO : 추후에는 없애고 메뉴 상세페이지 밑에 리뷰 목록 붙일 것임
	// 일반 -> 메뉴 리뷰 페이지로 이동
	@RequestMapping("/main/review/review.do")
	public ModelAndView review(@RequestParam int mnum){
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount();
		List<ReviewDto> list = service.getListUser(mnum);
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("mnum", mnum);
		model.setViewName("/main/menu/review");
		return model;
	}
	
	//review 등록(이미지추가)
		@RequestMapping(value="/main/review/insert.do",method=RequestMethod.POST)
		public String read(
				@ModelAttribute ReviewDto dto,
				HttpServletRequest request
				)
		{
			//일단 파일명이 어떻게 넘어오는지부터 확인 - 입력안했을시에
			/*for(MultipartFile f:dto.getUpfile())
			{
				System.out.println("파일명:"+f.getOriginalFilename());
			}*/
			 //-> 이미지선택 안할경우 null값이 아닌 그냥 빈 문자열로 출력됨
			
			//이미지 업로드 경로
			String path=request.getSession().getServletContext().getRealPath("/save");
			System.out.println(path);
			
			String image="";
			//path경로에 이미지 저장
			SpringFileWriter fileWriter=new SpringFileWriter();
			for(MultipartFile f:dto.getUpfile())
			{
				//빈 문자열이 아닐 경우에만 저장
				if(f.getOriginalFilename().length()>0){
					image+=f.getOriginalFilename()+",";
					fileWriter.writeFile(f, path, f.getOriginalFilename());
				}
				
			}
			if(image.length()==0)//이미지 세개 다 선택 안한경우
			{
				image="noimage";
			}else{
				//마지막 컴마 제거하기
				image=image.substring(0,image.length()-1);
			}
			//dto에 이미지 이름들 저장
			dto.setImage(image);
			//db에 저장
			service.reviewInsert(dto);
			
			return "redirect:review.do?mnum="+dto.getMnum();
		}
	
	//리뷰 수정
	@RequestMapping("/main/review/update.do")
	public String update(@RequestParam int num,@ModelAttribute ReviewDto dto){
		service.reviewUpdate(dto);
		return "redirect:review.do?mnum="+dto.getMnum();
	}
	
	//review삭제 (user&관리자)
	@RequestMapping("/{mainadmin}/review/delete.do")
	public String delete(@PathVariable String mainadmin,@RequestParam int num,
			@RequestParam int mnum){
		
		service.reviewDelete(num);
		
		if(mainadmin.equals("main")) { // 일반 모드일 경우 
			return "redirect:review.do?mnum="+mnum;
		}
		else if(mainadmin.equals("admin")) { // 관리자 모드일 경우
			return "redirect:list.do?mnum="+mnum;
		}
		return mainadmin;
	}

	//관리자 >> review목록 출력
	@RequestMapping("/admin/review/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
					
		int totalCount = service.getTotalCount();
		// review 리스트 가져오기
		List<ReviewDto> list = service.getListAdmin();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.setViewName("/admin/admin/review");
			
		return model;
	}
}
