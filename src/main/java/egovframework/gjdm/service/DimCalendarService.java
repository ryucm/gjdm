package egovframework.gjdm.service;

import java.util.List;
import java.util.Map;

import egovframework.gjdm.vo.DimCalendarVO;

public interface DimCalendarService {
	public List<DimCalendarVO> selectDimCalendarList(Map<String, String> paramMap) throws Exception;
}