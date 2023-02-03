package egovframework.gjdm.pagination;

import java.util.HashMap;
import java.util.Map;

public class Pagination {
	
	private Map<String,Integer> pageMap;
	
	public Pagination(int totalContentCount, Map<String,String> paramMap) {
		//총 페이지 버튼 개수
		int totalButtonCount = (int)(totalContentCount/Integer.parseInt(paramMap.get("contentLimit"))) + 1;
		
		//구간당 버튼 개수 -> 5개
		int buttonPerSection = 5;
		
		//시작 버튼 번호
		int divStartButtonNo = Integer.parseInt(paramMap.get("currentPage"))%buttonPerSection==0?Integer.parseInt(paramMap.get("currentPage"))/buttonPerSection-1
				:Integer.parseInt(paramMap.get("currentPage"))/buttonPerSection;
		
		int startButtonNo = divStartButtonNo*buttonPerSection + 1;
		
		//끝 버튼 번호
		int endButtonNo = startButtonNo+4>totalButtonCount?totalButtonCount:startButtonNo+4;
		
		//model.addAllAttribute할 Map
		this.pageMap = new HashMap<String, Integer>();
		pageMap.put("totalContentCount", totalContentCount);
		pageMap.put("totalButtonCount", totalButtonCount);
		pageMap.put("buttonPerSection", buttonPerSection);
		pageMap.put("startButtonNo", startButtonNo);
		pageMap.put("endButtonNo", endButtonNo);
	}

	public Map<String, Integer> getPageMap() {
		return pageMap;
	}
}
