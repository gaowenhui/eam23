package com.tansun.eam2.common.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 *
 * @author Baitin.Fong
 */
public class SpringContextHelper implements ApplicationContextAware {

    private static ApplicationContext context;
    /*
     * 注入ApplicationContext
     */
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        //在加载Spring时自动获得context
        SpringContextHelper.context = context;
    }

    public static Object getBean(String beanName) {
        return context.getBean(beanName);
    }

    public static Object getBean(Class beanName) {
        return context.getBean(beanName);
    }
}
