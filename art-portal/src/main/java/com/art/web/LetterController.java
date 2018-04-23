package com.art.web;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Letter;

import com.art.service.LetterService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
public class LetterController {
@Autowired
LetterService letterService;


@RequestMapping(value ="getLetterList",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String getUserLetterListByPage(String UtoP,String page,String rows,String email,String up) throws UnsupportedEncodingException
{System.out.println("getLetterList"+up);
  EUDataGridResult ullist = letterService.getLetterListByPage(UtoP, Integer.parseInt(page), Integer.parseInt(rows),email,up);
  JSONObject json = JSONObject.fromObject(ullist);
  return json.toString();
}


@RequestMapping(value ="saveLetter",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String saveUserLetter(String title,String desc,String uemail,String utop,String pemail) throws UnsupportedEncodingException 
{System.out.println("saveUserLetter");

Letter ul = new Letter();
ul.setTitle(title);
ul.setContextAddress(desc);
ul.setUemail(uemail);
ul.setPemail(pemail);
ul.setTime(new Date());
ul.setUtop(utop);
System.out.println(ul);
int i = letterService.insert(ul);
TaotaoResult result = new TaotaoResult();
result.setMsg(String.valueOf(i));
  JSONObject json = JSONObject.fromObject(result);
  return json.toString();
}

@RequestMapping(value ="getLetterDetailById",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String getUserLetterById(String id) throws UnsupportedEncodingException
{System.out.println("getLetterDetailById");
EUDataGridResult ullist = letterService.getLetterById(Integer.parseInt(id));
 
  JSONObject json = JSONObject.fromObject(ullist);
  return json.toString();
}
}