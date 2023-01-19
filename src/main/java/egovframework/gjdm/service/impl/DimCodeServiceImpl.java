package egovframework.gjdm.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimCodeMapper;
import egovframework.gjdm.service.DimCodeService;
import egovframework.gjdm.vo.DimCodeVO;

@Service("DimCodeService")
public class DimCodeServiceImpl extends EgovAbstractServiceImpl
								implements DimCodeService{

	@Autowired
	DimCodeMapper dimCodeMapper;
	
	@Override
	public List<DimCodeVO> selectDimCodeList() throws Exception {
		return dimCodeMapper.selectDimCodeList();
	}

	@Override
	public int deleteDimCode(int codeId) throws Exception {
		return dimCodeMapper.deleteDimCode(codeId);
	}
}
