package egovframework.gjdm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import egovframework.gjdm.service.DimCalendarService;
import egovframework.gjdm.vo.DimCalendarVO;

@Controller
public class DimCalendarController {
	
	@Resource(name="DimCalendarService")
	private DimCalendarService dimCalendarService;
		
	@RequestMapping(value="/dimCalendarList.do")
	public String selectDimCalendarList(Model model, @RequestParam
			Map<String, String> paramMap) throws Exception {
		
		if (paramMap.get("currentPage")==null || paramMap.get("currentPage").equals("")) {
			paramMap.put("currentPage", "1");
			paramMap.put("contentLimit", "10");
		}
		//총 데이터 개수
		int totalContentCount = dimCalendarService.selectDimCalendarListCount(paramMap);
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
		
		List<DimCalendarVO> list = dimCalendarService.selectDimCalendarList(paramMap);
		
		paramMap.put("totalContentCount", String.valueOf(totalContentCount));
		paramMap.put("totalButtonCount", String.valueOf(totalButtonCount));
		paramMap.put("buttonPerSection", String.valueOf(buttonPerSection));
		paramMap.put("startButtonNo", String.valueOf(startButtonNo));
		paramMap.put("endButtonNo", String.valueOf(endButtonNo));
		
		model.addAllAttributes(paramMap);
		model.addAttribute("dimCalendarList", list);
		if(paramMap.get("dateId") != null && !paramMap.get("dateId").equals("")) {
			model.addAttribute("dateId", paramMap.get("dateId"));		
		 } 

		return "standard_manage/calendar";
	}
	
}
