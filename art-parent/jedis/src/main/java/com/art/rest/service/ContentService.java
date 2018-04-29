package com.art.rest.service;

import java.util.List;

import com.art.pojo.ArtContent;


public interface ContentService {

	List<ArtContent> getContentList(long contentCid);
}
