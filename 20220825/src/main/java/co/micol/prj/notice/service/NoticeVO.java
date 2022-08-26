package co.micol.prj.notice.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeId;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeSubject;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date noticeDate;
	private int noticeHit;
	private String noticeAttech;
	private String noticeAttechDir;
	
}
