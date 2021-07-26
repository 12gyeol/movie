package com.web.maven.content;

import lombok.Data;

@Data
public class SearchVO {
	private int boardid;
	private	int p;
	private	String f; //검색 조건
	private	String q; //검색
	private String rank;

}
