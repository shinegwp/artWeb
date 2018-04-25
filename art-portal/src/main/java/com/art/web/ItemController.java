package com.art.web;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.art.pojo.Car;
import com.art.pojo.Item;
import com.art.pojo.ItemImg1;
import com.art.pojo.ItemImg2;
import com.art.service.ItemImg1Service;
import com.art.service.ItemImg2Service;
import com.art.service.ItemService;

import com.art.util.Detail;
import com.art.util.EUDataGridResult;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ItemController {
	@Autowired
	ItemService itemService;
	
	@Autowired
	ItemImg1Service itemimg1Service;
	
	@Autowired
	ItemImg2Service itemimg2Service;
	
	
	
	/**
	 * @describe 分页查询优先显示的商品
	 * @param 传入  页号
	 * @return 返回 Item集合
	 */
	@RequestMapping("/firstShowlist")
	@ResponseBody
	public String firstShowlist(String pageno)
	{  
		List<Item> list = itemService.getFirstShowItemsByPage(Integer.parseInt(pageno),"1");
		
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		return jsonArray.toString();
	}
	/**
	 * @describe 根据Item的id查询Item
	 * @param 传入  item的id
	 * @return 返回 一个Item
	 */
	@RequestMapping(value ="/getOneItem",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOneItem(String id)
	{  
	Item  list = itemService.getItemById(Integer.parseInt(id));
		
		JSONObject jsonobject= JSONObject.fromObject(list);
		
		return jsonobject.toString();
	}

    /**
     * @describe 当专场点击其中一个专场的时候，把商品类别的父类的id传类专场细节页面
     * @param  pid=商品类别的id (parent.id)
     * @return 带着pid,返回到special_detail页面
     */
	@RequestMapping(value ="/gotoSpecialDet",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public ModelAndView gotoSpecialDet(String pid) 
	{  //当专场点击其中一个专场的时候，把商品类别的父类的id传类专场细节页面
		Map<String, String> map = new HashMap<String, String>();
		map.put("pid", pid);
		return new ModelAndView("special_detail", map);

	}
	 /**
     * @describe 去结算（这个还没写完，需要改）
     * @param 
     * @return 
     */
	@RequestMapping("/gotojiesuan")
	@ResponseBody
	public ModelAndView getShippingAddressByUid(String id) 
	{ 
		Item item = itemService.getItemById(Integer.parseInt(id));
		Map<String, Object> map = new HashMap<String, Object>();
		Car car = new Car();
		List<Item> list =new ArrayList<Item>();
		list.add(item);
		car.setItems(list);
		map.put("car", list);
		return new ModelAndView("jiesuan", map);
	}
	 /**
     * @describe 去结算（这个还没写完，需要改）
     * @param 
     * @return 
     */
	@RequestMapping(value ="/gotojs",produces = "text/html;charset=UTF-8" )//�ύ���ﳵ����Ʒ
	@ResponseBody
	public ModelAndView gotojiesuan(String Items) 
	{   //去结算（这个还没写完，需要改）
		JSONObject job = JSONObject.fromObject(Items);
	     Car car = (Car) JSONObject.toBean(job, Car.class);
		Map<String, String> map = new HashMap<String, String>();
		return new ModelAndView("jiesuan", map);

	}
	
	/**
	 * @describe 当在专场细节页面点击按销量排序的时候，请求此方法
	 * @param 商品类别的id
	 * @return  带着商品类别的id返回到sale_special_detail页面（按销量排序后的页面）
	 */
	@RequestMapping(value ="/gotoSaleSpecialDet",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public ModelAndView gotoSaleSpecialDet(String pid) 
	{ 
		Map<String, String> map = new HashMap<String, String>();
		map.put("pid", pid);
		return new ModelAndView("sale_special_detail", map);

	}
	/**
	 * @describe 当在专场细节页面点击按上市时间排序的时候，请求此方法
	 * @param 商品类别的id
	 * @return  带着商品类别的id返回到time_special_detail页面（按上市时间排序后的页面）
	 */
	@RequestMapping(value ="/gotoTimeSpecialDet",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public ModelAndView gotoTimeSpecialDet(String pid) 
	{  
		Map<String, String> map = new HashMap<String, String>();
		map.put("pid", pid);
		return new ModelAndView("time_special_detail", map);

	}
	/**
	 * @describe 当在专场页面点进入专场的时候，请求此方法，分页查询某一类商品
	 * @param 商品类别的id
	 * @return  某一类商品的集合
	 */
	@RequestMapping(value ="getSpecialDetailList",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemByPageAndPid(String pid,String page,String rows) 
	{  
	
	    EUDataGridResult result = itemService.getItemByParentId(Integer.parseInt(pid),Integer.parseInt(page), Integer.parseInt(rows));
	   
	    JSONObject jsonarray = JSONObject.fromObject(result);
		
		
		return jsonarray.toString();

	}
	@RequestMapping(value ="getSpecialDetailListOrderBySale",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSaleOrderItemByPageAndPid(String pid,String page,String rows) 
	{  
	
	    EUDataGridResult result = itemService.getItemByParentIdOrderBySale(Integer.parseInt(pid),Integer.parseInt(page), Integer.parseInt(rows));
	   
	    JSONObject jsonarray = JSONObject.fromObject(result);
		
		
		return jsonarray.toString();

	}
	@RequestMapping(value ="getSpecialDetailListOrderByCreated",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getTimeOrderItemByPageAndPid(String pid,String page,String rows) 
	{  
	
	    EUDataGridResult result = itemService.getItemByParentIdOrderByCreated(Integer.parseInt(pid),Integer.parseInt(page), Integer.parseInt(rows));
	   
	    JSONObject jsonarray = JSONObject.fromObject(result);
		
		
		return jsonarray.toString();

	}
	
	@RequestMapping(value ="/getNewItem",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String  getNewItem() throws ParseException
	{ 	
		List<Item> list = itemService.getnewItems();
		JSONArray jsonarray = JSONArray.fromObject(list);
		return jsonarray.toString();
		
		
	}
	//��ϲ����������ȡItem�б�
	@RequestMapping(value ="/getItemBylikeCountOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemBylikeCountOrder() 
	{  
	    
		   return JSONArray.fromObject(itemService.getlikeCount()).toString();
	   



	}
	@RequestMapping(value ="/getItemBytimeOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemByTimeOrderAndpage(String page,String rows) 
	{  
		   return JSONObject.fromObject(itemService.getItemTimeOrder(Integer.parseInt(page),Integer.parseInt(rows))).toString();
	   



	}
	@RequestMapping(value ="/getItemBylikenumOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemBylikenumOrder(String page,String rows) 
	{  
	    
	    EUDataGridResult result = itemService.getItemBylikenumOrder(Integer.parseInt(page),Integer.parseInt(rows));
		   return JSONObject.fromObject(result).toString();

	}
	@RequestMapping(value ="/getItemBySaleCountOrder",produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getItemBySaleCountOrder(String page,String rows) 
	{  
	   
	    EUDataGridResult result = itemService.getSaleCountOrder(Integer.parseInt(page),Integer.parseInt(rows));
		   return JSONObject.fromObject(result).toString();

	}

	@RequestMapping("/getDetail")
	@ResponseBody
	public ModelAndView getDetail(String id) 
	{ 
	   Detail detail = new Detail();
	    Item item = itemService.getItemById(Integer.parseInt(id));
	    List<ItemImg1> itemimg1list = itemimg1Service.getItemImg1ById(Integer.parseInt(id));
	    List<ItemImg2> itemimg2list = itemimg2Service.getItemImg2ById(Integer.parseInt(id));
		detail.setItem(item);
		detail.setImg1(itemimg1list);
		detail.setImg2(itemimg2list);
		JSONObject jsonobject = JSONObject.fromObject(detail);
		Map<String,String> map = new HashMap<String,String>();
		map.put("detail", jsonobject.toString());
		return new ModelAndView("pro_detail",map);
	
	}
	@RequestMapping("/getfirstShowlist")
	@ResponseBody
	public String getfirstShowlist() 
	{ 
		Detail detail = new Detail();
	    List<Item> items = itemService.getFirstShowItemsByFirstShow(String.valueOf(1));
	    JSONArray jsonarray = JSONArray.fromObject(items);
		return jsonarray.toString();
	
	}
	
	
	@RequestMapping(value="itemsave", method=RequestMethod.POST)//ǰ��̨����
	@ResponseBody
	private int createItem(String title,String price,String desc,String ownerId,String image) throws Exception {
		
		Item item = new Item();
		item.setTitle(title);
		item.setPrice(Long.decode(price));
		item.setOwnerId(Integer.parseInt(ownerId));
		item.setDescription(desc);
		item.setImgAddress(image);
		item.setCreated(new Date());
		System.out.println(item);
		int i = itemService.insertItem(item);
		return i;
	}

	
	@RequestMapping(value ="itemlist",produces = "text/html;charset=UTF-8" )//ǰ��̨����
	@ResponseBody
	public String getItemList(Integer page, Integer rows) {
		
		EUDataGridResult result = itemService.getItemList(page, rows);
		
		return JSONObject.fromObject(result).toString();
	}

	
	
	
	@RequestMapping(value ="/getMySellListByPage",produces = "text/html;charset=UTF-8")//�õ��ҵļ�������Ʒ
	@ResponseBody
	public String getMySellListByPage(Integer uid,Integer page,Integer rows) 
	{ 
		  
		  EUDataGridResult rlist = itemService.getItemByOwenId(uid,page, rows);
		JSONObject jsonobject = JSONObject.fromObject(rlist);
		
		return jsonobject.toString();
	
	}
	
	
}

