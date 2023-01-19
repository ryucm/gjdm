package egovframework.gjdm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimCodeMapper;
import egovframework.gjdm.service.DimCodeService;
import egovframework.gjdm.vo.DimCodeVO;

@Service("DimCodeService")
public class DimCodeServiceImpl implements DimCodeService{

	@Autowired
	DimCodeMapper dimCodeMapper;
	
	@Override
	public List<DimCodeVO> selectDimCodeList() throws Exception {
		// TODO Auto-generated method stub
		return dimCodeMapper.selectDimCodeList();
	}
}
