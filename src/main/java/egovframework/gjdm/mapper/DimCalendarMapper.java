package egovframework.gjdm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimCalendarVO;

@Mapper("DimCalendarMapper")
public interface DimCalendarMapper {
	public List<DimCalendarVO> selectDimCalendarList() throws Exception;
}