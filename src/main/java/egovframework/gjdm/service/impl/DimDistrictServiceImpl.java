package egovframework.gjdm.service.impl;

import java.util.List;

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
	public List<DimDistrictVO> selectDimDistrictList() throws Exception {
		// TODO Auto-generated method stub
		return dimDistrictMapper.selectDimDistrictList();
	}

}
