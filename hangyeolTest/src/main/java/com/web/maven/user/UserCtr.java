package com.web.maven.user;

//이 파일 전체는 새것
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.maven.content.ContentVO;
import com.web.maven.content.ContentSvc;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserCtr {

	@Autowired
	private UserSvc UserSvc;
	private ContentSvc ContentSvc;

	// 유저관리테이블 긁어오기
	@RequestMapping(value = "/usertables")
	public String usermanage(HttpServletRequest req, ModelMap modelMap) {
		System.out.println("controller 들어옴");
		List<UserVO> list = UserSvc.userManage();
		modelMap.addAttribute("select", 8);
		modelMap.addAttribute("list", list);
		return "user/usertables";
	}

	// 유저 등급 변경 폼
	@RequestMapping(value = "user/usergrade")
	public String UserGradeModify(HttpServletRequest req, ModelMap modelMap) {
		String id = req.getParameter("id");

		List<UserVO> list = UserSvc.getDetailstr(id);
		System.out.println(list.get(0) + "테스트요오오오오오오옹");
		modelMap.addAttribute("nt2", list);
		System.out.println("222222");
		return "user/usergrade";

	}

	// 유저 등급 변경 저장
	@RequestMapping(value = "/UsergradeSave")
	public String UsergradeSave(HttpServletRequest req, UserVO uv, ModelMap modelMap) {

		String rank = req.getParameter("mrank");
		uv.setRank(rank);
		UserSvc.setUsergrade(uv);

		return "redirect:user/usertables";

	}

	// 댓글 플래그 변경 폼
	@RequestMapping(value = "user/flagmodify")
	public String UserFlagModify(HttpServletRequest req, ModelMap modelMap) {
		String id3 = req.getParameter("id");

		System.out.println("===================");
		List<UserVO> list2 = UserSvc.getCommentFlaginfo(id3);
		System.out.println("========" + list2.get(0));
		modelMap.addAttribute("nt3", list2);

		System.out.println("222222");
		return "user/flagmodify";

	}

	// comment flag 변경 저장
	@RequestMapping(value = "/CommentFlagSave")
	public String CommentFlagSave(HttpServletRequest req, UserVO uv, ModelMap modelMap) {
		System.out.println("\\\\\\\\\\\\\\\\\\\\\\\\\\");
		String commentFlag = req.getParameter("cf");
		uv.setCommentFlag(commentFlag);
		UserSvc.setcommentFlag(uv);

		return "redirect:user/usertables";

	}

	// 마이테이블 긁어오기
	@RequestMapping(value = "user/mytables")
	public String mytable(HttpServletRequest req, LoginVO lv, ModelMap modelMap) {

		String ui = req.getParameter("userID");
		System.out.println("id값으느ㅡㅡㅡㅡㅡㅡ" + ui);

		List<ContentVO> list = UserSvc.getWritten(ui);
		// System.out.println("========" + list.get(0)); 아무글도 쓰지 않았을 경우 마이페이지에서 에러가 날수
		// 있으므로 주석처리함
		modelMap.addAttribute("mp", list);
		return "user/Mypage";
	}

	// 회원정보 창
	@RequestMapping(value = "/Userinfo")
	public String Userinfo(HttpServletRequest req, ModelMap modelMap) {
		String uin = req.getParameter("writeid");
		System.out.println("******************" + uin);

		List<UserVO> list1 = UserSvc.getUserinfo(uin);

		System.out.println("**********" + list1.get(0));

		modelMap.addAttribute("l1", list1);

		/* System.out.println("========="+ list1.get(0)); */
		return "user/Userinfo";
	}

	/*
	 * //유저페이지 불러오기
	 * 
	 * @RequestMapping(value = "user/usertable") 
	 * public String Usertable(HttpServletRequest req, ModelMap modelMap) { String ut
	 * =req.getParameter("id"); System.out.println("******************"+ut);
	 * 
	 * List<UserVO>list1=UserSvc.getUserinfo(ut);
	 * 
	 * System.out.println("**********"+list1.get(0));
	 * 
	 * modelMap.addAttribute("l1", list1);
	 * 
	 * System.out.println("========="+ list1.get(0)); return "user/Userinfo"; }
	 */
	// 클릭한 유저페이지이동
	@RequestMapping(value = "writeuserpage")
	public String writeuserpage(HttpServletRequest req, ContentVO CV, ModelMap modelMap) {
		String ut = req.getParameter("writeid");
		System.out.println("*=*=*==*=*=*=**=*==*" + ut);
		
		List<UserVO> list = UserSvc.writeuserpage(ut);
		List<ContentVO> list2 = UserSvc.writeuserpage2(ut);
		
		
		System.out.println("*/*/*/*/*/*"+list.get(0).getName());
		System.out.println("*/*/*/*/*/*"+list.get(0).getRank());
		System.out.println("*=*=*=*=*=*=*=*=*=*=*=*=*" + list2.get(0));
		
		modelMap.addAttribute("li", list.get(0).getName());
		modelMap.addAttribute("li1", list.get(0).getRank());
		modelMap.addAttribute("li2", list2);

	
		System.out.println("=========" + list2.get(0));
		
		return "user/writeuserpage";
	}
}
