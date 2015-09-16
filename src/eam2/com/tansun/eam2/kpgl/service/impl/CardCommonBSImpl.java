package com.tansun.eam2.kpgl.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwgLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.KpRzkmDzb;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.kpgl.service.ICardCommonBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;

@Service
public class CardCommonBSImpl implements ICardCommonBS {

	@Autowired
	private PublicDao publicDao;

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	/**
	 * 保存新增卡片表头
	 * 
	 * @param caShead
	 */
	public void save(CaShead caShead) {
		publicDao.save(caShead);
	}

	/**
	 * 更新新增卡片表头
	 * 
	 * @param CaShead
	 */
	public void update(CaShead caShead) {
		publicDao.update(caShead);
	}

	/**
	 * 删除新增卡片表头
	 * 
	 * @param CaShead
	 */
	public void delete(CaShead caShead) {
		publicDao.delete(caShead);
	}

	/**
	 * 根据ID查询新增卡片表头信息
	 * 
	 * @param id
	 */
	public CaShead findCaSheadById(String id) {
		Long[] strs = new Long[1];
		strs[0] = Long.valueOf(id);
		return (CaShead) publicDao.findSingleResult("from CaShead o where o.id = ?", strs);
	}

	/**
	 * 保存新增卡片表体
	 * 
	 * @param KpCardtemp
	 */
	public void save(LcCardtemp lcCardtemp) {
		publicDao.save(lcCardtemp);
	}
	
	/**
	 * 保存新增卡片表体并返回id
	 * 
	 * @param KpCardtemp
	 */
	public String saveBody(LcCardtemp lcCardtemp){
		return publicDao.save(lcCardtemp).toString();
	}

	/**
	 * 更新新增卡片表体
	 * 
	 * @param LcCardtemp
	 */
	public void update(LcCardtemp lcCardtemp) {
		publicDao.update(lcCardtemp);
	}

	/**
	 * 删除一条新增卡片表体
	 * 
	 * @param LcCardtemp
	 */
	public void delete(LcCardtemp lcCardtemp) {
		publicDao.delete(lcCardtemp);
	}

	/**
	 * 删除多条新增卡片表体
	 * 
	 * @param LcCardtempIds
	 */
	public void delete(String[] LcCardtempIds) {
		LcCardtemp LcCardtemp = null;
		for (int i = 0; i < LcCardtempIds.length; i++) {
			if (StringUtils.isNotEmpty(LcCardtempIds[i])) {
				LcCardtemp = this.findLcCardtempById(LcCardtempIds[i]);//new LcCardtemp();
				//LcCardtemp.setId(Long.parseLong(LcCardtempIds[i]));
				try{
					this.delete(LcCardtemp);
					String sql = "delete from Lc_Cardtemp t where t.cardcode is null and t.kpxzid = '"+LcCardtemp.getKpxzid()+"'";
					this.publicDao.getJdbcTemplate().update(sql);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 通过headId 删除body
	 * @param headId
	 */
	public void deleteBodys(String headId){
		String sql = "delete from lc_cardtemp where kpxzid = "+Long.parseLong(headId);
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 根据ID查询新增卡片表体信息
	 * 
	 * @param id
	 */
	public LcCardtemp findLcCardtempById(String id) {
		Long[] strs = new Long[1];
		strs[0] = Long.valueOf(id);
		return (LcCardtemp) publicDao.findSingleResult("from LcCardtemp o where o.id = ?", strs);
	}

	/**
	 * 根据处理单ID查询该处理单下所有卡片信息
	 * 
	 * @param id
	 */
	public List findLcCardtempsBySheadId(String id) {
		Long[] strs = new Long[1];
		strs[0] = Long.valueOf(id);
		return publicDao.find("from LcCardtemp o where o.kpxzid = ?", strs);
	}

	/**
	 * 根据卡片id查询卡片信息并存入list
	 */
	public List<Cardinfo> findCardInfoByCardIds(String[] cardIds) {
		List<Cardinfo> list = new ArrayList<Cardinfo>();
		for (int i = 0; i < cardIds.length; i++) {
			if (cardIds[i] != null) {
				Cardinfo cardInfo = this.publicDao.findById(Cardinfo.class,
						Long.valueOf(cardIds[i]));
				list.add(cardInfo);
			}
		}
		return list;
	}

	/**
	 * 根据类型，得到数据字典表DIC_APP_ASSET_STATE里的数据
	 * 
	 * @return
	 */
	public List queryDicAppAssetState(String type) {
		String sql = "SELECT T.NAME FROM DIC_APP_ASSET_STATE T WHERE T.TYPE = ?";
		String[] strs = new String[1];
		strs[0] = type;
		List list = publicDao.queryForList(sql, strs);
		return list;
	}

	/**
	 * 根据类型，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public List queryIndividualtree(String type) {
		String sql = "SELECT T.CATEGORYNAME FROM INDIVIDUALTREE T WHERE T.PARENTCATEGORYID = ?";
		String[] strs = new String[1];
		strs[0] = type;
		List list = publicDao.queryForList(sql, strs);
		return list;
	}

	/**
	 * 根据卡片id查询卡片信息
	 */
	public Cardinfo findCardinfoByCardId(String cardId) {
		Long[] strs = new Long[1];
		strs[0] = Long.valueOf("null".equals(cardId)?"0":cardId);
		return (Cardinfo) publicDao.findSingleResult(
				"from Cardinfo ci where ci.id = ?", strs);
	}

	/**
	 * 删除多条变动记录
	 */
	public void deleteRecord(String[] bodyId) {
		for (int i = 0; i < bodyId.length; i++) {
			String sql = "delete from recordhistory where zc_id = '"+bodyId[i]+"'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

	/**
	 * 添加变动记录信息
	 */
	public void saveRecord(Recordhistory record) {
		publicDao.save(record);
	}

	/**
	 * 修改变动记录信息
	 */
	public void updateRecord(Recordhistory record) {
		publicDao.update(record);
	}
	
	/**
	 * 根据bodyId查找record记录
	 */
	public Recordhistory findRecordBybodyId(String bodyId){
		String[] strs = new String[1];
		strs[0] = bodyId;
		return (Recordhistory) publicDao.findSingleResult(
				"from Recordhistory re where re.zcId = ?", strs);
	}
	
	/**
	 * 卡片调配，通过资产id查找资产信息
	 * @return
	 */
	public JyzcXx findJyzcXxByZcId(String zcId){
		String[] strs = new String[1];
		strs[0] = zcId;
		JyzcXx xx = (JyzcXx) publicDao.findSingleResult("from JyzcXx x where x.id = ?", strs);//publicDao.findById(JyzcXx.class, zcId);
		return xx;
	}
	
	/**
	 * 把card的信息 复制到LcCardtemp里
	 * @param card
	 * @return
	 * liubeibei
	 */
	public LcCardtemp card2Body(Cardinfo cardinfo) {
		LcCardtemp cardTemp = new LcCardtemp();
		cardTemp.copyProperties(cardinfo);
		return cardTemp;
	}
	
	/**
	 * 根据body和card对比出卡片的变化信息，并存到变动表里，
	 * @param body
	 * @param card
	 * @return
	 * liubeibei
	 */
	@SuppressWarnings("unchecked")
	public void compareCardVsBody(LcCardtemp body, Cardinfo card) {
		Map<String,Object> bodyMap = null;
		Map<String,Object> cardMap = null;
		try {
			bodyMap = BeanUtils.describe(body);
			cardMap = BeanUtils.describe(card);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		Set<String> keySet = cardMap.keySet();
		Iterator ite = keySet.iterator();
		while(ite.hasNext()){
			String property = (String)ite.next();
			if("id".equals(property)||"class".equals(property)||
					"changereason".equals(property)){
				continue;
			}
			Object valueAfter = bodyMap.get(property);
			Object valueBefore = cardMap.get(property);
			if(valueAfter == null && valueBefore == null){
				continue;
			}else if("null".equals(valueAfter) && "null".equals(valueBefore)){
				continue;
			}else if("".equals(valueAfter) && "".equals(valueBefore)){
				continue;
			}else if(valueAfter != null && valueAfter.equals(valueBefore)){
				continue;
			}else if((valueAfter == null && valueBefore != null) || (valueAfter != null && !valueAfter.equals(valueBefore))){
				//对比时间类型的数据 add by lantianbo 
				boolean d = false;
				if("ksdate".equals(property)||"zxrq".equals(property)||"lrrq".equals(property)
						||"qydate".equals(property)){
					d = true;
				}
				if(d){
					Object []dateCom = this.compareDate(body, card,valueAfter,valueBefore,property);
					boolean s1= Boolean.parseBoolean(String.valueOf(dateCom[0]));
					if(s1){
						continue;
					}
					valueAfter = dateCom[1];
					valueBefore = dateCom[2];
				}else{
					if(checkEmpty(String.valueOf(valueAfter)).equals(checkEmpty(String.valueOf(valueBefore)))){
						continue;
					}
				}
				Recordhistory record = new Recordhistory();
				record.setBiaoming("LC_CARDTEMP");//变动的表名
				record.setZcId(String.valueOf(body.getId()));//变动记录的ID，card的主键
				record.setName(property);//改变的列名
				if(valueBefore == null){//改变前值
					record.setBefore(null);
				}else{
					record.setBefore(valueBefore.toString());
				}
				record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
				//查询head对象，获得拟稿人，拟稿日期
				CaShead shead = this.findCaSheadById(body.getKpxzid().toString());
				if(shead != null){
					record.setChangedate(shead.getNgrq());//变动的日期
					record.setChangeperson(shead.getNgrmc());//变动记录人
					record.setWfCode(shead.getWfconfigCode());//流程
					record.setPkId(shead.getId().toString());
				}
				record.setZhuangTai("0");//设置审批状态为0：未审批
				if(valueAfter!=null){
					this.saveRecord(record);//保存变动信息到recordhistory
				}
			}
		}
	}
	/**
	 * 将空串，null字符串，0，0.0，转换成空字符串 add by lantianbo
	 * @param str
	 * @return
	 */
	public String checkEmpty(String str){
		if(str==null){
			return "";
		}
		if(str.trim().equals("")||str.trim().equals("null")
				||str.trim().equals("0")||str.trim().equals("0.0")){
			return "";
		}else{
			return str.trim();
		}
	}
	/**
	 * 对比时间格式的数据
	 * @param body
	 * @param htzl
	 * @param valueAfter
	 * @param valueBefore
	 * @param property
	 */
	private Object[] compareDate(LcCardtemp body, Cardinfo head,
		Object valueAfter, Object valueBefore, String property) {
		Object []s = new Object[3];
		if("ksdate".equals(property)){
			if(body.getKsdate()!= null){
				valueAfter = DateUtils.formatDate(body.getKsdate());
			}
			if(head.getKsdate() != null){
				valueBefore = DateUtils.formatDate(head.getKsdate());
			}
		}
		if("zxrq".equals(property)){
			if(body.getZxrq()!= null){
				valueAfter = DateUtils.formatDate(body.getZxrq());
			}
			if(head.getZxrq() != null){
				valueBefore = DateUtils.formatDate(head.getZxrq());
			}
		}
		if("lrrq".equals(property)){
			if(body.getLrrq()!= null){
				valueAfter = DateUtils.formatDate(body.getLrrq());
			}
			if(head.getLrrq() != null){
				valueBefore = DateUtils.formatDate(head.getLrrq());
			}
		}
		if("qydate".equals(property)){
			if(body.getQydate()!= null){
				valueAfter = "".equals(checkEmpty(body.getQydate()))?"":DateUtils.formatDate(DateUtils.parseDate(body.getQydate()));
			}
			if(head.getKsdate() != null){
				valueBefore = "".equals(checkEmpty(body.getQydate()))?"":DateUtils.formatDate(DateUtils.parseDate(head.getQydate()));
			}
		}
		if(checkEmpty(String.valueOf(valueAfter)).equals(checkEmpty(String.valueOf(valueBefore)))){
			s[0]=true;
			return s;
		}else{
			s[0]=false;
			s[1]=String.valueOf(valueAfter);
			s[2]=String.valueOf(valueBefore);
			return s;
		}
	}
	/**
	 * 根据卡片的类别编码和是否承继信息查询卡片的入账科目编号
	 * @param
	 */
	public String getRzkm(String typeCode, String ifcj) {
		String hql = "from KpRzkmDzb o where o.dqzt = '1' and o.lbmc = ? and o.sfcj = ?";
		Object[] params = new Object[]{typeCode,ifcj};
		KpRzkmDzb kpRzkmDzb = (KpRzkmDzb)this.publicDao.findSingleResult(hql, params);
		if(kpRzkmDzb != null){
			return kpRzkmDzb.getKmbh();
		}
		return null;
	}

	public ZyZc findZyZcById(String id) {
		return this.publicDao.findById(ZyZc.class, id);
	}

	/**
	 * /根据所选的卡片合并，ids为合并的卡片id数组，baseCardId为基础卡片，headId为表单id，ybyz,ljzj,jvalue,jevalue 
	 * 
	 *                拆分后新卡片                       拆分前表体
		  CARDCODE         空                        为cardinfo表的cardCode 
		  CARDINFOID       空                        表体里为cardinfo的id 
		  BOXID	         表体里为该表体的id          表体里为新卡片表体的id
		  ID	 YBYZ（原币原值）	LJZJ（累计折旧）JVALUE	（净值）	JEVALUE（净额）CARDINFOID	BOXID		LRRQ	
		10056642	57816974.41	15287963.29	42529011.12	42529011.12		10056642				2010/11/21	这个是合并后的卡片
		10056641	57269974.41	15108477.09	42161497.32	42161497.32		125362		10056642				下面3个合并前卡片
		10056640	400000		113335.09	286664.91	286664.91		125337		10056642		
		10056639	147000		66151.11	80848.89	80848.89		124335		10056642	2010/3/24	

	 * @param ids 这个未用到
	 * @param baseCardId
	 * @param headId
	 */
	public boolean mergeBody(String[] ids, String baseCardId, String headId) {
		
		//先查出已合并的卡片，然后删除
		List list1 = this.findLcCardtempsBySheadId(headId, "false");
		if(list1!=null&&list1.size()>0){
			for(int i = 0;i<list1.size();i++){
				LcCardtemp temp = new LcCardtemp();
				temp = (LcCardtemp) list1.get(i);
				this.delete(temp);
			}
		}
		//根据ids在Cardinfo表中查询出要合并的卡片 
		List<LcCardtemp> list = this.findLcCardtempsBySheadId(headId);
		boolean tongyileixingkapian = this.compareZcTypeByHeadId(list);
		if(tongyileixingkapian){
			//合并后的卡片
			LcCardtemp newLcCardtemp = new LcCardtemp();
			Double ybyz  = new Double(0);
			Double jvalue = new Double(0);
			Double jevalue = new Double(0);
			Double ljzj = new Double(0);
			Double jzzb = new Double(0);
			String oldCode = null;
			//把Cardinfo对象转化为LcCardtemp对象
			for(int i = 0;i < list.size();i++){
				LcCardtemp body = list.get(i);
				if(String.valueOf(body.getId()).equals(baseCardId)){
					try {
						BeanUtils.copyProperties(newLcCardtemp, body);
					} catch (IllegalAccessException e1) {
						e1.printStackTrace();
					} catch (InvocationTargetException e1) {
						e1.printStackTrace();
					}
					newLcCardtemp.setCardcode(null);
					newLcCardtemp.setOldcode(body.getCardcode());
					//设置录入日期为当前日期
					Date date = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					String dateStr = sf.format(date);
					Date formatDate = null;
					try {
						formatDate = sf.parse(dateStr);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					newLcCardtemp.setLrrq(formatDate);
					//设置卡片的增加方式为合并增加0113
					newLcCardtemp.setAddtype("0113");
				}else{
					//设置卡片状态为退役
					body.setState("03");
					//设置卡片的减少方式为0212合并减少
					body.setChangeway("0212");
					if(body.getCardcode()!=null){
						this.update(body);
					}
				}
				//原币原值，累计折旧，净值，净额，信息合并前卡片进行累加
				ybyz += body.getYbyz();
				ljzj += body.getLjzj();
				jvalue += body.getJvalue();
				jevalue += body.getJevalue();
				jzzb += body.getJzzb();
			}
			newLcCardtemp.setYbyz(ybyz);
			newLcCardtemp.setLjzj(ljzj);
			newLcCardtemp.setJvalue(jvalue);
			newLcCardtemp.setJevalue(jevalue);
			newLcCardtemp.setJzzb(jzzb);
			newLcCardtemp.setState("02");
			String newBodyId = this.saveBody(newLcCardtemp);
//			LcCardtemp newBody = this.findLcCardtempById(newBodyId);
			newLcCardtemp.setBoxid(newBodyId);
			newLcCardtemp.setCardinfoid(newBodyId);
			this.update(newLcCardtemp);
//			for(int i = 0;i<list.size();i++){
//				LcCardtemp body = list.get(i);
//				body.setBoxid(newBodyId);
//				this.update(body);
//			}
		}
		return tongyileixingkapian;
	}

	private boolean compareZcTypeByHeadId(List<LcCardtemp> list) {
		boolean is = false;
		long type1 = 0l;
		long type2 = 0l;
		if(list!=null&&list.size()>0){
			LcCardtemp body1 = null;
			LcCardtemp body2 = null;
			for (int i = 0; i < list.size(); i++) {
				body1 = list.get(i);
				type1 = body1.getParentid();
				for (int j = 0; j < list.size(); j++) {
					body2 = list.get(j);
					type2 = body2.getParentid();
					if(type1!=type2){
						return is;
					}
				}
			}
			is = true;
		}
		return is;
	}

	/**
	 * 卡片合并处理单，根据条件查询出合并后卡片列表或要合并的卡片列表
	 * @param headId 处理单ID
	 * @param cardNew true时取卡片编号cardCode为空的数据，即合并后新生成的卡片；false时，取处理单中要合并的卡片，即卡片编号cardCode不为空
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<LcCardtemp> findLcCardtempsBySheadId(String headId, String cardNew) {
		String hql = null;
		if("true".equals(cardNew)){
			hql = "select o from LcCardtemp o where o.kpxzid = ? and o.boxid is null";
		}
		if("false".equals(cardNew)){
			hql = "select o from LcCardtemp o where o.kpxzid = ? and o.boxid is not null";
		}
		Object[] params = new Object[]{Long.valueOf(headId)};
		return (List<LcCardtemp>)this.publicDao.find(hql, params);
	}
	
	public LcCardtemp findLcCardtempByOldCardCode(String oldCode){
		String hql = "select o from LcCardtemp o where o.oldcode = ?";
		Object[] params = new Object[]{oldCode};
		return (LcCardtemp)this.publicDao.findSingleResult(hql, params);
	}
	
	/**
	 * 删除卡片拆分后的body
	 * @param boxId
	 */
	public void deleteSplits(String[] boxId){
		for (int i = 0; i < boxId.length; i++) {
			String sql = "delete from lc_cardtemp where boxid = '"+boxId[i]+"'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}
	
	/**
	 * 删除合并前的卡片，合并后的连同一起删掉
	 * @param bodyId
	 */
	public void deleteMerge(String bodyId){
		String sql = "delete from lc_cardtemp where id = '"+bodyId+"'";
		publicDao.getJdbcTemplate().execute(sql);
	}
	
	/**
	 * 取卡片变动原因，展示struts2标签
	 */
	public List getChangeReasonWay(String type){
		String changWayHql ="from Individualtree t where t.treetype='cardChangeWay' and t.activitystatus='Y' and t.colonizevalue like '%"+type+",%' order by t.nodeorder asc";
		List changWayList = this.publicDao.find(changWayHql, new ArrayList());
		return changWayList;
	}

	/**
	 * 根据ids取得cardinfo信息，并保存到lccardtemp表中
	 * @param ids   
	 */
	public String saveCard4Merge(String[] ids,String headId) {
		String zcId = "";
		String kplx = "";
		boolean isAdded = false;//已添加的数据
		for(int i = 0;i < ids.length;i++){
			String id = ids[i];
			Cardinfo cardinfo = this.publicDao.findById(Cardinfo.class, Long.valueOf(id));
			if("03".equals(cardinfo.getState())){
				return "退役的卡片不能选择";
			}
			List<LcCardtemp> list = this.findLcCardtempsBySheadId(headId);
			if(list!=null){
				for(int m=0;m<list.size();m++){
					LcCardtemp temp = list.get(m);
					if(temp.getCardcode().equals(cardinfo.getCardcode())){
						isAdded=true;
					}
				}
			}
			if(!isAdded){
				zcId = cardinfo.getZcid();
				kplx = String.valueOf(cardinfo.getParentid());
				for (int j = 0; j < ids.length; j++) {
					String id2 = ids[j];
					Cardinfo cardinfo1 = this.publicDao.findById(Cardinfo.class, Long.valueOf(id2));
					if(zcId!=null&&!zcId.equals(cardinfo1.getZcid())){
						return "资产不相同";
					}
					if(kplx!=null&&!kplx.equals(String.valueOf(cardinfo1.getParentid()))){
						return "卡片不相同";
					}
				}
				
				LcCardtemp lcCardtemp = new LcCardtemp();
				lcCardtemp.copyProperties(cardinfo);
				lcCardtemp.setKpxzid(Long.parseLong(headId));
				lcCardtemp.setCardinfoid(cardinfo.getId().toString());
				this.publicDao.save(lcCardtemp);
				isAdded = false;
			}
			isAdded = false;
		}
		return "";
	}
	
	/**
	 * 根据id，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public Individualtree getIndividualtreeById(String id) {
		String sql = "from Individualtree t where t.categoryid = ?";
		String[] strs = new String[1];
		strs[0] = id;
		return (Individualtree)publicDao.findSingleResult(sql, strs);
	}
	
	/**
	 * 根据临时表id,处理单id
	 * 查询变动表数据集合
	 * @param bodyId
	 * @param headId 
	 * @return
	 */
	public List findRecordsBybodyId(String bodyId,String headId){
		List list = new ArrayList();
		String sql = "from Recordhistory re where re.zcId = ? and re.pkId = ?";
		list = publicDao.find(sql, new Object[]{bodyId,headId});
		return list;
	}

	public void deleteSplits(String headId, Long bodyId) {
		String sql = "from LcCardtemp x where x.kpxzid = ? and x.boxid = ?";
		List list = this.publicDao.find(sql, new Object[]{Long.valueOf(headId),String.valueOf(bodyId)});
		if(list!=null&&list.size()>0){
			LcCardtemp temp = null;
			for (int i = 0; i < list.size(); i++) {
				temp = (LcCardtemp) list.get(i);
				this.delete(temp);
			}
		}
	}
	/**
	 * 卡片变动批量操作
	 * @param headId
	 * @param cardIds
	 */
	public String chooseChangeBatch(String headId, String cardIds){
		if(cardIds!=null&&cardIds.length()>0){
			if(cardIds.startsWith(",")){
				cardIds = cardIds.substring(1);
			}
			String []ids = cardIds.split(",");
			Cardinfo card = null;
			for (int i = 0; i < ids.length; i++) {
				card = this.findCardinfoByCardId(ids[i]);
				if("03".equals(card.getState())){
					return "退役卡片不能选择";
				}
				if(card!=null){
					LcCardtemp body = this.card2Body(card);
					body.setKpxzid(Long.parseLong(headId));
					body.setCardinfoid(String.valueOf(card.getId()));
					body.setId(null);
					this.save(body);
				}
			}
		}
		return "操作成功";
	}
	/**
	 * 批量变动
	 * @return
	 */
	public void operateChanageBatch(String changeway, String changereason,
			String changeValue, String bodyIds,String headId,String isProportion){
		if(bodyIds!=null&&bodyIds.length()>0){
			if(bodyIds.startsWith(",")){
				bodyIds = bodyIds.substring(1);
			}
			String ids[] = bodyIds.split(",");
			this.deleteRecord(ids);
			for(int i=0;i<ids.length;i++){
				LcCardtemp body  = this.findLcCardtempById(ids[i]);
				String cardId = body.getCardinfoid();
				Cardinfo card = this.findCardinfoByCardId(cardId);
				Individualtree tree = this.getIndividualtreeById(changeway);
				String nodevalue = "";
				if(tree!=null){
					nodevalue = tree.getNodevalue();
				}
				Recordhistory record = new Recordhistory();
				if("1".equals(nodevalue.trim())){ 								//原币原值增加
					if("true".equals(isProportion)){
						double d = card.getYbyz()*Double.valueOf(changeValue)/100.0 + card.getYbyz();
						body.setYbyz(d);
					}else{
						body.setYbyz(card.getYbyz()+Double.parseDouble(changeValue));
					}
					body.setJvalue(body.getYbyz()-card.getLjzj());
					body.setJevalue(body.getYbyz()-card.getLjzj());
					record.setName("ybyz");
					record.setBefore(String.valueOf(card.getYbyz()));
				}else if("2".equals(nodevalue.trim())){ 						//原币原值减少
					if("true".equals(isProportion)){
						double d = card.getYbyz()-card.getYbyz()*Double.valueOf(changeValue)/100.0 ;
						body.setYbyz(d);
					}else{
						body.setYbyz(card.getYbyz()-Double.parseDouble(changeValue));
					}
					body.setJvalue(body.getYbyz()-card.getLjzj());
					body.setJevalue(body.getYbyz()-card.getLjzj());
					record.setName("ybyz");
					record.setBefore(String.valueOf(card.getYbyz()));
				}else if("3".equals(nodevalue.trim())){							//管理部门
					body.setGlbm(changeValue);
					record.setName("glbm");
					record.setBefore(String.valueOf(card.getGlbm()));
				}else if("4".equals(nodevalue.trim())){							//使用部门
					body.setUsepartment(changeValue);
					record.setName("usepartment");
					record.setBefore(String.valueOf(card.getUsepartment()));
				}else if("5".equals(nodevalue.trim())){							//使用状况
					body.setUsestatus(changeValue);
					record.setName("usestatus");
					record.setBefore(String.valueOf(card.getUsestatus()));
				}else if("6".equals(nodevalue.trim())){							//折旧类型
					body.setZjtype(changeValue);
					record.setName("zjtype");
					record.setBefore(String.valueOf(card.getZjtype()));
				}else if("7".equals(nodevalue.trim())){							//使用月限
					Long yueTotal = Long.parseLong(changeValue);
					Long nian = yueTotal/12l;
					Long yue  = yueTotal%12l;
					body.setSynx(nian);
					body.setSyyx(yue);
					record.setName("syyx");
					record.setBefore(String.valueOf(card.getSyyx()+card.getSynx()*12));
				}else if("9".equals(nodevalue.trim())){							//净残值
					double bianhua = Double.parseDouble(changeValue);
					body.setJcz(bianhua);
					body.setJczl(bianhua/card.getYbyz()*100);//净残值率
					record.setName("jcz");
					record.setBefore(String.valueOf(card.getJcz()));
				}else if("10".equals(nodevalue.trim())){							//累计折旧
					body.setLjzj(Double.parseDouble(changeValue));
					body.setJvalue(card.getYbyz()-Double.parseDouble(changeValue));
					body.setJevalue(card.getYbyz()-Double.parseDouble(changeValue));
					record.setName("ljzj");
					record.setBefore(String.valueOf(card.getLjzj()));
				}else if("11".equals(nodevalue.trim())){							//卡片类别，
					body.setTypecode(changeValue);
					body.setChildid(changeValue);
					record.setName("typecode");
					record.setBefore(String.valueOf(card.getTypecode()));
				}else if("12".equals(nodevalue.trim())){							//增加方式
					body.setAddtype(changeValue);
					record.setName("addtype");
					record.setBefore(String.valueOf(card.getAddtype()));
				}else if("13".equals(nodevalue.trim())){							//折旧承担部门
					body.setZjcdbm(changeValue);
					record.setName("zjcdbm");
					record.setBefore(String.valueOf(card.getZjcdbm()));
				}else if("14".equals(nodevalue.trim())){							//使用人
					body.setUsername(changeValue);
					record.setName("username");
					record.setBefore(String.valueOf(card.getUsername()));
				}
				body.setChangeway(nodevalue);
				body.setChangereason(changereason);
				this.update(body);
				record.setPkId(headId.toString());
				record.setChangetype("卡片变动");
				record.setZcType("card");
				record.setChangeinfoid(cardId);
				record.setAfter(changeValue);
				record.setZcId(String.valueOf(body.getId()));
				record.setChangedate(new Date());
				IUser user = UserThreadLocal.get();
				record.setChangeperson(user.getUsername());
				record.setChangepersonId(user.getUserTidChar());
				record.setChangeinfoid(String.valueOf(card.getId()));
				//流程
				CaShead head = this.findCaSheadById(headId);
				record.setWfCode(head.getWfconfigCode());
				//设置审批状态为0：未审批
				record.setZhuangTai("0");
				record.setBiaoming("lccardtemp");
				this.saveRecord(record);
			}
		}
	}
	
	/**
	 * 保存减少表体 经营固定资产盘点用
	 * @param cardIds
	 */
	public void saveBody4JYZCcheck(String cardIds) {
//		String ids[] = cardIds.split(",");
//		for (int i = 0; i < ids.length; i++) {
//			//将card信息加入到body里部分字段要手动写
//			String dealmethod = body.getDealmethod();
//			String changereason = body.getChangereason();
//			Long kpxzid = body.getKpxzid();
//			String cardinfoid = body.getCardinfoid();
//			card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
//			body = cardCommonUCCImpl.card2Body(card);
//			body.setDealmethod(dealmethod);
//			body.setChangereason(changereason);
//			body.setKpxzid(kpxzid);
//			body.setCardinfoid(cardinfoid);
//			if("0".equals(body.getSfzy().trim())){
//				JyzcXx zc = new JyzcXx();
//				zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
//				if("1".equals(zc.getZlzt())||"3".equals(zc.getCZczc())||"4".equals(zc.getCZczc())||"5".equals(zc.getCZczc())){
//					reduceCheck = "该卡片所挂接资产在租赁或处置中，无法减少！";
//				}else{
//					cardCommonUCCImpl.save(body);
//				}
//			}
//		}
	}

	public Cardinfo findCardinfoByCardCode(String cardcode) {
		String hql = "from Cardinfo x where x.cardcode = ?" ;
		List params =  new ArrayList();
		params.add(cardcode);
		Cardinfo xx =  new Cardinfo();
		List cardinfoList  =  publicDao.find(hql, params);
		if(cardinfoList!=null&&cardinfoList.size()>0){
			xx  = (Cardinfo) cardinfoList.get(0);
		}
		return xx;
	}
	
	/**
	 * 通过办理依据的id查找办理依据
	 * @param id
	 * @return
	 */
	public CommonAccording findAccordingById(String id){
		CommonAccording ca = publicDao.findById(CommonAccording.class, id);
		return ca;
		
	}
	
	/**
	 * 保存办理依据
	 */
	public void saveCA(CommonAccording ca){
		publicDao.save(ca);
	}
	
}
