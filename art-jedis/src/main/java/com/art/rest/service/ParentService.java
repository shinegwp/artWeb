package com.art.rest.service;

import java.util.List;

import com.art.pojo.Parent;
import com.art.util.ArtResult;

public interface ParentService {

	ArtResult getParentListByPage(int page, int rows);

}
