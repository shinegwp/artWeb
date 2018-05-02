package com.art.portal.service;


import com.art.util.ArtResult;

public interface SearchService {
	
	ArtResult search(String queryString, int page);
      
}
