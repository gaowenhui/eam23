/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.panding.webservice;

import cn.cbhb.rpending.common.vo.RPendingVo;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Baitin.Fong
 */
public class TestIPandingInterfaceWebservice {
    IPandingInterfaceWebservice ucc;
    public TestIPandingInterfaceWebservice() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("xfire-servlet.xml");
		ucc = (IPandingInterfaceWebservice)ctx.getBean("pand");
    }
    
    @Test
    public void tesPutPandingInfo() {
       RPendingVo rpv = new RPendingVo();
       rpv.setOptType("1");
       rpv.setPCode("dfddfdeam");
       rpv.setPURL("http://www.google.com");
       rpv.setPnote("note");
       rpv.setPTitle("sdfsdfsdf");
       rpv.setPscode("eam");
       rpv.setPDate("2010-11-11");
       rpv.setPstatus("2");
       rpv.setPOraniger("sdfsdf");
       rpv.setPPrincipal("sdfsdf");
       rpv.setPtype("3");
       String s = ucc.putPandingInfo(rpv);
       System.out.println(s);
       Assert.assertEquals(s, "Y");
    }

    @Test
    public void tesChangePandingInfo() {
       RPendingVo rpv = new RPendingVo();
       rpv.setOptType("3");
       rpv.setPCode("dffeam");
       rpv.setPURL("http://www.80.com");
       rpv.setPnote("note");
       rpv.setPTitle("title");
       rpv.setPscode("eam");
       rpv.setPDate("2010-11-11");
       rpv.setPstatus("2");
       rpv.setPOraniger("sdfsdf");
       rpv.setPPrincipal("sdfsdf");
       rpv.setPtype("3");
       String s = ucc.changePangdingStatus(rpv);
       System.out.println(s);
       Assert.assertEquals(s, "Y");
    }
}
