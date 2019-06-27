package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	@RequestMapping("/qna/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		model.setViewName("/service/qnalist");
		return model;
	}
	
	@RequestMapping("/qna/content.do")
	public ModelAndView content(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/qnacontent");
		return model;
	}
	
	@RequestMapping("/qna/form.do")
	public ModelAndView form(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/qnaform");
		return model;
	}
	
	@RequestMapping("/qna/write.do")
	public ModelAndView write(){
		// TODO : 문의 추가 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/qnacontent");
		return model;
	}
	
	@RequestMapping("/qna/updateform.do")
	public ModelAndView updateform(){
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/qnaupdateform");
		return model;
	}
	
	@RequestMapping("/qna/update.do")
	public ModelAndView update(){
		// TODO : 문의 수정 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/qnacontent");
		return model;
	}
	
	@RequestMapping("/qna/delete.do")
	public ModelAndView delete(){
		// TODO : 문의 삭제 기능 
		ModelAndView model=new ModelAndView();
		model.setViewName("/service/qnalist");
		return model;
	}
}
