package com.web.maven.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.module.ModuleSvc;

import jdk.internal.org.jline.utils.Log;

@Controller
public class ContentCtr {

	@Autowired
	private ContentSvc ContentSvc;

	@Autowired
	private ModuleSvc ModuleSvc;

	// 게시판 목록 조회
	@RequestMapping(value = "/list")
	public String getList(HttpServletRequest req, ContentVO cv, SearchVO sv, ModelMap modelMap) {
		String userRank;
		int select = 0;
		if (req.getSession().getAttribute("userRank") == null) {
			userRank = "";
		} else {
			userRank = req.getSession().getAttribute("userRank").toString();
		}

		List<ContentVO> list = ContentSvc.getList(sv);
		for(ContentVO a : list) {
			System.out.println("1111111111111111111 : "+ a.getTitlename());
		}
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("sv", sv);
		modelMap.addAttribute("userRank", userRank);
		modelMap.addAttribute("select", select);
		modelMap.addAttribute("boardid", cv.getBoardid());
		modelMap.addAttribute("boardname", cv.getBoardname());
		return "content/ContentList";
	}
	  // 게시글 자세히 보기
	  
	  @RequestMapping(value = "/detail") public String
	  getDetail(HttpServletRequest req, ContentVO vo, ModelMap modelMap) {
	  ContentSvc.getupcocnt(vo.getId());  
	  ContentVO list = ContentSvc.getDetail(vo.getId());
	  modelMap.addAttribute("nt", list); // req.setattribute
	  modelMap.addAttribute("select", vo.getBoardid() + 1); 
	  return "content/Detail"; 
	  
	 }
	 

	// 게시판 글쓰기 form
	@RequestMapping(value = "regedit")
	public String regeditPage(HttpServletRequest req, ContentVO vo, ModelMap modelMap) {
		String userID = req.getSession().getAttribute("userID").toString();
		String userRank = req.getSession().getAttribute("userRank").toString();
		String userName = req.getSession().getAttribute("userName").toString();
		List<ContentVO> BoardList = ContentSvc.getMyBoardList(userRank);
	//	Log.info("333333333333333333333"+vo.getBoardid());
		List<ContentVO> sublist = ContentSvc.getMyBoardsubList(vo.getBoardid());
		System.out.println("2222222222222222222:"+sublist.get(0).getTitlename());
		modelMap.addAttribute("BoardList", BoardList);
		modelMap.addAttribute("sublist", sublist);
		modelMap.addAttribute("userID", userID);
		modelMap.addAttribute("userRank", userRank);
		modelMap.addAttribute("select", vo.getBoardid() + 1);
		return "content/regedit";
	}

	// 글쓰기 저장
	@RequestMapping(value = "regeditSave")
	public String regeditSave(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {

		cv.setTitle(ModuleSvc.filter(cv.getTitle()));
		cv.setContent(ModuleSvc.filter(cv.getContent()));

		ContentSvc.regeditSave(cv);

		return "redirect: list?boardid=" + cv.getBoardid();
	}

	// 글 수정 form
	@RequestMapping(value = "modify")
	public String getmodify(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {
		int id = Integer.parseInt(req.getParameter("id"));
		String userRank = req.getSession().getAttribute("userRank").toString();
		List<ContentVO> BoardList = ContentSvc.getMyBoardList(userRank);

		ContentVO list = ContentSvc.getDetail(id);

		modelMap.addAttribute("select", cv.getBoardid() + 1);
		modelMap.addAttribute("BoardList", BoardList);
		modelMap.addAttribute("nt", list); // req.setattribute
		modelMap.addAttribute("titleid", cv.getTitleid()); // req.setattribute
		return "content/modify";
	}

	// 글 수정 저장
	@RequestMapping(value = "edit")
	public String edit(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {

		cv.setTitle(ModuleSvc.filter(cv.getTitle()));
		cv.setContent(ModuleSvc.filter(cv.getContent()));
		ContentSvc.editContent(cv);

		return "redirect: /list?boardid=" + cv.getBoardid();
	}

	// 글 삭제하기
	@RequestMapping(value = "removelist")
	public String removelist(HttpServletRequest req, ContentVO cv, ModelMap modelMap) {

		ContentSvc.removelist(cv);

		return "redirect: list";
	}

	
}
