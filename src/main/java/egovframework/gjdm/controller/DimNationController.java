package egovframework.gjdm.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.gjdm.pagination.Pagination;
import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimNationVO;

@Controller
public class DimNationController {
	
	private static Logger logger = LoggerFactory.getLogger(DimNationController.class);
	
	@Resource(name="DimNationService")
	private DimNationService dimNationService;
	
	@RequestMapping(value="/dimNationList.do")
	public String selectDimNationList(Model model, @RequestParam Map<String,String> paramMap) throws Exception {
		
		//처음 국가페이지 들어올때 페이징 관련 초기값 설정
		if (paramMap.get("currentPage")==null || paramMap.get("currentPage").equals("")) {
			paramMap.put("currentPage", "1");
			paramMap.put("contentLimit", "10");
		}
				
		List<DimNationVO> list = dimNationService.selectDimNationList(paramMap);
		
		//총 데이터 개수
		int totalContentCount = dimNationService.selectDimNationListCount(paramMap);
		
		Pagination pg = new Pagination(totalContentCount, paramMap);
		model.addAllAttributes(pg.getPageMap());
		
		model.addAllAttributes(paramMap);
		model.addAttribute("dimNationList", list);
		
		return "standard_manage/nation";
	}
	
	@RequestMapping(value="/insertDimNation.do")
	public String insertDimNation(Model model, @ModelAttribute DimNationVO vo, @RequestParam Map<String,String> paramMap) throws Exception{
		dimNationService.insertDimNation(vo);

		model.addAllAttributes(paramMap);
		
    	Iterator<String> iter = paramMap.keySet().iterator();
      
		return "redirect:dimNationList.do";
		
	}
	
	@RequestMapping(value="/updateDimNation.do")
	public String updateDimNation(Model model, @ModelAttribute DimNationVO vo, @RequestParam Map<String,String> paramMap) throws Exception{
		dimNationService.updateDimNation(vo);
		
		model.addAllAttributes(paramMap);
		
		
		
		return "redirect:dimNationList.do";
	}
	
	@RequestMapping(value="/deleteDimNation.do")
	public String deleteDimNation(Model model,@RequestParam Map<String,String> paramMap) throws Exception{
		
		dimNationService.deleteDimNation(paramMap.get("nationId"));
		
		model.addAllAttributes(paramMap);
		
		return "redirect:dimNationList.do";
	}
	
	@RequestMapping(value="/nationInsert.do")
	public String nationInsert() {
		return "standard_manage/nationInsert";
	}
}
