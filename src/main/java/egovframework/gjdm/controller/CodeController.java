package egovframework.gjdm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CodeController {

	@GetMapping("code.do")
	public String Code() {
		return "standard_manage/code";
	}
}
