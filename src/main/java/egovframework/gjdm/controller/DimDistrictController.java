package egovframework.gjdm.controller;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.gjdm.service.DimDistrictService;
import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimDistrictVO;
import egovframework.gjdm.vo.DimNationVO;

@Controller
public class DimDistrictController {
	
	@Resource(name="DimNationService")
	private DimNationService DimNationService;
	
	@Resource(name="DimDistrictService")
	private DimDistrictService dimDistrictService;
	
	@RequestMapping("/dimDistrictList.do")
	public String selectDimDistrictList(Model model, @RequestParam Map<String, String> paramMap) throws Exception {
		List<DimNationVO> nationList = DimNationService.selectDimNationList();
		List<DimDistrictVO> districtList = dimDistrictService.selectDimDistrictList(paramMap);
		List<DimDistrictVO> distLvl1List = dimDistrictService.selectDimDistrictListGroupByLvl1();
		
		System.out.println("paramMap::::::::::::::::::::::: " + paramMap);
		
		model.addAttribute("dimNationList", nationList);
		model.addAttribute("dimDistrictList", districtList);
		model.addAttribute("distLvl1List", distLvl1List);
		
		if(paramMap.get("nationId") != null && !paramMap.get("nationId").equals("")) {
			model.addAttribute("nationId", paramMap.get("nationId"));
		}
		
		if(paramMap.get("distLvl1") != null && !paramMap.get("distLvl1").equals("")) {
			model.addAttribute("distLvl1", paramMap.get("distLvl1"));
			List<DimDistrictVO> distLvl2 = dimDistrictService.selectDimDistrictListGroupByLvl2(paramMap.get("distLvl1"));
			model.addAttribute("distLvl2", distLvl2);
			for(DimDistrictVO data: distLvl2) {
				System.out.println(data.getDistLvl2());
			}
			System.out.println("distLvl2:::::::::::::::::: " + model.getAttribute("distLvl2"));
		}
		
		if(paramMap.get("distLvl2") != null && !paramMap.get("distLvl2").equals("")) {
			model.addAttribute("distLvl2", paramMap.get("distLvl2"));
		}
	 	
		return "standard_manage/district";
	}
	
	@RequestMapping(value="/selectDistLvl.do", method=RequestMethod.POST)
	public String selectDistLvl(String distLvl1) throws Exception {
//		model.addAttribute("distLvl1", distLvl1);
//		System.out.println(model.getAttribute("distLvl1"));
		List<DimDistrictVO> distLvl2 = dimDistrictService.selectDimDistrictListGroupByLvl2(distLvl1);
		DimDistrictVO districtVO = distLvl2.get(1);
//		distLvl2.put("distLvl2List", "String");
		System.out.println(districtVO.getDistLvl1());
		String[] string = new String[]{"hi", "hello", "hey"};
		return "success";
	}
	
	@RequestMapping("/districtInsert.do")
	public String districtInsert(Model model) throws Exception {
		List<DimNationVO> nationList = DimNationService.selectDimNationList();
		model.addAttribute("dimNationList", nationList);
		return "standard_manage/districtInsert";
	}
	
	@RequestMapping("/insertDimDistrict.do")
	public String insertDimDistrict(@RequestParam Map<String, String> paramMap) throws Exception {
		System.out.println("insertttttttttttttttttttttttttttttttttttttt");
		dimDistrictService.insertDimDistrict(paramMap);
		
		return "redirect:districtInsert.do";
	}
	
	@RequestMapping("/updateDimDistrict.do")
	public String updateDimDistrict(@RequestParam Map<String, String> paramMap) throws Exception {
		dimDistrictService.updateDimDistrict(paramMap);
		
		return "redirect:dimDistrictList.do";
	}
	
	@RequestMapping("/deleteDimDistrict.do")
	public String deleteDimDistrict(@RequestParam int districtId) throws Exception {
		dimDistrictService.deleteDimDistrict(districtId);
		
		return "redirect:dimDistrictList.do";
	}
	
}
