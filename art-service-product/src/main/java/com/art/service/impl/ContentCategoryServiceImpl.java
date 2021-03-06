package com.art.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ArtContentCategoryMapper;
import com.art.pojo.ArtContentCategory;
import com.art.pojo.ArtContentCategoryExample;
import com.art.pojo.ArtContentCategoryExample.Criteria;
import com.art.pojo.ArtContentCategoryExample.Criterion;
import com.art.service.ContentCategoryService;
import com.art.util.EUTreeNode;
import com.art.util.ArtResult;


/**
 * 内容分类管理
 * <p>Title: ContentCategoryServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年9月8日上午9:17:41
 * @version 1.0
 */
@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {

	@Autowired
	private ArtContentCategoryMapper contentCategoryMapper;
	public List<EUTreeNode> getCategoryList(long parentId) {
		//根据parentid查询节点列表
		ArtContentCategoryExample example = new ArtContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		//执行查询
		List<ArtContentCategory> list = contentCategoryMapper.selectByExample(example);
		List<EUTreeNode> resultList = new ArrayList<EUTreeNode>();
		for (ArtContentCategory tbContentCategory : list) {
			//创建一个节点
			EUTreeNode node = new EUTreeNode();
			node.setId(tbContentCategory.getId());
			node.setText(tbContentCategory.getName());
			node.setState(tbContentCategory.getIsParent()?"closed":"open");
			
			resultList.add(node);
		}
		return resultList;
	}
	public ArtResult insertContentCategory(long parentId, String name) {
		
		//创建一个pojo
		ArtContentCategory contentCategory = new ArtContentCategory();
		contentCategory.setName(name);
		contentCategory.setIsParent(false);
		//'状态。可选值:1(正常),2(删除)',
		contentCategory.setStatus(1);
		contentCategory.setParentId(parentId);
		contentCategory.setSortOrder(1);
		contentCategory.setCreated(new Date());
		contentCategory.setUpdated(new Date());
		//添加记录
		contentCategoryMapper.insert(contentCategory);
		//查看父节点的isParent列是否为true，如果不是true改成true
		ArtContentCategory parentCat = contentCategoryMapper.selectByPrimaryKey(parentId);
		//判断是否为true
		if(!parentCat.getIsParent()) {
			parentCat.setIsParent(true);
			//更新父节点
			contentCategoryMapper.updateByPrimaryKey(parentCat);
		}
		//返回结果
		return ArtResult.ok(contentCategory);
	}
	public ArtContentCategory selectById(long parentId) {
		ArtContentCategory acc = contentCategoryMapper.selectByPrimaryKey(parentId);
		return acc;
	}
	public int updateNameById(ArtContentCategory acc) {
		contentCategoryMapper.updateByPrimaryKey(acc);
		return 1;
	}
	public int deleteById(long id) {
		contentCategoryMapper.deleteByPrimaryKey(id);
		return 1;
	}

}
