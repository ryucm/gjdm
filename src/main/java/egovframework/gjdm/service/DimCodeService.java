 package egovframework.gjdm.service;

import java.util.List;
import java.util.Map;

import egovframework.gjdm.vo.DimCodeVO;

public interface DimCodeService {

	public List<DimCodeVO> selectDimCodeList(Map<String, String> paramMap) throws Exception;
	public int selectDimCodeListCount(Map<String,String> paramMap) throws Exception;
	public void insertDimCode(Map<String, String> paramMap) throws Exception;
	public void deleteDimCode(int codeId) throws Exception;
	public void updateDimCode(Map<String, String> paramMap) throws Exception;
}
