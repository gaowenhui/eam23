package com.tansun.rdp4j.file.service;

import java.util.List;

import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;

public interface IAttachHandleService {

	void delAttachment(String[] id);

	void uploadAttachment(PTAttachment attach);

	void updateAttachment(List<PTAttachment> attachs);

	List<PTAttachment> queryAttachment(String bdid, String fjlx, String... val);
	
	public List<PTAttachment> queryAttachment(String bdid, String fjlx);

	PTAttachment retriveAttachement(String id);
	PTAttachment retriveAttachementByBDIB(String id);
	PTAttachment retriveAttachementByBDIBFW(String id,String templateId);
	PTAttachmentBlob retriveAttachementblob(String id);

	void downAttachment(String[] str);

	void upAttachment(String[] str);

	void setOrder(String strId, String sortId);

	// 将临时表的附件改成正式表的附件，新的bdid ,新的附件类型。//update
	void updateAttach(String oldbdid, String oldFileType, String newbdId,
			String newFileType);

	// 将临时表的附件拷贝一份到正式表附件，并设置新的类型。//insert 操作
	public void copyAttach(String oldbdid, String oldFileType, String newbdId,
			String newFileType);
	// 根据表单ID删除已有的附件正文信息
	void deleteAttachblobByBdid(String strBdid);
	// 根据表单ID,表单类型删除已有的附件基本信息
	void deleteAttachByBdid(String strBdid,String fileType);

//	void copyAttach(PTAttachment pTAttachment_old, String newbdId, String newFileType);
//
	void save(PTAttachment attachment_new);
	
	
}
