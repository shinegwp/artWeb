package com.art.service;

import java.util.List;

import com.art.pojo.TradeLog;
import com.art.util.EUDataGridResult;

public interface TradeLogService {

	List<TradeLog> getTradeLogListByUid(Integer uid);

	EUDataGridResult getTradeLoglistByUidAndPage(Integer uid, Integer page, Integer rows);

	int insert(TradeLog tl);

}
