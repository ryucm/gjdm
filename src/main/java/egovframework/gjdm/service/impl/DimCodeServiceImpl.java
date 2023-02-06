package egovframework.gjdm.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<DimCodeVO> selectDimCodeList(Map<String, String> paramMap) throws Exception {
		return dimCodeMapper.selectDimCodeList(paramMap);
	}

	@Override
	public void deleteDimCode(int codeId) throws Exception {
		dimCodeMapper.deleteDimCode(codeId);
	}

	@Override
	public void updateDimCode(Map<String, String> paramMap) throws Exception {
		dimCodeMapper.updateDimCode(paramMap);
	}

	@Override
	public void insertDimCode(Map<String, String> paramMap) throws Exception {
		dimCodeMapper.insertDimCode(paramMap);
	}

	@Override
	public int selectDimCodeListCount(Map<String, String> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dimCodeMapper.selectDimCodeListCount(paramMap);
	}

	@Override
	public int checkGroupCode(Map<String, String> paramMap) throws Exception {
		return dimCodeMapper.checkGroupCode(paramMap);
	}

	@Override
	public int checkCode(Map<String, String> paramMap) throws Exception {
		return dimCodeMapper.checkCode(paramMap);
	}
}
