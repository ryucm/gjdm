package egovframework.gjdm.service;

import java.util.List;
import java.util.Map;

import egovframework.gjdm.vo.DimNationVO;

public interface DimNationService {
	//DimDistrict 전용
	public List<DimNationVO> selectDimNationListForDistrict() throws Exception;
	
	public List<DimNationVO> selectDimNationList(Map<String,String> paramMap) throws Exception;
	
	public int selectDimNationListCount(Map<String,String> paramMap) throws Exception;
	
	public void insertDimNation(DimNationVO vo);
	
	public void updateDimNation(DimNationVO vo);
	
	public void deleteDimNation(String nationId);
	
}
