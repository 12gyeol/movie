package com.web.maven.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MovielistCtr {

	@Autowired
	private MovieSvc MovieSvc; // 서비스 객체 생성

	// 개방 예정 영화 받아오
	@RequestMapping(value = "movielist")
	public String movielist(HttpServletRequest req, ModelMap modelMap) {
		
		List<MovieVO> list = MovieSvc.getNextList();
		modelMap.addAttribute("list", list);
		return "moviecontent/movielist";
	}

	// 계봉예정영화 디테일
	@RequestMapping(value = "nmd")
	public String nextmoviedetail(HttpServletRequest req, ModelMap modelMap) {
		
		int midx=Integer.parseInt(req.getParameter("midx"));
		MovieVO list=MovieSvc.getDetailList(midx);
		modelMap.addAttribute("list", list);
		return "moviecontent/nextmoviedetail";
	}

}