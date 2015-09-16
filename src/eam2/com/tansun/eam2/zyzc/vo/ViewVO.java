package com.tansun.eam2.zyzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class ViewVO  extends CommonBO{
	private static final long serialVersionUID = 2832867592393465901L;
	
	private String zcId;	//资产Id
	private String yjflbm;	//一级分类编码
	private String ejflbm;  //二级分类编码
	private String sjflbm;  //三级分类编码
	private String yjflmc;  //一级分类名称
	private String ejflmc;  //二级分类名称
	private String sjflmc;  //三级分类名称
	private String zcbh;    //资产编号
	private String zcmc;    //资产名称
	private String kpbh;    //卡片编号
	private String txmbh;   //条形码编号
	private String xlh;     //序列号
	private int    sl;      //数量
	private String jldw;    //计量单位
	private String gg;      //规格
	private String zczt;    //资产状态
	private String yjkcsl;  //预警库存数量
	private String ztwz;    //编号粘贴位置
	private String bgdd;    //保管地点
	private Date   kssyrq;  //开始使用日期
	private String fdjbh;   //发动机编号
	private String ylrr;    //原系统录入人员
	private Double dzyhdj;  //单价
	private Double dzyhjg;  //价格
	private Date   cbrq;    //出保日期
	private String cpuxh;   //cpu型号
	private String memory;  //内存
	private String disk;    //硬盘
	private String nzdisk;  //内置硬盘
	private String xtxsq;   //系统显示器
	private Date   zjxgsj;  //最近修改时间
	private String sszg;    //所属账管
	private String zcbz;    //资产备注
	private Date   zjpdrq;  //最近盘点日期
	private Date   rkrq;    //入库日期
	private String lybmmc;  //领用部门名称
	private String jybmmc;  //借用人名称
	private String lyrmc;   //领用人名称
	private Date   rq;		//记录此条记录的日期
	private Date   lyrq;    //领用日期
	private Date   jydqrq;  //借用到期日期
	private String djlx;    //单据类型
	private String djh;     //单据号
	private String sfzxjl;  //是否最新记录
	private Date   ghsj;    //归还时间
	private String ghbh;    //归还编号
	private String tzzt;    //台账状态
	private String sfxj;    //是否续借
	private Double wxfy;	//维修费用
	private String tzbz;    //台账备注
	private Integer cksl;	//出库数量
	
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getYjflbm() {
		return yjflbm;
	}

	public void setYjflbm(String yjflbm) {
		this.yjflbm = yjflbm;
	}

	public String getEjflbm() {
		return ejflbm;
	}

	public void setEjflbm(String ejflbm) {
		this.ejflbm = ejflbm;
	}

	public String getSjflbm() {
		return sjflbm;
	}

	public void setSjflbm(String sjflbm) {
		this.sjflbm = sjflbm;
	}

	public String getYjflmc() {
		return yjflmc;
	}

	public void setYjflmc(String yjflmc) {
		this.yjflmc = yjflmc;
	}

	public String getEjflmc() {
		return ejflmc;
	}

	public void setEjflmc(String ejflmc) {
		this.ejflmc = ejflmc;
	}

	public String getSjflmc() {
		return sjflmc;
	}

	public void setSjflmc(String sjflmc) {
		this.sjflmc = sjflmc;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getKpbh() {
		return kpbh;
	}

	public void setKpbh(String kpbh) {
		this.kpbh = kpbh;
	}

	public String getTxmbh() {
		return txmbh;
	}

	public void setTxmbh(String txmbh) {
		this.txmbh = txmbh;
	}

	public String getXlh() {
		return xlh;
	}

	public void setXlh(String xlh) {
		this.xlh = xlh;
	}

	public String getJldw() {
		return jldw;
	}

	public void setJldw(String jldw) {
		this.jldw = jldw;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public String getYjkcsl() {
		return yjkcsl;
	}

	public void setYjkcsl(String yjkcsl) {
		this.yjkcsl = yjkcsl;
	}

	public String getZtwz() {
		return ztwz;
	}

	public void setZtwz(String ztwz) {
		this.ztwz = ztwz;
	}

	public String getBgdd() {
		return bgdd;
	}

	public void setBgdd(String bgdd) {
		this.bgdd = bgdd;
	}

	public Date getKssyrq() {
		return kssyrq;
	}

	public void setKssyrq(Date kssyrq) {
		this.kssyrq = kssyrq;
	}

	public String getFdjbh() {
		return fdjbh;
	}

	public void setFdjbh(String fdjbh) {
		this.fdjbh = fdjbh;
	}

	public String getYlrr() {
		return ylrr;
	}

	public void setYlrr(String ylrr) {
		this.ylrr = ylrr;
	}

	public Double getDzyhdj() {
		return dzyhdj;
	}

	public void setDzyhdj(Double dzyhdj) {
		this.dzyhdj = dzyhdj;
	}

	public Double getDzyhjg() {
		return dzyhjg;
	}

	public void setDzyhjg(Double dzyhjg) {
		this.dzyhjg = dzyhjg;
	}

	public Date getCbrq() {
		return cbrq;
	}

	public void setCbrq(Date cbrq) {
		this.cbrq = cbrq;
	}

	public String getCpuxh() {
		return cpuxh;
	}

	public void setCpuxh(String cpuxh) {
		this.cpuxh = cpuxh;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getDisk() {
		return disk;
	}

	public void setDisk(String disk) {
		this.disk = disk;
	}

	public String getNzdisk() {
		return nzdisk;
	}

	public void setNzdisk(String nzdisk) {
		this.nzdisk = nzdisk;
	}

	public String getXtxsq() {
		return xtxsq;
	}

	public void setXtxsq(String xtxsq) {
		this.xtxsq = xtxsq;
	}

	public Date getZjxgsj() {
		return zjxgsj;
	}

	public void setZjxgsj(Date zjxgsj) {
		this.zjxgsj = zjxgsj;
	}

	public String getSszg() {
		return sszg;
	}

	public void setSszg(String sszg) {
		this.sszg = sszg;
	}

	public String getZcbz() {
		return zcbz;
	}

	public void setZcbz(String zcbz) {
		this.zcbz = zcbz;
	}

	public Date getZjpdrq() {
		return zjpdrq;
	}

	public void setZjpdrq(Date zjpdrq) {
		this.zjpdrq = zjpdrq;
	}

	public Date getRkrq() {
		return rkrq;
	}

	public void setRkrq(Date rkrq) {
		this.rkrq = rkrq;
	}

	public String getLybmmc() {
		return lybmmc;
	}

	public void setLybmmc(String lybmmc) {
		this.lybmmc = lybmmc;
	}

	public String getJybmmc() {
		return jybmmc;
	}

	public void setJybmmc(String jybmmc) {
		this.jybmmc = jybmmc;
	}

	public String getLyrmc() {
		return lyrmc;
	}

	public void setLyrmc(String lyrmc) {
		this.lyrmc = lyrmc;
	}

	public Date getLyrq() {
		return lyrq;
	}

	public void setLyrq(Date lyrq) {
		this.lyrq = lyrq;
	}

	public Date getJydqrq() {
		return jydqrq;
	}

	public void setJydqrq(Date jydqrq) {
		this.jydqrq = jydqrq;
	}

	public String getDjlx() {
		return djlx;
	}

	public void setDjlx(String djlx) {
		this.djlx = djlx;
	}

	public String getDjh() {
		return djh;
	}

	public void setDjh(String djh) {
		this.djh = djh;
	}

	public String getSfzxjl() {
		return sfzxjl;
	}

	public void setSfzxjl(String sfzxjl) {
		this.sfzxjl = sfzxjl;
	}

	public Date getGhsj() {
		return ghsj;
	}

	public void setGhsj(Date ghsj) {
		this.ghsj = ghsj;
	}

	public String getGhbh() {
		return ghbh;
	}

	public void setGhbh(String ghbh) {
		this.ghbh = ghbh;
	}

	public String getTzzt() {
		return tzzt;
	}

	public void setTzzt(String tzzt) {
		this.tzzt = tzzt;
	}

	public String getSfxj() {
		return sfxj;
	}

	public void setSfxj(String sfxj) {
		this.sfxj = sfxj;
	}

	public String getTzbz() {
		return tzbz;
	}

	public void setTzbz(String tzbz) {
		this.tzbz = tzbz;
	}

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public Date getRq() {
		return rq;
	}

	public void setRq(Date rq) {
		this.rq = rq;
	}

	public Double getWxfy() {
		return wxfy;
	}

	public void setWxfy(Double wxfy) {
		this.wxfy = wxfy;
	}

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public Integer getCksl() {
		return cksl;
	}

	public void setCksl(Integer cksl) {
		this.cksl = cksl;
	}

}
