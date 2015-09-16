package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzDisposeTrack;
import com.tansun.eam2.common.model.orm.bo.CzDisposeTrackAdjunct;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.zccz.ZcczCommonImpl;
import com.tansun.eam2.zccz.ucc.IDisposeTrackUCC;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class DisposeTrackAction extends CommonAction  {

	@Autowired
	private IDisposeTrackUCC ucc;
	private CzDisposeTrack track;
	private CzDisposeTrackAdjunct adjunct;
	private CzAzryXx czAzryXx;
	private CzFysrMx fysrmx;
	private String zcIds;
	private String xmIds;
	private String zcCzfs;
	private String czgzhj;
	private String trackId;
	private String fsxxlx;
	private String message = "";
	private String adjuncts;
	private String pmwcgcs;
	private String azryId;
	private String jieduan;
	private String sheettype;
	/**
	 * 进入处置跟踪主页面
	 * @return
	 */
	public String newTrack(){
		sheettype = request.getParameter("sheettype");
		String returnStr = "";
		if(ZcczCommonImpl.DISPOSE_GKPM_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_GKPM_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_GKPM_MAIN,ZcczCommonImpl.getGKPMList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_JYSGP_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_JYSGP_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_JYSGP_MAIN,ZcczCommonImpl.getJYSGPList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_XYZR_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_XYZR_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_XYZR_MAIN,ZcczCommonImpl.getXYZRList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_CQ_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_CQ_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_CQ_MAIN,ZcczCommonImpl.getCQList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_PCZX_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_PCZX_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_PCZX_MAIN,ZcczCommonImpl.getPCZXList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_QSZX_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_QSZX_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_QSZX_MAIN,ZcczCommonImpl.getQSZXList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_GQZR_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_GQZR_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_GQZR_MAIN,ZcczCommonImpl.getGQZRList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_STRYAZ_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_STRYAZ_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_STRYAZ_MAIN,ZcczCommonImpl.getSTRYAZList(),zcIds,xmIds);
		}else if(ZcczCommonImpl.DISPOSE_ZXQK_TYPE.equals(zcCzfs)){
			returnStr = ZcczCommonImpl.DISPOSE_ZXQK_MAIN;
			String s = this.ucc.newTracks(ZcczCommonImpl.DISPOSE_ZXQK_MAIN,ZcczCommonImpl.getZXQKList(),zcIds,xmIds);
		}
		//request.setAttribute("trackId", trackId);
		request.setAttribute("zcCzfs", returnStr);
		request.setAttribute("sheettype", sheettype);
		return "tomodify";
	}

	/**
	 * 进入跟踪环节iframe
	 * @return
	 */
	public String newChildTrack(){
		//track = new CzDisposeTrack();
		//track.setCzgzhj(czgzhj);
		//track.setCzgzfs(zcCzfs);
		//ucc.save(track);
		trackId = track.getId();
		request.setAttribute("trackId", trackId);
		return "toChildmodify";
		
	}

	/**
	 * 进入跟踪环节iframe
	 * @return
	 */
	public String modifyChildTrack(){
		trackId = (String)request.getAttribute("trackId");
		if(trackId==null||"".equals(trackId)||"null".equals(trackId)||trackId.length()<1){
			if(zcIds.startsWith(",")){
				zcIds.substring(1);
			}
			if(xmIds.startsWith(",")){
				xmIds.substring(1);
			}
			String []zcids = zcIds.split(",");
			String []xmids = xmIds.split(",");
			List list = this.ucc.findCzDisposeTrackByType(zcids[0], xmids[0], czgzhj);
			track = (CzDisposeTrack) list.get(0);
		}else{
			track = this.ucc.findCzDisposeTrackById(trackId);
		}
		if(ZcczCommonImpl.getGKPMList().get(2).equals(czgzhj)){//当跟踪环节为公开拍卖的现场拍卖次数时
			String wcgpmcishu = this.ucc.findWcgpmcsAdjunctById(track.getId());//根据跟踪信息id得到未成功拍卖次数
			request.setAttribute("wcgpmcishu", wcgpmcishu);
			pmwcgcs = wcgpmcishu;
		}
		return czgzhj;
		
	}
	
	/**
	 * 修改处置跟踪
	 * @return
	 */
	public String modifyTrack(){
		zcCzfs = (String)request.getAttribute("zcCzfs");
		sheettype = (String) request.getAttribute("sheettype");
		//trackId = (String)request.getAttribute("trackId");
		//track = ucc.findCzDisposeTrackById(trackId);
		return zcCzfs;
	}
	
	/**
	 * 保存处置跟踪
	 * @return
	 */
	public String saveTrack(){
		if(track!=null){
			if(ZcczCommonImpl.getGKPMList().get(2).equals(czgzhj)){//当跟踪环节为公开拍卖的现场拍卖次数时
				String pmsfcg = track.getPmsfcg();
				if(!"true".equals(pmsfcg)){
					adjunct.setPmwcgcs(Long.valueOf(pmwcgcs)+1);
					adjunct.setTrackid(track.getId());
					adjunct.setFsxxlx(ZcczCommonImpl.DISPOSE_ADJUNCT_WCGPM);
					ucc.save(adjunct);
				}else{
					ucc.update(track);
				}
			}
			if(track.getId()!=null&&track.getId().length()>0){
				ucc.updateTracks(track,zcIds,xmIds);	
			}else{
				ucc.save(track);
			}
		}
		String wcgpmcishu = this.ucc.findWcgpmcsAdjunctById(track.getId());//根据跟踪信息id得到未成功拍卖次数
		request.setAttribute("wcgpmcishu", wcgpmcishu);
		pmwcgcs=wcgpmcishu;
		request.setAttribute("trackId", track.getId());
		return czgzhj;
	}

	/**
	 * 得到一拍，二拍，三拍的信息
	 * @return
	 */
	public String getPmxx(){
		String cishu = request.getParameter("cishu");
		String pmsfcg = request.getParameter("pmsfcg");
		String str = ucc.getPmxx(cishu,pmsfcg,trackId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询附属信息列表
	 * @return
	 */
	public String findAdjuncts(){
		String s = this.ucc.findAdjunctsJSONString1(trackId,fsxxlx,xmIds,jieduan,zcIds);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询附属信息列表
	 * @return
	 */
	public String findAdjuncts1(){
		String s = this.ucc.findAdjunctsJSONString(trackId,fsxxlx,xmIds,zcIds);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 进入附属信息
	 * @return
	 */
	public String newAdjunct(){
		czAzryXx = ucc.findCzAzryXxById(azryId);
//		message = "";
		adjunct = new CzDisposeTrackAdjunct();
		IUser user=UserThreadLocal.get();
		adjunct.setLrr(user.getUsername());
		adjunct.setLrrbh(user.getUserTidChar());
		adjunct.setLrrq(new Date());
		return "adjunct";
	}
	
	/**
	 * 保存附属信息
	 * @return
	 */
	public String saveAdjunct(){
	 
		if("fyzf".equals(fsxxlx)){//modify by lantianbo 2011-1-6
			CzAzryXx czAzryXx1 = ucc.findCzAzryXxById(czAzryXx.getId());
			czAzryXx1.setAzrysfqsst(czAzryXx.getAzrysfqsst());
			czAzryXx1.setAzrysffszc(czAzryXx.getAzrysffszc());
			czAzryXx1.setAzrystqsqkms(czAzryXx.getAzrystqsqkms());
			czAzryXx1.setFsjazfy(czAzryXx.getFsjazfy());
			czAzryXx1.setAzryzcjg(czAzryXx.getAzryzcjg());
			czAzryXx1.setAzryzcjieguo(czAzryXx.getAzryzcjieguo());
			this.ucc.update(czAzryXx1);
		}else if("jcldht".equals(fsxxlx)){//modify by lantianbo 2011-1-6
			CzAzryXx czAzryXx1 = ucc.findCzAzryXxById(czAzryXx.getId());
			czAzryXx1.setAzrysfqsazxy(czAzryXx.getAzrysfqsazxy());
			czAzryXx1.setAzryxyqsqkms(czAzryXx.getAzryxyqsqkms());
			this.ucc.update(czAzryXx1);
		}else if("skjn".equals(fsxxlx)||"fyjn".equals(fsxxlx)||"hkhs".equals(fsxxlx)){//modify by lantianbo 2011-1-8
			if(fysrmx.getId()!=null&&!"".equals(fysrmx.getId())){
				this.ucc.update(fysrmx);
			}else{
				fysrmx.setXmId(xmIds);
				fysrmx.setAzcid(zcIds);
				this.ucc.save(fysrmx);
			}
		}else{
			if(adjunct!=null){
				if(adjunct.getId()!=null&&adjunct.getId().length()>0){
					ucc.update(adjunct);	
					fsxxlx = adjunct.getFsxxlx();
				}else{
					adjunct.setTrackid(trackId);
					adjunct.setFsxxlx(fsxxlx);
					ucc.save(adjunct);
				}
			}
		}
		message = "保存成功！";
		return "adjunct";
	}
	
	/**
	 * 进入附属信息修改页面
	 * @return
	 */
	public String modifyAdjunct(){
		String returnStr = "";
		if(adjuncts!=null){
			if(adjuncts.startsWith(",")){
				adjuncts = adjuncts.substring(1);
			}
			if("skjn".equals(fsxxlx)||"fyjn".equals(fsxxlx)||"hkhs".equals(fsxxlx)){
				fysrmx = ucc.findCzFysrMxById(adjuncts);
			}else{
				adjunct = this.ucc.findCzDisposeTrackAdjunctById(adjuncts);
				fsxxlx = adjunct.getFsxxlx();
			}
		}
//		message = "";
		return "adjunct";
	}
	
	/**
	 * 删除附属信息
	 * @return
	 */
	public String deleteAdjunct(){
		if("skjn".equals(fsxxlx)||"fyjn".equals(fsxxlx)||"hkhs".equals(fsxxlx)){
			ucc.deleteCzFysrMxs(adjuncts);
		}else{
			ucc.deleteAdjuncts(adjuncts);
		}
		message="删除成功！";
		return null;
	}
	
	//*****************getter\setter*****************************
	public CzDisposeTrack getTrack() {
		return track;
	}

	public void setTrack(CzDisposeTrack track) {
		this.track = track;
	}

	public CzDisposeTrackAdjunct getAdjunct() {
		return adjunct;
	}

	public void setAdjunct(CzDisposeTrackAdjunct adjunct) {
		this.adjunct = adjunct;
	}

	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}

	public String getZcCzfs() {
		return zcCzfs;
	}

	public void setZcCzfs(String zcCzfs) {
		this.zcCzfs = zcCzfs;
	}

	public String getCzgzhj() {
		return czgzhj;
	}

	public void setCzgzhj(String czgzhj) {
		this.czgzhj = czgzhj;
	}

	public String getTrackId() {
		return trackId;
	}

	public void setTrackId(String trackId) {
		this.trackId = trackId;
	}

	public String getFsxxlx() {
		return fsxxlx;
	}

	public void setFsxxlx(String fsxxlx) {
		this.fsxxlx = fsxxlx;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getAdjuncts() {
		return adjuncts;
	}

	public void setAdjuncts(String adjuncts) {
		this.adjuncts = adjuncts;
	}

	public String getXmIds() {
		return xmIds;
	}

	public void setXmIds(String xmIds) {
		this.xmIds = xmIds;
	}

	public String getPmwcgcs() {
		return pmwcgcs;
	}

	public void setPmwcgcs(String pmwcgcs) {
		this.pmwcgcs = pmwcgcs;
	}

	public String getAzryId() {
		return azryId;
	}

	public void setAzryId(String azryId) {
		this.azryId = azryId;
	}

	public CzAzryXx getCzAzryXx() {
		return czAzryXx;
	}

	public void setCzAzryXx(CzAzryXx czAzryXx) {
		this.czAzryXx = czAzryXx;
	}
	
	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public CzFysrMx getFysrmx() {
		return fysrmx;
	}

	public void setFysrmx(CzFysrMx fysrmx) {
		this.fysrmx = fysrmx;
	}

	public String getJieduan() {
		return jieduan;
	}

	public void setJieduan(String jieduan) {
		this.jieduan = jieduan;
	}

}
