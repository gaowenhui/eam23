package com.tansun.eam2.common.util;

import java.io.Serializable;
import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;

/**
 *
 * @author Baitin.Fong
 */
public class MethodCacheInterceptor implements MethodInterceptor, InitializingBean {
    private static final Log logger = LogFactory.getLog(MethodCacheInterceptor.class);
    private Cache cache;

    public Object invoke(MethodInvocation mi) throws Throwable {
        String targetName  =  mi.getThis().getClass().getName();
        String methodName  = mi.getMethod().getName();
        Object[] args = mi.getArguments();
        Object result;
        String cacheKey = generateKey(targetName, methodName, args);
        Element element = cache.get(cacheKey);
        if (element == null){
             result = mi.proceed();
             if(result != null){
                element = new Element(cacheKey, (Serializable)result);
                cache.put(element);
                if(logger.isDebugEnabled())
                    logger.debug("缓存对象成功:" + cacheKey);
             }
        }else{
            if(logger.isDebugEnabled())
                logger.debug("缓存命中成功。");
        }
        return element.getValue();
    }

    public void afterPropertiesSet() throws Exception {
       if(cache == null){
           logger.fatal("未初始化EhCache，请检查配置文件。");
       }else{
           logger.info("初始化缓存成功！");
       }
    }

    public void setCache(Cache cache) {
        this.cache = cache;
    }

    public Cache getCache() {
        return cache;
    }

    private String generateKey(String targetName, String methodName, Object[] args) {
        StringBuilder result = new StringBuilder();
        result.append(targetName).append(".").append(methodName);
        if(args != null){
            result.append("(");
            for (int i = 0; i < args.length; i++) {
                Object object = args[i];
                result.append(object);
                if(i != args.length - 1){
                    result.append(",");
                }
            }
            result.append(")");
        }
        return result.toString();
    }

}
