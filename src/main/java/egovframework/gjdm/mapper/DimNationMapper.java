package egovframework.gjdm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.gjdm.vo.DimNationVO;

@Mapper("DimNationMapper")
public interface DimNationMapper {
	public List<DimNationVO> selectDimNationListForDistrict() throws Exception;
	
	public List<DimNationVO> selectDimNationList(Map<String,String> paramMap) throws Exception;
	
	public int selectDimNationListCount(Map<String,String> paramMap) throws Exception;
	
	public void insertDimNation(DimNationVO vo);
	
	public void updateDimNation(DimNationVO vo);
	
	public void deleteDimNation(int nationId);
}
