package com.web.maven.comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.module.ModuleSvc;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentCtr {

	@Autowired
	private CommentSvc CommentSvc;

	@Autowired
	private ModuleSvc ModuleSvc;

	
	//댓글 출력
	@RequestMapping(value = "comment")
	public String comment(HttpServletRequest req, CommentVO cv, ModelMap modelMap) {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		List<GetCommentVO> list = CommentSvc.getComment(id);
		
		modelMap.addAttribute("list",list);
		
		return "content/comment";
	}
	
	
	//댓글추가
	@RequestMapping(value = "/setComment")
	public String setComment(HttpServletResponse resp, CommentVO cv) {
		int result = CommentSvc.setComment(cv);
		
		
		return "content/comment";
	}
	
	//댓글 삭제
	@RequestMapping(value = "/deleteComment")
	public String deleteCommnet(HttpServletRequest req, CommentVO cv, ModelMap modelMap) {
		CommentSvc.deleteComment(cv);

		return "content/comment";
	}
	
	//댓글 수정
	@RequestMapping(value = "/modifyComment")
	public String modifyComment(HttpServletRequest req, CommentVO cv, ModelMap modelMap) {
		
		String detailID = req.getParameter("detailID");
		CommentSvc.modifyComment(cv);
		
		return "redirect: detail?id="+detailID;
	}
	
	
}
