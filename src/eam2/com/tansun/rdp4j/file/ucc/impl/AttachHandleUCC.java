package com.tansun.rdp4j.file.ucc.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.file.service.IAttachHandleService;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;

@Service
public class AttachHandleUCC implements IAttachHandleUCC {

	@Autowired
	IAttachHandleService attachHandleServiceImpl;
	@Autowired
	PublicDao publicDao;

	public void delAttachment(String[] id) {
		attachHandleServiceImpl.delAttachment(id);
	}

	private PTAttachment retriveAttachement(String id) {
		return attachHandleServiceImpl.retriveAttachement(id);
	}
	private PTAttachment retriveAttachementByBDIB(String id) {
		return attachHandleServiceImpl.retriveAttachementByBDIB(id);
	}
	private PTAttachment retriveAttachementByBDIBFW(String id,String templateId) {
		return attachHandleServiceImpl.retriveAttachementByBDIBFW(id,templateId);
	}
	private PTAttachmentBlob retriveAttachementblob(String id) {
		return attachHandleServiceImpl.retriveAttachementblob(id);
	}

	public PTAttachment downloadAttachment(String id) {
		return retriveAttachement(id);
	}
	public PTAttachment downloadAttachmentByBDIB(String id) {
		return retriveAttachementByBDIB(id);
	}
	public PTAttachment downloadAttachmentByBDIBFW(String id,String templateId) {
		return retriveAttachementByBDIBFW(id,templateId);
	}
	public List<PTAttachment> queryAttachment(String bdid, String fjlx,
			String... val) {

		return attachHandleServiceImpl.queryAttachment(bdid, fjlx, val);
	}

	public void updateAttachment(List<PTAttachment> attachs) {

		attachHandleServiceImpl.updateAttachment(attachs);
	}

	public void uploadAttachment(PTAttachment attach) {
		attachHandleServiceImpl.uploadAttachment(attach);

	}

	public void downAttachment(String[] str) {
		attachHandleServiceImpl.downAttachment(str);

	}

	public void upAttachment(String[] str) {
		attachHandleServiceImpl.upAttachment(str);

	}

	public void setOrder(String strId, String sortId) {
		attachHandleServiceImpl.setOrder(strId, sortId);
	}

	

	// 复制临时表的附件，成为正式附件
	public void updateAttach(String oldbdid, String oldFileType,
			String newbdId, String newFileType) {
		attachHandleServiceImpl.copyAttach(oldbdid, oldFileType, newbdId,
				newFileType);
	}

	public void deleteAttachblobByBdid(String strBdid) {
		attachHandleServiceImpl.deleteAttachblobByBdid(strBdid);
	}

	public void deleteAttachByBdid(String strBdid, String fileType) {
		attachHandleServiceImpl.deleteAttachByBdid(strBdid, fileType);
	}

	// public void copyAttach(String[] ids, String newbdId, String newFileType)
	// {
	// for (int i = 0; i < ids.length; i++) {
	// if(!isZzfj(ids[i])){
	// //System.out.println("=======非最终附件=====");
	// PTAttachment pTAttachment_old=finfById(ids[i]);
	// PTAttachment pTAttachment_new = new PTAttachment();// 新的附件对象
	// publicDao.save(pTAttachment_new);
	// PTAttachmentBlob pTAttachment_blob_new = new PTAttachmentBlob();//
	// 新的附件正文对象
	// // = publicDao.findById(PTAttachment.class,id);// 旧的正文对象
	// pTAttachment_blob_new.setContent(pTAttachment_old.getBlob().getContent());//
	// pTAttachment_new.setBdid(newbdId);// 设置新的表单ID
	// pTAttachment_new.setBlob(pTAttachment_blob_new);// 设置新的正文内容
	// pTAttachment_new.setFjlx(newFileType);
	// pTAttachment_new.setZzfj("0");
	// //BeanUtils.copyProperties(pTAttachment_old, pTAttachment_new,new
	// String[] { "id" });
	// publicDao.save(pTAttachment_new);// 保存新的附件
	// setZzfj(ids[i]);
	// }else{
	// //System.out.println("已经是最终附件");
	// }
	// }
	// }

	// 将临时表的附件改成正式表的附件，新的bdid ,新的附件类型。//update

	public void copyAttach(String oldbdid, String oldFileType, String newbdId,
			String newFileType) {
		List list = new ArrayList();
		String strIds="";
		list = publicDao.queryForList("select * from p_t_Attachment where fjlx='"+oldFileType+"' and bdid='"+oldbdid+"' ",
				new ArrayList());
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			strIds=strIds+","+map.get("ID");
		}
		String[] ids= strIds.split(",");
		copyAttach1(ids,newbdId,newFileType);
	}
	
	private void copyAttach1(String[] ids, String newbdId, String newFileType) {
		for (int i = 0; i < ids.length; i++) {
				Map map = getFilePropMap(ids[i]);
				PTAttachment pTAttachment_new = new PTAttachment();// 新的附件对象
				pTAttachment_new.setBdid(newbdId);// 设置新的表单ID
				pTAttachment_new.setFjlx("1");
				pTAttachment_new.setZzfj("0");
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setYwjm((String) map.get("YWJM"));
				pTAttachment_new.setWjlx((String) map.get("WJLX"));
				pTAttachment_new.setWjdx(new Long((String) map.get("WJDX")));
				pTAttachment_new.setScrid((String) map.get("SCRID"));
				pTAttachment_new.setScrbh((String) map.get("SCRBH"));
				pTAttachment_new.setScsj((String) map.get("SCSJ"));
				pTAttachment_new.setScbm((String) map.get("SCBM"));
				pTAttachment_new.setDel(new Long("0"));
				pTAttachment_new.setSwid((String) map.get("SWID"));
				pTAttachment_new.setTemplateid((String) map.get("TEMPLATEID"));
				pTAttachment_new.setSortid((String) map.get("SORTID"));
				pTAttachment_new.setZzfj((String) map.get("ZZFJ"));
				PTAttachmentBlob pTAttachment_blob_new = new PTAttachmentBlob();// 新的附件正文对象
				pTAttachment_new.setBlob(pTAttachment_blob_new);// 设置新的正文内容
				this.save(pTAttachment_new);// 保存新的附件
				String strId = pTAttachment_new.getId();
				copyBlob((String) map.get("ID"), strId);
				// System.out.println("新的附件的编号" + strId);
				//setZzfj(ids[i]);// 标识为最终附件
		}
	}
	
	public void copyAttach(String[] ids, String newbdId, String newFileType) {
		for (int i = 0; i < ids.length; i++) {
			if (!isZzfj(ids[i])) {
				Map map = getFilePropMap(ids[i]);
				PTAttachment pTAttachment_new = new PTAttachment();// 新的附件对象
				pTAttachment_new.setBdid(newbdId);// 设置新的表单ID
				pTAttachment_new.setFjlx("1");
				pTAttachment_new.setZzfj("0");
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setYwjm((String) map.get("YWJM"));
				pTAttachment_new.setWjlx((String) map.get("WJLX"));
				pTAttachment_new.setWjdx(new Long((String) map.get("WJDX")));
				pTAttachment_new.setScrid((String) map.get("SCRID"));
				pTAttachment_new.setScrbh((String) map.get("SCRBH"));
				pTAttachment_new.setScsj((String) map.get("SCSJ"));
				pTAttachment_new.setScbm((String) map.get("SCBM"));
				pTAttachment_new.setDel(new Long("0"));
				pTAttachment_new.setSwid((String) map.get("SWID"));
				pTAttachment_new.setTemplateid((String) map.get("TEMPLATEID"));
				pTAttachment_new.setSortid((String) map.get("SORTID"));
				pTAttachment_new.setZzfj((String) map.get("ZZFJ"));
				PTAttachmentBlob pTAttachment_blob_new = new PTAttachmentBlob();// 新的附件正文对象
				pTAttachment_new.setBlob(pTAttachment_blob_new);// 设置新的正文内容
				this.save(pTAttachment_new);// 保存新的附件
				String strId = pTAttachment_new.getId();
				copyBlob((String) map.get("ID"), strId);
				// System.out.println("新的附件的编号" + strId);
				setZzfj(ids[i]);// 标识为最终附件
			} else {
				// System.out.println("已经是最终附件");
			}
		}
	}

	private void copyBlob(String strOld, String strNew) {
		String strSQL = "update p_t_attachment_blob set content = (select content from p_t_attachment_blob where id = '"
				+ strOld + "') where id='" + strNew + "' ";
		publicDao.getJdbcTemplate().execute(strSQL);

	}

	private Map getFilePropMap(String strId) {
		String preparSQL = "select * from p_t_attachment where id= ? ";
		List params = new ArrayList();
		List listMap = new ArrayList();
		params.add(strId);
		listMap = publicDao.queryForList(preparSQL, params);
		Map map = (Map) listMap.get(0);
		return map;
	}

	public PTAttachment getAttach(String id) {
		PTAttachment pTAttachment = publicDao.findById(PTAttachment.class, id);
		return pTAttachment;
	}

	public boolean isZzfj(String strId) {
		List list = new ArrayList();
		String strSQL = "select zzfj from p_t_attachment where id= ? ";
		list.add(strId);
		Map map = (Map) publicDao.queryForList(strSQL, list).get(0);
		String strZZFJ = (String) map.get("ZZFJ");
		if ("0".equals(strZZFJ)) {
			return false;
		} else {
			return true;
		}
	}

	public void setZzfj(String id) {
		String strSQL = "update p_t_attachment set zzfj='1' where id='" + id
				+ "'";
		publicDao.getJdbcTemplate().execute(strSQL);
	}

	public PTAttachment finfById(String strId) {
		return attachHandleServiceImpl.retriveAttachement(strId);

	}

	public void save(PTAttachment attachment_new) {
		attachHandleServiceImpl.save(attachment_new);

	}

}