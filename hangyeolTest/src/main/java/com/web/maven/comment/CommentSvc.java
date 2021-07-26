package com.web.maven.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentSvc {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 댓글 출력
	public List<GetCommentVO> getComment(int id) {
		return sqlSession.selectList("getComment", id);
	}

	// 댓글
	public int setComment(CommentVO cv) {
		return sqlSession.insert("setComment", cv);
	}

	// 댓글 삭제
	public void deleteComment(CommentVO cv) {
		sqlSession.update("deleteComment", cv.getId());
	}

	public void modifyComment(CommentVO cv) {
		sqlSession.update("modifyComment", cv);
		
	}
}
