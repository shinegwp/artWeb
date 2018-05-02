package com.art.portal.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.art.poral.pojo.CartItem;
import com.art.util.ArtResult;

public interface CartService {

	ArtResult addCartItem(Integer id, Integer num, HttpServletRequest request, HttpServletResponse response);

	List<CartItem> getCartItemList(HttpServletRequest request, HttpServletResponse response);

	ArtResult deleteCartItem(long itemId, HttpServletRequest request, HttpServletResponse response);

}
