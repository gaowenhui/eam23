package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 实体基本信息 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StJbxx extends CommonBO implements Cloneable,
		java.io.Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6960370488389805900L;
	
	// Fields
	//ID
	private String id;
	//实体类型
	private String stlx;
	//资产编号
	private String zcbh;
	//实体性质
	private String stxz;
	//实体中文名称
	private String stzwmc;
	//实体英文名称
	private String stywmc;
	//经营分类
	private String jyfl;
	//行业
	private String CHangye;
	//实体状态
	private String CStzt;
	//省份
	private String CShengfen;
	//地级市
	private String CDijishi;
	//管理部门
	private String CGlbm;
	//委托管理机构
	private String CWtgljg;
	//法人代表
	private String frdb;
	//注册地址
	private String zcdz;
	//名义持有人
	private String mycyr;
	//总经理
	private String zjl;
	//营业执照号
	private String yezxh;
	//营业执照有效期
	private String yezzyxq;
	//税务登记编号
	private String swdjbh;
	//股票代码
	private String gpdm;
	//原建行投资日期
	private Date yjhtzrq;
	//原投资公司
	private String ytzgs;
	//账面投资(元)
	private String zmtz;
	//实际投资(元)
	private String sjtz;
	//联系人
	private String lxr;
	//传真
	private String chuanzhen;
	//联系电话
	private String lxdh;
	//主页地址
	private String zydz;
	//办公地址
	private String bgdz;
	//邮政编码
	private String yzbm;
	//电子邮箱
	private String dzyx;
	//经济性质
	private String jjxz;
	//主营业务
	private String zyyw;
	//兼营业务
	private String jyyw;
	//出资与工商年审情况
	private String czygsnsqk;
	//实体简介
	private String stjj;
	//成立时间
	private Date clsj;
	//实体现状
	private String stxz2;
	//尚有人员数
	private Long syrys;
	//有无历史遗留问题
	private String ywlsylwt;
	//历史遗留问题描述
	private String lsylwtms;
	//原值
	private Double yuanzhi;
	//净值
	private Double jingzhi;
	//减值准备
	private Double jzzb;
	//对建投是否有负债
	private String djtsfyfz;
	//负债金额
	private Double fzje;
	//账面内是否有预计负债
	private String zmnsfyyjfz;
	//预计负债金额
	private Double yjfzje;
	//账面资产总额
	private Double zmzcze;
	//账面资产负债
	private Double zmzcfz;
	//开户银行
	private String khyh;
	//资质情况
	private String zzqk;
	//备注
	private String beizhu;
	//状态
	private String xxzt;
//	//地区
//	private String area;
	//实际控制单位
	private String sjkzdw;
	//目前经营状态
	private String mqjyzt;

	//是否保存  1： 保存
	private String sfbc;
	
	//注册资金
	private String zczj;
	
	//处置方式
	private String CCzfs;	

	private String CZcqs;
	private String wtrmc;

	// Constructors

	/** default constructor */
	public StJbxx() {
	}
	public StJbxx clone(StJbxx sf){
		try {
			return (StJbxx) sf.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return null;
		}
	}
	/** full constructor */
	public StJbxx(String stlx, String zcbh, String stxz, String stzwmc,
			String stywmc, String jyfl, String CHangye, String CStzt,
			String CShengfen, String CDijishi, String CGlbm, String CWtgljg,
			String frdb, String zcdz, String mycyr, String zjl, String yezxh,
			String yezzyxq, String swdjbh, String gpdm, Date yjhtzrq,
			String ytzgs, String zmtz, String sjtz, String lxr,
			String chuanzhen, String lxdh, String zydz, String bgdz,
			String yzbm, String dzyx, String jjxz, String zyyw, String jyyw,
			String czygsnsqk, String stjj, Date clsj, String stxz2, Long syrys,
			String ywlsylwt, String lsylwtms, Double yuanzhi, Double jingzhi,
			Double jzzb, String djtsfyfz, Double fzje, String zmnsfyyjfz,
			Double yjfzje, Double zmzcze, Double zmzcfz, String khyh,
			String zzqk, String beizhu, String xxzt, String sjkzdw,
			String mqjyzt, String sfbc, String zczj, String CCzfs,
			String CZcqs, String wtrmc) {
		this.stlx = stlx;
		this.zcbh = zcbh;
		this.stxz = stxz;
		this.stzwmc = stzwmc;
		this.stywmc = stywmc;
		this.jyfl = jyfl;
		this.CHangye = CHangye;
		this.CStzt = CStzt;
		this.CShengfen = CShengfen;
		this.CDijishi = CDijishi;
		this.CGlbm = CGlbm;
		this.CWtgljg = CWtgljg;
		this.frdb = frdb;
		this.zcdz = zcdz;
		this.mycyr = mycyr;
		this.zjl = zjl;
		this.yezxh = yezxh;
		this.yezzyxq = yezzyxq;
		this.swdjbh = swdjbh;
		this.gpdm = gpdm;
		this.yjhtzrq = yjhtzrq;
		this.ytzgs = ytzgs;
		this.zmtz = zmtz;
		this.sjtz = sjtz;
		this.lxr = lxr;
		this.chuanzhen = chuanzhen;
		this.lxdh = lxdh;
		this.zydz = zydz;
		this.bgdz = bgdz;
		this.yzbm = yzbm;
		this.dzyx = dzyx;
		this.jjxz = jjxz;
		this.zyyw = zyyw;
		this.jyyw = jyyw;
		this.czygsnsqk = czygsnsqk;
		this.stjj = stjj;
		this.clsj = clsj;
		this.stxz2 = stxz2;
		this.syrys = syrys;
		this.ywlsylwt = ywlsylwt;
		this.lsylwtms = lsylwtms;
		this.yuanzhi = yuanzhi;
		this.jingzhi = jingzhi;
		this.jzzb = jzzb;
		this.djtsfyfz = djtsfyfz;
		this.fzje = fzje;
		this.zmnsfyyjfz = zmnsfyyjfz;
		this.yjfzje = yjfzje;
		this.zmzcze = zmzcze;
		this.zmzcfz = zmzcfz;
		this.khyh = khyh;
		this.zzqk = zzqk;
		this.beizhu = beizhu;
		this.xxzt = xxzt;
		this.sjkzdw = sjkzdw;
		this.mqjyzt = mqjyzt;
		this.sfbc = sfbc;
		this.zczj = zczj;
		this.CCzfs = CCzfs;
		this.CZcqs = CZcqs;
		this.wtrmc = wtrmc;
	}
	
	// Constructors
	
	public String setkhyhString(String[] khyh,String[] zh){
		StringBuffer sb = new StringBuffer();
		for(int i = 0 ; i<khyh.length ; i++){
			if((khyh[i] == null||"".equals(khyh[i]))&&(zh[i] == null||"".equals(zh[i]))){
			}else{
				if((khyh[i] == null||"".equals(khyh[i]))){
					khyh[i] = "&nbsp;";
				}
				if((zh[i] == null||"".equals(zh[i]))){
					zh[i] = "&nbsp;";
				}
				sb.append(khyh[i]).append("#,%,#").append(zh[i]);
				if(i < khyh.length -1){
					sb.append("<,#,>");
				}
			}
		}
		return sb.toString();
	}
	
	public String getkhyhString(String khyhs,String look){
		StringBuffer sb = new StringBuffer();
		if(!(khyhs == null || "".equals(khyhs))){
			String[] khyhStr = khyhs.split("<,#,>");
			for(String khyh : khyhStr){
				String[] khDetail = khyh.split("#,%,#");
				if(khDetail.length == 0)return "";
				sb.append("<tr>");
				sb.append("<td >");
				if(!("1".equals(look)))
				sb.append("<a href='#' onclick='myDeleteRow(this);return false;'>&nbsp;x&nbsp;</a>");
				sb.append("开户银行:").append("</td>");
				sb.append("<td>");
				sb.append("<input name='khyh' value='").append(khDetail[0]).append("'/></td>");
				sb.append("<td>").append("账户：").append("</td>");
				sb.append("<td>").append("<input name='zh' value='").append(khDetail[1]).append("'/></td></tr>");
			}
		}
		return sb.toString();
	}
	
	/**
	 * 资质情况
	 */
	public String setZzqkString(String[] zzmcArr , String[] stzzdjArr, String[] fzdwArr, String[] zzdqrqArr){
		StringBuffer SB = new StringBuffer();
		for(int i = 0;i < zzmcArr.length ;i++){
			if((zzmcArr[i]== null||"".equals(zzmcArr[i]))&&(stzzdjArr[i] == null||"".equals(stzzdjArr[i]))&&(fzdwArr[i] == null||"".equals(fzdwArr[i]))
					&&(zzdqrqArr[i] == null||"".equals(zzdqrqArr[i]))){
			}else{
				if(zzmcArr[i]==null||"".equals(zzmcArr[i])){
					SB.append("&nbsp;").append("#%#");	
				}else{
					SB.append(zzmcArr[i]).append("#%#");
				}
				if(stzzdjArr[i]==null||"".equals(stzzdjArr[i])){
					SB.append("&nbsp;").append("#%#");	
				}else{
					SB.append(stzzdjArr[i]).append("#%#");
				}
				if(fzdwArr[i]==null||"".equals(fzdwArr[i])){
					SB.append("&nbsp;").append("#%#");	
				}else{
					SB.append(fzdwArr[i]).append("#%#");	
				}
				if(zzdqrqArr[i]==null||"".equals(zzdqrqArr[i])){
					SB.append("&nbsp;").append("#%#");	
				}else{
					SB.append(zzdqrqArr[i]).append("#%#");	
				}
				if(i < zzmcArr.length-1)SB.append("<#>");
				
			}
		}
		return SB.toString();
	}
	
	public String getZzqkHtml(String zzqks,String look){
		StringBuffer sb = new StringBuffer();
		if(!(zzqks == null || "".equals(zzqks))){
			String[] zzqkArr = zzqks.split("<#>");
			for(String zzqk : zzqkArr){
				sb.append("<tr>");
				sb.append("<td>");
				if(!("1".equals(look)))
				sb.append("<a href='#' onClick='deleRow(this);return false;'>&nbsp;x&nbsp;</a>");
				String[] qkDetail = zzqk.split("#%#");
				if(qkDetail.length == 0)return "";
				sb.append("资质名称:").append("</td>");
				sb.append("<td>").append("<input name='zzmc' value='").append(qkDetail[0]).append("'/>").append("</td>");
				sb.append("<td>").append("实体资质等级:").append("</td>");
				sb.append("<td>").append("<input name='stzzdj' value='").append(qkDetail[1]).append("'/>").append("</td></tr>");
				sb.append("<tr><td>");
				if(!("1".equals(look)))sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
				sb.append("发证单位:").append("</td>");
				sb.append("<td>").append("<input name='fzdw' value='").append(qkDetail[2]).append("'/>").append("</td>");
				sb.append("<td>").append("资质到期日期:").append("</td>");
				sb.append("<td>").append("<input name='zzdqrq' value='").append(qkDetail[3]).append("'  readonly='true'/>").append("</td>");
				sb.append("</td></tr>");
			}
		}
		return sb.toString();
	}
	
//	public String getArea() {
//		return this.CShengfen + this.CDijishi;
//	}
//
//	public void setArea(String area) {
//		area = this.CShengfen + this.CDijishi;
//		this.area = area;
//	}
	
	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStlx() {
		return this.stlx;
	}

	public void setStlx(String stlx) {
		this.stlx = stlx;
	}

	public String getZcbh() {
		return this.zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getStxz() {
		return this.stxz;
	}

	public void setStxz(String stxz) {
		this.stxz = stxz;
	}

	public String getStzwmc() {
		return this.stzwmc;
	}

	public void setStzwmc(String stzwmc) {
		this.stzwmc = stzwmc;
	}

	public String getStywmc() {
		return this.stywmc;
	}

	public void setStywmc(String stywmc) {
		this.stywmc = stywmc;
	}

	public String getJyfl() {
		return this.jyfl;
	}

	public void setJyfl(String jyfl) {
		this.jyfl = jyfl;
	}

	public String getCHangye() {
		return this.CHangye;
	}

	public void setCHangye(String CHangye) {
		this.CHangye = CHangye;
	}

	public String getCStzt() {
		return this.CStzt;
	}

	public void setCStzt(String CStzt) {
		this.CStzt = CStzt;
	}

	public String getCShengfen() {
		return this.CShengfen;
	}

	public void setCShengfen(String CShengfen) {
		this.CShengfen = CShengfen;
	}

	public String getCDijishi() {
		return this.CDijishi;
	}

	public void setCDijishi(String CDijishi) {
		this.CDijishi = CDijishi;
	}

	public String getCGlbm() {
		return this.CGlbm;
	}

	public void setCGlbm(String CGlbm) {
		this.CGlbm = CGlbm;
	}

	public String getCWtgljg() {
		return this.CWtgljg;
	}

	public void setCWtgljg(String CWtgljg) {
		this.CWtgljg = CWtgljg;
	}

	public String getFrdb() {
		return this.frdb;
	}

	public void setFrdb(String frdb) {
		this.frdb = frdb;
	}

	public String getZcdz() {
		return this.zcdz;
	}

	public void setZcdz(String zcdz) {
		this.zcdz = zcdz;
	}

	public String getMycyr() {
		return this.mycyr;
	}

	public void setMycyr(String mycyr) {
		this.mycyr = mycyr;
	}

	public String getZjl() {
		return this.zjl;
	}

	public void setZjl(String zjl) {
		this.zjl = zjl;
	}

	public String getYezxh() {
		return this.yezxh;
	}

	public void setYezxh(String yezxh) {
		this.yezxh = yezxh;
	}

	public String getYezzyxq() {
		return this.yezzyxq;
	}

	public void setYezzyxq(String yezzyxq) {
		this.yezzyxq = yezzyxq;
	}

	public String getSwdjbh() {
		return this.swdjbh;
	}

	public void setSwdjbh(String swdjbh) {
		this.swdjbh = swdjbh;
	}

	public String getGpdm() {
		return this.gpdm;
	}

	public void setGpdm(String gpdm) {
		this.gpdm = gpdm;
	}

	public Date getYjhtzrq() {
		return this.yjhtzrq;
	}

	public void setYjhtzrq(Date yjhtzrq) {
		this.yjhtzrq = yjhtzrq;
	}

	public String getYtzgs() {
		return this.ytzgs;
	}

	public void setYtzgs(String ytzgs) {
		this.ytzgs = ytzgs;
	}

	public String getZmtz() {
		return this.zmtz;
	}

	public void setZmtz(String zmtz) {
		this.zmtz = zmtz;
	}

	public String getSjtz() {
		return this.sjtz;
	}

	public void setSjtz(String sjtz) {
		this.sjtz = sjtz;
	}

	public String getLxr() {
		return this.lxr;
	}

	public void setLxr(String lxr) {
		this.lxr = lxr;
	}

	public String getChuanzhen() {
		return this.chuanzhen;
	}

	public void setChuanzhen(String chuanzhen) {
		this.chuanzhen = chuanzhen;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getZydz() {
		return this.zydz;
	}

	public void setZydz(String zydz) {
		this.zydz = zydz;
	}

	public String getBgdz() {
		return this.bgdz;
	}

	public void setBgdz(String bgdz) {
		this.bgdz = bgdz;
	}

	public String getYzbm() {
		return this.yzbm;
	}

	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}

	public String getDzyx() {
		return this.dzyx;
	}

	public void setDzyx(String dzyx) {
		this.dzyx = dzyx;
	}

	public String getJjxz() {
		return this.jjxz;
	}

	public void setJjxz(String jjxz) {
		this.jjxz = jjxz;
	}

	public String getZyyw() {
		return this.zyyw;
	}

	public void setZyyw(String zyyw) {
		this.zyyw = zyyw;
	}

	public String getJyyw() {
		return this.jyyw;
	}

	public void setJyyw(String jyyw) {
		this.jyyw = jyyw;
	}

	public String getCzygsnsqk() {
		return this.czygsnsqk;
	}

	public void setCzygsnsqk(String czygsnsqk) {
		this.czygsnsqk = czygsnsqk;
	}

	public String getStjj() {
		return this.stjj;
	}

	public void setStjj(String stjj) {
		this.stjj = stjj;
	}

	public Date getClsj() {
		return this.clsj;
	}

	public void setClsj(Date clsj) {
		this.clsj = clsj;
	}

	public String getStxz2() {
		return this.stxz2;
	}

	public void setStxz2(String stxz2) {
		this.stxz2 = stxz2;
	}

	public Long getSyrys() {
		return this.syrys;
	}

	public void setSyrys(Long syrys) {
		this.syrys = syrys;
	}

	public String getYwlsylwt() {
		return this.ywlsylwt;
	}

	public void setYwlsylwt(String ywlsylwt) {
		this.ywlsylwt = ywlsylwt;
	}

	public String getLsylwtms() {
		return this.lsylwtms;
	}

	public void setLsylwtms(String lsylwtms) {
		this.lsylwtms = lsylwtms;
	}

	public Double getYuanzhi() {
		return this.yuanzhi;
	}

	public void setYuanzhi(Double yuanzhi) {
		this.yuanzhi = yuanzhi;
	}

	public Double getJingzhi() {
		return this.jingzhi;
	}

	public void setJingzhi(Double jingzhi) {
		this.jingzhi = jingzhi;
	}

	public Double getJzzb() {
		return this.jzzb;
	}

	public void setJzzb(Double jzzb) {
		this.jzzb = jzzb;
	}

	public String getDjtsfyfz() {
		return this.djtsfyfz;
	}

	public void setDjtsfyfz(String djtsfyfz) {
		this.djtsfyfz = djtsfyfz;
	}

	public Double getFzje() {
		return this.fzje;
	}

	public void setFzje(Double fzje) {
		this.fzje = fzje;
	}

	public String getZmnsfyyjfz() {
		return this.zmnsfyyjfz;
	}

	public void setZmnsfyyjfz(String zmnsfyyjfz) {
		this.zmnsfyyjfz = zmnsfyyjfz;
	}

	public Double getYjfzje() {
		return this.yjfzje;
	}

	public void setYjfzje(Double yjfzje) {
		this.yjfzje = yjfzje;
	}

	public Double getZmzcze() {
		return this.zmzcze;
	}

	public void setZmzcze(Double zmzcze) {
		this.zmzcze = zmzcze;
	}

	public Double getZmzcfz() {
		return this.zmzcfz;
	}

	public void setZmzcfz(Double zmzcfz) {
		this.zmzcfz = zmzcfz;
	}

	public String getKhyh() {
		return this.khyh;
	}

	public void setKhyh(String khyh) {
		
		this.khyh = khyh;
	}

	public String getZzqk() {
		return this.zzqk;
	}

	public void setZzqk(String zzqk) {
		this.zzqk = zzqk;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getXxzt() {
		return this.xxzt;
	}

	public void setXxzt(String xxzt) {
		this.xxzt = xxzt;
	}

	@Override
	public String getMid() {
		return this.id;
	}

	public String getSjkzdw() {
		return sjkzdw;
	}

	public void setSjkzdw(String sjkzdw) {
		this.sjkzdw = sjkzdw;
	}

	public String getMqjyzt() {
		return mqjyzt;
	}

	public void setMqjyzt(String mqjyzt) {
		this.mqjyzt = mqjyzt;
	}

	public String getSfbc() {
		return sfbc;
	}

	public void setSfbc(String sfbc) {
		this.sfbc = sfbc;
	}

	public String getZczj() {
		return zczj;
	}

	public void setZczj(String zczj) {
		this.zczj = zczj;
	}

	public String getCCzfs() {
		return CCzfs;
	}

	public void setCCzfs(String czfs) {
		CCzfs = czfs;
	}

	public String getCZcqs() {
		return CZcqs;
	}

	public void setCZcqs(String zcqs) {
		CZcqs = zcqs;
	}

	public String getWtrmc() {
		return wtrmc;
	}

	public void setWtrmc(String wtrmc) {
		this.wtrmc = wtrmc;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString()
	{
	    final String TAB = ",";
	    
	    String retValue = "";
	    
	    retValue = "StJbxx ( "
	        + super.toString() + TAB
	        + "id = " + this.id + TAB
	        + "stlx = " + this.stlx + TAB
	        + "zcbh = " + this.zcbh + TAB
	        + "stxz = " + this.stxz + TAB
	        + "stzwmc = " + this.stzwmc + TAB
	        + "stywmc = " + this.stywmc + TAB
	        + "jyfl = " + this.jyfl + TAB
	        + "CHangye = " + this.CHangye + TAB
	        + "CStzt = " + this.CStzt + TAB
	        + "CShengfen = " + this.CShengfen + TAB
	        + "CDijishi = " + this.CDijishi + TAB
	        + "CGlbm = " + this.CGlbm + TAB
	        + "CWtgljg = " + this.CWtgljg + TAB
	        + "frdb = " + this.frdb + TAB
	        + "zcdz = " + this.zcdz + TAB
	        + "mycyr = " + this.mycyr + TAB
	        + "zjl = " + this.zjl + TAB
	        + "yezxh = " + this.yezxh + TAB
	        + "yezzyxq = " + this.yezzyxq + TAB
	        + "swdjbh = " + this.swdjbh + TAB
	        + "gpdm = " + this.gpdm + TAB
	        + "yjhtzrq = " + this.yjhtzrq + TAB
	        + "ytzgs = " + this.ytzgs + TAB
	        + "zmtz = " + this.zmtz + TAB
	        + "sjtz = " + this.sjtz + TAB
	        + "lxr = " + this.lxr + TAB
	        + "chuanzhen = " + this.chuanzhen + TAB
	        + "lxdh = " + this.lxdh + TAB
	        + "zydz = " + this.zydz + TAB
	        + "bgdz = " + this.bgdz + TAB
	        + "yzbm = " + this.yzbm + TAB
	        + "dzyx = " + this.dzyx + TAB
	        + "jjxz = " + this.jjxz + TAB
	        + "zyyw = " + this.zyyw + TAB
	        + "jyyw = " + this.jyyw + TAB
	        + "czygsnsqk = " + this.czygsnsqk + TAB
	        + "stjj = " + this.stjj + TAB
	        + "clsj = " + this.clsj + TAB
	        + "stxz2 = " + this.stxz2 + TAB
	        + "syrys = " + this.syrys + TAB
	        + "ywlsylwt = " + this.ywlsylwt + TAB
	        + "lsylwtms = " + this.lsylwtms + TAB
	        + "yuanzhi = " + this.yuanzhi + TAB
	        + "jingzhi = " + this.jingzhi + TAB
	        + "jzzb = " + this.jzzb + TAB
	        + "djtsfyfz = " + this.djtsfyfz + TAB
	        + "fzje = " + this.fzje + TAB
	        + "zmnsfyyjfz = " + this.zmnsfyyjfz + TAB
	        + "yjfzje = " + this.yjfzje + TAB
	        + "zmzcze = " + this.zmzcze + TAB
	        + "zmzcfz = " + this.zmzcfz + TAB
	        + "khyh = " + this.khyh + TAB
	        + "zzqk = " + this.zzqk + TAB
	        + "beizhu = " + this.beizhu + TAB
	        + "xxzt = " + this.xxzt + TAB
	        + "sjkzdw = " + this.sjkzdw + TAB
	        + "mqjyzt = " + this.mqjyzt + TAB
	        + "sfbc = " + this.sfbc + TAB
	        + "zczj = " + this.zczj + TAB
	        + "CCzfs = " + this.CCzfs + TAB
	        + "CZcqs = " + this.CZcqs + TAB
	        + "wtrmc = " + this.wtrmc
	        + " )";
	
	    return retValue;
	}
	
	
}