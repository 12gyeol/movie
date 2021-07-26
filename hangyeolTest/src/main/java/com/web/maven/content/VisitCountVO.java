package com.web.maven.content;

import java.util.Date;

import lombok.Data;

@Data
public class VisitCountVO {
	
	private int seq;
	private Date date;
	private String ip;
	private String agent;
	private String refer;
	
	

}
