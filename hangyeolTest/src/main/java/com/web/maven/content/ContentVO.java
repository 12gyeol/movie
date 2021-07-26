package com.web.maven.content;

import java.util.Date;
import lombok.Data;


@Data
public class ContentVO {
	private int boardid;   //보드 아이디
	private int id;		//아이디
	private String boardname;	//보드이름
	private String title;		//글제목
	private String writeid;		//글쓴이아이디
	private String content;		//글내용
	private Date regdate;		//글등록일
	private int hit;			//조회수
	private String board;		//글
	private int cocnt;			//댓글수
	private String files;		//파일
	private int lk;				//좋아요수
    private int count;			//조회수
    private String useFlag;		//일자
	private int recommend;   	//추천수
	private String secret;		//비밀글 여부
	private int titleid;		//말머리 종류 ID
	private String titlename;	//(잡담, 질문 등)
}
