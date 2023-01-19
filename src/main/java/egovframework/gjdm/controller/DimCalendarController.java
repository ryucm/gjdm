package egovframework.gjdm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.gjdm.service.DimCalendarService;
import egovframework.gjdm.vo.DimCalendarVO;

@Controller
public class DimCalendarController {
	
	private static Logger logger = LoggerFactory.getLogger(DimCalendarController.class);
	
	@Resource(name="DimCalendarService")
	private DimCalendarService dimCalendarService;
	
	@RequestMapping(value="/dimCalendarList.do")
	public String selectDimCalendarList(Model model) throws Exception {
//		logger.debug("calendarList......calendarList......calendarList......");
		List<DimCalendarVO> list = dimCalendarService.selectDimCalendarList();
		
		model.addAttribute("dimCalendarList", list);
		
		return "standard_manage/calendar";
	}
}