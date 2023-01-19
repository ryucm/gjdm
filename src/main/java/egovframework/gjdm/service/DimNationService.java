package egovframework.gjdm.service;

import java.util.List;

import egovframework.gjdm.vo.DimNationVO;

public interface DimNationService {
	public List<DimNationVO> selectDimNationList() throws Exception;
	
	public List<DimNationVO> selectDimNationListByContinent(String continent) throws Exception;
	
}
