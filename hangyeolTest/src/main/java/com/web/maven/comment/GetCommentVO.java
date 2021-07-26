package com.web.maven.comment;

import java.util.Date;

import lombok.Data;

@Data
public class GetCommentVO {

	int id;
	int board_id;
	String writeid;
	String content;
	Date regdate;
	String username;
	
}
