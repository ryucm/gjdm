package egovframework.gjdm.service;

import java.util.List;

import egovframework.gjdm.vo.DimCalendarVO;

public interface DimCalendarService {
	public List<DimCalendarVO> selectDimCalendarList() throws Exception;
}
