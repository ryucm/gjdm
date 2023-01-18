package egovframework.gjdm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimCodeVO;


@Mapper("DimCodeMapper")
public interface DimCodeMapper {

	public List<DimCodeVO> selectDimCodeList() throws Exception;
}
