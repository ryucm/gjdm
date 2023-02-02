package egovframework.gjdm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimNationMapper;
import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimNationVO;

@Service("DimNationService")
public class DimNationServiceImpl implements DimNationService{
	
	@Autowired
	DimNationMapper dimNationMapper;
	
	//DimDistrict 전용
	@Override
	public List<DimNationVO> selectDimNationListForDistrict() throws Exception {
		
		return dimNationMapper.selectDimNationListForDistrict();
	}
	
	@Override
	public List<DimNationVO> selectDimNationList(Map<String,String> paramMap) throws Exception {
		
		return dimNationMapper.selectDimNationList(paramMap);
	}
	
	@Override
	public int selectDimNationListCount(Map<String, String> paramMap) throws Exception {
		
		return dimNationMapper.selectDimNationListCount(paramMap);
	}
	
	@Override
	public void insertDimNation(DimNationVO vo) {
		
		dimNationMapper.insertDimNation(vo);
		
	}
	
	@Override
	public void updateDimNation(DimNationVO vo) {
		
		dimNationMapper.updateDimNation(vo);
	}

	@Override
	public void deleteDimNation(String nationId) {
		
		dimNationMapper.deleteDimNation(Integer.parseInt(nationId));
		
	}

}
