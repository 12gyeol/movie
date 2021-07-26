package com.web.module;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.maven.content.WordsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ModuleSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 필터링
	public String filter(String word) {

		List<WordsVO> words = sqlSession.selectList("selectWords");
		String replace_word = "";
		String room;

		for (int i = 0; i < words.size(); i++) {

			if (word.contains(words.get(i).getWords())) {

				room = word.replace(words.get(i).getWords(), "*");
				replace_word = room;

				System.out.println("change word : " + replace_word);

			}else {
				replace_word=word;
			}

			word = replace_word;

		}

		return replace_word;

	}

}
