package co.micol.prj.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;

@RestController //@Controller + @ResponseBody가 결합된 거. 호출한 페이지로 결과 돌려줌
public class NoticeAjaxController {
	@Autowired
	private NoticeService ns;

	
	@RequestMapping("/ajaxSearch.do") 
	public List<NoticeVO> ajaxSearch(@RequestParam String key, @RequestParam String val) {
		
		return ns.noticeSearch(key, val);
	}
		
	
}
