package com.tansun.eam2.zyzc.service.impl;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.ITokenService;
import com.tansun.eam2.zyzc.vo.ZyzcToken;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;

@Service
public class TokenServiceImpl implements ITokenService {
	@Autowired
	PublicDao publicDao;
	@Autowired
	IUserBS iuserBS ;
	/**
	 * 根据tokenSN到资产表和台账表中查询数据，返回符合查询条件的List<ZyzcToken>
	 */
	public List<ZyzcToken> queryToken(String status, String tokenSN, String user) {
		List params = new ArrayList();
		StringBuffer strWhere = new StringBuffer();
		String preparSQL = "select tz.lyrmc,zc.lpdlm, zc.lph,zc.lpqx,zc.zczt,zc.lpsx "
				+ "from zy_zc zc, zy_kctz tz where zc.zc_id = tz.zc_id and zc.sjflmc='令牌'";
		if(StringUtils.isNotEmpty(status)){
			if("在库".equals(status)){
				strWhere.append(" and zc.zczt = ?");
			}else if("在用".equals(status)){
				strWhere.append(" and tz.sfzxjl = '1' and zc.zczt = ?");
			}
			params.add(status);
		}
		if(StringUtils.isNotEmpty(tokenSN)){
			strWhere.append(" and zc.lph = ?");
			params.add(tokenSN);
		}
		if(StringUtils.isNotEmpty(user)){
			strWhere.append(" and (tz.lyrmc like '%" + user + "%' or zc.lpdlm like '%" + user+"%')" );
		}
		List<ZyzcToken> list = new ArrayList<ZyzcToken>();
		preparSQL = preparSQL + strWhere.toString();
		List<Map<String, Object>> list4token = publicDao.queryForList(preparSQL, params);
		if(list4token != null){
			DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
			for(Map<String, Object> map : list4token){
				ZyzcToken token = new ZyzcToken();
				token.setName     (map.get("LYRMC") != null ? (String)map.get("LYRMC") : null);
				token.setLoginname(map.get("LPDLM") != null ? (String)map.get("LPDLM") : null);
				token.setToken    (map.get("LPH") 	!= null ? (String)map.get("LPH")   : null);
				token.setAuth     (map.get("LPQX") 	!= null ? (String)map.get("LPQX")  : null);
				token.setStatus   (map.get("ZCZT") 	!= null ? (String)map.get("ZCZT")  : null);
				if(map.get("LPSX") 	!= null ){
					String date = map.get("LPSX").toString();
					try {
						date = dateformat.parse(date).toString();
					} catch (ParseException e) {
						e.printStackTrace();
					}
					token.setExpire(date);
				}
				list.add(token);
			}
		}
		return list;
	}

	/**
	 * 根据传过来的参数分别更新台账表和资产表中相应字段，台账表中更新日期、是否最新记录、台账状态字段
	 */
	@SuppressWarnings("finally")
	public boolean updateToken(String tokenSN, String useUser,
			String loginname, String auth, String status, String expireDate) {
		boolean isUpdateTokenSuccess = false;
		try{
			ZyZc zyzc = obationZyZc(tokenSN);
			PTUserBO ptUserBO = iuserBS.getUserBo(loginname);
			ZyKctz zyKctz = obtainLatelyZyKctz(zyzc.getZcId());
			zyKctz.setLyrbh(ptUserBO.getTid().toString());
			zyKctz.setLyrmc(ptUserBO.getUsername());
			publicDao.update(zyKctz);
			zyzc.setLpdlm(loginname);
//			if(expireDate!=null){
//				zyzc.setLpsx(DateUtils.parseDate(expireDate));
//			}
			zyzc.setLpqx(auth);
			zyzc.setZczt(status);
			updateZyZc(zyzc);
//			
//			ZyKctz tz = new ZyKctz();
//			ZyKctz lastTz = obtainLatelyZyKctz(zyzc.getZcId());
//			BeanUtils.copyProperties(lastTz, tz);
//			lastTz.setSfzxjl(0L);
//			if("在库".equals(status)){
//				tz.setTzzt("在库");
//			}else if("在用".equals(status)){
//				tz.setTzzt("在用");
//			}
//			tz.setSfzxjl(1L);
//			tz.setLyrmc(useUser);
//			tz.setRq(new Date());
//			saveZyKctz(tz);
//			updateZyKctz(lastTz);
			isUpdateTokenSuccess = true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return isUpdateTokenSuccess;
		}
	}
	
	/**
	 * 根据令牌号到资产表中查询该令牌的信息
	 * @return
	 */
	private ZyZc obationZyZc(String tokenSN){
		List params = new ArrayList();
		String preparedHQL = "from ZyZc zc where zc.lph = ?";
		params.add(tokenSN);
		return (ZyZc)publicDao.findSingleResult(preparedHQL, params);
	}
	
	/**
	 * 根据令牌号更新资产记录中的令牌信息
	 */
	private void updateZyZc(ZyZc zc){
		publicDao.update(zc);
	}
	
	/**
	 * 根据zcId查询台账信息
	 * @return
	 */
	private ZyKctz obtainLatelyZyKctz(String zcId){
		List params = new ArrayList();
		String preparedHQL = "from ZyKctz tz where  tz.sfzxjl = '1' and tz.zcId = ?";
		params.add(zcId);
		return (ZyKctz)publicDao.findSingleResult(preparedHQL, params);
	}
	
	
	/**
	 * 在插入一条关于该资产的新的台账信息,
	 * @param tz
	 */
	private void saveZyKctz(ZyKctz tz){
		publicDao.save(tz);
	}
	
	/**
	 * 更新台账信息
	 * @param tz
	 */
	private void updateZyKctz(ZyKctz tz){
		publicDao.update(tz);
	}

}
