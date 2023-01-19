package egovframework.gjdm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimNationVO;

@Controller
public class DimNationController {
	
	private static Logger logger = LoggerFactory.getLogger(DimNationController.class);
	
	@Resource(name="DimNationService")
	private DimNationService dimNationService;
	
	@RequestMapping(value="/dimNationList.do")
	public String selectDimNationList(Model model, @RequestParam Map<String,String> paramMap) throws Exception {
		
		List<DimNationVO> list = new ArrayList<DimNationVO>();
		
		if (paramMap.get("continent")==null || paramMap.get("continent").equals("")) {
			list = dimNationService.selectDimNationList();
		}else {
			list = dimNationService.selectDimNationListByContinent(paramMap.get("continent")); 
		}
		
		model.addAttribute("dimNationList", list);
		
		return "standard_manage/nation";
	}
}
