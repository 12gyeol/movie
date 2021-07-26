package com.web.maven.movie;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieCtr {

	@Autowired
	private MovieSvc MovieSvc; // 서비스 객체 생성

	// 크롤링 값 디비에 보내주기
	@RequestMapping(value = "movie")
	public String crawling(HttpServletRequest req,ModelMap modelMap) throws IOException  {
		String url1 = "http://www.cgv.co.kr/movies/"; // 크롤링할 url지정
		Document doc1 = null; // Document에는 페이지의 전체 소스가 저장된다
		Document doc2 = null; // Document에는 페이지의 전체 소스가 저장된다
		
		doc1 = Jsoup.connect(url1).get();
		
		Elements midx1 = doc1.select(".sect-movie-chart .box-contents > a ");
		Elements rank1 = doc1.select(" strong.rank ");
		Elements title1 = doc1.select(".sect-movie-chart strong.title  ");
		Elements dday1 = doc1.select(".sect-movie-chart .txt-info > strong ");
		Elements image1 = doc1.select(".sect-movie-chart .thumb-image > img  ");
		Elements percent1 = doc1.select("strong.percent > span");
		
		for (int i=0; i<title1.size(); i++) {
			
			int midx = Integer.parseInt(midx1.get(i).attr("href").substring(26));
			String rank = rank1.get(i).text();
			String title = title1.get(i).text();
			String dday = dday1.get(i).text();
			String image = image1.get(i).attr("src");
			String percent = percent1.get(i).text();
			
			String url2 = "http://www.cgv.co.kr/movies/detail-view/?midx=" + midx;
			
			doc2 = Jsoup.connect(url2).get();
			
			Elements spec1 = doc2.select(" .spec "); // 정보
			Elements content1 = doc2.select(" .sect-story-movie");
			
			String spec = spec1.get(0).text();
			String content = content1.get(0).text();
			
			MovieVO mv =new MovieVO(midx,rank,title,dday,image,percent,spec,content);
			
			MovieSvc.setMovie(mv);
		}
		return "redirect: main";
	}
	

	// 개봉예정영화 크롤링 디비에 보내주기
	@RequestMapping(value = "nextmovie")
	public String nextmoviecrawling(HttpServletRequest req, ModelMap modelMap) throws IOException  {
		String url1 = "http://www.cgv.co.kr/movies/pre-movies.aspx"; // 크롤링할 url지정
		Document doc1 = null; // Document에는 페이지의 전체 소스가 저장된다
		Document doc2 = null; // Document에는 페이지의 전체 소스가 저장된다
		
		doc1 = Jsoup.connect(url1).get();
		
		Elements midx1 = doc1.select(".sect-movie-chart .box-contents > a ");
		Elements title1 = doc1.select(".sect-movie-chart strong.title  ");
		Elements dday1 = doc1.select(".sect-movie-chart .txt-info > strong ");
		Elements image1 = doc1.select(".sect-movie-chart .thumb-image > img  ");
		
		for (int i = 3; i < title1.size(); i++) {
			
			int midx = Integer.parseInt(midx1.get(i).attr("href").substring(26));
			String title = title1.get(i).text();
			String dday = dday1.get(i).text();
			String image = image1.get(i).attr("src");
			
			String url2 = "http://www.cgv.co.kr/movies/detail-view/?midx=" + midx;
			
			doc2 = Jsoup.connect(url2).get();
			
			Elements spec1 = doc2.select(" .spec "); // 정보
			Elements content1 = doc2.select(" .sect-story-movie");

			String spec = spec1.get(0).text();
			String content = content1.get(0).text();
			

			MovieVO nm = new MovieVO(midx,title,dday,image,spec,content);

			MovieSvc.setNextMovie(nm);
		}
		// select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
		// 후 김한결 바보 ... 멍청후
		return "redirect: main";
	}

}
