package egovframework.gjdm.service;

import java.util.List;
import java.util.Map;

import egovframework.gjdm.vo.DimDistrictVO;

public interface DimDistrictService {
	public List<DimDistrictVO> selectDimDistrictList(Map<String, String> paramMap) throws Exception;
}
