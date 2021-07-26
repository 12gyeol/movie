package com.web.maven.user;

import java.util.Date;

import com.web.maven.user.UserVO;

import lombok.Data;
//밑에 값 순서,바꾸고 플래그 세개 추가
@Data
public class UserVO {
	private String id;
	private String name;
	private String rank; //등급
	private String pass;
	
	private String email;
	private Date regdate; //가입일자
	
	private int number; //조회로 리턴될 결과 값
	
	private String birthday;
	private int gender;
	
	private String loginFlag;
	private String commentFlag;
	private String writeFlag;
}

