package com.art.web;


import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Item;
import com.art.service.ItemServiceBack;
import com.art.util.EUDataGridResult;
import com.art.util.ArtResult;

import net.sf.json.JSONObject;

@Controller
public class ItemControllerBack {
	@Autowired(required=true)
	ItemServiceBack itemServiceBack;
	
    @RequestMapping(value="rest/item/reshelf",method=RequestMethod.POST)
	@ResponseBody
	public int itemReshelf(Integer[] ids)
	{
		int i = 0;	
		for(Integer id:ids)
			{
				i+= itemServiceBack.ReshelfItem(id);
			}
		if(i==ids.length)
		{
			return 1;
		}
			return 0;
	}
    @RequestMapping(value="rest/item/query/item/desc")
	@ResponseBody
	public ArtResult edit(Integer id)
	{   
		ArtResult result = new ArtResult();
		Item item = itemServiceBack.getItemById(String.valueOf(id));
		System.out.println(item);
		if(item!=null)
		{
			result.setData(item);
			result.setStatus(200);
		}
		return result;
	}
    @RequestMapping(value="rest/item/delete")
	@ResponseBody
	public int delete(Integer[] ids)
	{
		int i = 0;	
		for(Integer id:ids)
			{
				i+= itemServiceBack.deleteItemById(id);
			}
		if(i==ids.length)
		{
			return 1;
		}
			return 0;
	}
//******************************************************************************************************88888	
    @RequestMapping(value="item/save/back",method=RequestMethod.POST)
	@ResponseBody
	private int createItem(String title,String price,String desc,String image) throws Exception {
		
		Item item = new Item();
		item.setTitle(title);
		item.setPrice(Long.decode(price));
//		item.setOwnerId(Integer.parseInt(ownerId));
		item.setDescription(desc);
		item.setImgAddress(image);
		item.setCreated(new Date());
		System.out.println(item);
		int i = itemServiceBack.insertItem(item);
		return i;
	}

	
   // @RequestMapping(value="itemlistback",produces = "text/html;charset = utf-8")
	@RequestMapping(value="item/list/back")
	@ResponseBody
	public String getItemList(Integer page, Integer rows) {
		
		EUDataGridResult result = itemServiceBack.getItemList(page, rows);
		return JSONObject.fromObject(result).toString();
	}

	
	
	
	
	
	
}

