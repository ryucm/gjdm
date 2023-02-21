package egovframework.gjdm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
	
	@GetMapping("/dashboardTour.do")
	public String tourPage() {
		return "dashboard/tour";
	}
	
	@GetMapping("/dashboardVisitor.do")
	public String visitorPage() {
		return "dashboard/visitor";
	}
	
	@GetMapping("/dashboardInfo.do")
	public String infoPage() {
		return "dashboard/info";
	}
	
	@GetMapping("/dashboardDistour.do")
	public String distourPage() {
		return "dashboard/distour";
	}
}
