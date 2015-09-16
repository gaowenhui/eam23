package com.tansun.eam2.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;

public class TestAttachHandleUCC extends TestCase {
	IAttachHandleUCC iah = null;
	public TestAttachHandleUCC(String name) {
		super(name);
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContextTest.xml");    
		iah = (IAttachHandleUCC)ctx.getBean("attachHandleUCC");
	}

	public void _testDelAttachment() {
		iah.delAttachment(new String[]{"8a81894e2c4d9e04012c4d9e1e0c0002"});
		List<PTAttachment> list = iah.queryAttachment("dddd","0");
		
		assertTrue((list == null) | (list.size() == 0));
//		fail("Not yet implemented");
	}

	public void _testDownloadAttachment() {
		fail("Not yet implemented");
	}

	public void _testQueryAttachment() {
		List<PTAttachment> list = iah.queryAttachment("dddd","0");
		
		assertNotNull(list);
		assertTrue(list.size() > 0);
//		fail("Not yet implemented");
	}

	public void _testUpdateAttachment() {
		List<PTAttachment> attach = new ArrayList<PTAttachment>();
		
		List<PTAttachment> list = iah.queryAttachment("dddd","0");
//		PTAttachment data = new PTAttachment();
		
//		((PTAttachment) attach).setBdid("dddd");
		((PTAttachment) attach).setFjbt("hhhhh");
		((PTAttachment) attach).setFjlx("zzzzz");
		
		PTAttachmentBlob b = new PTAttachmentBlob();
		b.setContent( new byte[]{2,2,2,2,2,2,2,2,2,2,2,2,2});
		((PTAttachment) attach).setBlob(b);
		iah.updateAttachment(attach);
		fail("Not yet implemented");
	}

	public void testUploadAttachment() {
		PTAttachment attach = new PTAttachment();
		attach.setBdid("WORD_TEMPLATE");
		attach.setFjbt("资产处置公告");
		attach.setYwjm("jic_zcczgg.doc");
		attach.setFjlx("5");
		attach.setDel(new Long(1));
		PTAttachmentBlob b = new PTAttachmentBlob();
		File file = new File("D:\\jic_zcczgg.doc");
		try {
			InputStream in = new FileInputStream(file);
			byte[] buffer = new byte[(int)file.length()];
            while (in.available() > 0) {
                int len = in.read(buffer);
            }
            b.setContent(buffer);
            in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		attach.setWjdx(file.length());
		attach.setWjlx("doc");
		attach.setTemplateid("manager_jic_zcczgg");
		attach.setBlob(b);
		iah.uploadAttachment(attach);
		assertNotNull(attach.getId());
	}

	
	public static void main(String [] args)
	{
		String bodyId[] = new String [2];
		String sql = "delete from COMMON_ACCORDING t where t.id in (" ;
	for(int i=0 ; i<bodyId.length;i++){
		
		
		if(i == bodyId.length-1){
			sql=sql+bodyId[i];
		}else{
			sql= sql+ bodyId[i]+",";
		}
			
		
	
	}	sql=sql+")";
		System.out.println(sql);
//		publicDao.updateBySql(sql, bodyId);
	}
}
