package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskHead;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.zccz.service.IKnowOperateBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;

/**
 * 知识库维护
 * 
 * @author 陈煜霄
 * @date 2010-12-22
 */
@Service
public class KnowOperateBSImpl implements IKnowOperateBS {

	private String bdqfid = ""; // 变动前父id
	private String bdqbh = ""; // 变动前编号
	private String bdqz = ""; // 变动前值
	private String bdhfid = ""; // 变动后父id
	private String bdhbh = ""; // 变动后编号
	private String bdhz = ""; // 变动后值
	private String spjg = ""; // 审批结果
	@Autowired
	private PublicDao publicDao;

	/**
	 * 保存表头信息
	 * 
	 * @param head
	 */
	public void saveHead(CzSczskHead head) {
		publicDao.save(head);
	}

	/**
	 * 修改表头信息
	 * 
	 * @param head
	 */
	public void updateHead(CzSczskHead head) {
		publicDao.update(head);
	}

	/**
	 * 根据表头id查询表头信息
	 * 
	 * @return
	 */
	public CzSczskHead findHeadByHeadId(String headId) {
		String hql = "from CzSczskHead o where o.id=?";
		List<String> list = new ArrayList<String>();
		list.add(headId);
		return (CzSczskHead) publicDao.findSingleResult(hql, list);
	}

	/**
	 * 根据表头id查询表体信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId) {
		String hqlStr = "from CzSczskBdxx c where c.cldId = '" + headId
				+ "' and c.bdfs <> '因迁移而变动' order by c.id desc ";
		List resultList = publicDao.find(hqlStr);
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}

	/**
	 * 删除临时表中的内容
	 * 
	 * @param headId
	 * @param itemId
	 */
	@SuppressWarnings("unchecked")
	public void deleteLSB(String headId, String itemId,String level) {
		String isnewAdd = "select zjbz from cz_sczsk_lsb where cld_id = '"
			+ headId + "' and zsk_id = '" + itemId + "'";
		List isnew = publicDao.queryForList(isnewAdd, new ArrayList());
		String zjbz = "";
		if(isnew.size()>0){
			Map map = (Map)isnew.get(0);
			zjbz = String.valueOf(map.get("zjbz"));
		}
		if("1".equals(zjbz)){
			String sql = "select * from cz_sczsk_lsb where pid = '" + itemId
				+ "' and cld_id = '" + headId + "' ";	
			List list = publicDao.queryForList(sql, new ArrayList());
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				Map map = new HashMap();
				map = (Map) iterator.next();
				deleteLSB(headId, String.valueOf(map.get("zsk_id")),String.valueOf(Integer.valueOf(level)+1));
			}
			String strSql = "delete from cz_sczsk_lsb where zsk_id = '"+itemId+"' and cld_id = '"+headId+"'";
			publicDao.getJdbcTemplate().execute(strSql);
			String delbdxx = "delete from cz_sczsk_bdxx where cld_id = '"+headId+"' and zsk_id = '"+itemId+"' ";
			publicDao.getJdbcTemplate().execute(delbdxx);
		}else{
			String sql = "select * from cz_sczsk_lsb where pid = '" + itemId
				+ "' and cld_id = '" + headId + "' ";
			List list = publicDao.queryForList(sql, new ArrayList());
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				Map map = new HashMap();
				map = (Map) iterator.next();
				deleteLSB(headId, String.valueOf(map.get("zsk_id")),String.valueOf(Integer.valueOf(level)+1));
			}
			this.saveDeleteBody(headId, itemId, level);
			String strSql = "update cz_sczsk_lsb set scbz = '1' where cld_id = '"
					+ headId + "' " + "and zsk_id = '" + itemId + "'";
			publicDao.getJdbcTemplate().execute(strSql);
		}
	}

	/**
	 * 判断是否有子节点
	 * 
	 * @param headId
	 * @param itemId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean findLSBByParentId(String headId, String itemId) {
		String strSql = "select * from cz_sczsk_lsb where cld_id = ? and pid = ?";
		List list = new ArrayList();
		list.add(headId);
		list.add(itemId);
		List resultList = publicDao.queryForList(strSql, list);
		if (resultList.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 保存删除临时表的表体
	 * 
	 * @param headId
	 * @param itemId
	 */
	public void saveDeleteBody(String headId, String itemId, String level) {
		String before = "select * from cz_sczsk where id = '" + itemId + "'";
		List beforeR = publicDao.queryForList(before, new ArrayList());
		CzSczskBdxx bdxx = new CzSczskBdxx();
		if (beforeR.size() > 0) {
			Map map = (Map) beforeR.get(0);
			bdxx.setCldId(headId);
			bdxx.setZskId(itemId);
			bdxx.setBdqfid(String.valueOf(map.get("pid")));
			bdxx.setBdqbh(String.valueOf(map.get("code")));
			bdxx.setBdhbh(String.valueOf(map.get("code")));
			bdxx.setBdhfid(String.valueOf(map.get("pid")));
			bdxx.setBdhz("  ");
			if("1".equals(level)){
				bdxx.setBdqz("  项目:"+String.valueOf(map.get("value")));
				bdxx.setBdfs("项目删除");
			}else if("2".equals(level)){
				String sqlyd = "select value from cz_sczsk where id = '"+String.valueOf(map.get("pid"))+"'";
				List listyd = publicDao.queryForList(sqlyd, new ArrayList());
				if(listyd.size()>0){
					Map mapyd = (Map)listyd.get(0);
					String xm = String.valueOf(mapyd.get("value"));
					bdxx.setBdqz("  项目:" + xm + "  要点:" + String.valueOf(map.get("value")));
				}
				bdxx.setBdfs("要点删除");
			}else if("3".equals(level)){
				String sqlyj = "select value,pid from cz_sczsk where id = '"+String.valueOf(map.get("pid"))+"'";
				List listyj = publicDao.queryForList(sqlyj, new ArrayList());
				if(listyj.size()>0){
					Map mapyj = (Map)listyj.get(0);
					String yd = String.valueOf(mapyj.get("value"));
					String ydpid = String.valueOf(mapyj.get("pid"));
					String sqlyj1 = "select value from cz_sczsk where id = '"+ydpid+"'";
					List listyd1 = publicDao.queryForList(sqlyj1, new ArrayList());
					if(listyd1.size()>0){
						Map mapyj1 = (Map)listyd1.get(0);
						String xm = String.valueOf(mapyj1.get("value"));
						bdxx.setBdqz("  项目:" + xm + "  要点:" + yd + "  意见:" + String.valueOf(map.get("value")));
					}
				}
				bdxx.setBdfs("意见删除");
			}
			bdxx.setSpjg("未审批");
		}
		publicDao.save(bdxx);
	}

	/**
	 * 修改临时表的内容
	 * 
	 * @param headId
	 * @param itemId
	 * @param value
	 */
	public void updateLSB(String headId, String itemId, String value, String level) {
		String sqlStr = "update cz_sczsk_lsb set value = '" + value + "' where cld_id = '"
			+ headId + "' and zsk_id = '" + itemId + "'";
		publicDao.getJdbcTemplate().execute(sqlStr);
		this.saveUpdateBody(headId, itemId, value, level);
	}

	/**
	 * 保存修改时的表体
	 * 
	 * @param headId
	 * @param itemId
	 * @param value
	 */
	public void saveUpdateBody(String headId, String itemId, String value, String level) {
		String isnewAdd = "select zjbz from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and zsk_id = '" + itemId + "'";
		List isnew = publicDao.queryForList(isnewAdd, new ArrayList());
		String zjbz = "";
		if(isnew.size()>0){
			Map map = (Map)isnew.get(0);
			zjbz = String.valueOf(map.get("zjbz"));
		}
		if("1".equals(zjbz)){
			this.updateAddBdxx(headId,itemId,value,level);
		}else{
			String before = "select * from cz_sczsk where id = '" + itemId + "'";
			String after = "select * from cz_sczsk_lsb where cld_id ='" + headId
					+ "' and zsk_id = '" + itemId + "' ";
			List beforeR = publicDao.queryForList(before, new ArrayList());
			List afterR = publicDao.queryForList(after, new ArrayList());
			String cldId = headId;
			String zskId = itemId;
			if (beforeR.size() > 0) {
				Map map = (Map) beforeR.get(0);
				bdqfid = String.valueOf(map.get("pid")); // 变动前父id
				bdqbh = String.valueOf(map.get("code")); // 变动前编号
				bdqz = String.valueOf(map.get("value")); // 变动前值
			}
			if (afterR.size() > 0) {
				Map map = (Map) afterR.get(0);
				bdhfid = String.valueOf(map.get("pid")); // 变动后父id
				bdhbh = String.valueOf(map.get("code")); // 变动后编号
				bdhz = String.valueOf(value); // 变动后值
			}
			String checkSql = "";
			if("1".equals(level)){
				checkSql = "select * from cz_sczsk_bdxx where cld_id = '"
					+ headId + "' and zsk_id = '" + itemId + "' and bdfs = '项目修改'";
			}else{
				checkSql = "select * from cz_sczsk_bdxx where cld_id = '"
					+ headId + "' and zsk_id = '" + itemId + "' and bdfs = '要点修改'";
			}
			List list = publicDao.queryForList(checkSql, new ArrayList());
			if(list.size()>0){
				CzSczskBdxx bdxx = new CzSczskBdxx();
				Map map = (Map)list.get(0);
				String id = String.valueOf(map.get("id"));
				bdxx.setId(id);
				bdxx.setCldId(headId);
				bdxx.setZskId(itemId);
				bdxx.setBdqfid(bdqfid);
				bdxx.setBdqbh(bdqbh);
				bdxx.setBdhfid(bdhfid);
				bdxx.setBdhbh(bdhbh);
				if("1".equals(level)){
					bdxx.setBdfs("项目修改");
					bdxx.setBdqz("  项目:"+bdqz);
					bdxx.setBdhz("  项目:"+bdhz);
				}else{
					String selectSql = "select p.value from cz_sczsk_lsb c , cz_sczsk_lsb p where "
						+ "c.pid = p.zsk_id and c.zsk_id = '" + itemId + "' and c.cld_id = '"+headId+"'";
					List listaa = publicDao.queryForList(selectSql, new ArrayList());
					if(listaa.size()>0){
						Map mapaa = (Map)listaa.get(0);
						String parentText = String.valueOf(mapaa.get("value"));
						bdxx.setBdhz("  项目:"+parentText + "  要点:"+bdhz);
						bdxx.setBdqz("  项目:"+parentText + "  要点:"+bdqz);
					}
					bdxx.setSpjg("要点修改");
				}
				publicDao.update(bdxx);
			}else{
				CzSczskBdxx bdxx = new CzSczskBdxx();
				bdxx.setCldId(headId);
				bdxx.setZskId(itemId);
				bdxx.setBdqfid(bdqfid);
				bdxx.setBdqbh(bdqbh);
				bdxx.setBdhfid(bdhfid);
				bdxx.setBdhbh(bdhbh);
				if("1".equals(level)){
					bdxx.setBdfs("项目修改");
					bdxx.setBdqz("  项目:"+bdqz);
					bdxx.setBdhz("  项目:"+bdhz);
				}else{
					String selectSql = "select p.value from cz_sczsk_lsb c , cz_sczsk_lsb p where "
						+ "c.pid = p.zsk_id and c.zsk_id = '" + itemId + "' and c.cld_id = '"+headId+"'";
					List listaa = publicDao.queryForList(selectSql, new ArrayList());
					if(listaa.size()>0){
						Map mapaa = (Map)listaa.get(0);
						String parentText = String.valueOf(mapaa.get("value"));
						bdxx.setBdhz("  项目:"+parentText + "  要点:"+bdhz);
						bdxx.setBdqz("  项目:"+parentText + "  要点:"+bdqz);
					}
					bdxx.setBdfs("要点修改");
				}
				bdxx.setSpjg("未审批");
				publicDao.save(bdxx);
			}
		}
	}

	/**
	 * 迁移临时表操作
	 * 
	 * @param itemId
	 * @param parentId
	 * @param nextId
	 * @param headId
	 */
	public void moveLSB(String moveIds, String parentId, String nextIds,
			String headId) {
		String[] moveId = moveIds.split(",");
		String[] next = nextIds.split(",");
//		if(nextIds != null){
//			next = nextIds.split(",");
//		}
		String nextId = "";
		for(int n = 0 ; n < next.length;n++){
			nextId = next[0];
		}
		int count = 0;
		count = moveId.length + 1;
		if(!nextId.equals("null")){
			String codeNum = "";// nextId所对应的排序
			String strNext = "select code from cz_sczsk_lsb where zsk_id = '"
				+ nextId + "' and cld_id = '" + headId + "'";
			List nextR = publicDao.queryForList(strNext, new ArrayList());
			if (nextR.size() > 0) {
				Map map = (Map) nextR.get(0);
				codeNum = String.valueOf(map.get("code")); // nextId所对应的排序
			}
			// 查询临时表里面该要点下的所有信息
			String sql = "select * from cz_sczsk_lsb where cld_id = '" + headId
			+ "' and pid = '" + parentId + "' ";
			for(int m = 0 ; m < moveId.length;m++){
				String itemId = moveId[m];
				sql = sql + " and zsk_id != '"+itemId+"' ";
			}
			List sqlList = publicDao.queryForList(sql, new ArrayList());
			for (int i = 0; i < sqlList.size(); i++) {
				Map map = (Map) sqlList.get(i);
				String code = String.valueOf(map.get("code"));
				String zskId = String.valueOf(map.get("zsk_id"));
				boolean flag = this.isNewMove(headId,zskId);
				if (Integer.valueOf(code) >= Integer.valueOf(codeNum) && flag != true) {
					code = String.valueOf(Integer.valueOf(code) + count);
					CzSczskBdxx bdxx = new CzSczskBdxx();
					bdxx.setBdhbh(code);
					bdxx.setBdqbh(String.valueOf(map.get("code")));
					bdxx.setBdhfid(String.valueOf(map.get("pid")));
					bdxx.setBdqfid(String.valueOf(map.get("pid")));
					bdxx.setBdqz(String.valueOf(map.get("value")));
					bdxx.setBdhz(String.valueOf(map.get("value")));
					bdxx.setZskId(String.valueOf(map.get("zsk_id")));
					bdxx.setCldId(headId);
					bdxx.setBdfs("因迁移而变动");
					bdxx.setSpjg("审批通过");
					this.isUpdateORsaveBDXX(bdxx); // 判断变动信息是新增还是修改
				} else {
					code = String.valueOf(Integer.valueOf(code) + count);
					CzSczskBdxx bdxx = new CzSczskBdxx();
					bdxx.setBdhbh(code);
					bdxx.setBdqbh(String.valueOf(map.get("code")));
					bdxx.setBdhfid(String.valueOf(map.get("pid")));
					bdxx.setBdqfid(String.valueOf(map.get("pid")));
					bdxx.setBdqz(String.valueOf(map.get("value")));
					bdxx.setBdhz(String.valueOf(map.get("value")));
					bdxx.setZskId(String.valueOf(map.get("zsk_id")));
					bdxx.setCldId(headId);
					bdxx.setBdfs("迁移具体意见");
					bdxx.setSpjg("未审批");
				}
				// 该要点下的其他信息的修改
				String id = String.valueOf(map.get("id"));
				String update = "update cz_sczsk_lsb set code = '"+code+"' where id = '"+id+"' ";
				publicDao.getJdbcTemplate().execute(update);
			}
			for (int i = 0; i < moveId.length; i++) {
				String itemId = moveId[i];
				this.moveLSBImpl(itemId, parentId, nextId, headId, Integer.valueOf(codeNum)+i);
			}
		} else {
			for (int i = 0; i < moveId.length; i++) {
				String itemId = moveId[i];
				this.moveLSBImpl(itemId, parentId, nextId, headId, i);
			}
		}
		
	}
	
	/**
	 * 迁移的实现
	 * 
	 * @param itemId
	 * @param parentId
	 * @param nextId
	 * @param headId
	 */
	@SuppressWarnings("unchecked")
	public void moveLSBImpl(String itemId, String parentId, String nextId,
			String headId, int hcode) {
		String hydtext = this.findLSBValue(headId, parentId); // 变动后要点信息
		String hxmid = this.findLSBPid(headId, parentId); // 变动后项目id
		String hxmtext = this.findLSBValue(headId, hxmid); // 变动后项目信息
		String qydid = this.findLSBPid(headId, itemId); // 变动前要点id
		String qydtext = this.findLSBValue(headId, qydid); // 变动前要点信息
		String qmxid = this.findLSBPid(headId, qydid); // 变动前项目id
		String qxmtext = this.findLSBValue(headId, qmxid); // 变动前项目信息
		String yjtext = this.findLSBValue(headId, itemId); // 具体意见值
		if (!nextId.equals("null")) { // 如果不是移动到最某个要点下的最后一位 即nextId不等于null
			// 修改变动信息表里要迁移信息的排序字段和父节点字段
			String updMove = "update cz_sczsk_lsb set code = '" + hcode
					+ "' , pid = '" + parentId + "' where zsk_id = '" + itemId
					+ "' and cld_id = '" + headId + "' ";
			publicDao.getJdbcTemplate().execute(updMove);
			// 将迁移的信息存入变动信息表
			CzSczskBdxx thisxx = new CzSczskBdxx();
			thisxx.setBdfs("迁移具体意见"); // 变动方式
			thisxx.setBdhbh(String.valueOf(hcode)); // 变动后编号
			thisxx.setBdhfid(parentId); // 变动后要点id 既pid
			thisxx.setBdhz("  项目:" + hxmtext + "  要点:" + hydtext + "  意见:" + yjtext); // 变动后值
			thisxx.setBdqbh(""); // 变动前编号
			thisxx.setBdqfid(qydid); // 变动前pid
			thisxx.setBdqz("  项目:" + qxmtext + "  要点:" + qydtext + "  意见:" + yjtext); // 变动前值
			thisxx.setCldId(headId); // 处理单id
			thisxx.setSpjg("未审批"); // 审批状态
			thisxx.setZskId(itemId); // 对应知识库id
			this.isUpdateORsaveBDXX(thisxx); // 判断变动信息是新增还是修改
		}
		else { // 如果是移动到最某个要点下的最后一位 即nextId等于null
			// 查找该要点下最大的code 则变动后编号为最大code+1
			String lastsql = "select * from cz_sczsk_lsb where cld_id = '"
					+ headId + "' and pid = '" + parentId
					+ "' order by code desc";
			List lastList = publicDao.queryForList(lastsql, new ArrayList());
			if (lastList.size() > 0) {
				Map map = (Map) lastList.get(0);
				String code = String.valueOf(map.get("code"));
				bdhbh = String.valueOf(Integer.valueOf(code) + 1 + hcode); // 变动后排序
			}else{
				bdhbh = "1";
			}
			// 修改变动信息表里要迁移信息的排序字段和父节点字段
			String updMove = "update cz_sczsk_lsb set code = '" + bdhbh
					+ "' , pid = '" + parentId + "' where zsk_id = '" + itemId
					+ "' and cld_id = '" + headId + "' ";
			publicDao.getJdbcTemplate().execute(updMove);
			// 将迁移的信息存入变动信息表
			CzSczskBdxx thisxx = new CzSczskBdxx();
			thisxx.setBdfs("迁移具体意见"); // 变动方式
			thisxx.setBdhbh(bdhbh); // 变动后编号
			thisxx.setBdhfid(parentId); // 变动后要点id 既pid
			thisxx.setBdhz("  项目:" + hxmtext + "  要点:" + hydtext + "  意见:" + yjtext); // 变动后值
			thisxx.setBdqbh(""); // 变动前编号
			thisxx.setBdqfid(qydid); // 变动前pid
			thisxx.setBdqz("  项目:" + qxmtext + "  要点:" + qydtext + "  意见:" + yjtext); // 变动前值
			thisxx.setCldId(headId); // 处理单id
			thisxx.setSpjg("未审批"); // 审批状态
			thisxx.setZskId(itemId); // 对应知识库id
			this.isUpdateORsaveBDXX(thisxx); // 判断变动信息是新增还是修改
		}
	}
	
	/**
	 * 点击按钮迁移
	 * 
	 * @param headId
	 * @param qyjid
	 * @param hxmid
	 * @param hxmtext
	 * @param hydid
	 * @param hydtext
	 */
	public void moveYJ(String headId, String qyjid, String hxmid,
			String hxmtext, String hydid, String hydtext) {
		String code = "1";
		String selCode = "select code from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and pid = '" + hydid + "' order by code desc";
		List codelist = publicDao.queryForList(selCode, new ArrayList());
		if (codelist.size() > 0) {
			Map map = (Map) codelist.get(0);
			code = (String) map.get("code");
		}
		String[] ids = qyjid.split(",");
		for (int i = 0; i < ids.length; i++) {
			code = String.valueOf(Integer.valueOf(code) + 1);
			String qcode = this.findLSBCode(headId, ids[i]);
			String qydid = this.findLSBPid(headId, ids[i]);
			String qydtext = this.findLSBValue(headId, qydid);
			String qxmid = this.findLSBPid(headId, qydid);
			String qxmtext = this.findLSBValue(headId, qxmid);
			String updYJ = "update cz_sczsk_lsb set pid = '" + hydid
					+ "' , code = '" + code + "' where cld_id = '" + headId
					+ "' and zsk_id = '" + ids[i] + "' ";
			publicDao.getJdbcTemplate().execute(updYJ);
			CzSczskBdxx bdxx = new CzSczskBdxx();
			bdxx.setBdhfid(hydid);
			bdxx.setBdfs("迁移具体意见");
			bdxx.setBdhbh(code);
			bdxx.setBdhz(hxmtext + " / " + hydtext);
			bdxx.setBdqfid(qydid);
			bdxx.setBdqbh(qcode);
			bdxx.setBdqz(qydtext + " / " + qxmtext);
			bdxx.setZskId(ids[i]);
			bdxx.setSpjg("未审批");
			bdxx.setCldId(headId);
			publicDao.save(bdxx);
		}
	}
	
	/**
	 * 是否通过审批
	 * 
	 * @param Ids
	 * @param isAgree
	 */
	public void isAgree(String[] Ids, String isAgree) {
		if ("yes".equals(isAgree)) {
			for (int i = 0; i < Ids.length; i++) {
				String strSql = "update cz_sczsk_bdxx set spjg = '审批通过' where id = '"
						+ Ids[i] + "'";
				publicDao.getJdbcTemplate().execute(strSql);
			}
		} else if ("no".equals(isAgree)) {
			for (int i = 0; i < Ids.length; i++) {
				String strSql = "update cz_sczsk_bdxx set spjg = '审批未通过' where id = '"
						+ Ids[i] + "'";
				publicDao.getJdbcTemplate().execute(strSql);
			}
		}
	}
	
	/**
	 * 添加一级分类
	 * 
	 * @param headId
	 */
	public void addLSBParent1(String headId) {
		String zskId = ""; // 知识库id
		String code = "0"; // 序号编号
		for (int i = 0; i < 32; i++) {
			zskId = UUID.randomUUID().toString().replaceAll("-", "");
		}
		String selCode = "select code from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and pid = '0' order by code desc";
		List list = publicDao.queryForList(selCode, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			code = String.valueOf(map.get("code"));
		}
		CzSczskLsb lsb = new CzSczskLsb();
		lsb.setCldId(headId);
		lsb.setZskId(zskId);
		lsb.setCode(String.valueOf(Integer.valueOf(code) + 1));
		lsb.setValue("New item");
		lsb.setZjbz("1");
		lsb.setPid("0");
		lsb.setScbz("0");
		publicDao.save(lsb);
		this.saveAddBdxx(headId, zskId, lsb.getCode(), lsb.getPid(), "  项目:"+lsb.getValue(),"1");
	}

	/**
	 * 添加二级分类
	 * 
	 * @param headId
	 * @param itemId
	 */
	public void addLSBParent2(String headId, String itemId) {
		String pid = ""; // 父id
		String code = "0"; // 顺序编号
		String zskId = "";
		for (int i = 0; i < 32; i++) {
			zskId = UUID.randomUUID().toString().replaceAll("-", "");
		}
		String selPar = "select pid from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and zsk_id = '" + itemId + "'";
		List pidList = publicDao.queryForList(selPar, new ArrayList());
		if (pidList.size() > 0) {
			Map map = (Map) pidList.get(0);
			pid = String.valueOf(map.get("pid"));
		}
		String selCode = "select code from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and pid = '" + pid + "' order by code desc";
		List list = publicDao.queryForList(selCode, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			code = String.valueOf(map.get("code"));
		}
		CzSczskLsb lsb = new CzSczskLsb();
		lsb.setCldId(headId);
		lsb.setZskId(zskId);
		lsb.setCode(String.valueOf(Integer.valueOf(code) + 1));
		lsb.setValue("New item");
		lsb.setZjbz("1");
		lsb.setPid(pid);
		lsb.setScbz("0");
		publicDao.save(lsb);
		this.saveAddBdxx(headId, zskId, lsb.getCode(), lsb.getPid(), lsb.getValue(),"2");
	}
	
	/**
	 * 添加子节点
	 * 
	 * @param headId
	 * @param itemId
	 */
	public void addLSBChild(String headId, String itemId,String itemText) {
		String code = "0";
		String selCode = "select code from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and pid = '" + itemId + "' order by code desc";
		List list = publicDao.queryForList(selCode, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			code = String.valueOf(map.get("code"));
		}
		String zskId = "";
		for (int i = 0; i < 32; i++) {
			zskId = UUID.randomUUID().toString().replaceAll("-", "");
		}
		CzSczskLsb lsb = new CzSczskLsb();
		lsb.setCldId(headId);
		lsb.setZskId(zskId);
		lsb.setCode(String.valueOf(Integer.valueOf(code) + 1));
		lsb.setValue("New item");
		lsb.setZjbz("1");
		lsb.setPid(itemId);
		lsb.setScbz("0");
		publicDao.save(lsb);
		String bdhz =  "  项目:" + itemText + "  要点:" + lsb.getValue();
		this.saveAddBdxx(headId, zskId, lsb.getCode(), lsb.getPid(), bdhz,"2");
	}
	
	/**
	 * 保存添加时候的变动记录表
	 * 
	 * @param headId
	 * @param zskId
	 * @param bdhbh
	 * @param bdhfid
	 * @param bdhz
	 */
	public void saveAddBdxx(String headId, String zskId, String bdhbh,
			String bdhfid, String bdhz,String level) {
		CzSczskBdxx bdxx = new CzSczskBdxx();
		bdxx.setCldId(headId);
		bdxx.setZskId(zskId);
		if("1".equals(level)){
			bdxx.setBdfs("项目增加");
		}else{
			bdxx.setBdfs("要点增加");
		}
		bdxx.setBdhbh(bdhbh);
		bdxx.setBdhfid(bdhfid);
		bdxx.setBdhz(bdhz);
		bdxx.setSpjg("未审批");
		publicDao.save(bdxx);
	}
	
	/**
	 * 修改
	 */
	public void updateAddBdxx(String headId, String itemId, String value,String level) {
		if("1".equals(level)){
			value = "  项目:"+value;
			String updateSql = "update cz_sczsk_bdxx set bdhz = '" + value
					+ "' where cld_id = '" + headId + "' and zsk_id = '"
					+ itemId + "' ";
			publicDao.getJdbcTemplate().execute(updateSql);
		}else{
			String selectSql = "select p.value from cz_sczsk_lsb c , cz_sczsk_lsb p where "
					+ "c.pid = p.zsk_id and c.zsk_id = '"
					+ itemId
					+ "' and c.cld_id = '" + headId + "'";
			List list = publicDao.queryForList(selectSql, new ArrayList());
			if(list.size()>0){
				Map map = (Map)list.get(0);
				String parentText = String.valueOf(map.get("value"));
				value = "  项目:" + parentText + "  要点:" + value;
				String updateSql = "update cz_sczsk_bdxx set bdhz = '" + value
						+ "' where cld_id = '" + headId + "' and zsk_id = '"
						+ itemId + "' ";
				publicDao.getJdbcTemplate().execute(updateSql);
			}
		}
	}
	
	/**
	 * 流程办结时候将变动信息写入正式表
	 * 
	 * @param headId
	 */
	@SuppressWarnings("unchecked")
	public void writeToZSB(String headId) {
		String sql = "select * from cz_sczsk_bdxx where cld_id = '" + headId
				+ "' and spjg = '审批通过' ";
		List list = publicDao.queryForList(sql, new ArrayList());
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			String bdfs = String.valueOf(map.get("bdfs"));
			if ("项目增加".equals(bdfs)) {
				String id = String.valueOf(map.get("zsk_id"));
				String code = String.valueOf(map.get("bdhbh"));
				String value = String.valueOf(map.get("bdhz"));
				String pid = String.valueOf(map.get("bdhfid"));
				String scbz = "0";
				String str[] = value.split("  项目:");
				value = str[1];
				String strSql = "insert into cz_sczsk (id,pid,code,value,scbz)"
						+ " values ('" + id + "','" + pid + "','" + code
						+ "','" + value + "','" + scbz + "')";
				publicDao.getJdbcTemplate().execute(strSql);
			}else if("要点增加".equals(bdfs)){
				String id = String.valueOf(map.get("zsk_id"));
				String code = String.valueOf(map.get("bdhbh"));
				String value = String.valueOf(map.get("bdhz"));
				String pid = String.valueOf(map.get("bdhfid"));
				String scbz = "0";
				String str[] = value.split("  要点:");
				value = str[1];
				String strSql = "insert into cz_sczsk (id,pid,code,value,scbz)"
						+ " values ('" + id + "','" + pid + "','" + code
						+ "','" + value + "','" + scbz + "')";
				publicDao.getJdbcTemplate().execute(strSql);
			}else if ("项目删除".equals(bdfs) || "要点删除".equals(bdfs) || "意见删除".equals(bdfs)) {
				CzSczsk zsb = new CzSczsk();
				zsb.setId(String.valueOf(map.get("zsk_id")));
				zsb.setCode(String.valueOf(map.get("bdhbh")));
				zsb.setValue(String.valueOf(map.get("bdhz")));
				zsb.setPid(String.valueOf(map.get("bdhfid")));
				zsb.setScbz("1");
				publicDao.update(zsb);
			}else if ("要点修改".equals(bdfs)) {
				CzSczsk zsb = new CzSczsk();
				zsb.setId(String.valueOf(map.get("zsk_id")));
				zsb.setCode(String.valueOf(map.get("bdhbh")));
				String value = String.valueOf(map.get("bdhz"));
				String str[] = value.split("  要点:");
				value = str[1];
				zsb.setValue(value);
				zsb.setPid(String.valueOf(map.get("bdhfid")));
				zsb.setScbz("0");
				publicDao.update(zsb);
			}else if("项目修改".equals(bdfs)){
				CzSczsk zsb = new CzSczsk();
				zsb.setId(String.valueOf(map.get("zsk_id")));
				zsb.setCode(String.valueOf(map.get("bdhbh")));
				String value = String.valueOf(map.get("bdhz"));
				String str[] = value.split("  项目:");
				value = str[1];
				zsb.setValue(value);
				zsb.setPid(String.valueOf(map.get("bdhfid")));
				zsb.setScbz("0");
				publicDao.update(zsb);
			}else {
				String update = "update cz_sczsk set pid = '"
						+ String.valueOf(map.get("bdhfid")) + "',code = '"
						+ String.valueOf(map.get("bdhbh")) + "' where id = '"
						+ String.valueOf(map.get("zsk_id")) + "'";
				publicDao.getJdbcTemplate().execute(update);
			}
		}
	}
	
	/**
	 * 查找临时表的父id
	 * 
	 * @param headId
	 * @param itemId
	 * @return
	 */
	public String findLSBPid(String headId, String itemId) {
		String pid = "";
		String selbdq = "select pid from cz_sczsk_lsb where cld_id = '" + headId
				+ "' and zsk_id = '" + itemId + "' ";
		List bdqList = publicDao.queryForList(selbdq, new ArrayList());
		if (bdqList.size() > 0) {
			Map map = (Map) bdqList.get(0);
			pid = (String) map.get("pid");
		}
		return pid;
	}
	
	/**
	 * 查找临时表的value
	 * 
	 * @param headId
	 * @param zskId
	 * @return
	 */
	public String findLSBValue(String headId, String zskId) {
		String value = "";
		String selbdq = "select value from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and zsk_id = '" + zskId + "' ";
		List bdqList = publicDao.queryForList(selbdq, new ArrayList());
		if (bdqList.size() > 0) {
			Map map = (Map) bdqList.get(0);
			value = (String) map.get("value");
		}
		return value;
	}
	
	/**
	 * 查找临时表排序
	 * 
	 * @param headId
	 * @param zskId
	 * @return
	 */
	public String findLSBCode(String headId, String zskId) {
		String code = "";
		String selbdq = "select code from cz_sczsk_lsb where cld_id = '"
				+ headId + "' and zsk_id = '" + zskId + "' ";
		List bdqList = publicDao.queryForList(selbdq, new ArrayList());
		if (bdqList.size() > 0) {
			Map map = (Map) bdqList.get(0);
			code = (String) map.get("code");
		}
		return code;
	}
	
	/**
	 * 判断变动信息是修改还是添加
	 * @param thisxx
	 */
	public void isUpdateORsaveBDXX(CzSczskBdxx thisxx) {
		String checkSql = "select id from cz_sczsk_bdxx where zsk_id = '"
				+ thisxx.getZskId() + "'  and cld_id = '" + thisxx.getCldId()
				+ "'";
		List checkList = publicDao.queryForList(checkSql, new ArrayList());
		if (checkList.size() > 0) {
			Map xx = (Map) checkList.get(0);
			String id = String.valueOf(xx.get("id"));
			thisxx.setId(id);
			// publicDao.update(thisxx);
			String update = "update cz_sczsk_bdxx set bdhfid = '"
					+ thisxx.getBdhfid() + "' , bdhz = '" + thisxx.getBdhz()
					+ "' , " + "bdqz = '" + thisxx.getBdqz() + "',bdqfid = '"
					+ thisxx.getBdqfid() + "',bdfs = '" + thisxx.getBdfs()
					+ "' , bdhbh = '" + thisxx.getBdhbh() + "' , bdqbh = '"
					+ thisxx.getBdqbh() + "' where id = '" + id + "'";
			publicDao.getJdbcTemplate().execute(update);
		} else {
			publicDao.save(thisxx);
		}
	}
	
	/**
	 * 判断是否是新迁移过的意见
	 * 
	 * @return
	 */
	public boolean isNewMove(String headId, String zskId) {
		boolean flag = false;
		String sql = "select bdfs from cz_sczsk_bdxx where zsk_id = '" + zskId
				+ "' and cld_id = '" + headId + "' ";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			String bdfs = String.valueOf(map.get("bdfs"));
			if ("迁移具体意见".equals(bdfs)) {
				flag = true;
			}
		}
		return flag;
	}
	
	/**
	 * 通过用户id查找用户名
	 * 
	 * @param userId
	 * @return
	 */
	public String getUserName(String userId){
		PTUserBO user = publicDao.findById(PTUserBO.class, Long.parseLong(userId));
		return user.getUsername();
	}
	
}
