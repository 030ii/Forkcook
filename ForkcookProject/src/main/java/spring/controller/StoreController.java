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
import spring.data.StoreDto;
import spring.service.StoreService;
import upload.util.SpringFileWriter;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	// 일반 -> 매장 페이지로 이동 
	// 관리자 -> 매장 관리 페이지로 이동
	@RequestMapping("/{mainadmin}/store/list.do")
	public ModelAndView list(@PathVariable String mainadmin){ // path의 mainadmin 부분을 변수로 가짐
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount(); 		// 매장 총 개수 가져오기
		List<StoreDto> list = service.getList(); 		// 매장 리스트 가져오기
	
		model.addObject("totalCount", totalCount); 		// 매장 총 개수값 추가
		model.addObject("list", list); 					// 매장 리스트 값들 추가
		
		if(mainadmin.equals("main")) { 					// 매장 모드일 경우 
			model.setViewName("/main/store/storelist"); 	// 일반 모드의 매장 목록 화면으로 이동
		}
		else if(mainadmin.equals("admin")) { 			// 관리자 모드일 경우
			model.setViewName("/admin/admin/store"); 	// 관리자 모드의 매장 관리(목록) 화면으로 이동
		}
		
		return model;
	}
	
	// 일반 -> 매장 페이지 -> 매장 상세보기 페이지로 이동 
	@RequestMapping("/main/store/detail.do")
	public String content(Model model,@RequestParam int num){
		//데이타 가져오기
	    StoreDto dto=service.getData(num);
	    //model 에 저장
	    model.addAttribute("dto", dto);   
	    return "/main/store/storedetail";
	}
	
	// 관리자 -> 매장 관리 -> 매장 추가 페이지로 이동 
	@RequestMapping("/admin/store/writeform.do")
	public ModelAndView writeform(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/admin/storeform");
		return model;
	}	
	
	// 관리자 -> 매장 관리 -> DB에 메뉴 추가한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/store/write.do",method=RequestMethod.POST)
	public String write(@ModelAttribute StoreDto dto, HttpServletRequest request){
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);
		
		String mainimage="";
		String mapimage="";
		
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		int count = 0;
		for(MultipartFile f:dto.getUpfile()){
			count++;
			//빈 문자열이 아닐 경우에만 저장
			if(f.getOriginalFilename().length()>0){
				if(count == 1) mainimage=f.getOriginalFilename();
				else if(count == 2) mapimage=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		
		dto.setMainimage(mainimage);
		dto.setMapimage(mapimage);
		
		service.insertStore(dto); // 추가
		return "redirect:list.do"; // 목록 새로고침
	}
	
	// 관리자 -> 매장 관리 -> 매장 수정 페이지로 이동
	@RequestMapping("/admin/store/updateform.do")
	public ModelAndView updateform(@RequestParam int num){
		ModelAndView model=new ModelAndView();
		StoreDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.setViewName("/admin/admin/storeupdateform");
		return model;
	}	
	
	// 관리자 -> 매장 관리 -> DB에 매장 수정한 뒤 목록으로 redirect 
	@RequestMapping(value="/admin/store/update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute StoreDto dto, HttpServletRequest request){
		// @TODO : 기존 이미지 삭제
		
		System.out.println(dto.getNum());
		System.out.println("name:"+dto.getName());
		System.out.println("area:"+dto.getArea());
		System.out.println(dto.getAddr());
		System.out.println(dto.getPhone());
		System.out.println(dto.getMainimage());
		System.out.println(dto.getMapimage());
		System.out.println(dto.getOpertime());
		System.out.println(dto.getShortmsg());
		System.out.println(dto.getLongmsg());
		
		// 기존 사진 가져오기
		StoreDto originalDto=service.getData(dto.getNum());
		String mainimage=originalDto.getMainimage(); 
		String mapimage=originalDto.getMapimage();
		
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
				else if(count == 2) mapimage=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		
		dto.setMainimage(mainimage);
		dto.setMapimage(mapimage);
		
		service.storeUpdate(dto); // 추가
		
		return "redirect:list.do"; // 목록 새로고침
	}
	
	
	
	// 관리자 -> 매장 관리 -> DB에 매장 삭제하고 목록으로 redirect
	@RequestMapping("/admin/store/delete.do")
	public String delete(@RequestParam int num){
		// 삭제
		service.storeDelete(num);
		return "redirect:list.do"; // 목록 새로고침
	}	
}
