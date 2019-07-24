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

import spring.data.NoticeDto;
import spring.service.NoticeService;
import upload.util.SpringFileWriter;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;

	@RequestMapping("/{mainadmin}/notice/list.do")
	public ModelAndView list(@PathVariable String mainadmin,@RequestParam(value="pageNum",defaultValue="1") int currentPage){
		ModelAndView model=new ModelAndView();

		int totalCount;//총 데이타 갯수

		totalCount=service.getTotalCount();
		//페이징 복사한거
		//페이징처리에 필요한 변수들 선언
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=5;//한페이지당 보여질 글의갯수
		int perBlock=5;//한블럭당 보여질 페이지의 갯수

		//총페이수를 구한다
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);

		//존재하지 않는 페이지일경우 마지막 페이지로 가기
		if(currentPage>totalPage)
			currentPage=totalPage;

		//각 블럭의 시작페이지와 끝페이지를 구한다
		//perBlock 이 5일경우
		//예) 현재페이지가 3 일경우 시작페이지:1,끝페이지:5
		//예) 현재페이지가 7 일경우 시작페이지:6,끝페이지:10
		//예) 현재페이지가 11 일경우 시작페이지:11,끝페이지:15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
		if(endPage>totalPage)
			endPage=totalPage;

		//각 페이지의 시작번호와 끝번호를 구한다
		//perPage 가 5일경우
		//예) 1페이지 : 시작번호 : 1, 끝번호:5
		//    3페이지 :           11        15
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
		//마지막 페이지의 글번호 체크하기
		if(endNum>totalCount)
			endNum=totalCount;

		//각 페이지마다 출력할 시작번호
		//총갯수가 30일경우 1페이지는 30,2페이지는 25....
		no=totalCount-(currentPage-1)*perPage;		

		//2. 리스트 가져오기
		List<NoticeDto> list=service.getList(startNum, endNum);

		//3. 페이징에 필요한 변수들 request에 저장		
		model.addObject("list", list);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.setViewName("/main/service/noticelist");
		
		if(mainadmin.equals("main")) { 					// 일반 모드일 경우 
			model.setViewName("/main/service/noticelist"); 	// 일반 모드의 메뉴 목록 화면으로 이동
		}
		else if(mainadmin.equals("admin")) { 			// 관리자 모드일 경우
			model.setViewName("/admin/admin/notice"); 	// 관리자 모드의 메뉴 관리(목록) 화면으로 이동
		}
		
		return model;
	}
	


	@RequestMapping("/{mainadmin}/notice/content.do")
	public String content(@PathVariable String mainadmin,Model model,@RequestParam int num,@RequestParam int pageNum){
		//데이타 가져오기
		NoticeDto dto=service.getData(num);
		//model 에 저장
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		
		if(mainadmin.equals("main")) { 					// 일반 모드일 경우 
			return "/main/service/noticecontent"; 	// 일반 모드의 메뉴 목록 화면으로 이동
		}
		else { 			// 관리자 모드일 경우
			return "/admin/admin/noticecontent";	// 관리자 모드의 메뉴 관리(목록) 화면으로 이동
		}

	}

	
	@RequestMapping("/admin/notice/form.do")
	public ModelAndView form(){
		ModelAndView model=new ModelAndView();
		
		model.setViewName("/admin/admin/noticeform");
		return model;
	}
	

	
	@RequestMapping(value="/admin/notice/write.do",method=RequestMethod.POST)
	public String readData(@ModelAttribute NoticeDto dto,
			HttpServletRequest request)
	{
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
				
				
		service.insertNotice(dto);		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/admin/notice/updateform.do")
	public ModelAndView updateForm(@RequestParam int num,
			@RequestParam String pageNum)
	{
		ModelAndView model=new ModelAndView();
		NoticeDto dto=service.getData(num);
		model.addObject("dto",dto);
		model.addObject("pageNum",pageNum);
		model.setViewName("/admin/admin/noticeupdateform");
		return model;
	}

	// 컨텐츠(content)에서 바로 수정 눌렀을 경우에는 pageNum가 있어서 파라미터에 pageNum이 있는 경우의 update함수
	@RequestMapping(value="/admin/notice/updatec.do",method=RequestMethod.POST)
	public String updatec(@ModelAttribute NoticeDto dto,@RequestParam String pageNum)
	{
		service.noticeUpdate(dto);
		return "redirect:content.do?num="+dto.getNum()+"&pageNum="+pageNum;
	}
	
	// 목록(list)에서 바로 수정 눌렀을 경우에는 pageNum가 없어서 파라미터에 pageNum이 없는 경우의 update함수
	@RequestMapping(value="/admin/notice/updatel.do",method=RequestMethod.POST)
	public String updatel(@ModelAttribute NoticeDto dto)
	{
		service.noticeUpdate(dto);	
		return "redirect:list.do";
		
	}

	
	

	
	@RequestMapping("/admin/notice/delete.do")
	public String delete(@RequestParam int num,@RequestParam String pageNum)
	{
		//삭제
		service.noticeDelete(num);
		//목록으로 이동(보던 페이지로)
		return "redirect:list.do?pageNum="+pageNum;
	}

	
	
}
