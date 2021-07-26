package com.web.maven.etc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.maven.content.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HeaderCtr {
	@Autowired
	EtcSvc EtcSvc;
	
	@RequestMapping(value = "/etc/headerd")
	public String getMenuList(HttpServletRequest req, ModelMap modelMap) {
		List<MenuVO> list = EtcSvc.getMenuList();
		modelMap.addAttribute("menu", list);
			
		return "etc/header";
	}
}
