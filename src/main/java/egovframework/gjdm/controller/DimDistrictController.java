package egovframework.gjdm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.gjdm.service.DimDistrictService;
import egovframework.gjdm.vo.DimDistrictVO;

@Controller
public class DimDistrictController {
	@Resource(name="DimDistrictService")
	private DimDistrictService dimDistrictService;
	
	@RequestMapping("/dimDistrictList.do")
	public String selectDimDistrictList(Model model, @RequestParam Map<String, String> paramMap) throws Exception {
		List<DimDistrictVO> list = dimDistrictService.selectDimDistrictList(paramMap);
		
		model.addAttribute("dimDistrictList", list);
		
		System.out.println("11111111" + paramMap);
		System.out.println("11111111" + paramMap.get("distLvl1"));
		System.out.println("11111111" + paramMap.get("searchDistLvl2"));
		
		if(paramMap.get("searchNation") != null && !paramMap.get("searchNation").equals("")) {
			System.out.println(paramMap.get("searchNation"));
			System.out.println(paramMap.get("searchDistLvl1"));
			System.out.println(paramMap.get("searchDistLvl2"));
			model.addAttribute("searchNation", paramMap.get("searchNation"));
		}
		
		if(paramMap.get("searchDistLvl1") != null && !paramMap.get("searchDistLvl1").equals("")) {
			System.out.println(paramMap.get("searchNation"));
			System.out.println(paramMap.get("searchDistLvl1"));
			System.out.println(paramMap.get("searchDistLvl2"));
			model.addAttribute("searchDistLvl1", paramMap.get("searchDistLvl1"));
		}
		
		if(paramMap.get("searchDistLvl2") != null && !paramMap.get("searchDistLvl2").equals("")) {
			System.out.println(paramMap.get("searchNation"));
			System.out.println(paramMap.get("searchDistLvl1"));
			System.out.println(paramMap.get("searchDistLvl2"));
			model.addAttribute("searchDistLvl2", paramMap.get("searchDistLvl2"));
		}
		
		System.out.println("222222222" + paramMap.get("searchNation"));
		System.out.println("222222222" + paramMap.get("searchDistLvl1"));
		System.out.println("222222222" + paramMap.get("searchDistLvl2"));
		
		return "standard_manage/district";
	}
}
