package egovframework.gjdm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimNationVO;

@Mapper("DimNationMapper")
public interface DimNationMapper {
	public List<DimNationVO> selectDimNationList() throws Exception;
	
	public List<DimNationVO> selectDimNationListByContinent(String Continent);
}
