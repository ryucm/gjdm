package egovframework.gjdm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.EtlBatchVO;

@Mapper("EtlBatchMapper")
public interface EtlBatchMapper {
	public List<EtlBatchVO> selectEtlBatchList(Map<String, String> paramMap) throws Exception;
	
	public void insertEtlBatch(Map<String, String> paramMap) throws Exception;
	
	public void deleteEtlBatch(int etlId) throws Exception;
	
	public void updateEtlBatch(Map<String, String> paramMap) throws Exception;
}