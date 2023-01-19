package egovframework.gjdm.service;

import java.util.List;

import egovframework.gjdm.vo.DimCodeVO;

public interface DimCodeService {

	public List<DimCodeVO> selectDimCodeList() throws Exception;
}
