package egovframework.gjdm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.gjdm.service.EtlBatchService;
import egovframework.gjdm.vo.EtlBatchVO;

@Controller
public class EtlBatchController {
	
	@Resource(name="EtlBatchService")
	private EtlBatchService etlBatchService;
	
	@RequestMapping(value="/etlBatchList.do")
	public String selectEtlBatchList(Model model, @RequestParam Map<String, String> paramMap) throws Exception {
		List<EtlBatchVO> list = etlBatchService.selectEtlBatchList(paramMap);

		model.addAttribute("etlBatchList", list);
		
		if(paramMap.get("jobType") != null && !paramMap.get("jobType").equals("")) {
			model.addAttribute("jobType", paramMap.get("jobType"));
		}
		
		if(paramMap.get("etlName") != null && !paramMap.get("etlName").equals("")) {
			model.addAttribute("etlName", paramMap.get("etlName"));
		}
		
		return "standard_manage/etlbatch";
	}
	
	@RequestMapping("/insertEtlBatch.do")
	public String insertEtlBatch(@RequestParam Map<String, String> paramMap) throws Exception {
		etlBatchService.insertEtlBatch(paramMap);
		
		return "redirect:etlBatchList.do";
	}
	
	@RequestMapping("/deleteEtlBatch.do")
	public String deleteEtlBatch(int etlId) throws Exception{
		etlBatchService.deleteEtlBatch(etlId);
		return "redirect:etlBatchList.do";
	}
	
	@RequestMapping("/updateEtlBatch.do")
	public String updateEtlBatch(@RequestParam Map<String, String> paramMap) throws Exception {
		etlBatchService.updateEtlBatch(paramMap);
		return "redirect:etlBatchList.do";
	}
}