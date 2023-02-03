package egovframework.gjdm.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimCalendarMapper;
import egovframework.gjdm.service.DimCalendarService;
import egovframework.gjdm.vo.DimCalendarVO;

@Service("DimCalendarService")
public class DimCalendarServiceImpl extends EgovAbstractServiceImpl
									implements DimCalendarService{
	
	@Autowired
	DimCalendarMapper dimCalendarMapper;
	
	@Override
	public List<DimCalendarVO> selectDimCalendarList(Map<String, String> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dimCalendarMapper.selectDimCalendarList(paramMap);
	}
	
	@Override
	public int selectDimCalendarListCount(Map<String, String> paramMap) throws Exception {
			
		return dimCalendarMapper.selectDimCalendarListCount(paramMap);
		}
	}
