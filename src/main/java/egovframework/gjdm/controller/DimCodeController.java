package egovframework.gjdm.controller;

import java.util.List;
import java.util.Map;

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
	

	@RequestMapping("/code.do")
	public String selectDimCodeList(Model model, @RequestParam Map<String, String> paramMap) throws Exception {
		List<DimCodeVO> list = dimCodeService.selectDimCodeList(paramMap);
		model.addAttribute("dimCodeList", list);
		if(paramMap.get("codeId") != null && !paramMap.get("codeId").equals("")) {
			model.addAttribute("codeId", paramMap.get("codeId"));
		}
		
		if(paramMap.get("groupCode") != null && !paramMap.get("groupCode").equals("")) {
			model.addAttribute("groupCode", paramMap.get("groupCode"));
		}
		
		if(paramMap.get("code") != null && !paramMap.get("code").equals("")) {
			model.addAttribute("code", paramMap.get("code"));
		}
		
		return "standard_manage/code";
	}
	
	@RequestMapping("/deleteCode.do")
	public String deleteCode(int codeId) throws Exception{
		dimCodeService.deleteDimCode(codeId);
		return "redirect:code.do";
	}
	
	@RequestMapping("/updateCode.do")
	public String updateCode(@RequestParam Map<String, String> paramMap) throws Exception {
		dimCodeService.updateDimCode(paramMap);
		return "redirect:code.do";
	}
}
