package egovframework.gjdm.service;

import java.util.List;
import java.util.Map;

import egovframework.gjdm.vo.EtlBatchVO;

public interface EtlBatchService {
	public List<EtlBatchVO> selectEtlBatchList(Map<String, String> paramMap) throws Exception;
	
	public void insertEtlBatch(Map<String, String> paramMap) throws Exception;
	
	public void deleteEtlBatch(int etlId) throws Exception;
	
	public void updateEtlBatch(Map<String, String> paramMap) throws Exception;
}