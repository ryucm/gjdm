package egovframework.gjdm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.gjdm.service.DimCodeService;
import egovframework.gjdm.vo.DimCodeVO;

@Controller
public class DimCodeController {
	
	@Resource(name="DimCodeService")
	private DimCodeService dimCodeService;
	

	@GetMapping("/code.do")
	public String selectDimCodeList(Model model) throws Exception {
		List<DimCodeVO> list = dimCodeService.selectDimCodeList();
		model.addAttribute("dimCodeList", list);
		
		return "standard_manage/code";
	}
	
	@RequestMapping("/deleteCode.do")
	public String deleteCode(int codeId) throws Exception{
		int result = dimCodeService.deleteDimCode(codeId);
		return "redirect:code.do";
	}
}