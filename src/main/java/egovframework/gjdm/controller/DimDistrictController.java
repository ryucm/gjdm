package egovframework.gjdm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.gjdm.service.DimDistrictService;
import egovframework.gjdm.vo.DimDistrictVO;

@Controller
public class DimDistrictController {
	@Resource(name="DimDistrictService")
	private DimDistrictService dimDistrictService;
	
	@RequestMapping("/dimDistrictList.do")
	public String selectDimDistrictList(Model model) throws Exception {
		List<DimDistrictVO> list = dimDistrictService.selectDimDistrictList();
		
		model.addAttribute("dimDistrictList", list);
		
		return "standard_manage/district";
	}
}
