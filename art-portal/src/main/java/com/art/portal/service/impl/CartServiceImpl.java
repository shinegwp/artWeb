package com.art.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.pojo.Item;
import com.art.poral.pojo.CartItem;
import com.art.portal.service.CartService;
import com.art.util.ArtResult;
import com.art.util.CookieUtils;
import com.art.util.HttpClientUtil;
import com.art.util.JsonUtils;


@Service
public class CartServiceImpl implements CartService {
	
	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	
	@Value("${ITME_INFO_URL}")
	private String ITME_INFO_URL;
	
	
	/**
	 * 从cookie中取商品列表
	 * <p>Title: getCartItemList</p>
	 * <p>Description: </p>
	 * @return
	 */
	private List<CartItem> getCartItemList(HttpServletRequest request) {
		//从cookie中取商品列表
		String cartJson = CookieUtils.getCookieValue(request, "ART_CART", true);
		if (cartJson == null) {
			return new ArrayList<>();
		}
		//把json转换成商品列表
		try {
			List<CartItem> list = JsonUtils.jsonToList(cartJson, CartItem.class);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	@Override
	public List<CartItem> getCartItemList(HttpServletRequest request, HttpServletResponse response) {
		List<CartItem> itemList = getCartItemList(request);
		return itemList;
	}
	
	@Override
	public ArtResult deleteCartItem(long itemId, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("jinlaile");
		//从cookie中取购物车商品列表
		List<CartItem> itemList = getCartItemList(request);
		System.out.println("从cookie中查询到的list="+itemList);
		//从列表中找到此商品
		for (CartItem cartItem : itemList) {
			if (cartItem.getId() == itemId) {
				itemList.remove(cartItem);
				break;
			}
				 
		}
		//把购物车列表重新写入cookie
		CookieUtils.setCookie(request, response, "ART_CART", JsonUtils.objectToJson(itemList), true);
		System.out.println("impl里的list="+itemList);
		return ArtResult.ok(itemList);
	}

	@Override
	public ArtResult addCartItem(Integer id, Integer num, HttpServletRequest request, HttpServletResponse response) {

		//取商品信息
		CartItem cartItem = null;
		//取购物车商品列表
		List<CartItem> itemList = getCartItemList(request);
		//判断购物车商品列表中是否存在此商品
		for (CartItem cItem : itemList) {
			//如果存在此商品
			if (cItem.getId() == id) {
				//增加商品数量
				cItem.setNum(cItem.getNum() + num);
				cartItem = cItem;
				break;
			}
		}
		if (cartItem == null) {
			cartItem = new CartItem();
			//根据商品id查询商品基本信息。
			String json = HttpClientUtil.doGet(REST_BASE_URL + ITME_INFO_URL + id); 
			System.out.println(json);
			//把json转换成java对象
			ArtResult taotaoResult = ArtResult.formatToPojo(json, Item.class);
			if (taotaoResult.getStatus() == 200) {
				Item item = (Item) taotaoResult.getData();
				cartItem.setId(item.getCid());
				cartItem.setTitle(item.getTitle());
				cartItem.setImage(item.getImgAddress());
				cartItem.setNum(num);
				cartItem.setPrice(item.getPrice());
			}
			//添加到购物车列表
			itemList.add(cartItem);
		}
		//把购物车列表写入cookie
		CookieUtils.setCookie(request, response, "ART_CART", JsonUtils.objectToJson(itemList), true);
		
		return ArtResult.ok();
	
	}

}
