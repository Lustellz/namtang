package kosta.namtang.talkbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String mainIndex() {
		
		return "guest/index";
	}

}
