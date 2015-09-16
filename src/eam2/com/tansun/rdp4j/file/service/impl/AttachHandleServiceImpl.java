package com.tansun.rdp4j.file.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.file.service.IAttachHandleService;

@Service
public class AttachHandleServiceImpl implements IAttachHandleService {
	@Autowired
	PublicDao publicDao;

	public void delAttachment(String[] id) {
		String strIDS = "";
		for (int i = 0; i < id.length; i++) {
			if (i == id.length - 1) {
				strIDS = strIDS + "'" + id[i] + "'";
			} else {
				strIDS = strIDS + "'" + id[i] + "',";
			}
		}
		String strSQL1 = "delete from p_t_attachment where ID in (" + strIDS
				+ ")";
		String strSQL2 = "delete from p_t_attachment_blob where ID in ("
				+ strIDS + ")";
		publicDao.getJdbcTemplate().execute(strSQL1);
		publicDao.getJdbcTemplate().execute(strSQL2);

	}

	@SuppressWarnings("unchecked")
	public List<PTAttachment> queryAttachment(String bdid, String fjlx,
			String... val) {
		int i = val != null ? val.length : 0;
		String[] str = new String[2 + i];
		str[0] = bdid;
		str[1] = fjlx;
		for (int j = 2; j < 2 + i; j++) {
			str[j] = val[j - 2];
		}
		return (List<PTAttachment>) publicDao.find(
				"From PTAttachment t where t.bdid= ? and t.fjlx=? "
						+ (val != null ? " and t.templateid=? " : ""), str);

	}

	@SuppressWarnings("unchecked")
	public List<PTAttachment> queryAttachment(String bdid, String fjlx) {
		List params = new ArrayList();
		params.add(bdid);
		params.add(fjlx);
		return (List<PTAttachment>) publicDao.find(
				"from PTAttachment t where t.bdid= ? and t.fjlx=? ", params);
	}

	public PTAttachment retriveAttachement(String id) {
		String[] str = new String[1];
		str[0] = id;
		return (PTAttachment) publicDao.findSingleResult(
				"from PTAttachment t where t.id = ?", str);

	}
	public PTAttachment retriveAttachementByBDIB(String id) {
		String[] str = new String[1];
		str[0] = id;
		return (PTAttachment) publicDao.findSingleResult(
				"from PTAttachment t where t.bdid = ?", str);

	}
	public PTAttachment retriveAttachementByBDIBFW(String id,String templateId) {
		String[] str = new String[2];
		str[0] = id;
		str[1] = templateId;
		return (PTAttachment) publicDao.findSingleResult(
				"from PTAttachment t where t.bdid = ? and t.templateid = ?", str);

	}
	public void updateAttachment(List<PTAttachment> attachs) {
		for (PTAttachment attach : attachs) {
			PTAttachment up = retriveAttachement(attach.getId());
			up.setBdid(attach.getBdid());
			up.setFjbt(attach.getFjbt());
			up.setFjlx(attach.getFjlx());
			up.setYwjm(attach.getYwjm());
			up.setWjdx(attach.getWjdx());
			up.setWjlx(attach.getWjlx());
			up.setScrid(attach.getScrid());
			up.setScrbh(attach.getScrbh());
			up.setScsj(attach.getScsj());
			up.setScbm(attach.getScbm());
			// 附件不提供修改up.setBlob(attach.getBlob());
			publicDao.updateAttach(up);
		}
	}

	public void uploadAttachment(PTAttachment attach) {
		publicDao.saveOrUpdateAttach(attach.getBlob());
		publicDao.saveOrUpdateAttach(attach);

	}

	public PTAttachmentBlob retriveAttachementblob(String id) {
		String[] str = new String[1];
		str[0] = id;
		return (PTAttachmentBlob) publicDao.findSingleResult(
				"from PTAttachmentBlob t where t.id = ?", str);
	}

	public void downAttachment(String[] str) {
		String strSQL = "update p_t_attachment  set sortid = sortid+1 where id='"
				+ str[0] + "'";
		publicDao.getJdbcTemplate().execute(strSQL);
	}

	public void upAttachment(String[] str) {
		String strSQL = "update p_t_attachment  set sortid = sortid-1 where id='"
				+ str[0] + "'";
		publicDao.getJdbcTemplate().execute(strSQL);
	}

	public void setOrder(String strId, String sortId) {
		String sql = "update P_T_Attachment set sortid='" + sortId
				+ "' where id='" + strId + "' ";
		try {
			publicDao.getJdbcTemplate().execute(sql);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}
	// 将临时表的附件改成正式表的附件，新的bdid ,新的附件类型。//update
	public void updateAttach(String oldbdid, String oldFileType,
			String newbdId, String newFileType) {
		String strSQL = "update p_t_attachment set bdid='" + newbdId
				+ "' , fjlx='" + newFileType + "' where bdid='" + oldbdid
				+ "' and fjlx='" + oldFileType + "' ";
		publicDao.getJdbcTemplate().execute(strSQL);
	}
	public void copyAttach(String oldbdid, String oldFileType, String newbdId,
			String newFileType) {
		List list = new ArrayList();
		String strIds = "";
		list = publicDao.queryForList(
				"select * from p_t_Attachment where fjlx='" + oldFileType
						+ "' and bdid='" + oldbdid + "' ", new ArrayList());
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				strIds = strIds + "," + map.get("ID");
			}
		}
		String[] ids = strIds.split(",");
		copyAttach1(ids, newbdId, newFileType);
	}
	private void copyAttach1(String[] ids, String newbdId, String newFileType) {
		System.out.println("newbdId:"+newbdId);
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids:"+ids);
			if (ids[i].length() == 32) {
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

	public void deleteAttachblobByBdid(String strBdid) {
		String strSQL = "delete  from p_t_attachment_blob where id in(select id from p_t_attachment where bdid='"
				+ strBdid + "')";
		publicDao.getJdbcTemplate().execute(strSQL);
	}

	public void deleteAttachByBdid(String strBdid, String fileType) {
		String strSQL = "delete  from p_t_attachment where  bdid='" + strBdid
				+ "' and fjlx='" + fileType + "'";
		publicDao.getJdbcTemplate().execute(strSQL);
	}
	public void save(PTAttachment attachment_new) {
		publicDao.save(attachment_new);
	}
}