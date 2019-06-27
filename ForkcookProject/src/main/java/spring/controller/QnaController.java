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
}
