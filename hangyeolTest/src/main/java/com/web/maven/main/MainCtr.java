package com.web.maven.main;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.maven.movie.MovieSvc;
import com.web.maven.movie.MovieVO;




@Controller
public class MainCtr {
	
		@Autowired
	private	MovieSvc MovieSvc;
	// 메인화면 // 크롤링 값 가져오기
	@RequestMapping(value = "main")
	public String main(HttpServletRequest request, ModelMap modelMap) {
		
		List<MovieVO> list = MovieSvc.getrankList();
		modelMap.addAttribute("list", list);
		
		return "main/main";
	}
	// main
	@RequestMapping(value = "rmd")
	public String moviedetail(HttpServletRequest req, ModelMap modelMap) {
		
		int midx=Integer.parseInt(req.getParameter("midx"));
		MovieVO list=MovieSvc.getDetailListRank(midx);
		modelMap.addAttribute("list", list);
		return "moviecontent/rankmoviedetail";
	}
	
}
