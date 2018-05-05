package com.art.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.art.mapper.ItemMapper;
import com.art.pojo.Item;
import com.art.pojo.ItemExample;
import com.art.pojo.ItemExample.Criteria;
import com.art.service.ItemService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Component
public class ItemServiceImpl implements ItemService {
 @Autowired
 ItemMapper itemMapper;
// CRON表达式    含义 
 //0/5 * *  * * ?  没五秒变一次
// "0 0 12 * * ?"    每天中午十二点触发 
// "0 15 10 ? * *"    每天早上10：15触发 
// "0 15 10 * * ?"    每天早上10：15触发 
// "0 15 10 * * ? *"    每天早上10：15触发 
// "0 15 10 * * ? 2005"    2005年的每天早上10：15触发 
// "0 * 14 * * ?"    每天从下午2点开始到2点59分每分钟一次触发 
// "0 0/5 14 * * ?"    每天从下午2点开始到2：55分结束每5分钟一次触发 
// "0 0/5 14,18 * * ?"    每天的下午2点至2：55和6点至6点55分两个时间段内每5分钟一次触发 
// "0 0-5 14 * * ?"    每天14:00至14:05每分钟一次触发 
// "0 10,44 14 ? 3 WED"    三月的每周三的14：10和14：44触发 
// "0 15 10 ? * MON-FRI"    每个周一、周二、周三、周四、周五的10：15触发 
     @Scheduled(cron="0 0 12 * * ?")
	public void reducePrice()
	{  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	   ItemExample example = new ItemExample();
	   List<Item> ilist = itemMapper.selectByExample(example );
	   for(Item i:ilist)
	   {   if(i.getPrice()-10>0)
	   {
		   i.setPrice( i.getPrice()-10);
	   }
		 
		  itemMapper.updateByPrimaryKeySelective(i);
	   }
	   System.out.println(sdf.format(new Date())+"---->"+ilist.get(0).getPrice());
	}
 

	public List<Item> getItems() {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		 List<Item> list = itemMapper.selectByExample(example);
          
		return list;
	}
//	public List<Item> getFirstShowItemsByPage(int pageno,String firstshow) {
//		ItemExample example = new ItemExample();
//		PageHelper.startPage(pageno, 9);
//		Criteria criteria = example.createCriteria();
//		criteria.andFistShowEqualTo(firstshow);
//		List<Item> list = itemMapper.selectByExample(example );
//	
//		return list;
//
//	}
//	public Integer getFirstShowItemsNumber(String firstshow) {
//		ItemExample example = new ItemExample();
//		Criteria criteria = example.createCriteria();
//		criteria.andFistShowEqualTo(firstshow);
//		List<Item> list = itemMapper.selectByExample(example );
//		
//		return list.size();
//
//	}
	
//	public List<Item> getFirstShowItemsByFirstShow(String firstshow) {
//		ItemExample example = new ItemExample();
//		Criteria criteria = example.createCriteria();
//		criteria.andFistShowEqualTo(firstshow);
//		List<Item> list = itemMapper.selectByExample(example);
//		return list;
//	}
	
	
	public int InstockItem(Integer id) {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		Item item = new Item();
		item.setStatus(0);
		int i = itemMapper.updateByExampleSelective(item, example);
		return i;
	}


	public List<Item> getnewItems() {
		ItemExample example = new ItemExample();
		example.setOrderByClause("created");
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		// TODO Auto-generated method stub
		return itemMapper.selectByExample(example);
	}

	public List<Item> getlikeCount() {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		example.setOrderByClause("like_count desc");//降序排序  asc升序
		
		return itemMapper.selectByExample(example);
	}
//根据父ID查询商品并按喜欢的人数降序排序
	public EUDataGridResult getItemByParentId(Integer parentId, Integer pageno, Integer i) {
		
		PageHelper.startPage(pageno, i); 
		ItemExample example = new ItemExample() ;
		
		Criteria criteria = example.createCriteria();
		criteria.andCidEqualTo(parentId);
		criteria.andStatusEqualTo(1);
		example.setOrderByClause("like_count desc");
		List<Item> plist = itemMapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(plist);
		result.setPageinfo(p);
		return result;
	}

	//根据父ID查询商品并按销量降序排序
public EUDataGridResult getItemByParentIdOrderBySale(Integer parentId, Integer pageno, Integer i) {
		
		PageHelper.startPage(pageno, i); 
		ItemExample example = new ItemExample() ;
		
		Criteria criteria = example.createCriteria();
		criteria.andCidEqualTo(parentId);
		criteria.andStatusEqualTo(1);
		example.setOrderByClause("sales_volume desc");
		List<Item> plist = itemMapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(plist);
		result.setPageinfo(p);
		return result;
	}
//根据父ID查询商品并按时间降序排序
public EUDataGridResult getItemByParentIdOrderByCreated(Integer parentId, Integer pageno, Integer i) {
		
		PageHelper.startPage(pageno, i); 
		ItemExample example = new ItemExample() ;
		
		Criteria criteria = example.createCriteria();
		criteria.andCidEqualTo(parentId);
		criteria.andStatusEqualTo(1);
		example.setOrderByClause("created desc");
		List<Item> plist = itemMapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(plist);
		result.setPageinfo(p);
		return result;
	}

	public EUDataGridResult getSaleCountOrder(Integer page,Integer rows) {
		 ItemExample example = new ItemExample();
		 Criteria criteria = example.createCriteria();
			criteria.andStatusEqualTo(1);
			example.setOrderByClause("sales_volume desc");//降序排序  asc升序
			PageHelper.startPage(page, rows); 
			List<Item> plist = itemMapper.selectByExample(example);
			PageInfo<Item> p=new PageInfo<Item>(plist);
			EUDataGridResult result = new EUDataGridResult();
			 result.setRows(plist);
			 result.setPageinfo(p);
			return result;
	}

//按上市时间分页降序查询
	public EUDataGridResult getItemTimeOrder(Integer page,Integer rows) {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		example.setOrderByClause("created desc");//降序排序  asc升序
		PageHelper.startPage(page, rows); 
		List<Item> plist = itemMapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
		return result;
	}

//按喜欢的人数分页降序查询
	public EUDataGridResult getItemBylikenumOrder(int page, int rows) {
	 ItemExample example = new ItemExample();
 	 Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		example.setOrderByClause("like_count desc");//降序排序  asc升序
		PageHelper.startPage(page, rows); 
		List<Item> plist = itemMapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		System.out.println(plist);
		System.out.println(p);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
		return result;
	}


//public EUDataGridResult getItemByOwenId(Integer uid, Integer page, Integer rows) {
//	ItemExample example = new ItemExample();
//	Criteria criteria = example.createCriteria();
//	PageHelper.startPage(page, rows); 
//	List<Item> olist = itemMapper.selectByExample(example);//.selectByExample(example);
//	SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
//	List<String> list = new ArrayList<String>();
//	for(Item of:olist)
//	{
//		list.add(simpledate.format(of.getCreated()));
//	}
//	 PageInfo<Item> p=new PageInfo<Item>(olist);
//	 EUDataGridResult result = new EUDataGridResult();
//	 result.setRows(olist);
//	 result.setPageinfo(p);
//	 result.setTime(list);
//	 System.out.println(result);
//	return result;
//}

//****************************************************************************************************8888

public Item getItemById(String id) {//前后台都有
	// TODO Auto-generated method stub
	return itemMapper.selectByPrimaryKey(Integer.parseInt(id));
}
public Item getItemById(Integer id) {//前后台都有
	Item item = itemMapper.selectByPrimaryKey(id);
	return item;
}

public int insertItem(Item item) {//前后台都有
	int i = itemMapper.insertSelective(item);
	return i;
}
public EUDataGridResult getItemList(int page, int rows) {//前后台都有
	ItemExample example = new ItemExample();
	Criteria criteria = example.createCriteria();
	criteria.andStatusEqualTo(1);
	//鍒嗛〉澶勭悊
	PageHelper.startPage(page, rows);
	List<Item> list = itemMapper.selectByExample(example);
	System.out.println(list);
	//鍒涘缓涓�涓繑鍥炲�煎璞�
	EUDataGridResult result = new EUDataGridResult();
	result.setRows(list);
	//鍙栬褰曟�绘潯鏁�
	PageInfo<Item> pageInfo = new PageInfo<Item>(list);

	result.setTotal(pageInfo.getTotal());;
	


	
	return result;
}


public int ReshelfItem(Integer id) {
	// TODO Auto-generated method stub
	return 0;
}


public int deleteItemById(Integer id) {
	// TODO Auto-generated method stub
	return 0;
}


public List<Item> getFirstShowItemsByPage(int pageno, String firstshow) {
	// TODO Auto-generated method stub
	return null;
}


public Integer getFirstShowItemsNumber(String firstshow) {
	// TODO Auto-generated method stub
	return null;
}


public List<Item> getFirstShowItemsByFirstShow(String firstshow) {
	// TODO Auto-generated method stub
	return null;
}


public EUDataGridResult getItemByOwenId(Integer uid, Integer page, Integer rows) {
	// TODO Auto-generated method stub
	return null;
}
}
