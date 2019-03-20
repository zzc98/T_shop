package com.taobao.web.servlet.admin;

import com.taobao.Constant.Constant;
import com.taobao.domain.Category;
import com.taobao.domain.Product;
import com.taobao.service.admin.AdminProductService;
import com.taobao.utils.DateUtil;
import com.taobao.utils.UUIDUtils;
import com.taobao.utils.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 负责处理添加商品请求的Servlet
 */
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//因为form表单的encty为multipart/formdata,所以以前学的所有获取请求参数的方法全部失效了
		//使用commons-fileupload来处理文件上传
		//获取请求参数以及上传的图片
		//1.创建磁盘文件项工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//2.使用工厂对象创建核心上传文件对象
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		//3.使用核心上传文件对象解析请求,获取文件项的集合-------->每一个文件项就对应一个请求参数
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			Product product = new Product();
			//创建一个map，将所有的参数名和参数值都保存到map中
			Map<String, String> map = new HashMap<>();
			List<FileItem> items = fileUpload.parseRequest(request);
			String name = "";
			//4.遍历出每一个文件项
			for (FileItem fileItem : items) {
				//每一个文件项就对应一个请求参数
				//获取请求参数名
				String fieldName = fileItem.getFieldName();
				//上传文件项包含两部分:1.普通参数  2.文件(图片)
				boolean flag = fileItem.isFormField();
				if (flag) {
					//获取普通上传参数的参数值
					String fieldValue = fileItem.getString("UTF-8");
					//将每一个参数名和参数值都保存到map中
					map.put(fieldName, fieldValue);
				}else {
					//表示是上传文件
					//获取一个输入流，上传的文件就在这个输入流中
					inputStream = fileItem.getInputStream();
					//将输入流中的所有的字节保存(写)服务器的文件中
					//使用输出流写
					name = fileItem.getName();
					
					//去掉盘符
					String realName = UploadUtils.getRealName(name);
					
					//图片路径有两个问题
					//1.图片名重名的问题:不使用你传过来的名字，而是在服务器端给每个文件随机命名(UUID),但是"后缀名不能改"
					//从它原来的名字那里把后缀名取出来"找到最后一个.然后取这个.后面的所有字符就是后缀名",但是你还得注意"有的文件没有后缀名"
					
					//生成了一个随机的文件名
					String uuidName = UploadUtils.getUUIDName(realName);
					
					
					//2.一个文件夹中不能存放过多的文件的问题
					//创建文件夹的思路:1.按照时间创建。2.按照文件夹中的文件数量创建。3.随机创建
					String dir = UploadUtils.getDir();
					
					//dir路径的文件夹要放到我们自己项目的"products"里面
					//ServletContext是不是能获取项目的路径
					ServletContext servletContext = getServletContext();
//					String realPath = servletContext.getRealPath("/products");
					String realPath = "/www/server/tomcat/webapps/ROOT/products";
					System.out.println(realPath);
					String path = realPath+dir;//完全是我们自己构想出来的，实际上硬盘中没有这个路径，咱们要先把文件夹创建出来
					File file = new File(path);//这样创建的话只是在内存中创建一个对象
					//如果这个文件夹不存在，我们才需要新建文件夹
					if (!file.exists()) {
						file.mkdirs();//mkdirs()和mkdir()的区别，mkdirs()会循环创建
					}
					map.put("pimage", "products"+dir+"/"+uuidName);
					//创建一个文件，路径就是获取到的path，文件名则是uuidName
					
					//获取其上传的文件的文件名
					outputStream = new FileOutputStream(new File(file, uuidName));
					
					//将输入流中的数据写到输出流中
					IOUtils.copy(inputStream, outputStream);
					
				}
				//删除临时文件
				fileItem.delete();
			}
			//将map中的数据使用BeanUtils设置到javaBean对象中
			BeanUtils.populate(product, map);
			
			//product对象还缺少什么?pid、pdate、pflag、pimage、category都没有
			product.setPid(UUIDUtils.getId());
			product.setPdate(DateUtil.getCurrentDate());
			product.setPflag(Constant.UPJIA);

			
			//设置category到product对象中
			Category category = new Category();
			BeanUtils.populate(category, map);
			
			product.setCategory(category);
			//调用业务层的方法，保存product
			AdminProductService service = new AdminProductService();
			service.saveProduct(product);
			
			//商品保存完毕之后，咱们跳转到查看所有商品信息
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			outputStream.close();
			inputStream.close();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
