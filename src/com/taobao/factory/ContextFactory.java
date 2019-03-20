package com.taobao.factory;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.InputStream;

public class ContextFactory {
	/**
	 * 工厂模式获取对象，工厂模式就是根据传入的原材料生产出相对应产品
	 * @param id
	 * @return
	 */
	public static Object getInstance(String id) throws Exception {
		//1.解析xml，根据id值查找到对应的class属性值
		//DOM4J里面的XPath
		SAXReader reader = new SAXReader();
		
		//如果能将context.xml转换成一个字节输入流就行了
		ClassLoader classLoader = ContextFactory.class.getClassLoader();
		InputStream in = classLoader.getResourceAsStream("context.xml");
		Document document = reader.read(in);
		
		//2.查找传入的id对应的instance标签
		Element element = (Element) document.selectSingleNode(String.format("/contexts/instance[@id='%s']", id));
		
		//3.获取该标签上的class属性
		Attribute attribute = element.attribute("class");
		//4.使用属性对象获取属性值
		String className = attribute.getValue();
		//5.使用反射通过类的全限定名创建对象
		Class<?> clazz = Class.forName(className);
		
		Object object = clazz.newInstance();
		return object;
	}
}
