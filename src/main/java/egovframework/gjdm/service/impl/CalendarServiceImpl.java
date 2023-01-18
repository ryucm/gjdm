package egovframework.gjdm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.CalendarMapper;
import egovframework.gjdm.service.CalendarService;
import egovframework.gjdm.vo.CalendarVO;

@Service("CalendarService")
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	CalendarMapper calendarMapper;
	
	@Override
	public List<CalendarVO> selectCalendarList() throws Exception {
		// TODO Auto-generated method stub
		return calendarMapper.selectCalendarList();
	}
}
