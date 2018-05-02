package com.art.portal.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.art.pojo.Car;
import com.art.pojo.Item;
import com.art.poral.pojo.CartItem;
import com.art.portal.service.CartService;
import com.art.service.ItemService;
import com.art.util.ArtResult;

import net.sf.json.JSONObject;
@Controller
public class CarController {

	@Autowired(required=true)
	CartService cartService;
	       /**
	        *测试一波
	        */
//	@RequestMapping("cartadd/{itemId}")
//	public String addCartItem(@PathVariable Long itemId, 
//			@RequestParam(defaultValue="1")Integer num, 
//			HttpServletRequest request, HttpServletResponse response) {System.out.println("测试一波");}
	
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
			@RequestMapping("addItemtoCar")
			public String addCartItem( Integer id, @RequestParam(defaultValue="1")Integer num, 
					HttpServletRequest request, HttpServletResponse response) {
				
				System.out.println("进来了num="+num);
				ArtResult result = cartService.addCartItem(id, num, request, response);
				return "success";
			}
			/**
			 * 展示购物车里的商品
			 * @param request
			 * @param response
			 * @param model
			 * @return
			 */
			@RequestMapping("cartShow")
			public ModelAndView showCart(HttpServletRequest request, HttpServletResponse response) {
				List<CartItem> list = cartService.getCartItemList(request, response);
				Map<String,Object> map = new HashMap();
				System.out.println(list);
				map.put("cartList", list);
				return new ModelAndView("shopping",map);
			}
			/*
			 * 删除购物车中的商品
			 */
			@RequestMapping("deleteItemInCart")
			public ModelAndView deleteCartItem( Long itemId, HttpServletRequest request, HttpServletResponse response) {
				ArtResult artresult = cartService.deleteCartItem(itemId, request, response);
				Map<String,Object> map = new HashMap();
				List<CartItem> list = (List<CartItem>) artresult.getData();
				System.out.println("删除后的列表="+list);
				map.put("cartList",list);
				return new ModelAndView("shopping",map);
			}
//			/**
//			 * @describe 删除购物车中的商品
//			 * @param id 商品 id
//			 * @param request
//			 * @param response
//			 * @return TaotaoResult.status 如果成功了则status为1
//			 * @throws JsonParseException
//			 * @throws JsonMappingException
//			 * @throws UnsupportedEncodingException
//			 * @throws IOException
//			 */
//			@RequestMapping(value ="/deleteCarItem")
//			@ResponseBody
//			public String deleteCarItem(Integer id,HttpServletRequest request,HttpServletResponse response) throws JsonParseException, JsonMappingException, UnsupportedEncodingException, IOException//ɾ���ﳵ�����Ʒ
//			{
//				Cookie[] cookies = request.getCookies();
//				 ObjectMapper om = new ObjectMapper(); 
//				 List<Item> list = new ArrayList<Item>();
//				 Car car = null;
//				
//				 ArtResult result = new ArtResult();
//				 if (null != cookies && cookies.length > 0) {
//				for(Cookie c:cookies)
//				{
//					if("car".equals(c.getName()))
//							{
//						    car = om.readValue(URLDecoder.decode(c.getValue(), "utf-8"), Car.class);
//							}
//				}
//				 }
//				 if(car!=null)
//				 {
//					 list = car.getItems();
//					 Item i = null; 
//					 for(Item item:list)
//					 {
//						 if(item.getId().equals(id))
//						 {
//							i = item;
//							break;
//							 
//						 }
//					 }
//					 list.remove(i);
//					 car.setItems(list);
//					 Writer w = new StringWriter();
//					 om.writeValue(w, car);
//					 Cookie cookie = new Cookie("car", URLEncoder.encode(w.toString(), "utf-8"));
//						
//					 response.addCookie(cookie);
//					 result.setStatus(1);
//				 }
//
//				 JSONObject json = JSONObject.fromObject(result);
//				 return json.toString();
//			}

}
