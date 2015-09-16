package com.tansun.eam2.common.ucc;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.EAMDept;

public class TestDeptTreeUcc {
	IDeptTreeUcc ucc;
	public TestDeptTreeUcc(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext*.xml");    
		ucc = (IDeptTreeUcc)ctx.getBean("deptTreeUccImpl");
	}
	
	@Test
	public void testGetEAMDept() {
		List<EAMDept> depts = ucc.getEAMDept((long)1, (long)0);
		assertTrue(depts != null && depts.size() != 0);
	}

}
