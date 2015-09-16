package com.tansun.eam2.common.util;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.commons.beanutils.Converter;

 public class DateConvert implements Converter {    
   
	 public Object convert(Class type, Object value) {    
    	if(value == null) {
    		return null;
    	}
		if(value instanceof Date) {
			return value;
		}
		if(value instanceof String) {
			 try{    
	        	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	            return df.parse(((String)value).trim());    
	         }    
	        catch(Exception e){    
	            try { 	                  
	                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  

  
	                return df.parse(((String)value).trim());    
	             } catch (ParseException ex) {    
	                return null;    
	             }    
	         }    

		} 
		return null;	            
	 }    
}