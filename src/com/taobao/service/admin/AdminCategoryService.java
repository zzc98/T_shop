package com.taobao.service.admin;

import com.taobao.Constant.Constant;
import com.taobao.dao.admin.AdminCategoryDao;
import com.taobao.domain.Category;
import com.taobao.utils.JedisUtil;
import com.taobao.utils.JsonUtil;
import redis.clients.jedis.Jedis;

import java.util.ArrayList;
import java.util.List;

public class AdminCategoryService {


	public List<Category> findAll() {
		//调用dao层的方法查找所有分类信息的集合
		List<Category> categories = new ArrayList<>();
		try {
			AdminCategoryDao dao = new AdminCategoryDao();
			categories = dao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}


	public void saveCategory(Category category) {
		//1.调用dao层的方法，将分类信息存放到数据库
		try {
			AdminCategoryDao dao = new AdminCategoryDao();
			dao.saveCategory(category);
			//2.修改redis中存放的所有分类的json字符串
			//2.1找出所有的分类信息
			List<Category> categories = findAll();
			//2.2将categories转换成json
			String json = JsonUtil.list2json(categories);
			//2.3将json存放到redis中
			save2Redis(Constant.STORE_CATEGORY_ALL, json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void save2Redis(String key, String value){
		Jedis jedis = JedisUtil.getJedis();
		jedis.set(key, value);
		jedis.close();
	}
}
