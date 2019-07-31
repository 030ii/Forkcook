package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import spring.data.QnaDto;
import spring.data.ReqnaDto;
import spring.data.StoreDto;
import spring.data.StoreuserDto;
import spring.service.QnaService;
import spring.service.ReqnaService;
import spring.service.StoreService;
import upload.util.SpringFileWriter;



@Controller
public class QnaController {
	@Autowired
	private QnaService qservice;
	
	@Autowired
	private ReqnaService reqservice;
	
	@Autowired
	private StoreService storeservice;

	@RequestMapping("/{mainadmin}/{qnauser}/{listpartnermyqna}.do")
	public ModelAndView list(@PathVariable String mainadmin,@PathVariable String listpartnermyqna, @PathVariable String qnauser, @RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session) {
		ModelAndView model = new ModelAndView();
		
		StoreuserDto storeuser = (StoreuserDto) session.getAttribute("adminLoginInfo"); 
		int snum = storeuser.getSnum();
		
		int totalCount = qservice.getTotalCount(); 		// 문의 총 개수 가져오기
		int storeTotalCount = qservice.getStoreTotalCount(snum); // 상점별 문의 총 개수 가져오기
		
		//페이징 복사한거
		//페이징처리에 필요한 변수들 선언
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=10;//한페이지당 보여질 글의갯수
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
		List<QnaDto> qlist=qservice.getList(startNum, endNum);
		List<QnaDto> qlist2=qservice.getList2();
		List<StoreDto> slist=storeservice.getList();

		//3. 페이징에 필요한 변수들 request에 저장		
		model.addObject("qlist", qlist);
		model.addObject("qlist2", qlist2);
		model.addObject("slist", slist);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.addObject("storeTotalCount",storeTotalCount);
		
		if(mainadmin.equals("main")) { 											 // 일반 모드일 경우 
			if(qnauser.equals("user") && listpartnermyqna.equals("myqna")){ 	 // main/user/myqna.do
				model.setViewName("/main/user/qnalist"); 						 // 일반 모드의 마이페이지 문의 목록 화면으로 이동
			} else if(qnauser.equals("qna") && listpartnermyqna.equals("list")){ // main/qna/list.do
				model.setViewName("/main/service/qnalist"); 					 // 일반 모드의 문의 목록 화면으로 이동
			} 
		} else if(mainadmin.equals("admin") && qnauser.equals("qna")) { // 관리자 모드일 경우
			if(listpartnermyqna.equals("list")){ 					    // admin/qna/list.do
				model.setViewName("/admin/admin/qna"); 				    // 관리자 모드의 문의 관리(목록) 화면으로 이동
			} else if(listpartnermyqna.equals("partner")) {        	    // admin/qna/partner.do
				model.setViewName("/admin/partner/partnerqna"); 	    // 가맹점 모드의 문의 관리(목록) 화면으로 이동
			} 
		}
		return model;
	}

	@RequestMapping("/{mainadmin}/qna/content.do")
	public String content(@PathVariable String mainadmin,Model model,@RequestParam int qnum,@RequestParam int pageNum){
		//데이타 가져오기
		QnaDto qdto=qservice.getData(qnum);
		//model 에 저장
		model.addAttribute("qdto", qdto);
		model.addAttribute("pageNum", pageNum);	

		List<ReqnaDto> reqlist=reqservice.getReqnaList(qdto.getNum());
		model.addAttribute("reqlist",reqlist);
		List<StoreDto> slist=storeservice.getList();
		model.addAttribute("slist", slist);

		if(mainadmin.equals("main")) { 
			return "/main/service/qnacontent";// 일반 모드일 경우 
		}
		/*else if(mainadmin.equals("admin")) {*/ 			// 관리자 모드일 경우
		else {
			return "/admin/admin/qnacontent"; 	  // 관리자 모드의 메뉴 관리(목록) 화면으로 이동
		}		
	}

	@RequestMapping("/main/user/uqcontent.do")
	public String usercontent(@RequestParam int qnum,@RequestParam int pageNum,Model model)
	{
		QnaDto qdto=qservice.getData(qnum);
		model.addAttribute("qdto", qdto);
		model.addAttribute("pageNum", pageNum);
		List<ReqnaDto> reqlist=reqservice.getReqnaList(qdto.getNum());
		model.addAttribute("reqlist",reqlist);
		List<StoreDto> slist=storeservice.getList();
		model.addAttribute("slist", slist);

		return "/main/user/qnacontent";
	}

	@RequestMapping("/admin/qna/pqcontent.do")
	public String pqcontent(@RequestParam int qnum,@RequestParam int pageNum,Model model)
	{
		QnaDto qdto=qservice.getData(qnum);
		model.addAttribute("qdto", qdto);
		model.addAttribute("pageNum", pageNum);
		List<ReqnaDto> reqlist=reqservice.getReqnaList(qdto.getNum());
		model.addAttribute("reqlist",reqlist);
		List<StoreDto> slist=storeservice.getList();
		model.addAttribute("slist", slist);

		return "/admin/partner/qnacontent";
	}

	@RequestMapping("/main/{qnauser}/form.do")
	public ModelAndView form(@PathVariable String qnauser){
		ModelAndView model=new ModelAndView();

		if(qnauser.equals("qna")){
			model.setViewName("/main/service/qnaform");
		}else{
			model.setViewName("/main/user/qnaform");
		}
		return model;
	}

	@RequestMapping(value="/main/{qnauser}/write.do",method=RequestMethod.POST)
	public String readData(@ModelAttribute QnaDto qdto,@PathVariable String qnauser,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		String image="";
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:qdto.getUpfile())
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
		qdto.setImage(image);

		qservice.qnaInsert(qdto);
		if(qnauser.equals("qna")){
			return "redirect:list.do";
		}else{
			return "redirect:myqna.do";
		}
	}

	@RequestMapping("/main/{qnauser}/updateform.do")
	public ModelAndView updateForm(@RequestParam int qnum,@PathVariable String qnauser,
			@RequestParam String pageNum)
	{
		ModelAndView model=new ModelAndView();
		QnaDto qdto=qservice.getData(qnum);
		model.addObject("qdto",qdto);
		model.addObject("pageNum",pageNum);
		if(qnauser.equals("qna")){
			model.setViewName("/main/service/qnaupdateform");
		} else {
			model.setViewName("/main/user/qnaupdateform");
		}
		return model;
	}

	@RequestMapping(value="/main/{qnauser}/update1.do",method=RequestMethod.POST)
	public String update1(@ModelAttribute QnaDto qdto,@PathVariable String qnauser,
			@RequestParam String pageNum,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		String image="";
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:qdto.getUpfile())
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
		qdto.setImage(image);

		qservice.qnaUpdate(qdto);
		if(qnauser.equals("qna")){
			return "redirect:content.do?qnum="+qdto.getNum()+"&pageNum="+pageNum;
		}else{
			return "redirect:uqcontent.do?qnum="+qdto.getNum()+"&pageNum="+pageNum;
		}
	}

	@RequestMapping(value="/main/{qnauser}/update2.do",method=RequestMethod.POST)
	public String update2(@ModelAttribute QnaDto qdto,@PathVariable String qnauser,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		String image="";
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:qdto.getUpfile())
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
		qdto.setImage(image);

		qservice.qnaUpdate(qdto);
		if(qnauser.equals("qna")){
			return "redirect:list.do";
		}else{
			return "redirect:myqna.do";
		}
	}

	// 일반 사용자 -> 문의삭제
	// 관리자 -> 문의삭제 
	@RequestMapping("/{mainadmin}/qna/delete.do")
	public String adminqnadelete(@PathVariable String mainadmin,@RequestParam int qnum,@RequestParam String pageNum)
	{
		//삭제
		qservice.qnaDelete(qnum);

		if(mainadmin.equals("main")) { 
			return "redirect:list.do?pageNum="+pageNum;// 일반 모드일 경우 
		}
		//else if(mainadmin.equals("admin")) { 			// 관리자 모드일 경우
		else {
			return "redirect:list.do?pageNum="+pageNum; 	  // 관리자 모드의 메뉴 관리(목록) 화면으로 이동
		}
	}

	@RequestMapping("admin/qna/pqdelete.do")
	public String pqdelete(@RequestParam int qnum,@RequestParam String pageNum)
	{
		qservice.qnaDelete(qnum);
		return "redirect:partner.do?pageNum="+pageNum;
	}

	@RequestMapping("main/user/uqdelete.do")
	public String uqdelete(@RequestParam int qnum,@RequestParam String pageNum)
	{
		qservice.qnaDelete(qnum);
		return "redirect:myqna.do?pageNum="+pageNum;
	}

	/*@RequestMapping("/main/qna/delete.do")
	public String delete(@RequestParam int qnum,@RequestParam String pageNum)
	{
		//삭제
		qservice.qnaDelete(qnum);
		//목록으로 이동(보던 페이지로)
		return "redirect:list.do?pageNum="+pageNum;
	}*/
}