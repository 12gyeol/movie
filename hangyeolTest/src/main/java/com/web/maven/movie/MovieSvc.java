package com.web.maven.movie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieSvc {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	///////////개봉한 영화
	//크롤링 값 보내주기
	public void setMovie(MovieVO mv) {
		sqlSession.insert("setMovie",mv);
	}
	//받아오기
	public List<MovieVO> getrankList() {
		return sqlSession.selectList("selectcrawling");
	}
	//차트 영화 디테일
	public MovieVO getDetailListRank(int midx){
		return sqlSession.selectOne("getDetailListRank", midx);
	}
	
    /////////개봉예정영화	
	//크롤링 값 디비에 보내주기
	public void setNextMovie(MovieVO nm) {
		sqlSession.insert("setNextMovie",nm);
	}
	//개봉 예정 영화 받아오기 
	public List<MovieVO> getNextList() {
		return sqlSession.selectList("getNextList");
	}
	//개봉 예정 영화 디테일
	public MovieVO getDetailList(int midx){
		return sqlSession.selectOne("getDetailList", midx);
	}
}
