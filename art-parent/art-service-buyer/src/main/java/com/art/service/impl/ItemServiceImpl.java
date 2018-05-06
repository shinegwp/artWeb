package com.art.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.Projection;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.art.mapper.ItemMapper;
import com.art.pojo.Item;
import com.art.pojo.ItemExample;
import com.art.pojo.Parent;
import com.art.pojo.ParentExample;
import com.art.pojo.User;
import com.art.pojo.UserExample;
import com.art.pojo.ItemExample.Criteria;
import com.art.service.ItemService;
import com.art.util.EUDataGridResult;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;
@Service
@Component
public class ItemServiceImpl implements ItemService {
 @Autowired
 ItemMapper itemmapper;
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
	   List<Item> ilist = itemmapper.selectByExample(example );
	   for(Item i:ilist)
	   {   if(i.getPrice()-10>0)
	   {
		   i.setPrice( i.getPrice()-10);
	   }
		 
		  itemmapper.updateByPrimaryKeySelective(i);
	   }
	   System.out.println(sdf.format(new Date())+"---->"+ilist.get(0).getPrice());
	}
 

	public List<Item> getItems() {
		ItemExample example = new ItemExample();
		 List<Item> list = itemmapper.selectByExample(example);
          
		return list;
	}
	public List<Item> getFirstShowItemsByPage(int pageno,String firstshow) {
		ItemExample example = new ItemExample();
		PageHelper.startPage(pageno, 9);
		Criteria criteria = example.createCriteria();
		criteria.andFistShowEqualTo(firstshow);
		List<Item> list = itemmapper.selectByExample(example );
	
		return list;

	}
	public Integer getFirstShowItemsNumber(String firstshow) {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andFistShowEqualTo(firstshow);
		List<Item> list = itemmapper.selectByExample(example );
		
		return list.size();

	}
	public Item getItemById(Integer id) {
		Item item = itemmapper.selectByPrimaryKey(id);
		System.out.println(item);
		return item;
	}
	public List<Item> getFirstShowItemsByFirstShow(String firstshow) {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andFistShowEqualTo(firstshow);
		List<Item> list = itemmapper.selectByExample(example);
		return list;
	}
	public int insertItem(Item item) {
		int i = itemmapper.insertSelective(item);
		return i;
	}
	public EUDataGridResult getItemList(int page, int rows) {
		        System.out.println(" getItemListImpl==============="+page+","+rows);
				ItemExample example = new ItemExample();
				//鍒嗛〉澶勭悊
				PageHelper.startPage(page, rows);
				List<Item> list = itemmapper.selectByExample(example);
				System.out.println(list);
				//鍒涘缓涓�涓繑鍥炲�煎璞�
				EUDataGridResult result = new EUDataGridResult();
				result.setRows(list);
				//鍙栬褰曟�绘潯鏁�
				PageInfo<Item> pageInfo = new PageInfo<Item>(list);
			
				result.setTotal(pageInfo.getTotal());;
				
			
			
				
				return result;
	}
	public int InstockItem(Integer id) {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		Item item = new Item();
		item.setStatus(0);
		int i = itemmapper.updateByExampleSelective(item, example);
		return i;
	}
	public int ReshelfItem(Integer id) {
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		Item item = new Item();
		item.setStatus(1);
		int i = itemmapper.updateByExampleSelective(item, example);
		return i;
	}
	public int deleteItemById(Integer id) {
		int i = itemmapper.deleteByPrimaryKey(id);
		return i;
	}
	public Item getItemById(String id) {
		// TODO Auto-generated method stub
		return itemmapper.selectByPrimaryKey(Integer.parseInt(id));
	}

	public List<Item> getnewItems() {
		ItemExample example = new ItemExample();
		example.setOrderByClause("created");
		// TODO Auto-generated method stub
		return itemmapper.selectByExample(example);
	}

	public List<Item> getlikeCount() {
		ItemExample example = new ItemExample();
		
		example.setOrderByClause("like_count desc");//降序排序  asc升序
		
		return itemmapper.selectByExample(example);
	}
//根据父ID查询商品并按喜欢的人数降序排序
	public EUDataGridResult getItemByParentId(Integer parentId, Integer pageno, Integer i) {
		
		PageHelper.startPage(pageno, i); 
		ItemExample example = new ItemExample() ;
		
		Criteria criteria = example.createCriteria();
		criteria.andCidEqualTo(parentId);
		example.setOrderByClause("like_count desc");
		List<Item> plist = itemmapper.selectByExample(example);
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
		example.setOrderByClause("sales_volume desc");
		List<Item> plist = itemmapper.selectByExample(example);
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
		example.setOrderByClause("created desc");
		List<Item> plist = itemmapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(plist);
		result.setPageinfo(p);
		return result;
	}

	public EUDataGridResult getSaleCountOrder(Integer page,Integer rows) {
		 ItemExample example = new ItemExample();
			
			example.setOrderByClause("sales_volume desc");//降序排序  asc升序
			PageHelper.startPage(page, rows); 
			List<Item> plist = itemmapper.selectByExample(example);
			PageInfo<Item> p=new PageInfo<Item>(plist);
			EUDataGridResult result = new EUDataGridResult();
			 result.setRows(plist);
			 result.setPageinfo(p);
			return result;
	}

//按上市时间分页降序查询
	public EUDataGridResult getItemTimeOrder(Integer page,Integer rows) {
		ItemExample example = new ItemExample();
		
		example.setOrderByClause("created desc");//降序排序  asc升序
		PageHelper.startPage(page, rows); 
		List<Item> plist = itemmapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
		return result;
	}

//按喜欢的人数分页降序查询
	public EUDataGridResult getItemBylikenumOrder(int page, int rows) {
	ItemExample example = new ItemExample();
		
		example.setOrderByClause("like_count desc");//降序排序  asc升序
		PageHelper.startPage(page, rows); 
		List<Item> plist = itemmapper.selectByExample(example);
		PageInfo<Item> p=new PageInfo<Item>(plist);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
		return result;
	}



}
