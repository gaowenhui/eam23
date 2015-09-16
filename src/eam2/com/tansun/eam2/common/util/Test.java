package com.tansun.eam2.common.util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

@Repository
public class Test {

	@Autowired
	private PublicDao publicDao;
	/**
	 * @param args    PTEnd
	 */
	public static void main(String[] args) throws IOException {
		Test t = new Test();
		t.test();

	}
	
public String test(){
		
		String sql = "from PTEnd where headType like '卡片%' ";
		List list = publicDao.find(sql);
		if(list!=null&&list.size()>0){
			
			for(int i=0;i<list.size();i++){
				PTEnd end = (PTEnd)list.get(i);
				end.setUrl("/eam2/kpglWorkflow/kpglWorkflow_endView.do");
				end.setProcInstId("tbtbcpgl"+i);
				publicDao.update(end);
				
				String headId = end.getHeadId();
				if(headId!=null){
					String sql1 = "select t.id, t.DRAFT_USERID,t.send_userid from P_T_Did t where t.head_Id=?";
					List list1 = publicDao.queryForList(sql1,new Object[]{headId});
					if(list1!=null&&list1.size()>0){
						for(int j=0;j<list1.size();j++){
							//did.setProcInstId(end.getProcInstId());
							Map map = (Map)list1.get(j);
							String sendUserId = String.valueOf(map.get("send_userid"));
							String draftUserId = String.valueOf(map.get("draft_userid"));
							String id = String.valueOf(map.get("id"));
							String sql4 = "from PTUserBO t where t.username = ?";
							//PTUserBO user1 = (PTUserBO)publicDao.findSingleResult(sql4,new Object[]{sendUserId});
							PTUserBO user2 = (PTUserBO)publicDao.findSingleResult(sql4,new Object[]{draftUserId});
//							if(user1!=null){
//								sendUserId = String.valueOf(user1.getTid());
//							}
							if(user2!=null){
								draftUserId=String.valueOf(user2.getTid());
							}
							String sql5 = "update P_T_Did t set t.DRAFT_USERID = '"+draftUserId
							+"' , t.send_userid = '' ,t.statu = '0', t.PROC_INST_ID= '"+end.getProcInstId()+"' where t.id = '"+id+"'" ;
							System.out.println(id + "-------"+sql5);
							publicDao.getJdbcTemplate().execute(sql5);
						}
					}
				}
			}
		}
		return "";
	}

}
