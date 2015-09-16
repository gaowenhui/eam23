package com.tansun.rdp4j.file.action;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.zccz.ucc.IAssetDealHeadUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.utils.ResponseUtil;
import com.tansun.rdp4j.file.FileCommon;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;

public class AttachHandleAction extends CommonAction implements FileCommon {
	public static final String FILE_OBJECTS = "FILE_OBJECTS";
	@Autowired
	IAttachHandleUCC attachHandleUcc;
	public File fileUpload;
	public String title;
	public String bdid;
	public String fileext;
	public String fileName;
	public String contentType;
	public String fileUploadFileName;
	public String fileUploadContentType;
	public String fjlx;
	@Autowired
	PublicDao publicDao;
	private PTAttachment ptattachment;
	private PTAttachmentBlob ptattachmentBlob;
	@Autowired
	private IAssetDealHeadUCC assetDealHeadUCCImpl;
	@Autowired
	IDeptUCC iDeptUCCimpl;
	public String intoUpload() {
		return "intoUpload";
	}

	public String uploadAttach() {
		ptattachment = new PTAttachment();
		try {
			ptattachment.setWjdx(fileUpload.length());
		} catch (Exception e) {
			return "file-exception";
		}
		IUser user = UserThreadLocal.get();
		ptattachment.setBdid(bdid);
		ptattachment.setFjlx(fjlx);
		ptattachment.setYwjm(fileUploadFileName);
		ptattachment.setWjlx(fileUploadFileName.substring(fileUploadFileName
				.lastIndexOf(".") + 1, fileUploadFileName.length()));
		ptattachment.setDel(new Long(0));
		ptattachment.setScrid("10");
		ptattachment.setScrbh(user.getUsername());
		ptattachment.setFjbt(title);
		ptattachment.setSortid(getSortId(bdid));
		ptattachment.setScsj(DateUtils.formatDate(new Date(),
				"yyyy-MM-dd HH:mm:ss"));
		ptattachment.setSessionid(request.getSession().getId());
		//System.out.println("============================="+ request.getSession().getId());
		List<PTDeptBO> list = iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			ptattachment.setScbm(dept.getRsvdStr1());
		}
		// System.out.println("===="+user.getDeptList().get(0).getDeptName());
		ptattachmentBlob = new PTAttachmentBlob();
		byte[] data = null;
		try {
			data = toByteArray(new FileInputStream(fileUpload));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ptattachmentBlob.setContent(data);
		ptattachment.setBlob(ptattachmentBlob);
		ptattachment.setZzfj("0");
		attachHandleUcc.uploadAttachment(ptattachment);
		if (!"1".equals(request.getParameter("type"))
				&& request.getParameter("type") != null) {
			request.setAttribute("urldown", request.getContextPath()
					+ "/file/file_download.do?id=" + ptattachment.getId());
			request.setAttribute("urldelete", request.getContextPath()
					+ "/file/file_deleAttach.do?id=" + ptattachment.getId());
			request.setAttribute("uuid", ptattachment.getId());
			request.setAttribute("filetype", ptattachment.getFjlx());
			String title = ptattachment.getYwjm();
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("title", title);
			// System.out.println(title);
			return "returnValue";
		}
		request.setAttribute("filetype", ptattachment.getFjlx());
		return "closewindow";
	}

	public String getSortId(String bdid) {
//		PTAttachment pTAttachment = new PTAttachment();
//		List params = new ArrayList();
//		params.add(bdid);
//		List<PTAttachment> listFile = (List<PTAttachment>) publicDao
//				.find(
//						"from  PTAttachment o where o.bdid = ?  order by o.sortid desc ",
//						params);
//		if (listFile.size() > 0) {
//			pTAttachment = (PTAttachment) listFile.get(0);
//			String sortid = "0";
//			try {
//				if (pTAttachment.getSortid() != null
//						&& !"null".equals(pTAttachment.getSortid())
//						&& !"".equals(pTAttachment.getSortid())) {
//					sortid = String.valueOf(Integer.parseInt(pTAttachment
//							.getSortid()) + 1);
//				}
//			} catch (NumberFormatException e) {
//				sortid = "0";
//			}
//			return sortid;
//		} else {
//			return "1";
//		}
		List params = new ArrayList();
		params.add(bdid);
		String sql = "update P_T_ATTACHMENT set sortid = sortid+1 where bdid = ?";
		publicDao.updateBySql(sql, params);
		return "0";
	}

	public String sortOrder() {
		String file_order1= request.getParameter("file_order1");
		String file_order2= request.getParameter("file_order2");
		if(file_order1!=null){
			String aaap[] =file_order1.split(",");
			String strid = aaap[0];
			String sortid = aaap[1];
			attachHandleUcc.setOrder(strid, sortid);
		}
		if(file_order2!=null){
			String aaap[] =file_order2.split(",");
			String strid = aaap[0];
			String sortid = aaap[1];
			attachHandleUcc.setOrder(strid, sortid);
		}
		return null;
	}

	public final static byte[] toByteArray(InputStream stream)
			throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		BufferedInputStream in = new BufferedInputStream(stream);
		byte[] buf = new byte[1024 * 64];
		int readed = 0;
		while (-1 != (readed = in.read(buf))) {
			out.write(buf, 0, readed);
		}
		in.close();
		out.close();
		return out.toByteArray();
	}

	public String deleAttach() {
		String str[] = request.getParameter("id").split(",");
		// System.out.println(str);
		attachHandleUcc.delAttachment(str);
		return "closewindow";
	}

	public String downAttach() {
		String str[] = request.getParameter("id").split(",");
		attachHandleUcc.downAttachment(str);
		return "closewindow";
	}

	public String upAttach() {
		String str[] = request.getParameter("id").split(",");
		attachHandleUcc.upAttachment(str);
		return "closewindow";
	}

	public String download() {
		String aid = request.getParameter("id");

		PTAttachment ptattachement = attachHandleUcc.downloadAttachment(aid);
		try {
			ResponseUtil.download(response, ptattachement.getBlob()
					.getContent(), ptattachement.getYwjm(),
					"application/x-msdownload");
		} catch (IOException e) {
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<PTAttachment> queryAttachment(String bdid, String fjlx,
			String zzfj) {
		List params = new ArrayList();
		params.add(bdid);
		List<PTAttachment> returnList = (List<PTAttachment>) publicDao
				.find(
						"from PTAttachment t where t.bdid= ? and fjlx='"
								+ fjlx
								+ "'   and zzfj='" + zzfj + "'  order by zzfj, scbm ,to_number(sortid) desc,scsj desc  ",//
						params);
		// 
		if (returnList == null) {
			return null;
		}
		return returnList;
	}

	@SuppressWarnings("unchecked")
	public List<PTAttachment> queryAttachment_HQ(String bdid, String fjlx) {
		List params = new ArrayList();
		params.add(bdid);
		List<PTAttachment> returnList = (List<PTAttachment>) publicDao
				.find(
						"from PTAttachment t where t.bdid= ? and fjlx='"
								+ fjlx
								+ "'  order by zzfj, scbm,to_number(sortid) asc ,scsj desc  ",//
						params);

		// System.out.println("=============from PTAttachment t where t.bdid= ?
		// and fjlx='"+ fjlx + "' order by to_number(sortid) asc ,scsj desc ");
		if (returnList == null) {
			return null;
		}
		return returnList;
	}

	@SuppressWarnings("unchecked")
	public List<PTAttachment> queryAttachment_HGSC(String bdid, String fjlx) {
		List params = new ArrayList();
		CzCztzfaXx czCztzfaXx = this.assetDealHeadUCCImpl.findHeadById(bdid);
		CzStcztz czStcztz = this.assetDealHeadUCCImpl.findHeadById1(bdid);
		
		Date fblsj = null;
		if(czCztzfaXx != null){
			fblsj = czCztzfaXx.getFblsj();
		}else if(czStcztz != null){
			fblsj = czStcztz.getFblsj();
		}
		
		params.add(bdid);
		params.add(fblsj);
		List<PTAttachment> returnList = (List<PTAttachment>) publicDao
				.find(
						"from PTAttachment t where t.bdid= ? and fjlx='"
								+ fjlx
								+ "' and scsj >= to_char(?,'yyyy-MM-dd hh24:mm:ss') order by zzfj, scbm,to_number(sortid) asc ,scsj desc  ",//
						params);

		if (returnList == null) {
			return null;
		}
		return returnList;
	}
	
	@SuppressWarnings("unchecked")
	public List<PTAttachment> queryAttachment_HQ_END(String bdid, String fjlx) {
		List params = new ArrayList();
		params.add(bdid);
		List<PTAttachment> returnList = (List<PTAttachment>) publicDao
				.find(
						"from PTAttachment t where t.bdid= ? and zzfj='1' and  fjlx='"
								+ fjlx
								+ "'  order by zzfj, scbm,to_number(sortid) asc ,scsj desc  ",//
						params);

		// System.out.println("=============from PTAttachment t where t.bdid= ?
		// and fjlx='"+ fjlx + "' order by to_number(sortid) asc ,scsj desc ");
		if (returnList == null) {
			return null;
		}
		return returnList;
	}
	public String up() {
		return null;
	}

	public String down() {
		return null;
	}

	public String queryFile() throws IOException {
		StringBuffer jsonString = new StringBuffer();

		List list = queryAttachment(bdid, fjlx, "0");
		jsonString.append("{");
		jsonString.append("\"total\":\"").append(list.size()).append("\",");
		jsonString.append("\"page\":\"").append(1).append("\",");
		jsonString.append("\"records\":\"").append(1).append("\",");
		jsonString.append("\"rows\":");
		jsonString.append("[");
		for (int i = 0; i < list.size(); i++) {
			jsonString.append("{");
			PTAttachment ptattachement = (PTAttachment) list.get(i);
			jsonString.append("\"idx\":\"" + ptattachement.getId() + "\",");
			jsonString.append("\"fjbt\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"scr\":\"" + ptattachement.getScrbh() + "\",");
			jsonString.append("\"scbm\":\"" + ptattachement.getScbm() + "\",");
			jsonString.append("\"scsj\":\"" + (ptattachement.getScsj()==null?"":ptattachement.getScsj().trim().length()==0?"":ptattachement.getScsj().trim()) + "\",");
			jsonString.append("\"ywjm\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"wjlx\":\"" + ptattachement.getWjlx() + "\",");
			jsonString.append("\"wjdx\":\"" + ptattachement.getWjdx() + "\",");
			jsonString.append("\"zzfj\":\"" + ptattachement.getZzfj() + "\",");
			jsonString.append("\"bdid\":\"" + ptattachement.getBdid() + "\",");
			jsonString.append("\"sortid\":\"" + ptattachement.getSortid() + "\",");
			jsonString.append("\"sessionid\":\"" + ptattachement.getSessionid() + "\",");
			jsonString.append("\"download\":\""
					+ "<a href='/eam2/file/file_download.do?id="
					+ ptattachement.getId() + "'>down</a></td>" + "\"");
			jsonString.append("}");
			if (i != (list.size() - 1)) {
				jsonString.append(",");
			}
		}
		jsonString.append("]}");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString.toString());
		return null;
	}
	
	
	public String isDaiban(){
		String cldid=request.getParameter("cldid");
		String userid=UserThreadLocal.get().getUserTid().toString();
		List params=new ArrayList();
		params.add(new Long(userid));
		params.add(cldid);
		
		response.setCharacterEncoding("UTF-8");
		try {
			if((publicDao.find("from PTTodo  where userId = ? and  statu='1'  and headId = ?  ", params).size())>0){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String queryFile_HQFJ() throws IOException {
		StringBuffer jsonString = new StringBuffer();
		String fjlx = this.request.getParameter("fjlx");
		if(fjlx == null){
			fjlx = "huiqian";
		}
		List list = queryAttachment_HQ(bdid, fjlx);
		jsonString.append("{");
		jsonString.append("\"total\":\"").append(list.size()).append("\",");
		jsonString.append("\"page\":\"").append(1).append("\",");
		jsonString.append("\"records\":\"").append(1).append("\",");
		jsonString.append("\"rows\":");
		jsonString.append("[");
		for (int i = 0; i < list.size(); i++) {
			jsonString.append("{");
			PTAttachment ptattachement = (PTAttachment) list.get(i);
			String strZzfj = ptattachement.getZzfj();
			strZzfj = ("1".equals(strZzfj)) ? "<input type='checkbox' id='checkfile' value='"
					+ ptattachement.getId() + "' checked disabled>   "
					: "<input type='checkbox' id='checkfile' value='"
							+ ptattachement.getId() + "' > ";
			jsonString.append("\"idx\":\"" + ptattachement.getId() + "\",");
			jsonString.append("\"fjbt\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"scr\":\"" + ptattachement.getScrbh() + "\",");
			jsonString.append("\"scbm\":\"" + ptattachement.getScbm() + "\",");
			jsonString.append("\"scsj\":\"" + ptattachement.getScsj() + "\",");
			jsonString.append("\"ywjm\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"wjlx\":\"" + ptattachement.getWjlx() + "\",");
			jsonString.append("\"wjdx\":\"" + ptattachement.getWjdx() + "\",");
			jsonString.append("\"bdid\":\"" + ptattachement.getBdid() + "\",");
			jsonString.append("\"sessionid\":\"" + ptattachement.getSessionid() + "\",");
			jsonString.append("\"zzfj\":\"" + strZzfj + "\",");
			jsonString.append("\"download\":\""
					+ "<a href='/eam2/file/file_download.do?id="
					+ ptattachement.getId() + "'>down</a></td>" + "\"");
			jsonString.append("}");
			if (i != (list.size() - 1)) {
				jsonString.append(",");
			}
		}
		jsonString.append("]}");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString.toString());
		return null;
	}

	
	public String queryFile_HQFJ_END() throws IOException {
		StringBuffer jsonString = new StringBuffer();
		String fjlx=request.getParameter("fjlx");
		List list = queryAttachment_HQ_END(bdid, fjlx);
		jsonString.append("{");
		jsonString.append("\"total\":\"").append(list.size()).append("\",");
		jsonString.append("\"page\":\"").append(1).append("\",");
		jsonString.append("\"records\":\"").append(1).append("\",");
		jsonString.append("\"rows\":");
		jsonString.append("[");
		for (int i = 0; i < list.size(); i++) {
			jsonString.append("{");
			PTAttachment ptattachement = (PTAttachment) list.get(i);
			String strZzfj = ptattachement.getZzfj();
			strZzfj = ("1".equals(strZzfj)) ? "<input type='checkbox' id='checkfile' value='"
					+ ptattachement.getId() + "' checked disabled>   "
					: "<input type='checkbox' id='checkfile' value='"
							+ ptattachement.getId() + "' > ";
			jsonString.append("\"idx\":\"" + ptattachement.getId() + "\",");
			jsonString.append("\"fjbt\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"scr\":\"" + ptattachement.getScrbh() + "\",");
			jsonString.append("\"scbm\":\"" + ptattachement.getScbm() + "\",");
			jsonString.append("\"scsj\":\"" + ptattachement.getScsj() + "\",");
			jsonString.append("\"ywjm\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"wjlx\":\"" + ptattachement.getWjlx() + "\",");
			jsonString.append("\"wjdx\":\"" + ptattachement.getWjdx() + "\",");
			jsonString.append("\"bdid\":\"" + ptattachement.getBdid() + "\",");
			jsonString.append("\"sessionid\":\"" + ptattachement.getSessionid() + "\",");
			jsonString.append("\"zzfj\":\"" + strZzfj + "\",");
			jsonString.append("\"download\":\""
					+ "<a href='/eam2/file/file_download.do?id="
					+ ptattachement.getId() + "'>down</a></td>" + "\"");
			jsonString.append("}");
			if (i != (list.size() - 1)) {
				jsonString.append(",");
			}
		}
		jsonString.append("]}");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString.toString());
		return null;
	}
	
	public String index() {
		request.setAttribute("biaodanid", "222");
		return "index";
	}

	public String selectOnefile() {
		return "selectOnefile";
	}

	public String selectfile() {
		return "selectfile";
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFjlx() {
		return fjlx;
	}

	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}

	public void copyAttach(String[] ids, String newbdId, String newFileType) {
		for (int i = 0; i < ids.length; i++) {
			if (!isZzfj(ids[i])) {
				StringBuffer sql  =new StringBuffer();
				String id = UUIDHexGenerator.getUUIDHex();
				sql.append("insert into p_t_attachment (ID,BDID,FJLX,FJBT,ZZFJ,YWJM,WJLX,SCRID,SCRBH,SCSJ,SCBM,DEL,SWID,TEMPLATEID,SORTID,SESSIONID)");
				sql.append("select '"+id+"' as id,'"+newbdId+"' as BDID ,'1' as FJLX ,FJBT,'1' as ZZFJ ,YWJM ,WJLX,SCRID,SCRBH,SCSJ,SCBM,DEL,SWID ,TEMPLATEID ,SORTID,SESSIONID from p_t_attachment where id= '"+ids[i]+"' ");
				publicDao.getJdbcTemplate().execute(sql.toString());
				String strSQL = "insert  into p_t_attachment_blob (ID,CONTENT)select '"+id+"' as id, content from p_t_attachment_blob where id ='"+ids[i] +"'";
				publicDao.getJdbcTemplate().execute(strSQL);
				String strupdateSQL = "update p_t_attachment set zzfj='1' where id='" + ids[i]+ "'";
				publicDao.getJdbcTemplate().execute(strupdateSQL);
				String WJDXSQL = "select WJDX FROM p_t_attachment  where id='" + ids[i]+ "'";
				Long  wjdx = publicDao.getJdbcTemplate().queryForLong(WJDXSQL);
				String updateSQL = "update p_t_attachment set WJDX='"+wjdx+"' where id='" + id+ "'";
				publicDao.getJdbcTemplate().execute(updateSQL);
//				Map map = getFilePropMap(ids[i]);
//				PTAttachment pTAttachment_new = new PTAttachment();// 閺傛壆娈戦梽鍕鐎电钖�
//				pTAttachment_new.setBdid(newbdId);// 鐠佸墽鐤嗛弬鎵畱鐞涖劌宕烮D
//				pTAttachment_new.setFjlx("1");
//				pTAttachment_new.setZzfj("0");
//				pTAttachment_new.setFjbt((String) map.get("FJBT"));
//				pTAttachment_new.setFjbt((String) map.get("FJBT"));
//				pTAttachment_new.setYwjm((String) map.get("YWJM"));
//				pTAttachment_new.setWjlx((String) map.get("WJLX"));
//				pTAttachment_new.setWjdx(new Long((String) map.get("WJDX")));
//				pTAttachment_new.setScrid((String) map.get("SCRID"));
//				pTAttachment_new.setScrbh((String) map.get("SCRBH"));
//				pTAttachment_new.setScsj((String) map.get("SCSJ"));
//				pTAttachment_new.setScbm((String) map.get("SCBM"));
//				pTAttachment_new.setDel(new Long("0"));
//				pTAttachment_new.setSwid((String) map.get("SWID"));
//				pTAttachment_new.setTemplateid((String) map.get("TEMPLATEID"));
//				pTAttachment_new.setSortid((String) map.get("SORTID"));
//				pTAttachment_new.setSessionid((String) map.get("SESSIONID"));
//				pTAttachment_new.setZzfj("1");// (String) map.get("ZZFJ")
//				PTAttachmentBlob pTAttachment_blob_new = new PTAttachmentBlob();// 閺傛壆娈戦梽鍕濮濓絾鏋冪�电钖�
//				pTAttachment_new.setBlob(pTAttachment_blob_new);// 鐠佸墽鐤嗛弬鎵畱濮濓絾鏋冮崘鍛啇
//				attachHandleUcc.save(pTAttachment_new);// 娣囨繂鐡ㄩ弬鎵畱闂勫嫪娆�
//				String strId = pTAttachment_new.getId();
//				copyBlob((String) map.get("ID"), strId);
//				// System.out.println("閺傛壆娈戦梽鍕閻ㄥ嫮绱崣锟�" + strId);
//				setZzfj(ids[i]);// 閺嶅洩鐦戞稉鐑樻付缂佸牓妾禒锟�
			} else {
				// System.out.println("瀹歌尙绮￠弰顖涙付缂佸牓妾禒锟�");
			}
		}
	}

	public PTAttachment getAttach(String id) {
		PTAttachment pTAttachment = publicDao.findById(PTAttachment.class, id);
		return pTAttachment;
	}

	public String isThisSession() {
		String strFileSessionId = request.getParameter("sessionid");
		if (strFileSessionId.equals(request.getSession().getId())) {
			return "true";
		} else {
			return "false";
		}
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
		return attachHandleUcc.finfById(strId);
	}

	public Map getFilePropMap(String strId) {
		String preparSQL = "select * from p_t_attachment where id= ? ";
		List params = new ArrayList();
		List listMap = new ArrayList();
		params.add(strId);
		listMap = publicDao.queryForList(preparSQL, params);
		Map map = (Map) listMap.get(0);
		return map;
	}

	public void copyBlob(String strOld, String strNew) {
		String strSQL = "update p_t_attachment_blob set content = (select content from p_t_attachment_blob where id = '"
				+ strOld + "') where id='" + strNew + "' ";
		publicDao.getJdbcTemplate().execute(strSQL);

	}

	public String copyFile2Form() {
		String strIds = request.getParameter("ids");
		if (strIds.startsWith(",")) {
			strIds = strIds.substring(1, strIds.length());
		}
		String strId[] = strIds.split(",");
		String strBdid_zz = request.getParameter("zzid");
		// System.out.println("鐏忓棜绻冪粙瀣娴犳儼娴嗛幑顤嶈礋缂傛牕褰挎稉鐚寸窗"+strBdid_zz+"閻ㄥ嫭娓剁紒鍫燁劀瀵繘妾禒锟�");
		copyAttach(strId, strBdid_zz, "1");
		return null;
	}

	/**
	 * 閸氬牊鍨氬锝嗘瀮娑擃厼濮╅幀浣瑰絹閸欐牞銆冮崡鏇熸瀮娴犺埖鐖ｆ０锟�
	 * 
	 * @return
	 */
	public String getFileList() {
		String strBDID = request.getParameter("bdid");
		List<PTAttachment> filelist = new ArrayList();
		List params = new ArrayList();
		params.add(strBDID);
		String preparHQL = "from PTAttachment o where o.bdid=? and o.fjlx='1' ";
		filelist = (List<PTAttachment>) publicDao.find(preparHQL, params);
		StringBuffer strReturn = new StringBuffer();
		if (filelist.size() == 0) {
			try {
				response.getWriter().write("");
			} catch (IOException e) {
			}
			return null;
		}
		for (int i = 0; i < filelist.size(); i++) {
			PTAttachment ptatt = filelist.get(i);
			strReturn.append((i + 1) + "." + ptatt.getFjbt());
			if (i != filelist.size() - 1) {
				strReturn.append(";^p^t   ");
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(strReturn.toString());
		} catch (IOException e) {
		}
		return null;
	}
	
	public void updateCanFileDel(){
		String strBDID=request.getParameter("bdid");
		String strSQL="update p_t_attachment set sessionid=''  where  bdid='"+strBDID+"'  and fjlx='1'";
		System.out.println("\n\n\n\n\n\n"+strSQL);
		publicDao.getJdbcTemplate().update(strSQL);
		
	}
	//============================閸氬牐顬冪�光剝鐓℃担璺ㄦ暏====================================================
	public String queryFile_HGSCFJ() throws IOException {
		StringBuffer jsonString = new StringBuffer();
		String fjlx = this.request.getParameter("fjlx");
		if(fjlx == null){
			fjlx = "huiqian";
		}
		List list = this.queryAttachment_HGSC(bdid, fjlx);
		jsonString.append("{");
		jsonString.append("\"total\":\"").append(list.size()).append("\",");
		jsonString.append("\"page\":\"").append(1).append("\",");
		jsonString.append("\"records\":\"").append(1).append("\",");
		jsonString.append("\"rows\":");
		jsonString.append("[");
		for (int i = 0; i < list.size(); i++) {
			jsonString.append("{");
			PTAttachment ptattachement = (PTAttachment) list.get(i);
			String strZzfj = ptattachement.getZzfj();
			strZzfj = ("1".equals(strZzfj)) ? "<input type='checkbox' id='checkfile' value='"
					+ ptattachement.getId() + "' checked disabled>   "
					: "<input type='checkbox' id='checkfile' value='"
							+ ptattachement.getId() + "' > ";
			jsonString.append("\"idx\":\"" + ptattachement.getId() + "\",");
			jsonString.append("\"fjbt\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"scr\":\"" + ptattachement.getScrbh() + "\",");
			jsonString.append("\"scbm\":\"" + ptattachement.getScbm() + "\",");
			jsonString.append("\"scsj\":\"" + ptattachement.getScsj() + "\",");
			jsonString.append("\"ywjm\":\"" + ptattachement.getFjbt() + "\",");
			jsonString.append("\"wjlx\":\"" + ptattachement.getWjlx() + "\",");
			jsonString.append("\"wjdx\":\"" + ptattachement.getWjdx() + "\",");
			jsonString.append("\"bdid\":\"" + ptattachement.getBdid() + "\",");
			jsonString.append("\"sessionid\":\"" + ptattachement.getSessionid() + "\",");
			jsonString.append("\"zzfj\":\"" + strZzfj + "\",");
			jsonString.append("\"download\":\""
					+ "<a href='/eam2/file/file_download.do?id="
					+ ptattachement.getId() + "'>down</a></td>" + "\"");
			jsonString.append("}");
			if (i != (list.size() - 1)) {
				jsonString.append(",");
			}
		}
		jsonString.append("]}");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString.toString());
		return null;
	}
	
	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getBdid() {
		return bdid;
	}

	public void setBdid(String bdid) {
		this.bdid = bdid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public IAssetDealHeadUCC getIAssetDealHeadUCCImpl() {
		return assetDealHeadUCCImpl;
	}

	public void setIAssetDealHeadUCCImpl(IAssetDealHeadUCC assetDealHeadUCCImpl) {
		this.assetDealHeadUCCImpl = assetDealHeadUCCImpl;
	}
}