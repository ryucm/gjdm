package egovframework.gjdm.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.EtlBatchMapper;
import egovframework.gjdm.service.EtlBatchService;
import egovframework.gjdm.vo.EtlBatchVO;

@Service("EtlBatchService")
public class EtlBatchServiceImpl extends EgovAbstractServiceImpl
									implements EtlBatchService{
	
	@Autowired
	EtlBatchMapper etlBatchMapper;
	
	@Override
	public List<EtlBatchVO> selectEtlBatchList(Map<String, String> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return etlBatchMapper.selectEtlBatchList(paramMap);
	}
	
	@Override
	public void insertEtlBatch(Map<String, String> paramMap) throws Exception {
		// TODO Auto-generated method stub
		etlBatchMapper.insertEtlBatch(paramMap);
	}
	
	@Override
	public void deleteEtlBatch(int etlId) throws Exception {
		etlBatchMapper.deleteEtlBatch(etlId);
	}

	@Override
	public void updateEtlBatch(Map<String, String> paramMap) throws Exception {
		etlBatchMapper.updateEtlBatch(paramMap);
	}
}