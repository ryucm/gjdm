package egovframework.gjdm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimCodeVO;


@Mapper("DimCodeMapper")
public interface DimCodeMapper {

	public List<DimCodeVO> selectDimCodeList() throws Exception;

	public void deleteDimCode(int codeId) throws Exception;
	
	public void updateDimCode(Map<String, String> paramMap) throws Exception;
}
