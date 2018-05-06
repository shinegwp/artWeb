package com.art.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.solr.common.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
public class PictureController {
//   @Autowired
//   private HttpServletRequest request;
	@RequestMapping("picupload")
	@ResponseBody
	public Map uploadPic(MultipartFile uploadFile,HttpServletRequest request) throws IOException, FileUploadException
	{  //System.out.println("相对路径"+request.getSession().getServletContext().getRealPath("")+"\\upload\\shadouyou\\"+uploadFile.getOriginalFilename());
	//System.out.println("绝对路径"+request.getSession().getServletContext().getRealPath(""));
	
		System.out.println("----picupload----");
		
		String filePath = request.getSession().getServletContext().getRealPath("")+"\\WEB-INF\\upload\\shadouyou\\"+uploadFile.getOriginalFilename();
	System.out.println("path:"+request.getSession().getServletContext().getRealPath("")+"\\WEB-INF\\upload\\shadouyou\\"+uploadFile.getOriginalFilename());	
	File saveDir = new File(filePath);
		//System.out.println("相对路径"+this.getClass().getClassLoader().getResource("/").getPath());
		Map resultMap = new HashMap<Object, Object>();	
		System.out.println(saveDir.getParentFile().exists());
		if(!saveDir.getParentFile().exists())
		{
			saveDir.getParentFile().mkdirs();
		}
		if(uploadFile.isEmpty())
		{
			resultMap.put("error", 1);
			resultMap.put("message", "图片为空");
			return resultMap;
		}
		else
		{
		    uploadFile.transferTo(saveDir);
		    resultMap.put("error", 0);
		    System.out.println("url:"+request.getContextPath()+"/upload/shadouyou/"+uploadFile.getOriginalFilename());
			resultMap.put("url", request.getContextPath()+"/upload/shadouyou/"+uploadFile.getOriginalFilename());
			return resultMap;
		}
		


	}
	@ResponseBody
    @RequestMapping("uploadImg")
    public String uploadPicture(@RequestParam(value="file",required=false)MultipartFile[] files,
    HttpServletRequest request){
		
        List<String> msg = new ArrayList<String>();//返回存储路径
        int code=1;
		for(int i=0;i<files.length;i++)
		{File targetFile=null;
			 String fileName=files[i].getOriginalFilename();
			//获取文件名加后缀
		        if(fileName!=null&&fileName!=""){   
		            String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() +"/upload/imgs/";//存储路径
		            String path = request.getSession().getServletContext().getRealPath("WEB-INF/upload/imgs"); //文件存储位置
		            String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
		            fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名
		             SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		            //先判断文件是否存在
		            String fileAdd = sdf.format(new Date());
		            File file1 =new File(path+"/"+fileAdd); 
		            //如果文件夹不存在则创建    
		            if(!file1 .exists()  && !file1 .isDirectory()){       
		                file1 .mkdir();  
		            }
		            targetFile = new File(file1, fileName);
//		          targetFile = new File(path, fileName);
		            try {
		                files[i].transferTo(targetFile);
//		              msg=returnUrl+fileName;
		                msg.add(returnUrl+fileAdd+"/"+fileName);
		                code=0;
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		}
        
       
       System.out.println("msg---"+msg+"---code"+code);
        return JSONObject.fromObject(( TaotaoResult.build(code, null, msg))).toString();
    }

}
