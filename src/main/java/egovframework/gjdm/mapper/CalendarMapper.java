package egovframework.gjdm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.CalendarVO;

@Mapper("CalendarMapper")
public interface CalendarMapper {
	public List<CalendarVO> selectCalendarList() throws Exception;
}