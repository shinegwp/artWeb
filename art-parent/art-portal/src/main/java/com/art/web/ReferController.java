package com.art.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Refer;
import com.art.service.ReferService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ReferController {
@Autowired
ReferService referservice;

@RequestMapping(value ="getReferListByPage",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String getReferListByUidAndPage(Integer uid,Integer page,Integer rows)
{ System.out.println("controller");
  EUDataGridResult rlist = referservice.getReferlistByUidAndPage(uid, page, rows);
  JSONObject json = JSONObject.fromObject(rlist);
  return json.toString();
}
@RequestMapping(value ="saveRefer",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String saveRefer(String uid,String context,String iid)
{System.out.println("saveRefer");
	Refer rf = new Refer();
rf.setUid(Integer.parseInt(uid));
rf.setContext(context);
rf.setIid(Integer.parseInt(iid));
rf.setTime(new Date());
  int i = referservice.saveRefer(rf);
  TaotaoResult result = new TaotaoResult();
  result.setMsg(String.valueOf(i));
  
  return JSONObject.fromObject(result).toString();
}
}
