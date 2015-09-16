/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.common.commonService.impl;

import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.eam2.GlobalVariable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import java.util.Date;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Baitin.Fong
 */
public class CommonChangeLogServiceTest {
    CommonChangeLogService instance;
    public CommonChangeLogServiceTest() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContextTest.xml");
       instance = ctx.getBean(CommonChangeLogService.class);
    }

    /**
     * Test of queryAssetChangeLog method, of class CommonChangeLogService.
     */
    @Test
    public void testQueryAssetChangeLog() {
        System.out.println("queryAssetChangeLog");
        String userid = "11";
        String upobjcode = "";
        String updateStart = "20101225";
        String updateEnd = "20101226";
        String subSys = GlobalVariable.ENTITY_SUBSYSTEM;
        String upsheet = "";
        String tableName = "StJbxx";
        String fk = "id";
        String name = "stzwmc";
        Paginator paginator = new Paginator();
        List result = instance.queryAssetChangeLog(userid, upobjcode, updateStart, updateEnd, subSys, upsheet, tableName, fk, name, paginator);
        System.out.println(result);
        assertEquals(1, result.size());
    }

    /**
     * Test of saveAssetChangeLog method, of class CommonChangeLogService.
     */
    public void testSaveAssetChangeLog() {
        System.out.println("saveAssetChangeLog");
        AssetChangeLog log = new AssetChangeLog();
        log.setPersonId("11");
        log.setPersonName("name");
        log.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);
        log.setUpaftervalue("dddd");
        log.setUpbefovalue("dfdfd");
        log.setUpdatedate(new Date());
        log.setUpdatetype("修改");
        log.setUpobjId("sdfsf");
        log.setUpproper("dddd");
        log.setUpsheet("sdfsdfsdf");
        log.setUpobjcode("测试");
        instance.saveAssetChangeLog(log);
        assertNotNull(log.getId());
    }

}