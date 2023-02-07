package egovframework.gjdm.controller;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.gjdm.pagination.Pagination;
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
		
		if (paramMap.get("currentPage")==null || paramMap.get("currentPage").equals("")) {
			paramMap.put("currentPage", "1");
			paramMap.put("contentLimit", "10");
		}
		
		List<DimNationVO> nationList = DimNationService.selectDimNationListForDistrict();
		List<DimDistrictVO> districtList = dimDistrictService.selectDimDistrictList(paramMap);
		List<DimDistrictVO> distLvl1List = dimDistrictService.selectDimDistrictListGroupByLvl1();
		List<DimDistrictVO> distLvl2List = dimDistrictService.selectDimDistrictListGroupByLvl2();
		
		int totalContentCount = dimDistrictService.selectDimDistrictListCount(paramMap);
		
		Pagination pg = new Pagination(totalContentCount, paramMap);
		model.addAllAttributes(pg.getPageMap());
		
		model.addAllAttributes(paramMap);
		model.addAttribute("dimNationList", nationList);
		model.addAttribute("dimDistrictList", districtList);
		model.addAttribute("distLvl1List", distLvl1List);
		model.addAttribute("distLvl2List", distLvl2List);
		
		if(paramMap.get("nationId") != null && !paramMap.get("nationId").equals("")) {
			model.addAttribute("nationId", paramMap.get("nationId"));
		}
		
		if(paramMap.get("distLvl1") != null && !paramMap.get("distLvl1").equals("")) {
			model.addAttribute("distLvl1", paramMap.get("distLvl1"));
		}
		
		if(paramMap.get("distLvl2") != null && !paramMap.get("distLvl2").equals("")) {
			model.addAttribute("distLvl2", paramMap.get("distLvl2"));
		}
	 	
		return "standard_manage/district";
	}
	
	@RequestMapping("/dimSelectDistLvl.do")
	public String selectDistLvl(Model model, @RequestParam Map<String, String> paramMap) throws Exception {
		if (paramMap.get("currentPage")==null || paramMap.get("currentPage").equals("")) {
			paramMap.put("currentPage", "1");
			paramMap.put("contentLimit", "10");
		}
		
		List<DimNationVO> nationList = DimNationService.selectDimNationListForDistrict();
		List<DimDistrictVO> districtList = dimDistrictService.selectAll(paramMap);
		List<DimDistrictVO> distLvl1List = dimDistrictService.selectDimDistrictListGroupByLvl1();
		List<DimDistrictVO> distLvl2List = dimDistrictService.selectDimDistrictListGroupByLvl2();
		
		int totalContentCount = dimDistrictService.selectDimDistrictAllListCount();
		
		Pagination pg = new Pagination(totalContentCount, paramMap);
		model.addAllAttributes(pg.getPageMap());
		
		model.addAllAttributes(paramMap);
		model.addAttribute("dimNationList", nationList);
		model.addAttribute("dimDistrictList", districtList);
		model.addAttribute("distLvl1List", distLvl1List);
		model.addAttribute("distLvl2List", distLvl2List);
		
		if(paramMap.get("nationId") != null && !paramMap.get("nationId").equals("")) {
			model.addAttribute("nationId", paramMap.get("nationId"));
		}
		
		if(paramMap.get("distLvl1") != null && !paramMap.get("distLvl1").equals("")) {
			model.addAttribute("distLvl1", paramMap.get("distLvl1"));
		}
		
		return "standard_manage/district";
	}
	
	@RequestMapping("/insertDimDistrict.do")
	public String insertDimDistrict(@RequestParam Map<String, String> paramMap) throws Exception {
		dimDistrictService.insertDimDistrict(paramMap);
		
		return "redirect:dimDistrictList.do";
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
