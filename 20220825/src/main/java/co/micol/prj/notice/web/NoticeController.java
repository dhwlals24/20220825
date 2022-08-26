package co.micol.prj.notice.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	@Autowired
	private ServletContext servletContext; //context path (=webapp폴더) 사용하기 위해 찾는 객체
	
	@RequestMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, Model model) {
		model.addAttribute("notice", ns.noticeSelect(vo));
		ns.noticeHitUpdate(vo);
		return "notice/noticeSelect";
	}
	
	@GetMapping("/noticeSelectList.do")
	public String noticeSelectList(Model model) {
		model.addAttribute("notices",ns.noticeSelectList());
		return "notice/noticeSelectList";
	}
	
	@PostMapping("/noticeInsert.do")        //jsp form에서 file로 지정함
	public String noticeInsert(NoticeVO vo, 
			@RequestParam("file") MultipartFile file)  throws IllegalStateException, IOException {
		//file Upload 처리해야함
		String saveFolder = servletContext.getRealPath("/fileUpload"); //저장할 공간 폴더명
		File sfile = new File(saveFolder); //물리적으로 저장할 위치
		String oFileName = file.getOriginalFilename(); //넘어온 파일의 이름
		
		if(!oFileName.isEmpty()){
			//파일명 충돌방지를 위한 파일 별명만듦			
			String sFileName = UUID.randomUUID().toString()+ oFileName.substring(oFileName.lastIndexOf("."));
			file.transferTo(new File(sfile, sFileName));
			vo.setNoticeAttech(oFileName);
			vo.setNoticeAttechDir(saveFolder + File.separator + sFileName); //fileUpload/273747.txt
		}
		
		ns.noticeInsert(vo); //이거까지 실행시켜야 인서트됨
		return "redirect:noticeSelectList.do";
	}
	
	@RequestMapping("/noticeUpdate.do")
	public String noticeUpdate(NoticeVO vo) {
		vo.setNoticeWriter("관리자");
		vo.setNoticeId(26);
		ns.noticeUpdate(vo); //실행
		return "redirect:noticeSelectList.do";
	}
	
//	@RequestMapping("/noticeSearch.do")
//	public String noticeSearch(NoticeVO vo, String key, String val, Model model) {
//		key = "3"; 
//		val = "관리자";
//		model.addAttribute("notices", ns.noticeSearch(key, val));
//		ns.noticeSearch(key, val);
//		
//		return "notice/noticeSearch";
//	}
	
	//글쓰기 폼호출
	@GetMapping("/noticeForm.do")
	public String noticeInsertForm() {
		
		return "notice/noticeForm";
	}
	
	
	@RequestMapping("/ajaxNoticeSelect.do")
	@ResponseBody //호출한 페이지로 결과를 전송
	public String ajaxNoticeSelect(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		String message = "ajax testing";
		return message;
	}
	
	@GetMapping("/ajaxTest.do")
	public String ajaxTest() {
		return "notice/ajaxTest";
	}
	
	
	
}
