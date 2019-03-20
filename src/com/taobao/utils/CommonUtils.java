package com.taobao.utils;

import java.util.UUID;

/**
 * 通用方法封装类
 * @author Administrator
 *
 */
public class CommonUtils {

	//生成uuid方法
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
}
