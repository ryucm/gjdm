package egovframework.gjdm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimDistrictMapper;
import egovframework.gjdm.service.DimDistrictService;
import egovframework.gjdm.vo.DimDistrictVO;

@Service("DimDistrictService")
public class DimDistrictServiceImpl implements DimDistrictService {
	
	@Autowired
	DimDistrictMapper dimDistrictMapper;
	
	@Override
	public List<DimDistrictVO> selectAll(Map<String, String> paramMap) throws Exception {
		return dimDistrictMapper.selectAll(paramMap);
	}
	
	@Override
	public List<DimDistrictVO> selectDimDistrictList(Map<String, String> paramMap) throws Exception {
		return dimDistrictMapper.selectDimDistrictList(paramMap);
	}
	
	@Override
	public int selectDimDistrictListCount(Map<String, String> paramMap) throws Exception {
		return dimDistrictMapper.selectDimDistrictListCount(paramMap);
	}
	
	@Override
	public int selectDimDistrictAllListCount() throws Exception {
		return dimDistrictMapper.selectDimDistrictAllListCount();
	}
	
	@Override
	public List<DimDistrictVO> selectDimDistrictListGroupByLvl1() throws Exception {
		return dimDistrictMapper.selectDimDistrictListGroupByLvl1();
	}
	
	@Override
	public List<DimDistrictVO> selectDimDistrictListGroupByLvl2() throws Exception {
		return dimDistrictMapper.selectDimDistrictListGroupByLvl2();
	}

	@Override
	public void insertDimDistrict(Map<String, String> paramMap) throws Exception {
		dimDistrictMapper.insertDimDistrict(paramMap);
	}
	
	@Override
	public void updateDimDistrict(Map<String, String> paramMap) throws Exception {
		dimDistrictMapper.updateDimDistrict(paramMap);
	}

	@Override
	public void deleteDimDistrict(int districtId) throws Exception {
		dimDistrictMapper.deleteDimDistrict(districtId);
	}

}
