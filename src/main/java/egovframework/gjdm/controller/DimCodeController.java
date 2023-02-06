package egovframework.gjdm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.gjdm.pagination.Pagination;
import egovframework.gjdm.service.DimCodeService;
import egovframework.gjdm.vo.DimCodeVO;

@Controller
public class DimCodeController {

	@Resource(name = "DimCodeService")
	private DimCodeService dimCodeService;

	@RequestMapping("/dimCodeList.do")
	public String selectDimCodeList(Model model, @RequestParam Map<String, String> paramMap) throws Exception {

		// 처음 국가페이지 들어올때 페이징 관련 초기값 설정
		if (paramMap.get("currentPage") == null || paramMap.get("currentPage").equals("")) {
			paramMap.put("currentPage", "1");
			paramMap.put("contentLimit", "10");
		}

		List<DimCodeVO> list = dimCodeService.selectDimCodeList(paramMap);

		// 총 데이터 개수
		int totalContentCount = dimCodeService.selectDimCodeListCount(paramMap);

		Pagination pg = new Pagination(totalContentCount, paramMap);

		model.addAllAttributes(pg.getPageMap());
		model.addAllAttributes(paramMap);
		model.addAttribute("dimCodeList", list);
		if (paramMap.get("codeId") != null && !paramMap.get("codeId").equals("")) {
			model.addAttribute("codeId", paramMap.get("codeId"));
		}

		if (paramMap.get("groupCode") != null && !paramMap.get("groupCode").equals("")) {
			model.addAttribute("groupCode", paramMap.get("groupCode"));
		}

		if (paramMap.get("code") != null && !paramMap.get("code").equals("")) {
			model.addAttribute("code", paramMap.get("code"));
		}

		return "standard_manage/code";
	}

	@RequestMapping("/insertCode.do")
	@ResponseBody
	public String insertCode(@RequestParam Map<String, String> paramMap) throws Exception {
		dimCodeService.insertDimCode(paramMap);
		return "redirect:dimCodeList.do";
	}

	@RequestMapping("/deleteCode.do")
	public String deleteCode(int codeId) throws Exception {
		dimCodeService.deleteDimCode(codeId);
		return "redirect:dimCodeList.do";
	}

	@RequestMapping("/updateCode.do")
	public String updateCode(@RequestParam Map<String, String> paramMap) throws Exception {
		dimCodeService.updateDimCode(paramMap);
		return "redirect:dimCodeList.do";
	}
	
	@ResponseBody
	@RequestMapping("/checkInsert.do")
	public String checkInsert(@RequestParam Map<String, String> paramMap) throws Exception {
		int groupCode = dimCodeService.checkGroupCode(paramMap);
		int code = dimCodeService.checkCode(paramMap);

		if (groupCode != 0) {
			return "groupCode";
		}

		if (code != 0) {
			return "code";
		}
				
		return "success";
	}
}
