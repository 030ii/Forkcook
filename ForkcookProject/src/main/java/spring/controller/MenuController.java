package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.data.MenuDto;
import spring.service.MenuService;
import upload.util.SpringFileWriter;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService service;
	
	// 일반 -> 메뉴 페이지로 이동 
	// 관리자 -> 메뉴 관리 페이지로 이동
	@RequestMapping("/{mainadmin}/menu/list.do")
	public ModelAndView list(@PathVariable String mainadmin){ // path의 mainadmin 부분을 변수로 가짐
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount(); 		// 메뉴 총 개수 가져오기
		List<MenuDto> list = service.getList(); 		// 메뉴 리스트 가져오기
	
		model.addObject("totalCount", totalCount); 		// 메뉴 총 개수값 추가
		model.addObject("list", list); 					// 메뉴 리스트 값들 추가
		
		if(mainadmin.equals("main")) { 					// 일반 모드일 경우 
			model.setViewName("/main/menu/menulist"); 	// 일반 모드의 메뉴 목록 화면으로 이동
		}
		else if(mainadmin.equals("admin")) { 			// 관리자 모드일 경우
			model.setViewName("/admin/admin/menu"); 	// 관리자 모드의 메뉴 관리(목록) 화면으로 이동
		}
		
		return model;
	}

	// 일반 -> 메뉴 상세보기 페이지로 이동
	@RequestMapping("/main/menu/detail.do")
	public String content(Model model,@RequestParam int num){
      //데이타 가져오기
      MenuDto mdto=service.getData(num);
      //model 에 저장
      model.addAttribute("mdto", mdto);
      return "/main/menu/menudetail";
	}
		
	// 관리자 -> 메뉴 관리 -> 메뉴 추가 페이지로 이동 
	@RequestMapping("/admin/menu/writeform.do")
	public ModelAndView writeform(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/admin/menuform");
		return model;
	}	
	
	// 관리자 -> 메뉴 관리 -> DB에 메뉴 추가한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/menu/write.do",method=RequestMethod.POST)
	public String write(@ModelAttribute MenuDto dto, HttpServletRequest request){
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		
		String mainimage="";
		String longimage="";
		
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		int count = 0;
		for(MultipartFile f:dto.getUpfile()){
			count++;
			//빈 문자열이 아닐 경우에만 저장
			if(f.getOriginalFilename().length()>0){
				if(count == 1) mainimage=f.getOriginalFilename();
				else if(count == 2) longimage=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		
		dto.setMainimage(mainimage);
		dto.setLongimage(longimage);
		
		service.insertMenu(dto); // DB에 추가
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 메뉴 관리 -> 메뉴 수정 페이지로 이동
	@RequestMapping("/admin/menu/updateform.do")
	public ModelAndView updateform(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		MenuDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.setViewName("/admin/admin/menuupdateform");
		return model;
	}	
	
	// 관리자 -> 메뉴 관리 -> DB에 메뉴 수정한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/menu/update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute MenuDto dto, HttpServletRequest request){
		// @TODO : 기존 이미지 삭제
		
		// 기존 사진 가져오기
		MenuDto originalDto=service.getData(dto.getNum());
		String mainimage=originalDto.getMainimage(); 
		String longimage=originalDto.getLongimage();
		
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		
		// 수정한 사진이 있을 경우에만 path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		int count = 0;
		for(MultipartFile f:dto.getUpfile()){
			count++;
			//빈 문자열이 아닐 경우에만 저장
			if(f.getOriginalFilename().length()>0){
				if(count == 1) mainimage=f.getOriginalFilename();
				else if(count == 2) longimage=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		dto.setMainimage(mainimage);
		dto.setLongimage(longimage);
		
		service.menuUpdate(dto); // 수정
		return "redirect:list.do"; // 목록 새로고침
	}	
	
	// 관리자 -> 메뉴 관리 -> DB에 메뉴 삭제하고 목록으로 redirect
	@RequestMapping("/admin/menu/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		service.menuDelete(num);
		return "redirect:list.do"; // 목록 새로고침
	}	

}
