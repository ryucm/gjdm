package egovframework.gjdm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.gjdm.mapper.DimCalendarMapper;
import egovframework.gjdm.service.DimCalendarService;
import egovframework.gjdm.vo.DimCalendarVO;

@Service("DimCalendarService")
public class DimCalendarServiceImpl implements DimCalendarService{
	
	@Autowired
	DimCalendarMapper dimCalendarMapper;
	
	@Override
	public List<DimCalendarVO> selectDimCalendarList() throws Exception {
		// TODO Auto-generated method stub
		return dimCalendarMapper.selectDimCalendarList();
	}
}