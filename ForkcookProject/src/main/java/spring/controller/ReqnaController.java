package spring.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.data.ReqnaDto;
import spring.service.QnaService;
import spring.service.ReqnaService;
import upload.util.SpringFileWriter;

@Controller
public class ReqnaController {
	@Autowired
	private ReqnaService reqservice;

	@Autowired
	private QnaService qservice;

	@RequestMapping("/admin/qna/reqform.do")
	public ModelAndView reqform(@RequestParam int qnum,@RequestParam int pageNum){
		ModelAndView model=new ModelAndView();
		model.addObject("qnum",qnum);
		model.addObject("pageNum",pageNum);
		model.setViewName("/admin/admin/reqnaform");
		return model;
	}

	@RequestMapping("/admin/qna/preqform.do")
	public ModelAndView preqform(@RequestParam int qnum,@RequestParam int pageNum){
		ModelAndView model=new ModelAndView();
		model.addObject("qnum",qnum);
		model.addObject("pageNum",pageNum);
		model.setViewName("/admin/partner/reqnaform");
		return model;
	}

	@RequestMapping(value="/admin/qna/reqwrite.do",method=RequestMethod.POST)
	public String reqnawrite(@ModelAttribute ReqnaDto reqdto,@RequestParam int pageNum,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		String image="";
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:reqdto.getUpfile())
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
		reqdto.setImage(image);

		int qnum = reqdto.getQnum();
		reqservice.reqnaInsert(reqdto);
		qservice.qnastateUpdate1(qnum);
		return "redirect:content.do?qnum="+qnum+"&pageNum="+pageNum;
	}

	@RequestMapping(value="/admin/qna/preqwrite.do",method=RequestMethod.POST)
	public String preqnawrite(@ModelAttribute ReqnaDto reqdto,@RequestParam int pageNum,HttpServletRequest request)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		String image="";
		//path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:reqdto.getUpfile())
		{
			//빈 문자열이 아닐 경우에만 저장
			if(f.getOriginalFilename().length()>0){
				image+=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}

		}
		if(image.length()==0)//이미지 세개 다 선택 안한경우
		{
			image="noimage";
		}
		
		//dto에 이미지 이름들 저장
		reqdto.setImage(image);

		int qnum = reqdto.getQnum();
		reqservice.reqnaInsert(reqdto);
		qservice.qnastateUpdate1(qnum);
		return "redirect:pqcontent.do?qnum="+qnum+"&pageNum="+pageNum;
	}

	@RequestMapping("/admin/qna/requpdateform.do")
	public ModelAndView reqnaupdateForm(@RequestParam int reqnum,@RequestParam String pageNum)
	{
		ModelAndView model=new ModelAndView();
		ReqnaDto reqdto=reqservice.getData(reqnum);
		model.addObject("reqdto",reqdto);
		model.addObject("pageNum", pageNum);
		model.setViewName("/admin/admin/reqnaupdateform");
		return model;
	}

	@RequestMapping("/admin/qna/pqupdateform.do")
	public ModelAndView pqupdateForm(@RequestParam int reqnum,@RequestParam String pageNum)
	{
		ModelAndView model=new ModelAndView();
		ReqnaDto reqdto=reqservice.getData(reqnum);
		model.addObject("reqdto",reqdto);
		model.addObject("pageNum", pageNum);
		model.setViewName("/admin/partner/reqnaupdateform");
		return model;
	}

	@RequestMapping(value="/admin/qna/requpdate.do",method=RequestMethod.POST)
	public String reqnaUpdate(@ModelAttribute ReqnaDto reqdto,@RequestParam String pageNum,HttpServletRequest request)
	{
		// @TODO : 기존 이미지 삭제
		
		// 기존 사진 가져오기
		ReqnaDto originalDto=reqservice.getData(reqdto.getNum());
		String image=originalDto.getImage();
		
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		// 수정한 사진이 있을 경우에만 path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:reqdto.getUpfile()){
			//빈 문자열이 아닐 경우에만 저장
			if(f.getOriginalFilename().length()>0){
				image=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		
		if(image.length()==0){ //이미지 세개 다 선택 안한경우
			image="noimage";
		}
		
		//dto에 이미지 이름들 저장
		reqdto.setImage(image);
		reqservice.reqnaUpdate(reqdto);	
		
		return "redirect:content.do?qnum="+reqdto.getQnum()+"&pageNum="+pageNum;
	}

	@RequestMapping(value="/admin/qna/pqupdate.do",method=RequestMethod.POST)
	public String pqUpdate(@ModelAttribute ReqnaDto reqdto,@RequestParam String pageNum,HttpServletRequest request)
	{
		// @TODO : 기존 이미지 삭제
		
		// 기존 사진 가져오기
		ReqnaDto originalDto=reqservice.getData(reqdto.getNum());
		String image=originalDto.getImage();
		
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		System.out.println(path);

		// 수정한 사진이 있을 경우에만 path경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();
		for(MultipartFile f:reqdto.getUpfile()){
			//빈 문자열이 아닐 경우에만 저장
			if(f.getOriginalFilename().length()>0){
				image=f.getOriginalFilename();
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}
		
		if(image.length()==0){ //이미지 세개 다 선택 안한경우
			image="noimage";
		}
		
		//dto에 이미지 이름들 저장
		reqdto.setImage(image);
		reqservice.reqnaUpdate(reqdto);	
		
		return "redirect:pqcontent.do?qnum="+reqdto.getQnum()+"&pageNum="+pageNum;
	}

	@RequestMapping("/admin/qna/reqdelete.do")
	public String reqnadelete(@RequestParam int reqnum,@RequestParam String pageNum)
	{
		//삭제
		ReqnaDto reqdto=reqservice.getData(reqnum);
		int qnum=reqdto.getQnum();
		qservice.qnastateUpdate2(qnum);
		reqservice.reqnaDelete(reqnum);
		return "redirect:content.do?qnum="+reqdto.getQnum()+"&pageNum="+pageNum;
	}

	@RequestMapping("/admin/qna/preqdelete.do")
	public String preqnadelete(@RequestParam int reqnum,@RequestParam String pageNum)
	{
		//삭제
		ReqnaDto reqdto=reqservice.getData(reqnum);
		int qnum=reqdto.getQnum();
		qservice.qnastateUpdate2(qnum);
		reqservice.reqnaDelete(reqnum);
		return "redirect:pqcontent.do?qnum="+reqdto.getQnum()+"&pageNum="+pageNum;
	}

}
