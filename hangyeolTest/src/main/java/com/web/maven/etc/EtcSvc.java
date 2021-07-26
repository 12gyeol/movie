package com.web.maven.etc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EtcSvc {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MenuVO> getMenuList() {
		return sqlSession.selectList("getHeaderMenu");
	}
}
