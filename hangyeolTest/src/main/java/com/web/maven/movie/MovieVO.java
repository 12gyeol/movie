package com.web.maven.movie;

import lombok.Data;

@Data
public class MovieVO {
	
	int seq;
	int midx;
	int idx;
	String rank;
	String title;
	String dday;
	String image;
	String percent;
	String spec;
	String content;
	
	public MovieVO(int midx, String rank, String title, String dday, String image, String percent, String spec, String content) {
		this.midx = midx;
		this.rank = rank;
		this.title = title;
		this.dday = dday;
		this.image = image;
		this.percent = percent;
		this.spec = spec;
		this.content = content;
	}
	public MovieVO(int midx, String title, String dday, String image, String spec, String content) {
		this.midx = midx;
		this.title = title;
		this.dday = dday;
		this.image = image;
		this.spec = spec;
		this.content = content;
	}
	public MovieVO(int midx, String rank, String title, String image, String percent) {
		this.midx = midx;
		this.rank = rank;
		this.title = title;
		this.image = image;
		this.percent = percent;
	}
	public MovieVO(String rank, String title, String dday, String image) {
		this.rank = rank;
		this.title = title;
		this.dday = dday;
		this.image = image;
	}
	

}
