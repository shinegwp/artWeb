package com.art.service;

import com.art.pojo.Letter;
import com.art.util.EUDataGridResult;

public interface LetterService {

	

	EUDataGridResult getLetterListByPage(String utoP, int parseInt, int parseInt2, String email,String uorp);

	int insert(Letter ul);

	EUDataGridResult getLetterById(int parseInt);

}
