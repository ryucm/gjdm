package egovframework.gjdm.controller;

import java.util.HashMap;
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

import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimNationVO;

@Controller
public class DimNationController {
	
	private static Logger logger = LoggerFactory.getLogger(DimNationController.class);
	
	@Resource(name="DimNationService")
	private DimNationService dimNationService;
	
	@RequestMapping(value="/dimNationList.do")
	public String selectDimNationList(Model model, @RequestParam Map<String,String> paramMap) throws Exception {
		
//    	Iterator<String> iter = paramMap.keySet().iterator();
//        
//        while(iter.hasNext()) {
//            String key = iter.next();
//            String value = paramMap.get(key);
//            
//            System.out.println(key + " : " + value);
//        }
		
		//처음 국가페이지 들어올때 페이징 관련 초기값 설정
		if (paramMap.get("currentPage")==null || paramMap.get("currentPage").equals("")) {
			paramMap.put("currentPage", "1");
			paramMap.put("contentLimit", "10");
		}
		//총 데이터 개수
		int totalContentCount = dimNationService.selectDimNationListCount(paramMap);
		//총 페이지 버튼 개수
		int totalButtonCount = (int)(totalContentCount/Integer.parseInt(paramMap.get("contentLimit"))) + 1;
		//구간당 버튼 개수 -> 5개
		int buttonPerSection = 5;
		//시작 버튼 번호
		int divStartButtonNo = Integer.parseInt(paramMap.get("currentPage"))%buttonPerSection==0?Integer.parseInt(paramMap.get("currentPage"))/buttonPerSection-1
				:Integer.parseInt(paramMap.get("currentPage"))/buttonPerSection;
		int startButtonNo = divStartButtonNo*buttonPerSection + 1;
		//끝 버튼 번호
		int endButtonNo = startButtonNo+4>totalButtonCount?totalButtonCount:startButtonNo+4;
				
		List<DimNationVO> list = dimNationService.selectDimNationList(paramMap);
		
		paramMap.put("totalContentCount", String.valueOf(totalContentCount));
		paramMap.put("totalButtonCount", String.valueOf(totalButtonCount));
		paramMap.put("buttonPerSection", String.valueOf(buttonPerSection));
		paramMap.put("startButtonNo", String.valueOf(startButtonNo));
		paramMap.put("endButtonNo", String.valueOf(endButtonNo));
		
		model.addAllAttributes(paramMap);
		model.addAttribute("dimNationList", list);
		
		return "standard_manage/nation";
	}
	
	@RequestMapping(value="/insertDimNation.do")
	public String insertDimNation(Model model, @ModelAttribute DimNationVO vo, @RequestParam Map<String,String> paramMap) throws Exception{
		dimNationService.insertDimNation(vo);

		model.addAllAttributes(paramMap);
		
    	Iterator<String> iter = paramMap.keySet().iterator();
      
      while(iter.hasNext()) {
          String key = iter.next();
          String value = paramMap.get(key);
          
          System.out.println(key + " : " + value);
      }
		
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
