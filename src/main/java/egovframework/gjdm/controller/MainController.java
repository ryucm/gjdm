package egovframework.gjdm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/index.do")
	public String loginPage() {
		return "index";
	}
	
	@GetMapping("/stardard_nation.do")
	public String nattionPage() {
		return "standard_manage/nation";
	}
}
