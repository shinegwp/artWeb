package com.art.portal.controller;

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
	ItemService itemService;
	
            /**
             * 
             * @describe 往购物车里添加商品 
             * @param response
             * @param request
             * @param id 商品的id
             * @return TaotaoResult.status 
             * @throws JsonGenerationException
             * @throws JsonMappingException
             * @throws IOException
             */
			@RequestMapping(value ="/addItemtoCar")
			@ResponseBody
			public String addItemToCar(HttpServletResponse response,HttpServletRequest request,Integer id) throws JsonGenerationException, JsonMappingException, IOException 
			{  System.out.println("addItemtocar");
				Cookie[] cookies = request.getCookies();
				 ObjectMapper om = new ObjectMapper();     
			       Car buyerCart = null;
                   Item item = itemService.getItemById(id);
                   System.out.println(item);
				 if (null != cookies && cookies.length > 0) {
			            for (Cookie cookie : cookies) {
			                //
			                if ("car".equals(cookie.getName())) {
			                	//购物车 对象 与json字符串互转
			                	
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
				//判断购物车是否以包含商品
				 boolean b = false;
				 List<Item> list = buyerCart.getItems();
				 for(Item i:list)
				 {System.out.println(i.getId().equals(item.getId()));
					 if(i.getId().equals(item.getId()))
					 {
						 b=true;
					 }
				 }
				 
				 if(b==false)
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
				 else//如果不包含，则往购物车添加商品
				 {
					 result.setStatus(0);
				 }
				
				//往Cookie了里添加购物车
				
				 JSONObject json = JSONObject.fromObject(result);
				 return json.toString();
				
//				 	
				 


			}
			/**
			 * @describe 删除购物车中的商品
			 * @param id 商品 id
			 * @param request
			 * @param response
			 * @return TaotaoResult.status 如果成功了则status为1
			 * @throws JsonParseException
			 * @throws JsonMappingException
			 * @throws UnsupportedEncodingException
			 * @throws IOException
			 */
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

}
