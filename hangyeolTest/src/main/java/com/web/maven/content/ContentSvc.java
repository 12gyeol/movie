package com.web.maven.content;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.maven.content.VisitCountVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContentSvc {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시판 별 검색
	public List<ContentVO> getList(SearchVO sv) {
		if (sv.getF() == null || sv.getF() == "") {
			sv.setF("title");
		}
		if (sv.getP() == 0) {
			sv.setP(0);
		} else {
			sv.setP((sv.getP() - 1) * 10);
		}
		if (sv.getQ() == null) {
			sv.setQ("");
		}
		if (sv.getBoardid() == 0) {
			sv.setBoardid(1);
		}

		log.info("field : " + sv.getF());
		log.info("qurry : " + sv.getQ());
		log.info("page : " + sv.getP());
		log.info("userRank : " + sv.getRank());
		return sqlSession.selectList("selectGetList", sv);
	}

	// 헤더에서 전체 게시판 목록 조회
	public List<ContentVO> getAllList(SearchVO sv) {
		log.info("field : " + sv.getF());
		log.info("qurry : " + sv.getQ());
		log.info("boardid : " + sv.getBoardid());
		log.info("page : " + sv.getP());
		log.info("userRank : " + sv.getRank());
		return sqlSession.selectList("selectAllList", sv);
		// 값 이 여러게 >> ArrayList 배열 <<
	}

	// 게시판 자세히 보기 조회
	public ContentVO getDetail(int id) {
		return sqlSession.selectOne("selecDetail", id);
		// 한개 한값 one
	}
	//조회수up
	public void getupcocnt(int id) {
		sqlSession.update("upcount", id);
	}

	// 사용자 권한별 게시판 종류 조회
	public List<ContentVO> getMyBoardList(String userRank) {
		return sqlSession.selectList("selectBoardList", userRank);
	}
	// 사용자 권한별 게시판 종류 조회
		public List<ContentVO> getMyBoardsubList(int boardid) {
			return sqlSession.selectList("selectBoardsubList", boardid);
		}
	
	// 글 입력
	public void regeditSave(ContentVO cv) {
		if (cv.getSecret() == null || cv.getSecret() == "") {
			cv.setSecret("N");
		}
		sqlSession.insert("regeditSave", cv);
	}

	// 글 수정
	public void editContent(ContentVO cv) {
		if (cv.getSecret() == null || cv.getSecret() == "") {
			cv.setSecret("N");
		}
		sqlSession.insert("editContent", cv);
	}

	// 글 삭제
	public void removelist(ContentVO cv) {
		sqlSession.update("removelist", cv.getId());
	}

	
	//통계 처리	
	public List<?> statistic(){
		
		List<?> list = new ArrayList();
		
		list = sqlSession.selectList("getStatistic");
		
		// int user_count = Integer.parseInt();			
		
		return list;
	}
	// 방문자 수 처리	
	public void insertVisitor(VisitCountVO vo) throws Exception{
        sqlSession.insert("VisitCounterDAO_insertVisitor",vo);
    }
	
}
