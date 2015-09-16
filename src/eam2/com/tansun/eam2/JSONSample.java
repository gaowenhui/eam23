package com.tansun.eam2;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.beanutils.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;

public class JSONSample {

	/**
	 * @param args
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public static void main(String[] args) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		ZyKctz aaa = new ZyKctz();
		aaa.setJybmbm("ddd");
		aaa.setJybmmc("dddd");
		aaa.setKcsl(new Double(111));
		aaa.setLybmbm("lybmbm");
		aaa.setLybmmc("中文");
		aaa.setRq(new Date());
		Map adaa = BeanUtils.describe(aaa);
		for (Iterator iterator = adaa.keySet().iterator(); iterator.hasNext();) {
			String name = (String) iterator.next();
			System.out.println(name + "   " +  adaa.get(name));
			
		}
		
		//String s = BeanUtils.getProperty(aaa, "a");
//		String[] ddd = BeanUtils.getArrayProperty(aaa, "ddd");
//		for (int i = 0; i < ddd.length; i++) {
//			String string = ddd[i];
//			System.out.println(string);
//		}
		
		JsonConfig jsonConfig = getJsonConfig("lybmmddc", "adddd");
		
		//指定某些属性如果为null则不转换成JSON串。
		jsonConfig.setExcludes( new String[]{ "Double", "Boolean"} );  
//		
//		//输出格式
		JSONObject jsonObject = JSONObject.fromObject(aaa,jsonConfig); 
		System.out.println(jsonObject);
//		
//		JSON json = JSONSerializer.toJSON(aaa,jsonConfig); 
//		System.out.println(json);
	}

	private static JsonConfig getJsonConfig(final String name, final String urlStr) {
		JsonConfig jsonConfig = new JsonConfig();
		
		//设置没有值，或者指定属性 不处理生成JSON串
		jsonConfig.setJsonPropertyFilter( new PropertyFilter(){   
			   public boolean apply( Object source, String name, Object value ){   
			      return name.equals("sysUpdateTime");   
			   }   
			});
		
		//特殊对象的数据进行转换，可以自行控制，如日期格式化。
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor(){

			public Object processArrayValue(Object value, JsonConfig jsonConfig) {
				return null;
			}

			public Object processObjectValue(String key, Object value,
					JsonConfig jsonConfig) {
				String str = "";
				if(value != null && value instanceof Date){
					str = new SimpleDateFormat("yyyy-MM-dd").format((Date)value);
				}
				return str;
			}
			
		});
		
		jsonConfig.registerJsonValueProcessor(String.class, new JsonValueProcessor(){
		
			public Object processArrayValue(Object value, JsonConfig jsonConfig) {
				return null;
			}

			public Object processObjectValue(String key, Object value,
					JsonConfig jsonConfig) {
				String str = "";
				if(value != null && key.equals(name)){
					str = "<a href=\"" + urlStr + "\" target=\"_blank\">" + value.toString() + "</a>";
				}else{
					str = value == null ? "" : value.toString();
				}
				
				return str;
			}
			
		});
		return jsonConfig;
	}
	
	

}
