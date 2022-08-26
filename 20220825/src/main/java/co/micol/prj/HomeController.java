package co.micol.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	//메소드 오버로딩 (같은 이름으로 메소드 사용. 하나라도 위에꺼랑 다르면 됨)
	@GetMapping("/home.do")
	public String home(Model model) {
		return "home";
	}
	
}
