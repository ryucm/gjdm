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
		
		
		
		
		List<DimCalendarVO> list = dimCalendarService.selectDimCalendarList(paramMap);

		model.addAttribute("dimCalendarList", list);
		if(paramMap.get("dateId") != null && !paramMap.get("dateId").equals("")) {
			model.addAttribute("dateId", paramMap.get("dateId"));		
		 } 

		return "standard_manage/calendar";
	}
	
}
