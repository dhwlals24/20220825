package co.micol.prj.notice.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	//조인 또는 VO객체를 안 만들고 사용하려 할 때
	List<Map<String, Object>> noticeSelectList();
	//key는 String이고 뒤에 들어오는 건 object 객체라는 뜻
	
	NoticeVO noticeSelect(NoticeVO vo);
	
	int noticeInsert(NoticeVO vo);
	
	int noticeUpdate(NoticeVO vo);
	
	int noticeDelete(NoticeVO vo);
	
	//조회수 증가
	int noticeHitUpdate(NoticeVO vo);
	
	//리스트에서 검색
	List<NoticeVO> noticeSearch(String key, String val);
	
	
}
