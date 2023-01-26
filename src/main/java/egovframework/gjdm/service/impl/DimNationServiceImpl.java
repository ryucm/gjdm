package egovframework.gjdm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimNationMapper;
import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimNationVO;

@Service("DimNationService")
public class DimNationServiceImpl implements DimNationService{
	
	@Autowired
	DimNationMapper dimNationMapper;
	
	@Override
	public List<DimNationVO> selectDimNationList() throws Exception {

		return dimNationMapper.selectDimNationList();
	}

	@Override
	public List<DimNationVO> selectDimNationListByContinent(String continent) throws Exception {
		
		return dimNationMapper.selectDimNationListByContinent(continent);
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
