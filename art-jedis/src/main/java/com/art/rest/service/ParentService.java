package com.art.rest.service;

import java.util.List;

import com.art.pojo.Parent;

public interface ParentService {

	List<Parent> getParentListByPage(int page, int rows);

}
