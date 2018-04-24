package com.art.web;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Professor;
import com.art.service.ProfessorService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ProfessorController {
@Autowired
ProfessorService professorService;

@RequestMapping("getProfessors")
@ResponseBody()
public String getNewPrefessor()
{
	List<Professor> plist = professorService.getNewProfessor();
	JSONArray json = JSONArray.fromObject(plist);
	return json.toString();
}

@RequestMapping("getProfessorById")
@ResponseBody()
public JSONObject getProfessorById(Integer pid) throws ParseException
{System.out.println("getProfessorById"+pid);
	Professor pro = professorService.getProfessorById(pid);
	System.out.println(pro);
	//String jsonstr="{'brthday':"+datestr+",'broLocation':"+pro.getBroLocation()+",'nowLocation':"+pro.getNowLocation()+",'skill':"+pro.getSkill()+",'university':"+pro.getUniversity()+",'pname':"+pro.getPname()+"}";
	JSONObject json = JSONObject.fromObject(pro);
	return json;
}

@RequestMapping(value ="getProfessorlistByPage",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String getProfessorByPage(String page,String rows)
{  
  EUDataGridResult ullist = professorService.getProfessorListByPage(Integer.parseInt(page), Integer.parseInt(rows));
  JSONObject json = JSONObject.fromObject(ullist);
  return json.toString();
}


@RequestMapping(value ="saveProfessor",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String saveProfessor(String pname,String birthday,String university,String broLocation,String nowLocation,String email,String experience,String skill,String img,String tel,String password) throws ParseException
{System.out.println("saveProfessor");
	Professor pro = new Professor();
	pro.setPname(pname);
	//yyyy-MM-dd HH:mm:ss
	SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
	Date d = smf.parse(birthday);
	pro.setBirthday(d);
	pro.setBroLocation("出生于"+broLocation);
	pro.setImg(img);
	pro.setNowLocation("现生活、工作于"+nowLocation);
	pro.setExperience(experience);
	pro.setImg(img);
    pro.setSkill(skill);
    pro.setUniversity("毕业于"+university);
    pro.setTel(tel);
    pro.setCreated(new Date());
    pro.setPassword(password);
    pro.setEmail(email);
int i =  professorService.saveProfessor(pro);
System.out.println(pro);
	System.out.println("=="+pro);
//	EUDataGridResult result = new EUDataGridResult();
//	result.setRows(pro);
//	PageInfo<Professor> pageInfo = new PageInfo<Professor>(pro);
//	result.setTotal(pageInfo.getTotal());	
	JSONObject json  = JSONObject.fromObject(i);
	//System.out.println(result.getRows());
	return json.toString();
}

@RequestMapping(value ="restproupdate",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String updataProfessor(String pid,String pname,String birthday,String tel,String email,String university,String broLocation,String nowLocation,String skill,String experience,String password) throws ParseException 
{SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
	Professor pro =new Professor();
	if(password!=null)
	{
		pro.setPassword(password);
	}
	if(pid!=null)
	{
		pro.setPid(Integer.parseInt(pid));
	}
	if(birthday!=null)
	{
		pro.setBirthday(simpledate.parse(birthday));
	}
	if(broLocation!=null)
	{
		pro.setBroLocation("出生于"+broLocation);
	}
	if(email!=null)
	{
		pro.setEmail(email);
	}
	if(pname!=null)
	{
		pro.setPname(pname);
	}
	if(tel!=null)
	{
		pro.setTel(tel);
	}
	if(university!=null)
	{
		pro.setUniversity("毕业于"+university);
	}
	if(skill!=null)
	{
		pro.setSkill(skill);
	}
	if(experience!=null)
	{
		pro.setExperience(experience);
	}
	if(nowLocation!=null)
	{
		pro.setNowLocation("现生活、工作于"+nowLocation);
	}
	System.out.println(pro);
	 int i =professorService.update(pro);
	 TaotaoResult result = new TaotaoResult();
	 if(i==1)
	 {
		
			result.setStatus(200);
	 }
	
	
	System.out.println(result);
	return JSONObject.fromObject(result).toString();
}
@RequestMapping(value ="getprofessorByPid",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String getProfessor(String pid) 
{//university=毕业于上海交大, broLocation=出生于安徽省淮南市, nowLocation=现生活、工作于上海及北京
	Professor pro = professorService.getProfessorById(Integer.parseInt(pid));
	System.out.println(pro);
	pro.setBroLocation(pro.getBroLocation().substring(3));
	pro.setNowLocation(pro.getNowLocation().substring(7));
	pro.setUniversity(pro.getUniversity().substring(3));
	SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
	String bir=simpledate.format(pro.getBirthday());
	TaotaoResult result = new TaotaoResult();
	result.setData(pro);
	result.setMsg(bir);
	return JSONObject.fromObject(result).toString();
}



@RequestMapping(value ="prologin",produces = "text/html;charset=UTF-8")
@ResponseBody()
public String prologin(String username,String password,HttpServletResponse response,HttpServletRequest request)
{Cookie[] cook = request.getCookies();
String msg="用户名或密码错误！";
boolean haveuid =false;
boolean havepid =false;
for(Cookie c:cook )
{System.out.println("cname="+c.getName());
System.out.println(c.getName().equals("uid"));
	if(c.getName().equals("uid"))
	{System.out.println("haveuid=true");
		haveuid=true;
		break;
	}
	if(c.getName().equals("pid"))
	{
		havepid=true;
	}
}
if(havepid==true)
{
	msg="当前已有用户登陆，请先退出！";
}
if(haveuid==false)
{
	Professor pro =  professorService.getProfessorByTel(username);

	if(!pro.equals(null)&&pro.getPassword().equals(password))
	{    Cookie cookieuid = new Cookie("pid",String.valueOf(pro.getPid())); 
	 Cookie cookiepas = new Cookie("password",String.valueOf(pro.getPassword())); 
	     response.addCookie(cookieuid);
	     response.addCookie(cookiepas);
		 msg="successful";
		
	}
}else{
	msg="您已作为用户登陆,请先退出";
}

	return msg;

}

}
