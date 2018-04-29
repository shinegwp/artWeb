package com.art.solr.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.solr.mapper.Solr_ItemMapper;
import com.art.solr.pojo.Solr_Item;
import com.art.solr.service.Solr_ItemService;
import com.art.util.ArtResult;
import com.art.util.ExceptionUtil;

@Service
public class Solr_ItemServiceImpl implements Solr_ItemService{

	@Autowired
	private Solr_ItemMapper itemMapper;
	
	@Autowired
	private SolrServer solrServer;
	
	public ArtResult importAllItems() {
		try {
			List<Solr_Item> list = itemMapper.getItemList();
			for (Solr_Item solr_item : list) {
				SolrInputDocument document = new SolrInputDocument();
				document.setField("id", solr_item.getId());
				document.setField("item_title", solr_item.getTitle());
				document.setField("item_pname", solr_item.getPname());
				document.setField("item_price", solr_item.getPrice());
				document.setField("item_img_address", solr_item.getImgAddress());
				document.setField("item_description", solr_item.getDescription());
				solrServer.add(document);
			}
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return ArtResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		return ArtResult.ok();
	}

}
