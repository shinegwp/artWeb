package com.art.web;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Refer;
import com.art.service.ReferService;
import com.art.util.EUDataGridResult;
import com.art.util.ArtResult;

import net.sf.json.JSONObject;

@Controller
public class ReferController {
@Autowired
ReferService referService;

@RequestMapping(value ="getReferListByPage",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String getReferListByUidAndPage(Integer uid,Integer page,Integer rows)
{ System.out.println("controller");
  EUDataGridResult rlist = referService.getReferlistByUidAndPage(uid, page, rows);
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
  int i = referService.saveRefer(rf);
  ArtResult result = new ArtResult();
  result.setMsg(String.valueOf(i));
  
  return JSONObject.fromObject(result).toString();
}
}
