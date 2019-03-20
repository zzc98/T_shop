package com.taobao.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {

	//该购物车中存储的n个购物项
	private Map<String,CartItem> cartItems = new HashMap<String,CartItem>();
	//购物车内商品总计
	private double total = 0.0;
	
	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(Map<String, CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
}
