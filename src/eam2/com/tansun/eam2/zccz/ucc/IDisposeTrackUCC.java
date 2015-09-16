package com.tansun.eam2.zccz.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzDisposeTrack;
import com.tansun.eam2.common.model.orm.bo.CzDisposeTrackAdjunct;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface IDisposeTrackUCC {

	public void save(CommonBO bo);
	
	public void update(CommonBO bo);
	
	public void delete(CommonBO bo);
	
	/**
	 * 根据跟踪id，附属信息类型，查询附属信息列表
	 * @param trackId
	 * @param fsxxlx
	 * @return
	 */
	public List findAdjuncts(String trackId,String fsxxlx);
	
	/**
	 * 根据跟踪id，附属信息类型，查询附属信息列表的Json字符串
	 * @param trackId
	 * @param fsxxlx
	 * @return
	 */
	public String findAdjunctsJSONString1(String trackId, String fsxxlx,String xmId,String jieduan,String zcIds);

	/**
	 * 得到一拍，二拍，三拍的信息
	 * @return
	 */
	public String getPmxx(String cishu, String pmsfcg, String trackId);

	/**
	 * 得到跟踪主表信息
	 * @param trackId
	 */
	public CzDisposeTrack findCzDisposeTrackById(String trackId);
	/**
	 * 得到跟踪附属表信息
	 * @param trackId
	 */
	public CzDisposeTrackAdjunct findCzDisposeTrackAdjunctById(String id);
	
	/**
	 * 删除附属信息
	 * @return
	 */
	public void deleteAdjuncts(String adjuncts);

	/**
	 * 根据处置方式不同 新建多条环节
	 * @param disposeGkpmMain
	 * @param list
	 * @return
	 */
	public String newTracks(String disposeTrackType, List list,String zcIds,String xmIds);
	/**
	 * 根据zcid资产id和xmId 项目id查询跟踪信息
	 * @param zcId
	 * @param xmId
	 * @return
	 */
	public List findCzDisposeTrackByType(String zcId,String xmId,String czgzhj);

	/**
	 * 根据一条跟踪信息，修改同一项目下，选择的资产的跟踪信息
	 * @param track
	 * @param zcIds
	 * @param xmIds
	 */
	public void updateTracks(CzDisposeTrack track, String zcIds, String xmIds);

	/**
	 * 根据跟踪信息id得到未成功拍卖次数
	 * @param id
	 * @return
	 */
	public String findWcgpmcsAdjunctById(String id);

	/**
	 * 根据跟踪id，附属信息类型，查询安置信息列表的Json字符串
	 * @param trackId
	 * @param fsxxlx
	 * @return
	 */
	public String findAdjunctsJSONString(String trackId, String fsxxlx,
			String xmIds, String zcIds);

	/**
	 * 根据id查询安置人员
	 * @param azryId
	 * @return
	 */
	public CzAzryXx findCzAzryXxById(String azryId);

	/**
	 * 根据ids 删除CzFysrMx表里 add by lantianbo 2010-1-8
	 * @param adjuncts
	 */
	public void deleteCzFysrMxs(String adjuncts);
	/**
	 * 根据id CzFysrMx表里 add by lantianbo 2010-1-8
	 * @param adjuncts
	 */
	public CzFysrMx findCzFysrMxById(String string);
}
