package com.tansun.eam2.zccz.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzDisposeTrack;
import com.tansun.eam2.common.model.orm.bo.CzDisposeTrackAdjunct;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.zccz.ZcczCommonImpl;
import com.tansun.eam2.zccz.service.IDisposeTrackBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.vo.CommonBO;
@Service
public class DisposeTrackBSImpl implements IDisposeTrackBS {
	@Autowired
	private PublicDao dao;

	public void delete(CommonBO bo) {
		dao.delete(bo);
		
	}

	public void save(CommonBO bo) {
		dao.save(bo);
		
	}

	public void update(CommonBO bo) {
		dao.update(bo);
		
	}
	
	/**
	 * 根据跟踪id，附属信息类型，查询附属信息列表
	 * @param trackId
	 * @param fsxxlx
	 * @return
	 */
	public List findAdjuncts(String trackId, String fsxxlx) {
		
		String sql = "from CzDisposeTrackAdjunct x where x.fsxxlx = ? and x.trackid = ?";
		List list = dao.find(sql, new Object[]{fsxxlx,trackId});
		return list;
	}

	/**
	 * 根据跟踪id，附属信息类型，查询附属信息列表的Json字符串
	 * @param trackId
	 * @param fsxxlx
	 * @return
	 */
	public String findAdjunctsJSONString1(String trackId, String fsxxlx,String xmId,String jieduan,String zcIds){
		List list = null;
		if("skjn".equals(fsxxlx)||"fyjn".equals(fsxxlx)||"hkhs".equals(fsxxlx)){
			list = this.findCzFysrMxs(xmId,jieduan, zcIds);
		}else{
			list = this.findAdjuncts(trackId, fsxxlx);
		}
		String s = BodyListToJSON.getJSON(list, 1, 1, 10000);
		return s;
	}
	
	/**
	 * 查询税款，费用，回款回收在CzFysrMx表里 add by lantianbo 2010-1-8
	 * @param xmId
	 * @param jieduan
	 * @return
	 */
	public List findCzFysrMxs(String xmId, String jieduan,String zcIds) {
		String sql = "from CzFysrMx x where x.xmId= ? and x.jieduan = ? and x.azcid = ?";
		return this.dao.find(sql, new Object[]{xmId,jieduan,zcIds});
	}

	/**
	 * 得到一拍，二拍，三拍的信息
	 * @return
	 */
	public String getPmxx(String cishu, String pmsfcg, String trackId){
		JsonConfig jsonConfig = this.getJsonConfig();
		
		List list1 = this.getWpmcgXx(trackId);
		int size = 0;
		int pmcs = Integer.parseInt(cishu);//查看第几次拍卖信息的次数
		
		if(list1!=null && list1.size() >0){
			size = list1.size();//未成功拍卖的次数
		}
		if(pmcs<=size){//如果查看的次数小于等于未成功拍卖的次数，那么就查出未成功拍卖的信息并展示到页面
			CzDisposeTrackAdjunct adjunct = (CzDisposeTrackAdjunct) list1.get(pmcs-1);
			JSONObject jsonObject = JSONObject.fromObject(adjunct,jsonConfig); 
			return jsonObject.toString();
		}else if(pmcs>size&&size+1!=pmcs){ //如果要查看的次数大于未成功拍卖次数并且不等于未成功拍卖次数+1
			return "";
		}else if((size+1==pmcs)&&"true".equals(pmsfcg)){//要查看的拍卖次数+1就是成功拍卖的查看
			String sql2 = "from CzDisposeTrack t where t.id = ?";
			CzDisposeTrack track = (CzDisposeTrack) this.dao.findSingleResult(sql2, new Object[]{trackId});
			JSONObject jsonObject = JSONObject.fromObject(track,jsonConfig); 
			return jsonObject.toString();
		}
		return "";
	}
	/**
	 * 得到一个jsonconfig
	 */
	private static JsonConfig getJsonConfig() {
		JsonConfig jsonConfig = new JsonConfig();
		
		//设置没有值，或者指定属性 不处理生成JSON串
		jsonConfig.setJsonPropertyFilter( new PropertyFilter(){   
			   public boolean apply( Object source, String name, Object value ){   
			      return name.equals("sysUpdateTime");   
			   }   
			});
		
		//特殊对象的数据进行转换，可以自行控制，如日期格式化。
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor(){

			public Object processArrayValue(Object value, JsonConfig jsonConfig) {
				return null;
			}

			public Object processObjectValue(String key, Object value,
					JsonConfig jsonConfig) {
				String str = "";
				if(value != null && value instanceof Date){
					str = new SimpleDateFormat("yyyy-MM-dd").format((Date)value);
				}
				
				return str;
			}
			
		});
		return jsonConfig;
	}
	/**
	 * 得到未成功拍卖的信息
	 */
	public List getWpmcgXx(String trackId){
		String sql1 = "from CzDisposeTrackAdjunct t where t.trackid = ? order by t.pmwcgcs asc";
		List list1 = this.dao.find(sql1, new Object[]{trackId});
		return list1;
	}

	/**
	 * 得到跟踪主表信息
	 * @param trackId
	 */
	public CzDisposeTrack findCzDisposeTrackById(String trackId){
		String sql = "from CzDisposeTrack t where t.id=?";
		return (CzDisposeTrack) this.dao.findSingleResult(sql, new Object[]{trackId});
	}
	/**
	 * 得到跟踪附属表信息
	 * @param trackId
	 */
	public CzDisposeTrackAdjunct findCzDisposeTrackAdjunctById(String id){
		String sql = "from CzDisposeTrackAdjunct t where t.id=?";
		return (CzDisposeTrackAdjunct) this.dao.findSingleResult(sql, new Object[]{id});
	}
	
	/**
	 * 删除附属信息
	 * @return
	 */
	public void deleteAdjuncts(String adjuncts){
		if(adjuncts!=null&&adjuncts.length()>0){
			if(adjuncts.startsWith(",")){
				adjuncts = adjuncts.substring(1);
			}
			String []ids = adjuncts.split(","); 
			for(int i=0;i<ids.length;i++){
				CzDisposeTrackAdjunct t = this.findCzDisposeTrackAdjunctById(ids[i]);
				if(t!=null){
					this.delete(t);
				}
			}
		}
	}
	
	/**
	 * 根据处置方式不同 新建多条环节
	 * @param disposeGkpmMain
	 * @param list
	 * @return
	 */
	public String newTracks(String disposeTrackType, List list,String zcIds,String xmIds){
		CzDisposeTrack track =null;
		if(zcIds.startsWith(",")){
			zcIds.substring(1);
		}
		if(xmIds.startsWith(",")){
			xmIds.substring(1);
		}
		String []zcids = zcIds.split(",");
		String []xmids = xmIds.split(",");
		for(int j=0;j<zcids.length;j++){
			for(int i=0;i<list.size();i++){
				List t = this.findCzDisposeTrackByType(zcids[j], xmids[0],(String)list.get(i));
				if(t==null||t.size()<1){//如果没有符合zcid xmid的跟踪信息，则创建一条跟踪信息
					track = new CzDisposeTrack();
					track.setCzgzhj((String)list.get(i));
					track.setCzgzfs(disposeTrackType);
					track.setXmid(xmids[0]);
					track.setZcid(zcids[j]);
					this.save(track);
				}
			}
		}
		return "";
	}
	
	/**
	 * 根据zcid资产id和xmId 项目id查询跟踪信息
	 * @param zcId
	 * @param xmId
	 * @return
	 */
	public List findCzDisposeTrackByType(String zcId,String xmId,String czgzhj){
		String sql = "from CzDisposeTrack t where t.czgzhj = ? and t.zcid=? and t.xmid=?";
		List t =  dao.find(sql, new Object[]{czgzhj,zcId,xmId});
		return t;
	}
	
	/**
	 * 根据一条跟踪信息，修改同一项目下，选择的资产的跟踪信息
	 * @param track
	 * @param zcIds
	 * @param xmIds
	 */
	public void updateTracks(CzDisposeTrack track, String zcIds, String xmIds){
		if(zcIds.startsWith(",")){
			zcIds.substring(1);
		}
		String []zcids = zcIds.split(",");
		if(track!=null){
			for(int j=0;j<zcids.length;j++){
				List list = this.findCzDisposeTrackByType(zcids[j], xmIds, track.getCzgzhj());
				if(list!=null&&list.size()>0){
					CzDisposeTrack track1 = (CzDisposeTrack) list.get(0);
					String id= track1.getId();
					String zcId = track1.getZcid();
					BeanUtils.copyProperties(track, track1);
					track1.setId(id);
					track1.setZcid(zcId);
					this.update(track1);
				} 
			}
		}
	}
	
	/**
	 * 根据跟踪信息id得到未成功拍卖次数
	 * @param id
	 * @return
	 */
	public String findWcgpmcsAdjunctById(String id){
		List list = getWpmcgXx(id);
		int i = 0;
		if(list!=null){
			i = list.size();
		}
		return String.valueOf(i);
	}
	
	/**
	 * 根据跟踪id，附属信息类型，查询安置信息列表的Json字符串
	 * @param trackId
	 * @param fsxxlx
	 * @return
	 */
	public String findAdjunctsJSONString(String trackId, String fsxxlx,
			String xmIds, String zcIds){
		String sql ="select a from CzAzryXx a,CzXmXx b where a.cldId = b.cldId and b.id = ? and a.stId = ?";
		List list = dao.find(sql, new Object[]{xmIds,zcIds});
		for(int i=0;i<list.size();i++){
			CzAzryXx xx = (CzAzryXx) list.get(i);
			xx.setAzrysfqsst("true".equals(xx.getAzrysfqsst())?"是":"否");
			xx.setAzrysffszc("true".equals(xx.getAzrysffszc())?"是":"否");
			xx.setAzrysfqsazxy("true".equals(xx.getAzrysfqsazxy())?"是":"否");
		}
		String s = BodyListToJSON.getJSON(list, 1, 1, 10000);
		return s;
	}
	
	/**
	 * 根据id查询安置人员
	 * @param azryId
	 * @return
	 */
	public CzAzryXx findCzAzryXxById(String azryId){
		String sql = "from CzAzryXx x where x.id = ?";
		return (CzAzryXx) this.dao.findSingleResult(sql, new Object[]{azryId});
	}
	
	/**
	 * 根据ids 删除CzFysrMx表里 add by lantianbo 2010-1-8
	 * @param adjuncts
	 */
	public void deleteCzFysrMxs(String adjuncts){
		if(adjuncts!=null&&adjuncts.length()>0){
			if(adjuncts.startsWith(",")){
				adjuncts = adjuncts.substring(1);
			}
			String []ids = adjuncts.split(","); 
			for(int i=0;i<ids.length;i++){
				CzFysrMx t = this.findCzFysrMxById(ids[i]);
				if(t!=null){
					this.delete(t);
				}
			}
		}
	}
	/**
	 * 根据id CzFysrMx表里 add by lantianbo 2010-1-8
	 * @param adjuncts
	 */
	public CzFysrMx findCzFysrMxById(String string) {
		String sql = "from CzFysrMx t where t.id=?";
		return (CzFysrMx) this.dao.findSingleResult(sql, new Object[]{string});
	}
}
