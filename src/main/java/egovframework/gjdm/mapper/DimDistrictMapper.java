package egovframework.gjdm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimDistrictVO;

@Mapper("DimDistrictMapper")
public interface DimDistrictMapper {
	public List<DimDistrictVO> selectAll(Map<String, String> paramMap) throws Exception;
	
	public List<DimDistrictVO> selectDimDistrictList(Map<String, String> paramMap) throws Exception;
	
	public int selectDimDistrictListCount(Map<String,String> paramMap) throws Exception;
	
	public int selectDimDistrictAllListCount() throws Exception;
	
	public List<DimDistrictVO> selectDimDistrictListGroupByLvl1() throws Exception;
	
	public List<DimDistrictVO> selectDimDistrictListGroupByLvl2() throws Exception;
	
	public void insertDimDistrict(Map<String, String> paramMap) throws Exception;
	
	public void updateDimDistrict(Map<String, String> paramMap) throws Exception;
	
	public void deleteDimDistrict(int districtId) throws Exception;
}
