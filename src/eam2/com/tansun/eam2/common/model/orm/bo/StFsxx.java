package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * 实体附属信息 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StFsxx extends com.tansun.rdp4j.common.web.vo.CommonBO implements Cloneable,
		java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3002179094133072306L;
	// Fields
	private String beizhu;
	//ID
	private String id;
	//类型
	private String leixing;
	//实体基本信息ID
	private String stid;
	//文件公章编号
	private String awjgzbh;
	//存放地点
	private String acfdd;
	//保管机构
	private String abgjg;
	//主要联系人
	private String azylxr;
	//联系方式
	private String alxfs;
	//存放内容
	private String acfnr;
	//报表编号
	private String dbbbh;
	//报表分类
	private String dcBbfl;
	//报表类型
	private String dcBblx;
	//行业类型
	private String dhylx;
	//报表日期
	private String dbbrq;
	//报表上船日期
	private String dbbscrq;
	//股东编号
	private String egdbh;
	//股东性质
	private String egdxz;
	//股东名称
	private String egdmc;
	//持股数量
	private String ecgsl;
	//持股比例
	private String ecgbl;
	//报告日期
	private Date ebgrq;
	//本部是否控股
	private String ebbsfkg;
	//人员编号
	private String frybh;
	//毕业时间
	private String fbysj;
	//执业资格情况
	private String fzyzgqk;
	//姓名
	private String fxingming;
	//性别
	private String fxingbie;
	//年龄
	private Long fnianling;
	//身份证号
	private String fsfzh;
	//婚姻状况
	private String fcHyzk;
	//民族
	private String fminzu;
	//籍贯
	private String fjiguan;
	//出生年月
	private Date fcsny;
	//职务
	private String fcZhiwu;
	//毕业学校
	private String fbyxx;
	//专业
	private String fzhuanye;
	//学历
	private String fcXueli;
	//手机
	private String fshouji;
	//家庭住址
	private String fjtzz;
	//邮政编码
	private String fyzbm;
	//单位电话
	private String fdianhua;
	//电子邮箱
	private String fdzyx;
	//任职时间
	private Date frzsj;
	//离职时间
	private Date flzsj;
	//收入
	private Double fshouru;
	//工资发放单位
	private String fgzffdw;
	//人员类型
	private String fcRylx;
	//档案存放单位
	private String fdacfdw;
	//移动电话
	private String fyddh;
	//固定电话
	private String fgddh;
	//人员类别
	private String fcRylb;
	//安置方式
	private String fazfs;
	//安置费用
	private String fazfy;
	//安置状态
	private String fazzt;
	//是否有安置协议
	private String fsfyazxy;
	//是否有收条
	private String fsfyst;
	//大事记编号
	private String gdsjbh;
	//大事发生日期
	private Date gdsfsrq;
	//事件类型
	private String gcSjlx;
	//大事内容
	private String gdsnr;
	//大事件备注
	private String gdsjbz;
	//现金编号
	private String hxjbh;
	//账户
	private String hzhanghu;
	//账户名称
	private String hzhmc;
	//金额
	private Double hjine;
	//土地编号
	private String jtdbh;
	//土地名称
	private String jtdmc;
	//土地取得方式
	private String jtdqdfs;
	//实际占有人
	private String jsjzyr;
	//土地使用权证
	private String jtdsyqz;
	//《土地使用权证》没有及下落不明的原因
	private String jxlbmyy;
	//土地是否抵押
	private String jtdsfdy;
	//土地抵押情况介绍
	private String jtddyqkjs;
	//土地面积
	private Double jtdmj;
	//土地使用权人
	private String jtdsyqr;
	//土地评估值（元）
	private Double jtdpgz;
	//变现额（元）
	private Double jbxe;
	//土地描述
	private String jtdms;
	//土地状态
	private String jtdzt;
	//土地处置方式
	private String jcCzfs;
	//房屋编号
	private String kfwbh;
	//房屋名称
	private String kfwmc;
	//房屋地址	
	private String kfwdz;
	//房屋所有权人
	private String kfwsyqr;
	//房屋取得方式
	private String kfwqdfs;
	//房屋实际占有人
	private String kfwsjzyr;
	//有无房屋使用权证
	private String kywfwsyqz;
	//《房屋使用权证》没有及下落不明的原因
	private String kxlbmyy;
	//房屋是否抵押
	private String ksfdy;
	//房屋抵押情况介绍
	private String kdyqk;
	//房屋面积（平方米）
	private Double kfwmj;
	//房屋使用权人
	private String ksyqr;
	//房屋评估值（元）
	private Double kfwpgz;
	//房屋变现额（元）
	private Double kfwbxe;
	//房屋描述
	private String kfwms;
	//资产状态
	private String kfwzt;
	//房屋处置方式
	private String kcCzfs;
	//交通工具编号
	private String ljtgjbh;
	//交通工具名称（车牌号）
	private String lcph;
	//交通工具存放何处
	private String ljtgjcfwz;
	//交通工具抵押情况介绍
	private String ldyjs;
	//交通工具权属
	private String lqs;
	//交通工具实际占有人
	private String lsjzyr;
	//交通工具是否抵押
	private String lsfdy;
	//交通工具评估值（元）
	private Double lpgz;
	//交通工具变现额（元）
	private Double lbxe;
	//交通运输工具描述
	private String ljtgjms;
	//交通工具资产状态
	private String ljtgjzt;
	//交通工具处置方式
	private String lcCzfs;
	//机器设备编号
	private String msbbh;
	//机器设备名称
	private String msbmc;
	//机器设备存放位置
	private String msbcfwz;
	//机器设备权属
	private String msbqs;
	//机器抵押情况介绍
	private String msbdyjs;
	//机器设备实际占有人
	private String msbsjzyr;
	//机器设备是否抵押
	private String msbsfdy;
	//机器设备评估值（元）
	private Double msbpgz;
	//机器设备变现额（元）
	private Double msbbxe;
	//机器设备描述
	private String msbms;
	//机器设备状态
	private String msbzt;
	//机器设备处置方式
	private String mcCzfs;
	//对外投资编号
	private String ndwtzbh;
	//被投资企业名称
	private String nbtqymc;
	//投资额(元)
	private Double ntze;
	//投资方式
	private String ntzfs;
	//投资情况描述
	private String ntzqkms;
	//其他资产编号
	private String pqtzcbh;
	//其他资产抵押情况介绍
	private String pdyjs;
	//其他资产名称
	private String pqtzcmc;
	//其他资产存放位置
	private String pqtzccfwz;
	//其他资产权属
	private String pqtzcqs;
	//其他资产实际占有人
	private String pqtzcsjzyr;
	//其他资产是否抵押
	private String pqtzcsfdy;
	//其他资产评估值（元）
	private Double ppgz;
	//其他资产变现额（元）
	private Double pbxe;
	//其他资产描述
	private String pzcms;
	//其他资产状态
	private String pzczt;
	//其他资产处置方式
	private String pcCzfs;
	//非咨询股东名称
	private String qgdmc;
	//控股比例
	private String qkgbl;
	//注册资本
	private String qzczb;
	//出资方式
	private String qcCzfs;
	//出资情况
	private String qcCzqk;
	//出资不实的数额
	private Double qczbsse;
	//抽逃出资
	private String qcCtcz;
	//抽逃数额
	private Double qctse;
	//独立法人资格
	private String qdlfrzg;
	//是否法人代表
	private Long fsffr;
	//实体内资产分类
	private String stnzcfl;
	//委托贷款ID
	private String cwdid;
	//贷款账号
	private String cdkzh;
	/**
	 * 是否保存    1 ：保存   
	 */
	private String sfbc;
	
	
	// Constructors

	public String getStnzcfl() {
		return stnzcfl;
	}

	public void setStnzcfl(String stnzcfl) {
		this.stnzcfl = stnzcfl;
	}

	public Long getFsffr() {
		return fsffr;
	}

	public void setFsffr(Long fsffr) {
		this.fsffr = fsffr;
	}

	/** default constructor */
	public StFsxx() {
	}

	/** full constructor */
	public StFsxx(String leixing, String stid, String awjgzbh, String acfdd,
			String abgjg, String azylxr, String alxfs, String acfnr,
			String dbbbh, String dcBbfl, String dcBblx, String dhylx,
			String dbbrq, String dbbscrq, String egdbh, String egdxz,
			String egdmc, String ecgsl, String ecgbl, Date ebgrq,
			String ebbsfkg, String frybh, String fzyzgqk, String fxingming,
			String fxingbie, Long fnianling, String fsfzh, String fcHyzk,
			String fminzu, String fjiguan, Date fcsny, String fcZhiwu,
			String fbyxx, String fzhuanye, String fcXueli, String fshouji,
			String fjtzz, String fyzbm, String fdianhua, String fdzyx,
			Date frzsj, Date flzsj, Double fshouru, String fgzffdw,
			String fcRylx, String fdacfdw, String fyddh, String fgddh,
			String fcRylb, String fazfs, String fazfy, String fazzt,
			String fsfyazxy, String fsfyst, String gdsjbh, Date gdsfsrq,
			String gcSjlx, String gdsnr, String gdsjbz, String hxjbh,
			String hzhanghu, String hzhmc, Double hjine, String jtdbh,
			String jtdmc, String jtdqdfs, String jsjzyr, String jtdsyqz,
			String jxlbmyy, String jtdsfdy, String jtddyqkjs, Double jtdmj,
			String jtdsyqr, Double jtdpgz, Double jbxe, String jtdms,
			String jtdzt, String jcCzfs, String kfwbh, String kfwmc,
			String kfwqdfs, String kfwsjzyr, String kywfwsyqz, String kxlbmyy,
			String ksfdy, String kdyqk, Double kfwmj, String ksyqr,
			Double kfwpgz, Double kfwbxe, String kfwms, String kfwzt,
			String kcCzfs, String ljtgjbh, String lcph, String ljtgjcfwz,
			String lqs, String lsjzyr, String lsfdy, Double lpgz, Double lbxe,
			String ljtgjms, String ljtgjzt, String lcCzfs, String msbbh,
			String msbmc, String msbcfwz, String msbqs, String msbsjzyr,
			String msbsfdy, Double msbpgz, Double msbbxe, String msbms,
			String msbzt, String mcCzfs, String ndwtzbh, String nbtqymc,
			Double ntze, String ntzfs, String ntzqkms, String pqtzcbh,
			String pqtzcmc, String pqtzccfwz, String pqtzcqs,
			String pqtzcsjzyr, String pqtzcsfdy, Double ppgz, Double pbxe,
			String pzcms, String pzczt, String pcCzfs, String qgdmc,
			String qkgbl, String qzczb, String qcCzfs, String qcCzqk,
			Double qczbsse, String qcCtcz, Double qctse, String qdlfrzg,Long fsffr,String stnzcfl,
			String kfwdz, String kfwsyqr,String msbdyjs,String ldyjs,String pdyjs ,String sfbc,
			String cwdid,String cdkzh) {
		this.leixing = leixing;
		this.stid = stid;
		this.awjgzbh = awjgzbh;
		this.acfdd = acfdd;
		this.abgjg = abgjg;
		this.azylxr = azylxr;
		this.alxfs = alxfs;
		this.acfnr = acfnr;
		this.dbbbh = dbbbh;
		this.dcBbfl = dcBbfl;
		this.dcBblx = dcBblx;
		this.dhylx = dhylx;
		this.dbbrq = dbbrq;
		this.dbbscrq = dbbscrq;
		this.egdbh = egdbh;
		this.egdxz = egdxz;
		this.egdmc = egdmc;
		this.ecgsl = ecgsl;
		this.ecgbl = ecgbl;
		this.ebgrq = ebgrq;
		this.ebbsfkg = ebbsfkg;
		this.frybh = frybh;
		this.fzyzgqk = fzyzgqk;
		this.fxingming = fxingming;
		this.fxingbie = fxingbie;
		this.fnianling = fnianling;
		this.fsfzh = fsfzh;
		this.fcHyzk = fcHyzk;
		this.fminzu = fminzu;
		this.fjiguan = fjiguan;
		this.fcsny = fcsny;
		this.fcZhiwu = fcZhiwu;
		this.fbyxx = fbyxx;
		this.fzhuanye = fzhuanye;
		this.fcXueli = fcXueli;
		this.fshouji = fshouji;
		this.fjtzz = fjtzz;
		this.fyzbm = fyzbm;
		this.fdianhua = fdianhua;
		this.fdzyx = fdzyx;
		this.frzsj = frzsj;
		this.flzsj = flzsj;
		this.fshouru = fshouru;
		this.fgzffdw = fgzffdw;
		this.fcRylx = fcRylx;
		this.fdacfdw = fdacfdw;
		this.fyddh = fyddh;
		this.fgddh = fgddh;
		this.fcRylb = fcRylb;
		this.fazfs = fazfs;
		this.fazfy = fazfy;
		this.fazzt = fazzt;
		this.fsfyazxy = fsfyazxy;
		this.fsfyst = fsfyst;
		this.gdsjbh = gdsjbh;
		this.gdsfsrq = gdsfsrq;
		this.gcSjlx = gcSjlx;
		this.gdsnr = gdsnr;
		this.gdsjbz = gdsjbz;
		this.hxjbh = hxjbh;
		this.hzhanghu = hzhanghu;
		this.hzhmc = hzhmc;
		this.hjine = hjine;
		this.jtdbh = jtdbh;
		this.jtdmc = jtdmc;
		this.jtdqdfs = jtdqdfs;
		this.jsjzyr = jsjzyr;
		this.jtdsyqz = jtdsyqz;
		this.jxlbmyy = jxlbmyy;
		this.jtdsfdy = jtdsfdy;
		this.jtddyqkjs = jtddyqkjs;
		this.jtdmj = jtdmj;
		this.jtdsyqr = jtdsyqr;
		this.jtdpgz = jtdpgz;
		this.jbxe = jbxe;
		this.jtdms = jtdms;
		this.jtdzt = jtdzt;
		this.jcCzfs = jcCzfs;
		this.kfwbh = kfwbh;
		this.kfwmc = kfwmc;
		this.kfwdz = kfwdz;
		this.kfwsyqr = kfwsyqr;
		this.kfwqdfs = kfwqdfs;
		this.kfwsjzyr = kfwsjzyr;
		this.kywfwsyqz = kywfwsyqz;
		this.kxlbmyy = kxlbmyy;
		this.ksfdy = ksfdy;
		this.kdyqk = kdyqk;
		this.kfwmj = kfwmj;
		this.ksyqr = ksyqr;
		this.kfwpgz = kfwpgz;
		this.kfwbxe = kfwbxe;
		this.kfwms = kfwms;
		this.kfwzt = kfwzt;
		this.kcCzfs = kcCzfs;
		this.ljtgjbh = ljtgjbh;
		this.lcph = lcph;
		this.ljtgjcfwz = ljtgjcfwz;
		this.lqs = lqs;
		this.ldyjs = ldyjs;
		this.lsjzyr = lsjzyr;
		this.lsfdy = lsfdy;
		this.lpgz = lpgz;
		this.lbxe = lbxe;
		this.ljtgjms = ljtgjms;
		this.ljtgjzt = ljtgjzt;
		this.lcCzfs = lcCzfs;
		this.msbbh = msbbh;
		this.msbmc = msbmc;
		this.msbdyjs = msbdyjs;
		this.msbcfwz = msbcfwz;
		this.msbqs = msbqs;
		this.msbsjzyr = msbsjzyr;
		this.msbsfdy = msbsfdy;
		this.msbpgz = msbpgz;
		this.msbbxe = msbbxe;
		this.msbms = msbms;
		this.msbzt = msbzt;
		this.mcCzfs = mcCzfs;
		this.ndwtzbh = ndwtzbh;
		this.nbtqymc = nbtqymc;
		this.ntze = ntze;
		this.ntzfs = ntzfs;
		this.ntzqkms = ntzqkms;
		this.pqtzcbh = pqtzcbh;
		this.pqtzcmc = pqtzcmc;
		this.pqtzccfwz = pqtzccfwz;
		this.pqtzcqs = pqtzcqs;
		this.pqtzcsjzyr = pqtzcsjzyr;
		this.pqtzcsfdy = pqtzcsfdy;
		this.ppgz = ppgz;
		this.pbxe = pbxe;
		this.pzcms = pzcms;
		this.pzczt = pzczt;
		this.pcCzfs = pcCzfs;
		this.pdyjs = pdyjs;
		this.qgdmc = qgdmc;
		this.qkgbl = qkgbl;
		this.qzczb = qzczb;
		this.qcCzfs = qcCzfs;
		this.qcCzqk = qcCzqk;
		this.qczbsse = qczbsse;
		this.qcCtcz = qcCtcz;
		this.qctse = qctse;
		this.qdlfrzg = qdlfrzg;
		this.fsffr = fsffr;
		this.stnzcfl = stnzcfl;
		this.sfbc = sfbc;
		this.cwdid = cwdid;
		this.cdkzh = cdkzh;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLeixing() {
		return this.leixing;
	}

	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}

	public String getStid() {
		return this.stid;
	}

	public void setStid(String stid) {
		this.stid = stid;
	}

	public String getAwjgzbh() {
		return this.awjgzbh;
	}

	public void setAwjgzbh(String awjgzbh) {
		this.awjgzbh = awjgzbh;
	}

	public String getAcfdd() {
		return this.acfdd;
	}

	public void setAcfdd(String acfdd) {
		this.acfdd = acfdd;
	}

	public String getAbgjg() {
		return this.abgjg;
	}

	public void setAbgjg(String abgjg) {
		this.abgjg = abgjg;
	}

	public String getAzylxr() {
		return this.azylxr;
	}

	public void setAzylxr(String azylxr) {
		this.azylxr = azylxr;
	}

	public String getAlxfs() {
		return this.alxfs;
	}

	public void setAlxfs(String alxfs) {
		this.alxfs = alxfs;
	}

	public String getAcfnr() {
		return this.acfnr;
	}

	public void setAcfnr(String acfnr) {
		this.acfnr = acfnr;
	}

	public String getDbbbh() {
		return this.dbbbh;
	}

	public void setDbbbh(String dbbbh) {
		this.dbbbh = dbbbh;
	}

	public String getDcBbfl() {
		return this.dcBbfl;
	}

	public void setDcBbfl(String dcBbfl) {
		this.dcBbfl = dcBbfl;
	}

	public String getDcBblx() {
		return this.dcBblx;
	}

	public void setDcBblx(String dcBblx) {
		this.dcBblx = dcBblx;
	}

	public String getDhylx() {
		return this.dhylx;
	}

	public void setDhylx(String dhylx) {
		this.dhylx = dhylx;
	}

	public String getDbbrq() {
		return this.dbbrq;
	}

	public void setDbbrq(String dbbrq) {
		this.dbbrq = dbbrq;
	}

	public String getEgdbh() {
		return this.egdbh;
	}

	public void setEgdbh(String egdbh) {
		this.egdbh = egdbh;
	}

	public String getEgdxz() {
		return this.egdxz;
	}

	public void setEgdxz(String egdxz) {
		this.egdxz = egdxz;
	}

	public String getEgdmc() {
		return this.egdmc;
	}

	public void setEgdmc(String egdmc) {
		this.egdmc = egdmc;
	}

	public String getEcgsl() {
		return this.ecgsl;
	}

	public void setEcgsl(String ecgsl) {
		this.ecgsl = ecgsl;
	}

	public String getEcgbl() {
		return this.ecgbl;
	}

	public void setEcgbl(String ecgbl) {
		this.ecgbl = ecgbl;
	}

	public Date getEbgrq() {
		return this.ebgrq;
	}

	public void setEbgrq(Date ebgrq) {
		this.ebgrq = ebgrq;
	}

	public String getEbbsfkg() {
		return this.ebbsfkg;
	}

	public void setEbbsfkg(String ebbsfkg) {
		this.ebbsfkg = ebbsfkg;
	}

	public String getFrybh() {
		return this.frybh;
	}

	public void setFrybh(String frybh) {
		this.frybh = frybh;
	}

	public String getFzyzgqk() {
		return this.fzyzgqk;
	}

	public void setFzyzgqk(String fzyzgqk) {
		this.fzyzgqk = fzyzgqk;
	}

	public String getFxingming() {
		return this.fxingming;
	}

	public void setFxingming(String fxingming) {
		this.fxingming = fxingming;
	}

	public String getFxingbie() {
		return this.fxingbie;
	}

	public void setFxingbie(String fxingbie) {
		this.fxingbie = fxingbie;
	}

	public Long getFnianling() {
		return this.fnianling;
	}

	public void setFnianling(Long fnianling) {
		this.fnianling = fnianling;
	}

	public String getFsfzh() {
		return this.fsfzh;
	}

	public void setFsfzh(String fsfzh) {
		this.fsfzh = fsfzh;
	}

	public String getFcHyzk() {
		return this.fcHyzk;
	}

	public void setFcHyzk(String fcHyzk) {
		this.fcHyzk = fcHyzk;
	}

	public String getFminzu() {
		return this.fminzu;
	}

	public void setFminzu(String fminzu) {
		this.fminzu = fminzu;
	}

	public String getFjiguan() {
		return this.fjiguan;
	}

	public void setFjiguan(String fjiguan) {
		this.fjiguan = fjiguan;
	}

	public Date getFcsny() {
		return this.fcsny;
	}

	public void setFcsny(Date fcsny) {
		this.fcsny = fcsny;
	}

	public String getFcZhiwu() {
		return this.fcZhiwu;
	}

	public void setFcZhiwu(String fcZhiwu) {
		this.fcZhiwu = fcZhiwu;
	}

	public String getFbyxx() {
		return this.fbyxx;
	}

	public void setFbyxx(String fbyxx) {
		this.fbyxx = fbyxx;
	}

	public String getFzhuanye() {
		return this.fzhuanye;
	}

	public void setFzhuanye(String fzhuanye) {
		this.fzhuanye = fzhuanye;
	}

	public String getFcXueli() {
		return this.fcXueli;
	}

	public void setFcXueli(String fcXueli) {
		this.fcXueli = fcXueli;
	}

	public String getFshouji() {
		return this.fshouji;
	}

	public void setFshouji(String fshouji) {
		this.fshouji = fshouji;
	}

	public String getFjtzz() {
		return this.fjtzz;
	}

	public void setFjtzz(String fjtzz) {
		this.fjtzz = fjtzz;
	}

	public String getFyzbm() {
		return this.fyzbm;
	}

	public void setFyzbm(String fyzbm) {
		this.fyzbm = fyzbm;
	}

	public String getFdianhua() {
		return this.fdianhua;
	}

	public void setFdianhua(String fdianhua) {
		this.fdianhua = fdianhua;
	}

	public String getFdzyx() {
		return this.fdzyx;
	}

	public void setFdzyx(String fdzyx) {
		this.fdzyx = fdzyx;
	}

	public Date getFrzsj() {
		return this.frzsj;
	}

	public void setFrzsj(Date frzsj) {
		this.frzsj = frzsj;
	}

	public Date getFlzsj() {
		return this.flzsj;
	}

	public void setFlzsj(Date flzsj) {
		this.flzsj = flzsj;
	}

	public Double getFshouru() {
		return this.fshouru;
	}

	public void setFshouru(Double fshouru) {
		this.fshouru = fshouru;
	}

	public String getFgzffdw() {
		return this.fgzffdw;
	}

	public void setFgzffdw(String fgzffdw) {
		this.fgzffdw = fgzffdw;
	}

	public String getFcRylx() {
		return this.fcRylx;
	}

	public void setFcRylx(String fcRylx) {
		this.fcRylx = fcRylx;
	}

	public String getFdacfdw() {
		return this.fdacfdw;
	}

	public void setFdacfdw(String fdacfdw) {
		this.fdacfdw = fdacfdw;
	}

	public String getFyddh() {
		return this.fyddh;
	}

	public void setFyddh(String fyddh) {
		this.fyddh = fyddh;
	}

	public String getFgddh() {
		return fgddh;
	}

	public void setFgddh(String fgddh) {
		this.fgddh = fgddh;
	}

	public String getFcRylb() {
		return this.fcRylb;
	}

	public void setFcRylb(String fcRylb) {
		this.fcRylb = fcRylb;
	}

	public String getFazfs() {
		return this.fazfs;
	}

	public void setFazfs(String fazfs) {
		this.fazfs = fazfs;
	}

	public String getFazfy() {
		return this.fazfy;
	}

	public void setFazfy(String fazfy) {
		this.fazfy = fazfy;
	}

	public String getFazzt() {
		return this.fazzt;
	}

	public void setFazzt(String fazzt) {
		this.fazzt = fazzt;
	}

	public String getFsfyazxy() {
		return this.fsfyazxy;
	}

	public void setFsfyazxy(String fsfyazxy) {
		this.fsfyazxy = fsfyazxy;
	}

	public String getFsfyst() {
		return this.fsfyst;
	}

	public void setFsfyst(String fsfyst) {
		this.fsfyst = fsfyst;
	}

	public String getGdsjbh() {
		return this.gdsjbh;
	}

	public void setGdsjbh(String gdsjbh) {
		this.gdsjbh = gdsjbh;
	}

	public Date getGdsfsrq() {
		return this.gdsfsrq;
	}

	public void setGdsfsrq(Date gdsfsrq) {
		this.gdsfsrq = gdsfsrq;
	}

	public String getGcSjlx() {
		return this.gcSjlx;
	}

	public void setGcSjlx(String gcSjlx) {
		this.gcSjlx = gcSjlx;
	}

	public String getGdsnr() {
		return this.gdsnr;
	}

	public void setGdsnr(String gdsnr) {
		this.gdsnr = gdsnr;
	}

	public String getGdsjbz() {
		return this.gdsjbz;
	}

	public void setGdsjbz(String gdsjbz) {
		this.gdsjbz = gdsjbz;
	}

	public String getHxjbh() {
		return this.hxjbh;
	}

	public void setHxjbh(String hxjbh) {
		this.hxjbh = hxjbh;
	}

	public String getHzhanghu() {
		return this.hzhanghu;
	}

	public void setHzhanghu(String hzhanghu) {
		this.hzhanghu = hzhanghu;
	}

	public String getHzhmc() {
		return this.hzhmc;
	}

	public void setHzhmc(String hzhmc) {
		this.hzhmc = hzhmc;
	}

	public Double getHjine() {
		return this.hjine;
	}

	public void setHjine(Double hjine) {
		this.hjine = hjine;
	}

	public String getJtdbh() {
		return this.jtdbh;
	}

	public void setJtdbh(String jtdbh) {
		this.jtdbh = jtdbh;
	}

	public String getJtdmc() {
		return this.jtdmc;
	}

	public void setJtdmc(String jtdmc) {
		this.jtdmc = jtdmc;
	}

	public String getJtdqdfs() {
		return this.jtdqdfs;
	}

	public void setJtdqdfs(String jtdqdfs) {
		this.jtdqdfs = jtdqdfs;
	}

	public String getJsjzyr() {
		return this.jsjzyr;
	}

	public void setJsjzyr(String jsjzyr) {
		this.jsjzyr = jsjzyr;
	}

	public String getJtdsyqz() {
		return this.jtdsyqz;
	}

	public void setJtdsyqz(String jtdsyqz) {
		this.jtdsyqz = jtdsyqz;
	}

	public String getJxlbmyy() {
		return this.jxlbmyy;
	}

	public void setJxlbmyy(String jxlbmyy) {
		this.jxlbmyy = jxlbmyy;
	}

	public String getJtdsfdy() {
		return this.jtdsfdy;
	}

	public void setJtdsfdy(String jtdsfdy) {
		this.jtdsfdy = jtdsfdy;
	}

	public String getJtddyqkjs() {
		return this.jtddyqkjs;
	}

	public void setJtddyqkjs(String jtddyqkjs) {
		this.jtddyqkjs = jtddyqkjs;
	}

	public Double getJtdmj() {
		return this.jtdmj;
	}

	public void setJtdmj(Double jtdmj) {
		this.jtdmj = jtdmj;
	}

	public String getJtdsyqr() {
		return this.jtdsyqr;
	}

	public void setJtdsyqr(String jtdsyqr) {
		this.jtdsyqr = jtdsyqr;
	}

	public Double getJtdpgz() {
		return this.jtdpgz;
	}

	public void setJtdpgz(Double jtdpgz) {
		this.jtdpgz = jtdpgz;
	}

	public Double getJbxe() {
		return this.jbxe;
	}

	public void setJbxe(Double jbxe) {
		this.jbxe = jbxe;
	}

	public String getJtdms() {
		return this.jtdms;
	}

	public void setJtdms(String jtdms) {
		this.jtdms = jtdms;
	}

	public String getJtdzt() {
		return this.jtdzt;
	}

	public void setJtdzt(String jtdzt) {
		this.jtdzt = jtdzt;
	}

	public String getJcCzfs() {
		return this.jcCzfs;
	}

	public void setJcCzfs(String jcCzfs) {
		this.jcCzfs = jcCzfs;
	}

	public String getKfwbh() {
		return this.kfwbh;
	}

	public void setKfwbh(String kfwbh) {
		this.kfwbh = kfwbh;
	}

	public String getKfwmc() {
		return this.kfwmc;
	}

	public void setKfwmc(String kfwmc) {
		this.kfwmc = kfwmc;
	}

	public String getKfwqdfs() {
		return this.kfwqdfs;
	}

	public void setKfwqdfs(String kfwqdfs) {
		this.kfwqdfs = kfwqdfs;
	}

	public String getKfwsjzyr() {
		return this.kfwsjzyr;
	}

	public void setKfwsjzyr(String kfwsjzyr) {
		this.kfwsjzyr = kfwsjzyr;
	}

	public String getKywfwsyqz() {
		return this.kywfwsyqz;
	}

	public void setKywfwsyqz(String kywfwsyqz) {
		this.kywfwsyqz = kywfwsyqz;
	}

	public String getKxlbmyy() {
		return this.kxlbmyy;
	}

	public void setKxlbmyy(String kxlbmyy) {
		this.kxlbmyy = kxlbmyy;
	}

	public String getKsfdy() {
		return this.ksfdy;
	}

	public void setKsfdy(String ksfdy) {
		this.ksfdy = ksfdy;
	}

	public String getKdyqk() {
		return this.kdyqk;
	}

	public void setKdyqk(String kdyqk) {
		this.kdyqk = kdyqk;
	}

	public Double getKfwmj() {
		return this.kfwmj;
	}

	public void setKfwmj(Double kfwmj) {
		this.kfwmj = kfwmj;
	}

	public String getKsyqr() {
		return this.ksyqr;
	}

	public void setKsyqr(String ksyqr) {
		this.ksyqr = ksyqr;
	}

	public Double getKfwpgz() {
		return this.kfwpgz;
	}

	public void setKfwpgz(Double kfwpgz) {
		this.kfwpgz = kfwpgz;
	}

	public Double getKfwbxe() {
		return this.kfwbxe;
	}

	public void setKfwbxe(Double kfwbxe) {
		this.kfwbxe = kfwbxe;
	}

	public String getKfwms() {
		return this.kfwms;
	}

	public void setKfwms(String kfwms) {
		this.kfwms = kfwms;
	}

	public String getKfwzt() {
		return this.kfwzt;
	}

	public void setKfwzt(String kfwzt) {
		this.kfwzt = kfwzt;
	}

	public String getKcCzfs() {
		return this.kcCzfs;
	}

	public void setKcCzfs(String kcCzfs) {
		this.kcCzfs = kcCzfs;
	}

	public String getLjtgjbh() {
		return this.ljtgjbh;
	}

	public void setLjtgjbh(String ljtgjbh) {
		this.ljtgjbh = ljtgjbh;
	}

	public String getLcph() {
		return this.lcph;
	}

	public void setLcph(String lcph) {
		this.lcph = lcph;
	}

	public String getLjtgjcfwz() {
		return this.ljtgjcfwz;
	}

	public void setLjtgjcfwz(String ljtgjcfwz) {
		this.ljtgjcfwz = ljtgjcfwz;
	}

	public String getLqs() {
		return this.lqs;
	}

	public void setLqs(String lqs) {
		this.lqs = lqs;
	}

	public String getLsjzyr() {
		return this.lsjzyr;
	}

	public void setLsjzyr(String lsjzyr) {
		this.lsjzyr = lsjzyr;
	}

	public String getLsfdy() {
		return this.lsfdy;
	}

	public void setLsfdy(String lsfdy) {
		this.lsfdy = lsfdy;
	}

	public Double getLpgz() {
		return this.lpgz;
	}

	public void setLpgz(Double lpgz) {
		this.lpgz = lpgz;
	}

	public Double getLbxe() {
		return this.lbxe;
	}

	public void setLbxe(Double lbxe) {
		this.lbxe = lbxe;
	}

	public String getLjtgjms() {
		return this.ljtgjms;
	}

	public void setLjtgjms(String ljtgjms) {
		this.ljtgjms = ljtgjms;
	}

	public String getLjtgjzt() {
		return this.ljtgjzt;
	}

	public void setLjtgjzt(String ljtgjzt) {
		this.ljtgjzt = ljtgjzt;
	}

	public String getLcCzfs() {
		return this.lcCzfs;
	}

	public void setLcCzfs(String lcCzfs) {
		this.lcCzfs = lcCzfs;
	}

	public String getMsbbh() {
		return this.msbbh;
	}

	public void setMsbbh(String msbbh) {
		this.msbbh = msbbh;
	}

	public String getMsbmc() {
		return this.msbmc;
	}

	public void setMsbmc(String msbmc) {
		this.msbmc = msbmc;
	}

	public String getMsbcfwz() {
		return this.msbcfwz;
	}

	public void setMsbcfwz(String msbcfwz) {
		this.msbcfwz = msbcfwz;
	}

	public String getMsbqs() {
		return this.msbqs;
	}

	public void setMsbqs(String msbqs) {
		this.msbqs = msbqs;
	}

	public String getMsbsjzyr() {
		return this.msbsjzyr;
	}

	public void setMsbsjzyr(String msbsjzyr) {
		this.msbsjzyr = msbsjzyr;
	}

	public String getMsbsfdy() {
		return this.msbsfdy;
	}

	public void setMsbsfdy(String msbsfdy) {
		this.msbsfdy = msbsfdy;
	}

	public Double getMsbpgz() {
		return this.msbpgz;
	}

	public void setMsbpgz(Double msbpgz) {
		this.msbpgz = msbpgz;
	}

	public Double getMsbbxe() {
		return this.msbbxe;
	}

	public void setMsbbxe(Double msbbxe) {
		this.msbbxe = msbbxe;
	}

	public String getMsbms() {
		return this.msbms;
	}

	public void setMsbms(String msbms) {
		this.msbms = msbms;
	}

	public String getMsbzt() {
		return this.msbzt;
	}

	public void setMsbzt(String msbzt) {
		this.msbzt = msbzt;
	}

	public String getMcCzfs() {
		return this.mcCzfs;
	}

	public void setMcCzfs(String mcCzfs) {
		this.mcCzfs = mcCzfs;
	}

	public String getNdwtzbh() {
		return this.ndwtzbh;
	}

	public void setNdwtzbh(String ndwtzbh) {
		this.ndwtzbh = ndwtzbh;
	}

	public String getNbtqymc() {
		return this.nbtqymc;
	}

	public void setNbtqymc(String nbtqymc) {
		this.nbtqymc = nbtqymc;
	}

	public Double getNtze() {
		return this.ntze;
	}

	public void setNtze(Double ntze) {
		this.ntze = ntze;
	}

	public String getNtzfs() {
		return this.ntzfs;
	}

	public void setNtzfs(String ntzfs) {
		this.ntzfs = ntzfs;
	}

	public String getNtzqkms() {
		return this.ntzqkms;
	}

	public void setNtzqkms(String ntzqkms) {
		this.ntzqkms = ntzqkms;
	}

	public String getPqtzcbh() {
		return this.pqtzcbh;
	}

	public void setPqtzcbh(String pqtzcbh) {
		this.pqtzcbh = pqtzcbh;
	}

	public String getPqtzcmc() {
		return this.pqtzcmc;
	}

	public void setPqtzcmc(String pqtzcmc) {
		this.pqtzcmc = pqtzcmc;
	}

	public String getPqtzccfwz() {
		return this.pqtzccfwz;
	}

	public void setPqtzccfwz(String pqtzccfwz) {
		this.pqtzccfwz = pqtzccfwz;
	}

	public String getPqtzcqs() {
		return this.pqtzcqs;
	}

	public void setPqtzcqs(String pqtzcqs) {
		this.pqtzcqs = pqtzcqs;
	}

	public String getPqtzcsjzyr() {
		return this.pqtzcsjzyr;
	}

	public void setPqtzcsjzyr(String pqtzcsjzyr) {
		this.pqtzcsjzyr = pqtzcsjzyr;
	}

	public String getPqtzcsfdy() {
		return this.pqtzcsfdy;
	}

	public void setPqtzcsfdy(String pqtzcsfdy) {
		this.pqtzcsfdy = pqtzcsfdy;
	}

	public Double getPpgz() {
		return this.ppgz;
	}

	public void setPpgz(Double ppgz) {
		this.ppgz = ppgz;
	}

	public Double getPbxe() {
		return this.pbxe;
	}

	public void setPbxe(Double pbxe) {
		this.pbxe = pbxe;
	}

	public String getPzcms() {
		return this.pzcms;
	}

	public void setPzcms(String pzcms) {
		this.pzcms = pzcms;
	}

	public String getPzczt() {
		return this.pzczt;
	}

	public void setPzczt(String pzczt) {
		this.pzczt = pzczt;
	}

	public String getPcCzfs() {
		return this.pcCzfs;
	}

	public void setPcCzfs(String pcCzfs) {
		this.pcCzfs = pcCzfs;
	}

	public String getQgdmc() {
		return this.qgdmc;
	}

	public void setQgdmc(String qgdmc) {
		this.qgdmc = qgdmc;
	}

	public String getQkgbl() {
		return this.qkgbl;
	}

	public void setQkgbl(String qkgbl) {
		this.qkgbl = qkgbl;
	}

	public String getQzczb() {
		return this.qzczb;
	}

	public void setQzczb(String qzczb) {
		this.qzczb = qzczb;
	}

	public String getQcCzfs() {
		return this.qcCzfs;
	}

	public void setQcCzfs(String qcCzfs) {
		this.qcCzfs = qcCzfs;
	}

	public String getQcCzqk() {
		return this.qcCzqk;
	}

	public void setQcCzqk(String qcCzqk) {
		this.qcCzqk = qcCzqk;
	}

	public Double getQczbsse() {
		return this.qczbsse;
	}

	public void setQczbsse(Double qczbsse) {
		this.qczbsse = qczbsse;
	}

	public String getQcCtcz() {
		return this.qcCtcz;
	}

	public void setQcCtcz(String qcCtcz) {
		this.qcCtcz = qcCtcz;
	}

	public Double getQctse() {
		return this.qctse;
	}

	public void setQctse(Double qctse) {
		this.qctse = qctse;
	}

	public String getQdlfrzg() {
		return this.qdlfrzg;
	}

	public void setQdlfrzg(String qdlfrzg) {
		this.qdlfrzg = qdlfrzg;
	}

	@Override
	public String getMid() {
		return this.id;
	}

	@Override
	public String toString() {
		return " 实体附属信息:StFsxx [id=" + id + ", leixing=" + leixing + ", stid=" + stid
				+ ", awjgzbh=" + awjgzbh + ", acfdd=" + acfdd + ", abgjg="
				+ abgjg + ", azylxr=" + azylxr + ", alxfs=" + alxfs
				+ ", acfnr=" + acfnr + ", dbbbh=" + dbbbh + ", dcBbfl="
				+ dcBbfl + ", dcBblx=" + dcBblx + ", dhylx=" + dhylx
				+ ", dbbrq=" + dbbrq + ", dbbscrq=" + dbbscrq + ", egdbh="
				+ egdbh + ", egdxz=" + egdxz + ", egdmc=" + egdmc + ", ecgsl="
				+ ecgsl + ", ecgbl=" + ecgbl + ", ebgrq=" + ebgrq
				+ ", ebbsfkg=" + ebbsfkg + ", frybh=" + frybh + ", fzyzgqk="
				+ fzyzgqk + ", fxingming=" + fxingming + ", fxingbie="
				+ fxingbie + ", fnianling=" + fnianling + ", fsfzh=" + fsfzh
				+ ", fcHyzk=" + fcHyzk + ", fminzu=" + fminzu + ", fjiguan="
				+ fjiguan + ", fcsny=" + fcsny + ", fcZhiwu=" + fcZhiwu
				+ ", fbyxx=" + fbyxx + ", fzhuanye=" + fzhuanye + ", fcXueli="
				+ fcXueli + ", fshouji=" + fshouji + ", fjtzz=" + fjtzz
				+ ", fyzbm=" + fyzbm + ", fdianhua=" + fdianhua + ", fdzyx="
				+ fdzyx + ", frzsj=" + frzsj + ", flzsj=" + flzsj
				+ ", fshouru=" + fshouru + ", fgzffdw=" + fgzffdw + ", fcRylx="
				+ fcRylx + ", fdacfdw=" + fdacfdw + ", fyddh=" + fyddh
				+ ", fgddh=" + fgddh + ", fcRylb=" + fcRylb + ", fazfs="
				+ fazfs + ", fazfy=" + fazfy + ", fazzt=" + fazzt
				+ ", fsfyazxy=" + fsfyazxy + ", fsfyst=" + fsfyst + ", gdsjbh="
				+ gdsjbh + ", gdsfsrq=" + gdsfsrq + ", gcSjlx=" + gcSjlx
				+ ", gdsnr=" + gdsnr + ", gdsjbz=" + gdsjbz + ", hxjbh="
				+ hxjbh + ", hzhanghu=" + hzhanghu + ", hzhmc=" + hzhmc
				+ ", hjine=" + hjine + ", jtdbh=" + jtdbh + ", jtdmc=" + jtdmc
				+ ", jtdqdfs=" + jtdqdfs + ", jsjzyr=" + jsjzyr + ", jtdsyqz="
				+ jtdsyqz + ", jxlbmyy=" + jxlbmyy + ", jtdsfdy=" + jtdsfdy
				+ ", jtddyqkjs=" + jtddyqkjs + ", jtdmj=" + jtdmj
				+ ", jtdsyqr=" + jtdsyqr + ", jtdpgz=" + jtdpgz + ", jbxe="
				+ jbxe + ", jtdms=" + jtdms + ", jtdzt=" + jtdzt + ", jcCzfs="
				+ jcCzfs + ", kfwbh=" + kfwbh + ", kfwmc=" + kfwmc
				+ ", kfwqdfs=" + kfwqdfs + ", kfwsjzyr=" + kfwsjzyr
				+ ", kywfwsyqz=" + kywfwsyqz + ", kxlbmyy=" + kxlbmyy
				+ ", ksfdy=" + ksfdy + ", kdyqk=" + kdyqk + ", kfwmj=" + kfwmj
				+ ", ksyqr=" + ksyqr + ", kfwpgz=" + kfwpgz + ", kfwbxe="
				+ kfwbxe + ", kfwms=" + kfwms + ", kfwzt=" + kfwzt
				+ ", kcCzfs=" + kcCzfs + ", ljtgjbh=" + ljtgjbh + ", lcph="
				+ lcph + ", ljtgjcfwz=" + ljtgjcfwz + ", lqs=" + lqs
				+ ", lsjzyr=" + lsjzyr + ", lsfdy=" + lsfdy + ", lpgz=" + lpgz
				+ ", lbxe=" + lbxe + ", ljtgjms=" + ljtgjms + ", ljtgjzt="
				+ ljtgjzt + ", lcCzfs=" + lcCzfs + ", msbbh=" + msbbh
				+ ", msbmc=" + msbmc + ", msbcfwz=" + msbcfwz + ", msbqs="
				+ msbqs + ", msbsjzyr=" + msbsjzyr + ", msbsfdy=" + msbsfdy
				+ ", msbpgz=" + msbpgz + ", msbbxe=" + msbbxe + ", msbms="
				+ msbms + ", msbzt=" + msbzt + ", mcCzfs=" + mcCzfs
				+ ", ndwtzbh=" + ndwtzbh + ", nbtqymc=" + nbtqymc + ", ntze="
				+ ntze + ", ntzfs=" + ntzfs + ", ntzqkms=" + ntzqkms
				+ ", pqtzcbh=" + pqtzcbh + ", pqtzcmc=" + pqtzcmc
				+ ", pqtzccfwz=" + pqtzccfwz + ", pqtzcqs=" + pqtzcqs
				+ ", pqtzcsjzyr=" + pqtzcsjzyr + ", pqtzcsfdy=" + pqtzcsfdy
				+ ", ppgz=" + ppgz + ", pbxe=" + pbxe + ", pzcms=" + pzcms
				+ ", pzczt=" + pzczt + ", pcCzfs=" + pcCzfs + ", qgdmc="
				+ qgdmc + ", qkgbl=" + qkgbl + ", qzczb=" + qzczb + ", qcCzfs="
				+ qcCzfs + ", qcCzqk=" + qcCzqk + ", qczbsse=" + qczbsse
				+ ", qcCtcz=" + qcCtcz + ", qctse=" + qctse + ", qdlfrzg="
				+ qdlfrzg + ", stnzcfl=" + stnzcfl + "]";
	}

	public String getFbysj() {
		return fbysj;
	}

	public void setFbysj(String fbysj) {
		this.fbysj = fbysj;
	}

	public String getDbbscrq() {
		return dbbscrq;
	}

	public void setDbbscrq(String dbbscrq) {
		this.dbbscrq = dbbscrq;
	}

	public String getKfwdz() {
		return kfwdz;
	}

	public void setKfwdz(String kfwdz) {
		this.kfwdz = kfwdz;
	}

	public String getKfwsyqr() {
		return kfwsyqr;
	}

	public void setKfwsyqr(String kfwsyqr) {
		this.kfwsyqr = kfwsyqr;
	}

	public String getLdyjs() {
		return ldyjs;
	}

	public void setLdyjs(String ldyjs) {
		this.ldyjs = ldyjs;
	}

	public String getMsbdyjs() {
		return msbdyjs;
	}

	public void setMsbdyjs(String msbdyjs) {
		this.msbdyjs = msbdyjs;
	}

	public String getPdyjs() {
		return pdyjs;
	}

	public void setPdyjs(String pdyjs) {
		this.pdyjs = pdyjs;
	}

	
	public String setFzyzgqkString(String[] zsmc,String[] fzsj,String[] fzjg, String[] zsbh){
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i<zsmc.length; i++){
			if((zsmc[i] == null||"".equals(zsmc[i]))&&(fzsj[i] == null||"".equals(fzsj[i]))&&(fzjg[i] == null||"".equals(fzjg[i]))
					&&(zsbh[i] == null||"".equals(zsbh[i]))){
			}else{
				if((zsbh[i] == null||"".equals(zsbh[i]))){
					sb.append("&nbsp;").append("#%#");
				}else{
					sb.append(zsbh[i]).append("#%#");
				}
				if((zsmc[i] == null||"".equals(zsmc[i]))){
					sb.append("&nbsp;").append("#%#");
				}else{
					sb.append(zsmc[i]).append("#%#");
				}
				if((fzsj[i] == null||"".equals(fzsj[i]))){
					sb.append("&nbsp;").append("#%#");
				}else{
					sb.append(fzsj[i]).append("#%#");
				}
				if((fzjg[i] == null||"".equals(fzjg[i]))){
					sb.append("&nbsp;");
				}else{
					sb.append(fzjg[i]);
				}
				if(i<zsmc.length-1)
					sb.append("<#>");
			}
		}
		return sb.toString();
	}
	
	
	public String getFzyzgqkString(String zyzgqk,String look){
		
		StringBuffer sb = new StringBuffer();
		if(!(zyzgqk == null || "".equals(zyzgqk))){
			String[] zyzgqkArr = zyzgqk.split("<#>");
			for(String zyzgqks : zyzgqkArr){
				String[] zyDetail = zyzgqks.split("#%#");
				if(zyDetail.length == 0) return "";
				sb.append("<tr><td >");
				if(!("1".equals(look)))
				//表格编辑权限的控制
				sb .append("<a href='#' onClick='myDeleteRow(this);return false;'>&nbsp;x&nbsp;</a>");
				sb.append("证书编号:").append("</td>")
				  .append("<td>").append("<input name='zsbh' value='").append(zyDetail[0]).append("'/></td>")
				  .append("<td>").append("证书名称:").append("</td>")
				  .append("<td>").append("<input name='zsmc' value='").append(zyDetail[1]).append("'/></td></tr>");
				sb.append("<tr>")
				  .append("<td>");
				if(!("1".equals(look)))sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");//表格编辑权限的控制
				   sb.append("发证时间:").append("</td>")
				  .append("<td>").append("<input name='fzsj'   value='").append(zyDetail[2]).append("' readonly='true'/></td>")
				  .append("<td>").append("发证机构:").append("</td>")
				  .append("<td>").append("<input name='fzjg' value='").append(zyDetail[3]).append("'/></td></tr>");
			}
		}
		return sb.toString();
	}
	
	public StFsxx clone(StFsxx sf){
		try {
			return (StFsxx) sf.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getSfbc() {
		return sfbc;
	}

	public void setSfbc(String sfbc) {
		this.sfbc = sfbc;
	}

	public String getCwdid() {
		return cwdid;
	}

	public String getCdkzh() {
		return cdkzh;
	}

	public void setCdkzh(String cdkzh) {
		this.cdkzh = cdkzh;
	}

	public void setCwdid(String cwdid) {
		this.cwdid = cwdid;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}



}