package egovframework.gjdm.service;

import java.util.List;

import egovframework.gjdm.vo.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> selectCalendarList() throws Exception;
}