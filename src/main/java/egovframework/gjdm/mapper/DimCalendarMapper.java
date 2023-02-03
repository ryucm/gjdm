package egovframework.gjdm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimCalendarVO;

@Mapper("DimCalendarMapper")
public interface DimCalendarMapper {
	public List<DimCalendarVO> selectDimCalendarList(Map<String, String> paramMap) throws Exception;
	
	public int selectDimCalendarListCount(Map<String,String> paramMap) throws Exception;
}