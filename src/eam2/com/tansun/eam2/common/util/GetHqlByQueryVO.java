package com.tansun.eam2.common.util;

import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;

public class GetHqlByQueryVO {

	public static String getHql(Map<String,String> strEqual,Map<String,String> strLike,Map<String,String> strBetween,Object obj,String origHql){
		//等值查询条件拼接
		Set<String> equalProperties = strEqual.keySet();
		Iterator<String> ite = equalProperties.iterator();
		while(ite.hasNext()){
			//获得属性名
			String propertyName = ite.next();
			//获得此属性所属的别名
			String alias = strEqual.get(propertyName);
			String value = null;
			//根据属性名，获得属性值
			try {
				value = BeanUtils.getProperty(obj,propertyName);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			if(value != null && value.trim().length() > 0){
				origHql += " and " + alias + "." + propertyName + " = '" + value + "'";
			}
		}
		
		//模糊查询条件拼接
		Set<String> likeProperties = strLike.keySet();
		Iterator<String> ite2 = likeProperties.iterator();
		while(ite2.hasNext()){
			//获得属性名
			String propertyName = ite2.next();
			//获得此属性所属的别名
			String alias = strLike.get(propertyName);
			String value = null;
			//根据属性名，获得属性值
			try {
				value = BeanUtils.getProperty(obj,propertyName);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			if(value != null && value.trim().length() > 0){
				origHql += " and " + alias + "." + propertyName + " like '%" + value + "%'";
			}
		}
		
		//区间查询查询条件拼接
		Set<String> betweenProperties = strBetween.keySet();
		Iterator<String> ite3 = betweenProperties.iterator();
		while(ite3.hasNext()){
			//获得VO属性名
			String startPropertyName = ite3.next();
			String endPropertyName = null;
			//BO属性名
			String propertyName = null;
			//判断是否为起始属性
			if(!startPropertyName.endsWith("_start")){
				continue;
			}else{
				propertyName = startPropertyName.substring(0, startPropertyName.lastIndexOf("_start"));
				endPropertyName = propertyName + "_end";
			}
			//获得此属性所属的别名
			String startAlias = strBetween.get(startPropertyName);
			String endAlias = strBetween.get(endPropertyName);
			String startValue = null;
			String endValue = null;
			//根据属性名，获得属性值
			try {
				startValue = BeanUtils.getProperty(obj,startPropertyName);
				endValue = BeanUtils.getProperty(obj,endPropertyName);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			if(startValue != null && startValue.trim().length() > 0){
				origHql += " and " + startAlias + "." + propertyName + " >= '" + startValue + "'";
			}
			if(endValue != null && endValue.trim().length() > 0){
				origHql += " and " + endAlias + "." + propertyName + " <= '" + endValue + "'";
			}			
		}		
		return origHql;
	}
}
