package com.tansun.rdp4j.file.service.impl;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.zyzc.service.ZCBookQueryService;
import com.tansun.rdp4j.file.service.IAttachHandleService;

public class AttachHandleServiceImplTest {

	IAttachHandleService attachHandleServiceImpl = null;

	public AttachHandleServiceImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		attachHandleServiceImpl = (IAttachHandleService) ctx
				.getBean("attachHandleServiceImpl");
	}

	@Test
	public void testUpdateAttachStringStringStringString() {
		String oldbdid = "444";
		String oldFileType = "1";
		String newbdId = "00000000000000000";
		String newFileType = "1";
		attachHandleServiceImpl.updateAttach(oldbdid, oldFileType, newbdId,
				newFileType);
	}

	@Test
	public void testCopyAttachStringStringString() {
		String oldbdid = "000";
		String newbdId = "111";
		String fileType = "111";
		String oldfileType = "111";
		attachHandleServiceImpl.copyAttach(oldbdid, oldfileType, newbdId,
				fileType);
	}
}
