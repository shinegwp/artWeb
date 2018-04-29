package com.art.portal.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.TradeLog;
import com.art.service.TradeLogService;
import com.art.util.EUDataGridResult;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class TradeLogController {
@Autowired
TradeLogService tradeLogService;

@RequestMapping(value ="getTradeLogByUid",produces = "text/html;charset=UTF-8")
@ResponseBody
public String getTradeLogListByUid(Integer uid)
{
	List<TradeLog> trlist  = tradeLogService.getTradeLogListByUid(uid);
	JSONArray json = JSONArray.fromObject(trlist);
	return json.toString();
}


@RequestMapping(value ="gettradelogListByPage",produces = "text/html;charset=UTF-8")
@ResponseBody
public String getTradeLogListByUidAndPage(Integer uid,Integer page,Integer rows)
{     EUDataGridResult trlist = tradeLogService.getTradeLoglistByUidAndPage(uid, page, rows);
    JSONObject json = JSONObject.fromObject(trlist);
   return json.toString();
}
@RequestMapping(value ="creatTradeLog")
@ResponseBody
public int creatTradeLog(String tradeMoney,String tradeType,String balance,Integer uid) throws UnsupportedEncodingException
{   TradeLog tl = new TradeLog();
    tl.setUid(uid);
    tl.setTradeMoney(tradeMoney);
    System.out.println(tradeType);
    tl.setTradeType(new String(tradeType.getBytes("iso-8859-1"),"utf-8"));
    tl.setBalance(balance);
    tl.setTradeTime(new Date());
    int i = tradeLogService.insert(tl);
   return i;
}

}
