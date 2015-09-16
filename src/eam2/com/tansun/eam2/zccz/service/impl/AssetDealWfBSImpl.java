package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHgshXx;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;
@Service
@Repository
public class AssetDealWfBSImpl extends CommonBSImpl implements IAssetDealWfBS{
	//来自CODE表的资产状态定义
	private String ZCZT_ZCJY = "02";//正常经营
	private String ZCZT_CZSPZ = "03"; //处置审批中
	private String ZCZT_CZZXZ = "04"; //处置执行中
	private String ZCZT_DCZ = "05"; 	//待处置（实体内资产、委托贷款抵债务）
	private String ZCZT_CZJA = "06";	//已处置
	

	@Autowired
	private PublicDao publicDao;
	private ICodeGenerator codeGenerator;
	@Autowired
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}
	public PublicDao getPublicDao() {
		return publicDao;
	}
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	/**
	 * 根据处理单id，修改处理单状态为已提交 ZcczCommon常量定义中有处理单状态 根据工作流程返回的流程id，设置处理单的流程id
	 * 
	 * @param headId
	 *            处理单id
	 * @param lcid
	 *            流程id 
	 *            
	 */
	public void updateHeadInfo(String headId, String lcid) {
		String strsql = "Update CZ_CZTZFA_XX " + "set CLDZT=?,LCID=?"
				+ " Where ID=?";
		String args[] = new String[3];
		args[0] = ZcczCommon.FORM_IS_APPROVING; // 更新状态为审批中
		args[1] = lcid; // Lcid字段
		args[2] = headId;
		try {
			this.publicDao.updateBySql(strsql, args);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 根据处理单id，在资产处置投资方案信息表CZ_CZTZFA_XX中把合规审查次数HGSCCS加1后进行保存，同时设置CZ_CZTZFA_XX办理时间为当前时间
	 * @param cldId
	 * 
	 */	
	public void addCheckCount(String cldId) {
		String strsql="Update CZ_CZTZFA_XX Set HGSCCS = HGSCCS + 1"
			+" Where Id=?";
		List params = new ArrayList();
		params.add(cldId);
		this.publicDao.updateBySql(strsql, params);
		
		//设置发办理时间
		String sql = "update cz_cztzfa_xx set fblsj = Sysdate " + " Where Id=?";
		this.publicDao.updateBySql(sql,params);
	}

	/**
	 * 根据处理单id，查询出相关的处理单信息，根据处理单的信息在处置投资项目信息临时表CZ_XMXX_LSB中插入一条新的记录
	 * 
	 * @param cldId
	 *            处理单id
	 *            copy属性有：编号、处置项目名称、汇报人（拟稿人）、汇报人姓名（拟稿人姓名）、状态（null）、
	 *            分类（ZcczCommon中定义有经营性固产处置）、受理序号、申报日期、处理单Id
	 * 
	 */
	public void copyPropertieToXmxxLsb(String cldId) {
		CzCztzfaXx bo = (CzCztzfaXx) this.findById(CzCztzfaXx.class, cldId); // 得到原始数据
		if (bo != null) {
			CzXmxxLsb bo2 = new CzXmxxLsb(); // 新对象
			bo2.setBianhao(bo.getBianhao()); // 编号
			bo2.setCzxmmc(bo.getCztzxmmc()); // 项目名称
			bo2.setHbr(bo.getNgr()); // 拟稿人
			bo2.setHbrxm(bo.getNgrxm()); // 拟稿人名称
			//TODO:根据具体需要修改分类,具体转换算法待定
			String fl = bo.getZclb(); 
			fl.replace("4", "6");
			fl.replace("5", "7");
			fl.replace("6", "8");
			fl.replace("7", "9");
			bo2.setFenlei(fl); // 分类:取自资产分类字段
			bo2.setSlxh(bo.getSlxh());// 受理序号
			bo2.setSbrq(bo.getSbrq());// 申报日期
			bo2.setCldId(bo.getId());
			bo2.setCzsx("6个月");
			bo2.setFenlei("0");
			this.save(bo2); // 插入一条新的记录
		}
	}

	/**
	 * 根据处理单id，修改处置资产信息CZ_ZC_XX表中状态为审批中，同时修改相应的资产状态处置中
	 * 
	 * @param cldId
	 */
	public void modifyBodyStateSpz(String cldId) {
		// step1:修改 处置资产信息表
		String strsql = "Update CZ_ZC_XX Set ZHUANGTAI = ? " + " Where CLD_Id = ? ";
		List<String> params = new ArrayList<String>();
		params.add(ZcczCommon.ASSET_IS_APPROVING); // 审批中
		params.add(cldId); // 处理单ID
		this.publicDao.updateBySql(strsql, params);
		// step2.修改相应资产状态
		// step3.检索处置单的内容
		this.modifyTablesZCZT(cldId, this.ZCZT_CZSPZ); // 03代表处置审批中,见CODE表中
	}

	/**
	 * 根据处理单id，
	 * 修改处理单状态为审批结束
	 * 修改处置资产信息CZ_ZC_XX表中状态为已审批
	 * 如果项目审批通过，修改相应的资产状态处置执行中
	 * 如果项目未通过，修改资产状态为未处置
	 * @param cldId
	 */
	public void modifyBodyStateYsp(String cldId) {
		List<String> params = new ArrayList<String>();
		// step1:检索项目信息表
		String hsql = "from CzXmxxLsb where CLD_ID=?";
		params.add(cldId);
		CzXmxxLsb lsb = (CzXmxxLsb) this.publicDao.findSingleResult(hsql, params);
		if (lsb == null) {
			System.out.println("CzXmxxLsb is null.");
			return;
		}
		if (lsb.getSpjl() == null) {
			System.out.println("CzXmxxLsb.getSpjl is null.");
			return;
		}

		// step1:修改 处理单状态为审批结束
		String strsql_new = "Update CZ_CZTZFA_XX Set CLDZT=? " + " Where Id=?";
		params.clear();
		params.add(ZcczCommon.FORM_HAVE_APPROVED);
		params.add(cldId); // 处理单ID
		this.publicDao.updateBySql(strsql_new, params);
		
		// step2:修改 处置资产信息表中状态为已审批
		String strsql = "Update CZ_ZC_XX Set ZHUANGTAI=? " + " Where CLD_Id=?";
		params.clear();
		params.add(ZcczCommon.ASSET_HAVE_APPROVED);
		params.add(cldId); // 处理单ID
		this.publicDao.updateBySql(strsql, params);
		
		// step3:根据审批结论修改相应资产状态
		if (lsb.getSpjl().equals("1")) { // 审批同意
			this.modifyTablesZCZT(cldId,ZCZT_CZZXZ);    //处置执行中
		} else if (lsb.getSpjl().equals("0")) {  // 审批不同意
			this.modifyTablesZCZT(cldId,ZCZT_DCZ);    //未处置
		} else {
			System.out.println("CzXmxxLsb.getSpjl is wrong data."
					+ lsb.getSpjl());
			return;
		}
	}

	/**
	 * 更新处理单Id对应的各项资产的状态,从处理单中检索下属的各个资产信息,然后统一进行更新
	 * 
	 * @param cldId
	 *            处理单Id
	 * @param status
	 *            要更新的状态
	 */
	public void modifyTablesZCZT(String cldId, String status) {
		List<String> params = new ArrayList<String>();
		String strsql = "";
		String hsql = "from CzZcXx where cldId = ?";
		params.add(cldId);
		List bolist = this.publicDao.find(hsql, params);
		int i = 0;
		for (i = 0; i < bolist.size(); i++) {
			CzZcXx bo = (CzZcXx) bolist.get(i);
			if (bo != null) {
				// 根据bo所对应的资产类型,来更新不同的对应数据表
				if (bo.getZclb().equals(ZcczCommon.MANAGE_FIXED_ASSEET) || bo.getZclb().equals(ZcczCommon.DEALING_ASSET) || bo.getZclb().equals(ZcczCommon.ENTRUST_ASSET)) {// 经营型资产
					strsql = "Update JYZC_XX Set C_ZCZC = ? " // CODE表中定义资产状态3代表处置审批中
							+ " Where ID = ?";
					params.clear();
					params.add(status);
					params.add(bo.getAzcid()); // 对应经营型固定资产ID
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}else if (bo.getZclb().equals(ZcczCommon.ENTITY_ASSET)) {// 实体内资产
											   //土地状态,房屋状态,设备状态,交通工具,其他
					strsql = "Update ST_FSXX Set JTDZT = ?, " + " KFWZT = ? ,"
							+ " LJTGJZT = ?, " + " MSBZT = ?,"
							+ " PZCZT = ? " + " Where Id = ?";
					params.clear();
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(bo.getAzcid()); // 对应实体内资产Id
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}else if (bo.getZclb().equals(ZcczCommon.LOAN_PLEDGE)) {// 委贷抵债物,也保存在实体附属信息表中
					strsql = "Update ST_FSXX Set JTDZT = ?, " + " KFWZT = ? ,"
							+ " LJTGJZT = ?, " + " MSBZT = ?,"
							+ " PZCZT = ? " + " Where Id = ?";
					params.clear();
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(bo.getAzcid()); // 对应委贷抵债物
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}else if(bo.getZclb().equals(ZcczCommon.ZYZC_ASSET)){
//					private String ZCZT_CZSPZ = "03"; //处置审批中
//					private String ZCZT_CZZXZ = "04"; //处置执行中
//					private String ZCZT_DCZ = "05"; 	//待处置（实体内资产、委托贷款抵债务）
//					private String ZCZT_CZJA = "06";	//已处置	
					strsql = "update zy_zc t set t.zczt = ? where t.zc_id = ? ";
					params.clear();
					if(StringUtils.equals(status, "03")){
						params.add("处置审批中");
					}else if(StringUtils.equals(status, "04")){
						params.add("处置执行");
					}else if(StringUtils.equals(status, "05")){
						params.add("待处置");
					}else if(StringUtils.equals(status, "06")){
						params.add("已处置");
					}
					params.add(cldId);
					this.publicDao.updateBySql(strsql, params);
					continue;
				}
				/*
				if (bo.getZclb().equals("3")) {// 实体
					strsql = "Update ST_JBXX Set C_STZT =? " + " Where Id=?";
					params = new ArrayList();
					params.add(status);
					params.add(bo.getAzcid()); // 对应实体
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}
				*/
			}
		}
	}
	//============拟稿环节，作废流程需要触发的操作=====================	
	/**
	 * 流程作废，需要修改处置资产信息CZ_ZC_XX表中状态为流程作废
	 * 根据处置资产类别，修改相应资产状态为未处置
	 * @param cldId
	 */	
	public void modifyBodyStateWcz(String cldId) {
		// step1:修改 处置资产信息表
		String strsql = "Update CZ_ZC_XX Set ZHUANGTAI=? " + " Where CLD_Id=?";
		List params = new ArrayList();
		params.add(ZcczCommon.ASSET_BE_ABANDONED); // 被作废
		params.add(cldId); // 处理单ID
		this.publicDao.updateBySql(strsql, params);
		// step2.修改相应资产状态
		this.modifyTablesZCZT(cldId, this.ZCZT_DCZ); //待处置
	}

	/**
	 * 点击提交时，根据处理单id修改处理单状态为审批中
	 * @param cldId 处理单id
	 * 资产处置投资方案信息表CZ_CZTZFA_XX
	 */
	public void modifyHeadStateSpz(String cldId) {
		// step1:修改 处置资产信息表
		String strsql = "Update CZ_CZTZFA_XX Set CLDZT = ? " + " Where Id = ?";
		List params = new ArrayList();
		params.add(ZcczCommon.FORM_IS_APPROVING); // 表单审批中
		params.add(cldId); // 处理单ID
		this.publicDao.updateBySql(strsql, params);
		
	}
	
	/**
	 * 如果处置项目审批通过
	 * 把处置投资项目信息临时表CZ_XMXX_LSB中的信息拷贝到处置项目信息表CZ_XM_XX表中
	 * 同时设置CZ_XM_XX表中的状态为0：处置方案未执行
	 * @param czXmxxLsb
	 */	
	public void copyItemInfo(CzXmxxLsb czXmxxLsb) {
		CzXmXx targetbo = new CzXmXx();
		targetbo.setBianhao(czXmxxLsb.getBianhao()); //项目编号
		targetbo.setCzxmmc(czXmxxLsb.getCzxmmc()); //处置项目名称
		targetbo.setHbr(czXmxxLsb.getHbr()); //汇报人
		targetbo.setHbrxm(czXmxxLsb.getHbrxm()); //汇报人姓名
		targetbo.setJcslxr(czXmxxLsb.getJcslxr());//监察室列席人
		targetbo.setJcslxrxm(czXmxxLsb.getJcslxrxm());//监察室列席人姓名
		targetbo.setYjhzr(czXmxxLsb.getYjhzr()); //意见汇总人
		targetbo.setYjhzrxm(czXmxxLsb.getYjhzrxm());//意见汇总人姓名
		targetbo.setHyId(czXmxxLsb.getHyId());//会议Id
		targetbo.setSpjl(czXmxxLsb.getSpjl()); //审批结论
		targetbo.setSfba(czXmxxLsb.getSfba()); //是否备案
		targetbo.setZhuangtai("0"); //项目:处置方案未执行
		targetbo.setFenlei(czXmxxLsb.getFenlei());//分类
		targetbo.setFwwh("");//发文文号为空
		targetbo.setSlxh(czXmxxLsb.getSlxh());//受理序号
		targetbo.setSbrq(czXmxxLsb.getSbrq());//申报日期
		targetbo.setXmlsb(czXmxxLsb.getId());//临时表Id
		targetbo.setCldId(czXmxxLsb.getCldId());//处理单Id
		
		this.publicDao.save(targetbo); //插入到后台数据库中去
		
	}
	/**
	 * 合规审查结束后给所有审批委员发消息（打开就是处理单页面）
	 * 先到表P_T_USER_L_ROLE中找出所有ROLE_ID＝142L的记录的USER_ID字段集合
	 * 对于每一个USER_ID在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					USER_ID
	 * MESSAGE					"项目上会材料"
	 * URL						"zccz/assetDealHead_modifyHead.do?head.id=" + CldId
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"1"
	 * @param cldId ：CZ_CZTZFA_XX.id
	 */		
	
	public void zcczMessageToAllSpwy(String cldId, Long currentUserId) {
	
		//Step1:检索所有用户类型为142的审查委员
		String strsql="select tid from p_t_user where tid in "
			+"(select user_id from P_T_USER_L_ROLE where role_id=?)";
		List params = new ArrayList();
		params.add("142");
		
		List userlist = this.publicDao.queryForList(strsql, params);
		
		//Step2:给审查委员发相应的消息过去
		int i=0;
		for(i=0;i<userlist.size();i++){
			Map userMap = (Map)userlist.get(i);
			String userid = String.valueOf(userMap.get("TID")); //得到用户编号
			PTMessage mess = new PTMessage();
			mess.setCreateDate(new java.util.Date());
			mess.setSendUserId(currentUserId);
			mess.setUserId(Long.parseLong(userid));
			mess.setMessage("项目上会材料");
			mess.setUrl("zccz/assetDealHead_modifyHead.do?head.id=" + cldId);
			mess.setIsRead("0");
			mess.setType("1");
			this.publicDao.save(mess); //插入一个新的消息记录过去
		}
	}
	
	/**
	 * 根据处理单id查询出数据库中的记录oldValue，新复制一份处理单信息newValue
	 * 设置newValue的id为null，处理单的状态为被退回ZcczCommon.FORM_BE_RETURN 3，初始处理单id为oldValue的id,进行数据保存
	 * 设置oldValue的发办理时间为空，上次资产处置方案信息ID为newValue的id，进行数据更新
	 * @param cldId 处理单id
	 * @return 新保存的处理单的id，即作为历史信息的处理单的id
	 */
	public String copyHeadHistory(String cldId) {
		CzCztzfaXx czCztzfaXx = this.publicDao.findById(CzCztzfaXx.class, cldId);
		CzCztzfaXx newCczCztzfaXx = new CzCztzfaXx();
		try {
			BeanUtils.copyProperties(newCczCztzfaXx, czCztzfaXx);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		newCczCztzfaXx.setId(null);
		newCczCztzfaXx.setCldzt(ZcczCommon.FORM_BE_RETURN);//被退回
		newCczCztzfaXx.setCscldid(czCztzfaXx.getId());
		String newId = (String)this.publicDao.save(newCczCztzfaXx);
		czCztzfaXx.setScczfaxxid(newCczCztzfaXx.getId());
		czCztzfaXx.setFblsj(null);
		czCztzfaXx.setCldzt(ZcczCommon.FORM_IS_APPROVING);  //审批中
		this.publicDao.saveOrUpdate(czCztzfaXx);
		return newId;
	}
	
	/**
	 * 拷贝body表到历史处理单中
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void copyBodysHistory(String cldId,String historyCldId) throws IllegalAccessException, InvocationTargetException {
		List<CzZcXx> zcxxList = (List<CzZcXx>)publicDao.find("from CzZcXx o where o.cldId=?", new String[]{cldId});
		for(CzZcXx zcxx : zcxxList){
			CzZcXx newZcxx = new CzZcXx();
			BeanUtils.copyProperties(newZcxx, zcxx);
			newZcxx.setId(null);
			newZcxx.setCldId(historyCldId);
			newZcxx.setZhuangtai(ZcczCommon.FORM_BE_RETURN);
			publicDao.save(newZcxx);
		}
	}
	
	public void updateXmxxLsbState(String cldId) {
		String strsql = "Update CZ_XMXX_LSB Set ZHUANGTAI = ? " + " Where CLD_ID = ?";
		List params = new ArrayList();
		params.add(ZcczCommon.DEALTODO_XMZT_WSH); // 未上会
		params.add(cldId); // 项目ID
		this.publicDao.updateBySql(strsql, params);
	}

	//拷贝合规性审查意见  处置项目合规性审核信息表
	public void cloneHgxscToHistory(String cldId, String historyCldId) throws IllegalAccessException, InvocationTargetException{
		List<CzHgshXx> hgscList = (List<CzHgshXx>)publicDao.find("from CzHgshXx h where h.cldId=?", new String[]{cldId});
		for(CzHgshXx hgsc : hgscList){
			CzHgshXx newHgsc = new CzHgshXx();
			BeanUtils.copyProperties(newHgsc, hgsc);
			newHgsc.setId(null);
			newHgsc.setCldId(historyCldId);
			publicDao.save(newHgsc);
		}
	}
	//根据处理单id清除合规审查意见
	public void deleteHgscByCldId(String cldId){
		List<CzHgshXx> hgscList = (List<CzHgshXx>)publicDao.find("from CzHgshXx h where h.cldId=?", new String[]{cldId});
		for(CzHgshXx hgsc : hgscList){
			publicDao.delete(hgsc);
		}
	}
	//拷贝临时表里面的数据到项目信息表了面去做跟踪	
	public void cloneXmLsbToXm(String cldId) throws IllegalAccessException, InvocationTargetException {
		List<String> params = new ArrayList<String>();
		// step1:检索项目信息表
		String hsql = "from CzXmxxLsb where CLD_ID=?";
		params.add(cldId);
		CzXmxxLsb lsb = (CzXmxxLsb) this.publicDao.findSingleResult(hsql, params);
		if(StringUtils.isNotEmpty(lsb.getSpjl())){
			if(StringUtils.equals("1", lsb.getSpjl())){
				CzXmXx xmxx = new CzXmXx();
				BeanUtils.copyProperties(xmxx, lsb);
				xmxx.setZhuangtai(ZcczCommon.PROJECT_TYPE_WZX);
				xmxx.setId(null);
				xmxx.setXmlsb(lsb.getId());
				publicDao.save(xmxx);
			}
		}
	}
	
	//资产处置报废是释放编号
	public void realseZcczBianhao(String cldId){
		CzCztzfaXx czCztzfaXx = publicDao.findById(CzCztzfaXx.class, cldId);
		if(StringUtils.isEmpty(czCztzfaXx.getBianhao()))
			return;
		codeGenerator.disableCurrentCode("stztcz", czCztzfaXx.getBianhao(), czCztzfaXx.getNgbm());
		List<CzCztzfaXx> czCztzfaXxList = (List<CzCztzfaXx>)publicDao.find("from CzCztzfaXx o where o.bianhao=?", new String[]{czCztzfaXx.getBianhao()});
		for(CzCztzfaXx fz : czCztzfaXxList){
			fz.setBianhao(fz.getBianhao() + "(作废)");
		}
	}
	//===合规审查到会议组织 给所有的审批委员发  jf  add
	
	public void sendMsg(long sender, String msg, String headId, String url,
				String param,PTMessageBS messageBS) {
		StringBuffer hql = new StringBuffer("").append(
				" SELECT A.TID,A.USERNAME ").append(
				" FROM P_T_USER A, P_T_ROLE B, P_T_USER_L_ROLE C ").append(
				" WHERE A.TID = C.USER_ID ").append(" AND B.TID = C.ROLE_ID ")
				.append(" AND B.TID = ? ");// 查找审批委员sql
		List listSpwy = publicDao.queryForList(hql.toString(),
				new Object[] { "142" });// 审批委员
		List<Long> didUserIdList = new ArrayList<Long>();
		int count = listSpwy.size();
		for (int i = 0; i < count; i++) {
			Map map = (Map) listSpwy.get(i);
			didUserIdList.add(Long.valueOf(String.valueOf((BigDecimal) map
					.get("TID"))));
		}
//		StringBuffer hql2 = new StringBuffer("").append(
//				" select a.url,a.param ").append(" from P_T_DID a ").append(
//				" where a.head_id=? ");//
//		List listCs = publicDao.queryForList(hql2.toString(),
//				new Object[] { headId });// 审批委员
//		String url = "";
//		String param = "";
//		int countCs = listCs.size();
//		if (countCs >= 1) {
//			Map map = (Map) listCs.get(0);
//			url = (String) map.get("url");
//			param = (String) map.get("param");
//		}
		int num = didUserIdList.size();
		if (num != 0) {
			for (int i = 0; i < num; i++) {
				long userId = (Long) didUserIdList.get(i);
				PTMessage message = new PTMessage();
				message.setSendUserId(sender);
				message.setUserId(userId);
				message.setMessage(msg);
				message.setUrl(url);
				message.setParam(param);
				message.setType("3");
				messageBS.SaveOrUpdate(message);
			}
}

		
	}

	
}
