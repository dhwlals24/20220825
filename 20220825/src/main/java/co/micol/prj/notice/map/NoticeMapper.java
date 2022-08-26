package co.micol.prj.notice.map;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import co.micol.prj.notice.service.NoticeVO;

public interface NoticeMapper {

	//조인 또는 VO객체를 안 만들고 사용하려 할 때
	@Select("select * from notice order by notice_id desc") //이러면 mapper설정 안해도 됨
	List<Map<String, Object>> noticeSelectList();
	
	NoticeVO noticeSelect(NoticeVO vo);
	
	int noticeInsert(NoticeVO vo);
	
	int noticeUpdate(NoticeVO vo);
	
	int noticeDelete(NoticeVO vo);
	
	//조회수 증가
	int noticeHitUpdate(NoticeVO vo);
	
	//리스트에서 검색					//변수의 타입을 ""안에 쓴다 date 등
	List<NoticeVO> noticeSearch(@Param("key") String key, @Param("val") String val);
					//mapper에서는 매개변수가 2개인 것은 어노테이션 @param("")붙여야함 그래야 mapper.xml에서 인식함
	
}
