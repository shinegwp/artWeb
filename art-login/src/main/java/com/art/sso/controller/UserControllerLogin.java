package com.art.sso.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.sso.service.UserServiceLogin;
import com.art.util.ArtResult;
import com.art.util.ExceptionUtil;

/**
 * @time 18.4.27
 * @author 高位鹏
 * @describe 单点登录的控制层，从url中接受两个参数，调用service进行校验，
 *           并且在调用service之前进行参数校验
 */
@Controller
@RequestMapping("userLogin")
public class UserControllerLogin {
    @Autowired
	private UserServiceLogin userServiceLogin;
    
    @RequestMapping("/check/{param}/{type}")
    @ResponseBody
    public Object checkDate(@PathVariable String param, @PathVariable Integer type, String callBack){
    	ArtResult result = null;
    	
    	//进行参数有效性校验
    	if (StringUtils.isBlank(param)) {
    		result = ArtResult.build(400, "校验内容不能为空");
    	}
    	if (type == null) {
    		result =  ArtResult.build(400, "校验内容类型不能为空");
    	}
    	if (type != 1 && type != 2 && type != 3) {
    		result = ArtResult.build(400, "校验内容类型错误");
    	}
    	//若校验不通过
    	if (result != null) {
    		if (null != callBack) {
    			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
    			mappingJacksonValue.setJsonpFunction(callBack);
    			return mappingJacksonValue;
    		} else {
    			return result;
    		}
    	}
    	//调用服务,进行校验
    	try {
    		result = userServiceLogin.checkDate(param, type);
    	} catch (Exception e) {
    		result = ArtResult.build(500,ExceptionUtil.getStackTrace(e));
    	}
    	//判断是否有回掉
    	if (null != callBack) {
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callBack);
			return mappingJacksonValue;
		} else {
			return result;
		}
    }
}
