package com.tansun.eam2.kpgl.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.kpgl.service.ICardCommonBS;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.kpgl.vo.CardListInfoVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
@Service
public class CardCommonUCCImpl implements ICardCommonUCC {
	
	@Autowired
	private ICardCommonBS cardAddBSImpl;
	/**
	 * 保存新增卡片表头
	 * @param KpShead
	 */
	public void save(CaShead CaShead){
		cardAddBSImpl.save(CaShead);
	}
	
	/**
	 * 更新新增卡片表头
	 * @param CaShead
	 */
	public void update(CaShead CaShead){
		cardAddBSImpl.update(CaShead);
	}
	
	/**
	 * 删除新增卡片表头
	 * @param CaShead
	 */
	public void delete(CaShead CaShead){
		cardAddBSImpl.delete(CaShead);
	}
	/**
	 * 根据ID查询新增卡片表头信息
	 * @param id
	 */
	public CaShead findCaSheadById(String id){
		return cardAddBSImpl.findCaSheadById(id);
	}
	
	/**
	 * 保存新增卡片表体
	 * @param KpCardtemp
	 */
	public void save(LcCardtemp LcCardtemp){
		cardAddBSImpl.save(LcCardtemp);
	}
	
	/**
	 * 保存新增卡片表体并返回id
	 * 
	 * @param KpCardtemp
	 */
	public String saveBody(LcCardtemp lcCardtemp){
		return cardAddBSImpl.saveBody(lcCardtemp);
	}
	
	/**
	 * 更新新增卡片表体
	 * @param LcCardtemp
	 */
	public void update(LcCardtemp LcCardtemp){
		cardAddBSImpl.update(LcCardtemp);
	}
	
	/**
	 * 删除一条新增卡片表体
	 * @param LcCardtemp
	 */
	public void delete(LcCardtemp LcCardtemp){
		cardAddBSImpl.delete(LcCardtemp);
	}
	
	/**
	 * 删除多条新增卡片表体
	 * @param LcCardtempIds
	 */
	public void delete(String[] LcCardtempIds){
		cardAddBSImpl.delete(LcCardtempIds);
	}
	
	/**
	 * 通过headId 删除body
	 * @param headId
	 */
	public void deleteBodys(String headId){
		cardAddBSImpl.deleteBodys(headId);
	}
	
	/**
	 * 根据ID查询新增卡片表体信息
	 * @param id
	 */
	public LcCardtemp findLcCardtempById(String id){
		return cardAddBSImpl.findLcCardtempById(id);
	}
	
	/**
	 * 根据处理单ID查询该处理单下所有卡片信息
	 * @param id
	 */
	public List findLcCardtempsBySheadId(String id) {
		return cardAddBSImpl.findLcCardtempsBySheadId(id);
	}
	/**
	 * 根据临时卡片表ID 查询出 '卡片名称', '卡片类型', '管理部门', '使用部门','增加方式','原币原值','折旧方法', '操作'
	 * @param bodyList
	 * @return
	 * 方法暂时废弃
	 */
	public String getJSON4CardAddQueryList(List bodyList) {
		return null;
	}

	/**
	 * 根据卡片id查询出卡片信息
	 */
	public List findCardInfoByCardIds(String[] cardIds) {
		return cardAddBSImpl.findCardInfoByCardIds(cardIds);
	}
	
	/**
	 * 查询全部卡片表体信息
	 * @return
	 *  方法暂废弃liubeibei
	 */
	public List<CardListInfoVO> findAllLcCardtemps(){
		// TODO 查询全部卡片的以下字段信息：
		// TODO 卡片id(id)，卡片编号(cardcode)，卡片名称(zcname)，卡片类型(kplx)，卡片状态(state)，是否继承(ifjc)，
		// TODO 资产编号(zcbh)，资产名称(zcmc)，使用部门(usepartment)，管理部门(glbm)，一级分行(firstbranch)
		// 存入CardListInfoVO的字段里面返回一个list
		return null;
	}
	/**
	 * 根据类型，得到数据字典表DIC_APP_ASSET_STATE里的数据，
	 * @return
	 */
	public List queryDicAppAssetState(String type) {
		return cardAddBSImpl.queryDicAppAssetState(type);
	}
	/**
	 * 根据类型，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public List queryIndividualtree(String type){
		return cardAddBSImpl.queryIndividualtree(type);
	}

	/**
	 * 通过卡片id查询卡片信息
	 */
	public Cardinfo findCardinfoByCardId(String cardId) {
		return cardAddBSImpl.findCardinfoByCardId(cardId);
	}
	
	/**
	 * 根据卡片类型的小类和是否承继，得到入账科目
	 */
	public String getRzkm(String typeCode, String ifcj) {
		return this.cardAddBSImpl.getRzkm(typeCode, ifcj);
	}

	/**
	 * 把card的信息 复制到LcCardtemp里
	 * @param card
	 * @return
	 */
	public LcCardtemp card2Body(Cardinfo card) {
		return this.cardAddBSImpl.card2Body(card);
	}
	/**
	 * 根据body和card对比出卡片的变化信息，并存到变动表里，
	 * @param body
	 * @param card
	 * @return
	 */
	public void compareCardVsBody(LcCardtemp body, Cardinfo card) {
		this.cardAddBSImpl.compareCardVsBody(body, card);
	}
	
	/**
	 * 保存变动记录
	 * 
	 * @param record
	 */
	public void saveRecord(Recordhistory record){
		cardAddBSImpl.saveRecord(record);
	}

	/**
	 * 删除多条变动记录
	 * 
	 * @param record
	 */
	public void deleteRecord(String[] bodyId){
		cardAddBSImpl.deleteRecord(bodyId);
	}

	/**
	 * 修改变动记录
	 * 
	 * @param record
	 */
	public void updateRecord(Recordhistory record){
		cardAddBSImpl.updateRecord(record);
	}
	
	/**
	 * 根据bodyId查找record
	 * @param bodyId
	 * @return
	 */
	public Recordhistory findRecordBybodyId(String bodyId){
		return cardAddBSImpl.findRecordBybodyId(bodyId);
	}
	
	/**
	 * 卡片调配，通过资产id查找资产信息
	 * @return
	 */
	public JyzcXx findJyzcXxByZcId(String zcId){
		JyzcXx xx = cardAddBSImpl.findJyzcXxByZcId(zcId);
		return xx;
	}

	/**
	 *  record.setPkId(headId); 表单id
	 *	record.setChangetype("card");	变动类型
	 *	record.setChangeinfoid(cardId);//根据cardId和dealmethod得到before
	 *	record.setAfter(changeValue);变动后的值
	 *	record.setName(dealmethod);变动方式
	 *	record.setZcType(changereason);//备用字段 ，这里存的是为了记录变动原因
	 * @param record
	 * @return
	 * 方法暂废弃
	 */
	public LcCardtemp cardChange(Recordhistory record) {
		// TODO 根据变动方式，变动原因，卡片id，变动后的值，插入到body表，和变动表。
		// 计算出原值变动产生的联动信息存入临时表还有 净残值联动，累计折旧联动，使用月限的联动
		return null;
	}
	
	public ZyZc findZyZcById(String id) {
		return this.cardAddBSImpl.findZyZcById(id);
	}

	/**
	 * /根据所选的卡片合并，ids为合并的卡片id数组，baseCardId为基础卡片，headId为表单id，ybyz,ljzj,jvalue,jevalue 
	 * 
	 *                拆分后新卡片                       拆分前表体
		  CARDCODE         空                        为cardinfo表的cardCode 
		  CARDINFOID       空                        表体里为cardinfo的id 
		  BOXID	         表体里为该表体的id          表体里为新卡片表体的id
		  ID	 	YBYZ			LJZJ	JVALUE		JEVALUE			CARDINFOID	BOXID		LRRQ	
		10056642	57816974.41	15287963.29	42529011.12	42529011.12		10056642				2010/11/21	这个是合并后的卡片
		10056641	57269974.41	15108477.09	42161497.32	42161497.32		125362		10056642				下面3个合并前卡片
		10056640	400000		113335.09	286664.91	286664.91		125337		10056642		
		10056639	147000		66151.11	80848.89	80848.89		124335		10056642	2010/3/24	

	 * @param ids
	 * @param baseCardId
	 * @param headId
	 */
	public boolean mergeBody(String[] ids, String baseCardId, String headId) {
		return cardAddBSImpl.mergeBody(ids, baseCardId, headId);
	}

	/**
	 * 在合并时，查询合并卡片列表，和合并后列表，headId为表单id，cardNew为字符串"true"和"false"
	 * 根据cardNew 判断读取该headId下 ，cardNew为true时取cardCode为空的数据
	 * cardNew为flase为false时，取cardCode不为空的数据
	 * @param headId
	 * @param cardNew
	 * @return
	 */
	public List findLcCardtempsBySheadId(String headId, String cardNew) {
		return cardAddBSImpl.findLcCardtempsBySheadId(headId, cardNew);
	}

	/**
	 * 根据ids查询出所有card，根据ids取得cardinfo信息，并保存到lccardtemp表中
	 * @param ids   
	 */
	public String saveCard4Merge(String[] ids,String headId) {
		return cardAddBSImpl.saveCard4Merge(ids,headId);
	}
	
	/**
	 * 删除卡片拆分后的body
	 * @param boxId
	 */
	public void deleteSplits(String[] boxId){
		cardAddBSImpl.deleteSplits(boxId);
	}
	
	/**
	 * 删除合并前的卡片，合并后的连同一起删掉
	 * @param bodyId
	 */
	public void deleteMerge(String bodyId){
		cardAddBSImpl.deleteMerge(bodyId);
	}

	public List getChangeReasonWay(String type) {
		return cardAddBSImpl.getChangeReasonWay(type);
	}
	
	/**
	 * 根据id，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public Individualtree getIndividualtreeById(String id){
		return cardAddBSImpl.getIndividualtreeById(id);
	}
	
	public void deleteSplits(String headId, Long bodyId){
		cardAddBSImpl.deleteSplits(headId,bodyId);
	}
	
	/**
	 * 卡片变动批量操作
	 * @param headId
	 * @param cardIds
	 */
	public String chooseChangeBatch(String headId, String cardIds){
		return cardAddBSImpl.chooseChangeBatch(headId,cardIds);
	}
	/**
	 * 批量变动
	 * @return
	 */
	public void operateChanageBatch(String changeway, String changereason,
			String changeValue, String bodyIds,String headId,String isProportion){
		cardAddBSImpl.operateChanageBatch( changeway,  changereason,
				 changeValue,  bodyIds,headId,isProportion);
	}
	
	/**
	 * 保存减少表体 经营固定资产盘点用
	 * @param cardIds
	 */
	public void saveBody4JYZCcheck(String cardIds){
		cardAddBSImpl.saveBody4JYZCcheck(cardIds);
	}
	/**
	 * 根据卡片编号查找卡片信息
	 * @param cardcode
	 * @return
	 */
	public Cardinfo findCardinfoByCardCode(String cardcode){
		return cardAddBSImpl.findCardinfoByCardCode(cardcode);
	};
	
	/**
	 * 通过办理依据的id查找办理依据
	 * @param id
	 * @return
	 */
	public CommonAccording findAccordingById(String id){
		return cardAddBSImpl.findAccordingById(id);
	}
	
	/**
	 * 保存办理依据
	 */
	public void saveCA(CommonAccording ca){
		cardAddBSImpl.saveCA(ca);
	}
}
