package com.art.sso.service;

import com.art.util.ArtResult;

/**
 * @time 18.4.27
 * @author 高位鹏
 * @describe 单点登录User表的数据校验
 */
public interface UserServiceLogin {

	ArtResult checkDate (String content, Integer type);
}
