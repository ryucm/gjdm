package egovframework.gjdm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.service.DimNationVO;

@Mapper("DimNationMapper")
public interface DimNationMapper {
	public List<DimNationVO> selectDimNationList() throws Exception;
}
