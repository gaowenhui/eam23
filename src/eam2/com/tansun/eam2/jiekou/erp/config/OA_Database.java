package com.tansun.eam2.jiekou.erp.config;

import java.io.Writer;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jiekou.erp.action.Comment;
import com.tansun.rdp4j.common.model.orm.PublicDao;
@Service
public class OA_Database {
	Logger log = Logger.getLogger(OA_Database.class);
	Map map = ReadBolb.getReadfilepath();

	/**
	 * 
	 * 描述：保存发送和接收erp的信息
	 * 
	 * @param billcode
	 *            流程ID
	 * @param key
	 *            流程key
	 * @param sender
	 *            发送人
	 * @param appPerson
	 *            流程起草人
	 * @param send
	 *            发送信息
	 * @param receive
	 *            接收信息
	 */
	public void insertClob(String billcode, String key, String sender,
			String appPerson, String send, String receive,PublicDao dao) {
		Connection conn = null;
		ResultSet rs = null;
		java.sql.PreparedStatement pstmt = null;
		try {
			// String delsql="delete from erp_history t where
			// t.eamcode='"+billcode+"'";
			String sql = "insert into Erp_History(id,Senddate,Eamcode,WFCONFIG_KEY,SENDER,APPPERSON,Send,Receive)values(SQL_ERP_HISTORY.Nextval,sysdate,?,?,?,?,empty_clob(),empty_clob())";
			
			
//			Class.forName(map.get("driver").toString()).newInstance();
			// conn =
			// DriverManager.getConnection(map.get("url").toString(),map.get("username").toString(),map.get("password").toString());
			// pstmt=conn.prepareStatement(delsql);
			// pstmt.execute();
			// conn.commit(); 
			conn = dao.getJdbcTemplate().getDataSource().getConnection();
			System.out.println("OA_Database - insertClob - getConnection()");
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, billcode);
			pstmt.setString(2, key);
			pstmt.setString(3, sender);
			pstmt.setString(4, appPerson);
			int s = pstmt.executeUpdate();
			pstmt = null;
			String selectsql = "select  t.send,t.receive    from  Erp_History t  where t.eamcode='"
					+ billcode + "' for update";
			pstmt = conn.prepareStatement(selectsql);
			rs = pstmt.executeQuery();
			oracle.sql.CLOB sendclob = null;
			oracle.sql.CLOB receiveclob = null;
			if (rs.next()) {
				sendclob = (oracle.sql.CLOB) rs.getClob(1);
				receiveclob = (oracle.sql.CLOB) rs.getClob(2);
			}
			Writer sendwr = sendclob.setCharacterStream(0);
			System.out.println("sendwr.write(send);");
			sendwr.write(send);
			Writer receivewr = receiveclob.setCharacterStream(0);
			System.out.println("receivewr.write(receive);");
			receivewr.write(receive);
			sendwr.write(send);
			System.out.println("sendwr.flush();");
			sendwr.flush();
			System.out.println("sendwr.close();");
			sendwr.close();
			System.out.println("receivewr.flush();");
			receivewr.flush();
			System.out.println("receivewr.close();");
			receivewr.close();
			System.out.println("conn.commit();");
			conn.commit();
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		} finally {
			try {
				System.out.println("rs.close();");
				if(rs!=null){
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				System.out.println("pstmt.close();");
				if(pstmt!=null){
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				System.out.println("conn.close();");
				if(conn!=null){
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				System.out.println("OA_Database - insertClob - closeConnection()");
			} catch (Exception e) {
				log.info(e.getMessage());
			}
		}

	}
	
	public Map selectdate(String sql, String field1, String field2,PublicDao dao) {
		Map titlemap = new HashMap();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String title, name = "";
			int i = 1;
			
//			Class.forName(map.get("driver").toString()).newInstance();
			conn = dao.getJdbcTemplate().getDataSource().getConnection();
			System.out.println("OA_Database - selectdate(String sql, String field1, String field2,PublicDao dao) - getConnection()");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				titlemap.put(field1 + i, rs.getString(field1));
				titlemap.put(field2 + i, rs.getString(field2));
				i++;
			}
			rs.close();
			stmt.close();
			conn.close();
			System.out.println("OA_Database - selectdate(String sql, String field1, String field2,PublicDao dao) - closeConnection()");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return titlemap;
	}
	
	public StringBuffer selectdate(String sql,PublicDao dao) {
		StringBuffer erpxml = new StringBuffer();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
//			Class.forName(map.get("driver").toString()).newInstance();
			conn = dao.getJdbcTemplate().getDataSource().getConnection();
			System.out.println("OA_Database - selectdate(String sql,PublicDao dao) - getConnection()");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				BigDecimal jczl = new BigDecimal(Comment.checkZero(rs.getString("JCZL")));
				BigDecimal ybyz = new BigDecimal(Comment.checkZero(rs.getString("YBYZ")));
				BigDecimal jcz = ybyz.multiply(jczl).multiply(new BigDecimal("0.01"));
				erpxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				erpxml.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
				erpxml.append("<soap:Body>");
				erpxml.append("<jic:getCardResponse xmlns:jic=\"http://www.jic.cn/soa\">");
				erpxml.append("<code>1</code>");
				erpxml.append("<message>EAM系统接受成功</message>");
				erpxml.append("<resultset>");
				erpxml.append("" + "<card id=\""
								+ rs.getString("ID")
								+ "\">"
								+ "<card_head>"
								+ "<eambill>"
								+ Comment.checknull(rs.getString("KPXZID"))
								+ "</eambill>"
								+ "<company>10101</company>"
								+ "<asset_code>"
								+ Comment.checknull(rs.getString("ERPASSETCODE"))
								+ "</asset_code>"
								+ "<asset_name>"
								+ Comment.checknull(rs.getString("ZCNAME"))
								+ "</asset_name>"
								+ "<begindate>"
								+ Comment.changedate(rs.getDate("KSDATE"))
								+ "</begindate>"
								+ "<fk_currency>RMB</fk_currency>"
								+ "<currunit>元</currunit>"
								+ "<recorder>"
								+ OAconfig.loginuse
								+ "</recorder>"
								+ "<recorddate >"
								+ Comment.changedate(rs.getDate("LRRQ"))
								+ "</recorddate>"
								+ "<assetuser>"
								+ getsyrbm(rs.getString("USERNAME"),dao)
								+ "</assetuser>"
								+ "<spec>"
								+ Comment.checknull(rs.getString("GGXH"))
								+ "</spec>"
								+ "<position>"
								+ Comment.checknull(rs.getString("SAVEADSRESS"))
								+ "</position>"
								+ "<workloanunit>小时</workloanunit>"
								+ "<fk_addreducestyle>"
								+ Comment.checknull(rs.getString("ADDTYPE"))
								+ "</fk_addreducestyle>"
								+ "<assetsuit_code>001</assetsuit_code>"
								+ "<fk_usedept>"
								+ Comment.checknull(rs.getString("USEPARTMENT"))
								+ "</fk_usedept>"
								+ "<fk_mandept>"
								+ Comment.checknull(rs.getString("GLBM"))
								+ "</fk_mandept>"
								+ "<paydept_flag>"
								+ Comment.zjcdbm(rs.getString("ZJCDBM"))
								+ "</paydept_flag>"
								+ "<accyear>"
								+ new Comment().getYear()
								+ "</accyear>"
								+ "<period>"
								+ new Comment().getMonth()
								+ "</period>"
								+ "<originvalue>"
								+ Comment.checkZero(rs.getString("YBYZ"))
								+ "</originvalue>"
								+ "<localoriginvalue>"
								+ Comment.checkZero(rs.getString("YBYZ"))
								+ "</localoriginvalue>"
								+ "<fracoriginvalue>0</fracoriginvalue>"
								+ "<allworkloan>0</allworkloan>"
								+ "<servicemonth>"
								+ Comment.checkZero(String.valueOf(rs
										.getInt("SYYX")
										+ rs.getInt("SYNX") * 12))
								+ "</servicemonth>"
								+ "<accudep>"
								+ Comment.checkZero(rs.getString("LJZJ"))
								+ "</accudep>"
								+ "<accuworkloan>0</accuworkloan>"
								+ "<predevaluate>"
								+ Comment.checkZero(rs.getString("JZZB"))
								+ "</predevaluate>"
								+ "<usedmonth>"
								+ Comment.checkZero(rs.getString("YJTYF"))
								+ "</usedmonth>"
								+ "<monthworkloan>0</monthworkloan>"
								+ "<depunit>0</depunit>"
								+ "<salvagerate>"
								+ Comment.checkZero(rs.getString("JCZL"))
								+ "</salvagerate>"
								+ "<salvage>"
								+ String.valueOf(jcz)
								+ "</salvage>"
								+ "<newasset_flag>1</newasset_flag>"
								+ "<fk_category>"
								+ Comment.checknull(rs.getString("TYPECODE"))
								+ "</fk_category>"
								+ "<fk_usingstatus>"
								+ Comment.checknull(rs.getString("USESTATUS"))
								+ "</fk_usingstatus>"
								+ "<fk_depmethod>"
								+ Comment.checknull(rs.getString("ZJTYPE"))
								+ "</fk_depmethod>"
								+ "<fk_jobmngfil>01</fk_jobmngfil>"
								+ "<fk_provider>"
								+ Comment.checknull(rs.getString("GYS"))
								+ "</fk_provider> "
								+ "<source>6</source>"
								+ "</card_head>"
								+ "<card_body>"
								+ "<entry>  <def_quote>2004年1月1日净值</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("OLDJZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>2004年1月1日累计折旧</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("OLDYEARJZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>2004年1月1日原值</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("OLDYEARYZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>CPU型号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("CUPXH"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>保修期</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("BXQ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>备注</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("BZSM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>车辆牌照号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("CLPXH"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>对应土地证使用权人</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("QZSYZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>发动机号码</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("FDJHM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>房产证号码</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("FDZHM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>建筑面积</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("JZMJ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>净额</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("JEVALUE"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>净值</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("JVALUE"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>旧卡片编号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("OLDCODE"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>内存</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("NSAVE"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>内置硬盘</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("NZYP"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>评估前累计折旧</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("PGQLJZJ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>评估前原值</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("PGQYZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>启用日期</def_quote>  <def_value>"
								+ Comment.checkdate(rs.getString("QYDATE"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>权属证明</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("QSZM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>权证所有者</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("QZSYZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>上门保修期</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("SMBXQ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>设备序列号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("SBXLH"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>是否承继</def_quote>  <def_value>"
								+ Comment.getifjc(rs.getString("IFJC"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>送修保修期</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("SXBXQ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>土地证号码</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("TDZHM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>外置硬盘</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("WZYP"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>系统显示器</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("XSQ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>有无对应土地</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("YWDYTD"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>原系统录入员</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("YXTLRY"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>月折旧额</def_quote>  <def_value>"
								+ rs.getDouble("YZJE")
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>月折旧率</def_quote>  <def_value>"
								+ rs.getDouble("YZJL")
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>在用状态</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("ZYZK"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>占地面积</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("ZDMJ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>主要用途</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("MAINYT"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>注销日期</def_quote>  <def_value>"
								+ Comment.changedate(rs.getDate("ZXRQ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>装修面积</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("ZXMJ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>原始取得价值</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("YSQDJZ"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>使用年限</def_quote>  <def_value>"
								+ rs.getInt("SYNX")
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>对应土地证号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("DYTDZH"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>对应土地原卡片编号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("DYTDKP"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>合同号码</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("HTHM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>合同号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("HTHM"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>供应商</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("GYS"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>硬盘型号</def_quote>  <def_value>"
								+ Comment.checknull(rs.getString("QPXH"))
								+ "</def_value>  </entry>"
								+ "<entry>  <def_quote>资产状态</def_quote>  <def_value>"
								+ "0102" + "</def_value>  </entry>" // add by
																	// xie
								+ "</card_body>" + "</card>");
				erpxml.append("</resultset>");
				erpxml.append("</jic:getCardResponse>");
				erpxml.append("</soap:Body>");
				erpxml.append("</soap:Envelope>");
			} else {
				erpxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				erpxml.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
				erpxml.append("<soap:Body>");
				erpxml.append("<jic:getCardResponse xmlns:jic=\"http://www.jic.cn/soa\">");
				erpxml.append("<code>-1</code>");
				erpxml.append("<message>EAM不存在此卡片</message>");
				erpxml.append("<resultset>");
				erpxml.append("</resultset>");
				erpxml.append("</jic:getCardResponse>");
				erpxml.append("</soap:Body>");
				erpxml.append("</soap:Envelope>");
			}
			rs.close();
			stmt.close();
			conn.close();
			System.out.println("OA_Database - selectdate(String sql,PublicDao dao) - closeConnection()");
		} catch (Exception e) {
			erpxml = new StringBuffer();
			erpxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			erpxml.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
			erpxml.append("<soap:Body>");
			erpxml.append("<jic:getCardResponse xmlns:jic=\"http://www.jic.cn/soa\">");
			erpxml.append("<code>-1</code>");
			erpxml.append("<message>取得卡片信息出错:" + e.getMessage() + "</message>");
			erpxml.append("<resultset>");
			erpxml.append("</resultset>");
			erpxml.append("</jic:getCardResponse>");
			erpxml.append("</soap:Body>");
			erpxml.append("</soap:Envelope>");
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return erpxml;
	}
	
	public String getsyrbm(String user,PublicDao dao) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			if (user == null || user.equals("") || user.equals("null")) {
				user = "";
			} else {
				try {
					String sql = "select  t.code    from dic_app_asset_state t  where t.type='person'  and t.name='"
							+ user + "'";
	//				Class.forName(map.get("driver").toString()).newInstance();
					conn = dao.getJdbcTemplate().getDataSource().getConnection();
	
					System.out.println("OA_Database - getsyrbm - getConnection()");
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if (rs.next()) {
						user = rs.getString("code");
					}
					rs.close();
					stmt.close();
					conn.close();
					System.out.println("OA_Database - getsyrbm - closeConnection()");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}catch(Exception e){
			log.info(e.getMessage());
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return user;
	}
}
