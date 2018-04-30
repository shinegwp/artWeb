package com.art.solr.dao;

import org.apache.solr.client.solrj.SolrQuery;

import com.art.solr.pojo.SearchResult;

public interface SearchDao {
	SearchResult search(SolrQuery query) throws Exception;
}