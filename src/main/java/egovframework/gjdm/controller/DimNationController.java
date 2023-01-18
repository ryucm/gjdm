package egovframework.gjdm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.gjdm.service.DimNationService;
import egovframework.gjdm.vo.DimNationVO;

@Controller
public class DimNationController {
	
	private static Logger logger = LoggerFactory.getLogger(DimNationController.class);
	
	@Resource(name="DimNationService")
	private DimNationService dimNationService;
	
	@RequestMapping(value="/dimNationList.do")
	public String selectDimNationList(Model model) throws Exception {
//		logger.debug("dimNationList......dimNationList......dimNationList......");
		List<DimNationVO> list = dimNationService.selectDimNationList();
		
		model.addAttribute("dimNationList", list);
		
		return "standard_manage/nation";
	}
}
