package egovframework.gjdm.service;

import java.util.List;
import java.util.Map;

import egovframework.gjdm.vo.DimDistrictVO;

public interface DimDistrictService {
	public List<DimDistrictVO> selectAll() throws Exception;
	
	public List<DimDistrictVO> selectDimDistrictList(Map<String, String> paramMap) throws Exception;

	public List<DimDistrictVO> selectDimDistrictListGroupByLvl1() throws Exception;
	
	public List<DimDistrictVO> selectDimDistrictListGroupByLvl2() throws Exception;
	
	public void insertDimDistrict(Map<String, String> paramMap) throws Exception;
	
	public void updateDimDistrict(Map<String, String> paramMap) throws Exception;
	
	public void deleteDimDistrict(int districtId) throws Exception;
}
