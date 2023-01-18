package egovframework.gjdm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.gjdm.service.CalendarService;
import egovframework.gjdm.vo.CalendarVO;

@Controller
public class CalendarController {
	
	private static Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Resource(name="CalendarService")
	private CalendarService calendarService;
	
	@RequestMapping(value="/CalendarList.do")
	public String selectDimNationList(Model model) throws Exception {
//		logger.debug("calendarList......calendarList......calendarList......");
		List<CalendarVO> list = calendarService.selectCalendarList();
		
		model.addAttribute("CalendarList", list);
		
		return "standard_manage/calendar";
	}
}