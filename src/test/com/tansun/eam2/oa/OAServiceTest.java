/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.oa;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Baitin.Fong
 */
public class OAServiceTest {
    GetsubjectService oaService;
    public OAServiceTest() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("xfire-servlet.xml");
		oaService = (GetsubjectService)ctx.getBean("oaService");
    }

    /**
     * Test of getOABLYJ method, of class OAService.
     */
    public void testGetOABLYJ() throws Exception {
        System.out.println("getOABLYJ");
        String expResult = "";
//        oaService.getOABLYJ("钱诚", "发文", "0", "10", "关于", "办结");
//        String result = instance.getOABLYJ();
//        assertNotNull(result);
    }

  /**
     * Test of getOABLYJ method, of class OAService.
     */
    @Test
    public void testGetOABlyj() throws Exception {
        System.out.println("getOABLYJ");
        String expResult = "";
        oaService.getOABlyj("钱诚", "发文", "0", "10", "关于", "办结");
//        String result = instance.getOABLYJ();
//        assertNotNull(result);
    }
    /**
     * Test of startOAFlow method, of class OAService.
     */
    public void testStartOAFlow() throws Exception {
        System.out.println("startOAFlow");
        GetsubjectService instance = new GetsubjectService();
        String expResult = "";
//        String result = instance.startOAFlow("EAMmsgid", "ngrq", "ngr", "zbbm", "zwbt", "zwnr", "fwsm", "yjwjurl");
//        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of queryOAFlow method, of class OAService.
     */
    public void testQueryOAFlow() throws Exception {
        System.out.println("queryOAFlow");
        String expResult = "";
//        String result = oaService.queryOAWorkflow("test");
//        assertNotNull(result);
//        System.out.println(result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of finishOAFlow method, of class OAService.
     */
    public void testFinishOAFlow() throws Exception {
        System.out.println("finishOAFlow");
        GetsubjectService instance = new GetsubjectService();
        String expResult = "";
//        String result = instance.finishOAFlow();
//        assertNotNull(result);
    }

}