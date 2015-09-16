package com.tansun.eam2.stgl.service.impl;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.stgl.vo.EntityQueryVO;

public class EntityServiceImplTest {
	IEntityService entityServiceImpl = null;

	public EntityServiceImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		entityServiceImpl = (IEntityService) ctx.getBean("entityServiceImpl");

	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public final void testDeleteFsxx() {
		String[] fsxxIds = new String[1];
		fsxxIds[0] = "";
		entityServiceImpl.deleteFsxx(fsxxIds);
	}

	@Test
	public final void testListEntities() {
		EntityQueryVO entity = null;
		entityServiceImpl.listEntities(entity);
	}

	@Test
	public final void testNewEntity() {
		StJbxx jbxx=new StJbxx();
		jbxx.setId("123");//(beizhu)
		entityServiceImpl.newEntity(jbxx);
	}

	@Test
	public final void testNewEntityFsxx() {
		StFsxx fsxx =new StFsxx();
		entityServiceImpl.newEntityFsxx(fsxx);
	}

	@Test
	public final void testViewEntityFsxx() {
		StFsxx fsxx =new StFsxx();
		entityServiceImpl.newEntityFsxx(fsxx);
	}

	@Test
	public final void testViewEntityJbxx() {
		String stid="123";
		entityServiceImpl.viewEntityJbxx(stid);
	}

}
