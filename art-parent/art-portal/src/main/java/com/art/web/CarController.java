package com.art.web;

import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.Car;
import com.art.pojo.Item;

import com.art.service.ItemService;
import com.art.util.TaotaoResult;

import net.sf.json.JSONObject;

@Controller
public class CarController {

	@Autowired(required=true)
	ItemService itemservice;
	
	//���ﳵ�������Ʒ	
			@RequestMapping(value ="/addItemtoCar")
			@ResponseBody
			public String addItemToCar(HttpServletResponse response,HttpServletRequest request,Integer id) throws JsonGenerationException, JsonMappingException, IOException 
			{  System.out.println("addItemtocar");
				Cookie[] cookies = request.getCookies();
				 ObjectMapper om = new ObjectMapper();     
			       Car buyerCart = null;
                   Item item = itemservice.getItemById(id);
                   System.out.println(item);
				 if (null != cookies && cookies.length > 0) {
			            for (Cookie cookie : cookies) {
			                //
			                if ("car".equals(cookie.getName())) {
			                    //���ﳵ ���� ��json�ַ�ת
			                	
			                    buyerCart = om.readValue(URLDecoder.decode(cookie.getValue(), "utf-8"), Car.class);
			                  
			                   
			                    break;
			                }
			            }
			        }
				 TaotaoResult result = new TaotaoResult();
				
				 if(null==buyerCart)
				 {
					 buyerCart = new Car();
				 }
				 //�жϹ��ﳵ�Ƿ��԰���Ʒ
				 boolean b = false;
				 List<Item> list = buyerCart.getItems();
				 for(Item i:list)
				 {System.out.println(i.getId().equals(item.getId()));
					 if(i.getId().equals(item.getId()))
					 {
						 b=true;
					 }
				 }
				 
				 if(b==false)//����ﳵ����Ʒ�򷵻�0
				 {  if(list.size()>10)
				 {
					 result.setStatus(2);
				 }
				 else
				 {
					 
                     buyerCart.addItem(item); 
					 System.out.println("--"+buyerCart.getItems().get(0));
					 Writer w = new StringWriter();
					 om.writeValue(w, buyerCart);
					 Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
					
					 response.addCookie(cookie);
					
					 result.setStatus(1);
				 }
					
				 }
				 else//���������ﳵ�����Ʒ
				 {
					 result.setStatus(0);
				 }
				
                 //��Cookie������ӹ��ﳵ
				
				 
				
				 JSONObject json = JSONObject.fromObject(result);
				 return json.toString();
				
//				 	
				 


			}
			@RequestMapping(value ="/deleteCarItem")
			@ResponseBody
			public String deleteCarItem(Integer id,HttpServletRequest request,HttpServletResponse response) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException//ɾ���ﳵ�����Ʒ
			{
				Cookie[] cookies = request.getCookies();
				 ObjectMapper om = new ObjectMapper(); 
				 List<Item> list = new ArrayList<Item>();
				 Car car = null;
				
				 TaotaoResult result = new TaotaoResult();
				 if (null != cookies && cookies.length > 0) {
				for(Cookie c:cookies)
				{
					if("car".equals(c.getName()))
							{
						    car = om.readValue(URLDecoder.decode(c.getValue(), "utf-8"), Car.class);
							}
				}
				 }
				 if(car!=null)
				 {
					 list = car.getItems();
					 Item i = null; 
					 for(Item item:list)
					 {
						 if(item.getId().equals(id))
						 {
							i = item;
							break;
							 
						 }
					 }
					 list.remove(i);
					 car.setItems(list);
					 Writer w = new StringWriter();
					 om.writeValue(w, car);
					 Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
						
					 response.addCookie(cookie);
					 result.setStatus(1);
				 }

				 JSONObject json = JSONObject.fromObject(result);
				 return json.toString();
			}
			
//	//���ﳵ�������Ʒ	
//		@RequestMapping(value ="/addItemtoCar",produces = "text/html;charset=UTF-8" )
//		@ResponseBody
//		public String addItemToCar(String id,String img,String title,String price,String uid) throws JsonGenerationException, JsonMappingException, IOException 
//		{  System.out.println("addItemtoCar");
//			Car car = new Car();
//		   car.setIid(Integer.parseInt(id));
//		   car.setImg(img);
//		   car.setPrice(Long.parseLong(price));
//		   car.setUid(Integer.parseInt(uid));
//		   car.setTitle(title);
//		int i = carservice.insert(car);
//		TaotaoResult result = new TaotaoResult();
//		result.setStatus(i);
//		JSONObject json = JSONObject.fromObject(result);
//				return json.toString();
//		}
//	@RequestMapping(value ="listFenYe",produces = "text/html;charset=UTF-8")
//	@ResponseBody
//	public String getControllerByPageAndUid(String pageNo,String pageSize,String list)
//	{
//		  System.out.println("listFenYe"+pageNo+","+pageSize+","+list);
//		Car car = jsonToSearchFilter(list);
//		List<Item> itemlist = car.getList();
//		List<Item> returnList = new ArrayList<Item>();
//			for(int i=Integer.parseInt(pageNo)*Integer.parseInt(pageSize)-Integer.parseInt(pageSize);i<Integer.parseInt(pageNo)*Integer.parseInt(pageSize);i++)
//			{
//				returnList.add( itemlist.get(i));
//			}
//			System.out.println(itemlist);
//		  return JSONObject.fromObject(returnList).toString();
//	}
	

}
