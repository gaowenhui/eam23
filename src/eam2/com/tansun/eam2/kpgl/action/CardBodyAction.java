package com.tansun.eam2.kpgl.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.kpgl.KpglCommon;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.eam2.kpgl.vo.CardNameVO;
import com.tansun.eam2.zyzc.ucc.ZCManageBodyUCC;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
public class CardBodyAction extends CommonAction {
	private CaShead head;
	private LcCardtemp body;
	private List changWayList;
	private Recordhistory record;
	private JyzcXx zc;
	private Cardinfo card;
	private CardNameVO bodyValue;
	private String zcmc;
	private String zcbh;
	private String zczt;
	private String chooseData;
	
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	@Autowired
	private ZCManageBodyUCC zCManageBodyUCCimpl;
	
	/**
	 * 进入卡片新增表体页面    
	 */
	public String addBody() {
		String sheetType = request.getParameter("sheetType");//sheetType为操作类型，根据操作类型进入不同处理单页面
		String headId = request.getParameter("headId");
		String sfzy = request.getParameter("sfzy");
		String sfrk = request.getParameter("sfrk");
		String zcType = null;
		body = new LcCardtemp();
		if("1".equals(sfzy)){
			zcType = "zyzc";
			//YanPeiling modify 2011-1-8 start
			if("true".equals(sfrk)){
				String tempZcId4ZyZcStock = request.getParameter("tempZcId4ZyZcStock");
				String [] bodyIds = new String [1];
				bodyIds[0] = tempZcId4ZyZcStock;
				List<ZySbody> bodyList = zCManageBodyUCCimpl.obtainBodyListByBodyIds(bodyIds);
				request.setAttribute("zcbh", bodyList.get(0).getZcbh());
				request.setAttribute("zcmc", bodyList.get(0).getZcmc());
				request.setAttribute("zczt", bodyList.get(0).getZczt());
				request.setAttribute("hiddenZCChoiceButton","yes");
				request.setAttribute("zcId", tempZcId4ZyZcStock);
			}
			//YanPeiling modify 2011-1-8 end
		}else{
			zcType = "jyzc";
		}
		changWayList= cardCommonUCCImpl.getChangeReasonWay("");
		
		bodyValue = new CardNameVO();
		card = new Cardinfo();
		//zjtype     = cardCommonUCCImpl.queryDicAppAssetState("zjtype");
		//department = cardCommonUCCImpl.queryIndividualtree("438");
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", headId);
		request.setAttribute("zcType", zcType);
		
		return sheetType;
	}
	
	/**
	 * 删除卡片表体页面
	 * @throws IOException 
	 */
	public String deleteBody() throws IOException {
		String sheetType = request.getParameter("sheetType");//sheetType为操作类型，根据操作类型进入不同处理单页面
		String delBodyIds = request.getParameter("delBodyIds");//delBodyIds为cardAddBody.jsp页面上的hidden
		if(delBodyIds.startsWith(",")){
			delBodyIds = delBodyIds.substring(1);//全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		if("devalue".equals(sheetType)||"modify".equals(sheetType)||"change".equals(sheetType)){
			cardCommonUCCImpl.delete(delBodyIds.split(","));
			cardCommonUCCImpl.deleteRecord(delBodyIds.split(","));//变动记录表中的类容连同一起删除
			response.getWriter().write("success");
			return null;
		}else if("split".equals(sheetType)){
			cardCommonUCCImpl.deleteSplits(delBodyIds.split(","));//拆分后的结果连同一起删除掉
			cardCommonUCCImpl.delete(delBodyIds.split(","));
			response.getWriter().write("success");
			return null;
		}else if("merge".equals(sheetType)){
			String flag = request.getParameter("flag");
			if("before".equals(flag)){
				String [] ids = delBodyIds.split(",");
				LcCardtemp beforeBody = cardCommonUCCImpl.findLcCardtempById(ids[0]);
				if(beforeBody.getBoxid()!=null){
					cardCommonUCCImpl.deleteMerge(beforeBody.getBoxid());
				}
				cardCommonUCCImpl.delete(delBodyIds.split(","));
				response.getWriter().write("success");
			}else{
				cardCommonUCCImpl.delete(delBodyIds.split(","));
				response.getWriter().write("success");
			}
			return null;
		}else{
			cardCommonUCCImpl.delete(delBodyIds.split(","));
			response.getWriter().write("success");
			return null;
		}
	}
	
	/**
	 * 卡片新增时变换增加方式删掉之前所有的表体
	 * @return
	 * @throws IOException 
	 */
	public String cardAddDeleteBody() throws IOException{
		String headId = request.getParameter("headId");
		cardCommonUCCImpl.deleteBodys(headId);
		response.getWriter().write("success");
		return null;
	}
	
	/**
	 * 保存处理单信息,表体
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public String saveBody() throws IOException {
		String sheetType = request.getParameter("sheetType");
		if("allocate".equals(sheetType)){// **********************************卡片调配时操作
			String isModifyBody = request.getParameter("isModifyBody");
			if("true".equals(isModifyBody)){//卡片调配修改
				Long id = body.getId();
				Long kpxzid = body.getKpxzid();
				String cardinfoid = body.getCardinfoid();
				String zcid = body.getZcid();
				card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
				body = cardCommonUCCImpl.card2Body(card);
				body.setId(id);
				body.setZcid(zcid);
				body.setKpxzid(kpxzid);
				body.setCardinfoid(cardinfoid);
				cardCommonUCCImpl.update(body);
			}else{//卡片调配添加
				//将card信息加入到body里部分字段要手动写
				Long kpxzid = body.getKpxzid();
				String cardinfoid = body.getCardinfoid();
				String zcid = body.getZcid();
				card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
				body = cardCommonUCCImpl.card2Body(card);
				body.setZcid(zcid);
				body.setKpxzid(kpxzid);
				body.setCardinfoid(cardinfoid);
				cardCommonUCCImpl.save(body);
			}
			request.setAttribute("message", "保存成功！");
			return sheetType;
		}else if("split".equals(sheetType)){//***********************************卡片拆分时操作
			String isMSplitBody = request.getParameter("isMSplitBody");
			if("true".equals(isMSplitBody)){
				cardCommonUCCImpl.update(body);
				String parentid = body.getParentid().toString();
				String returnStr = this.chooseCardType(parentid);
				request.setAttribute("closewin", "true");//更新后，关闭窗口
				request.setAttribute("message", "保存成功");
				request.setAttribute("sheetType", sheetType);
				return returnStr;
			}else{
				Long headId = Long.parseLong(request.getParameter("headId"));
				String id = request.getParameter("id");
				if(id.startsWith(",")){
					id = id.substring(1);
				}
				String [] ids = id.split(",");
				body = new LcCardtemp();
				card = cardCommonUCCImpl.findCardinfoByCardId(id);
				body = cardCommonUCCImpl.card2Body(card);//将card对象转化为body对象
				body.setKpxzid(headId);//将body与head进行关联
				body.setKplx(card.getParentid().toString());
				body.setCardinfoid(String.valueOf(card.getId()));
				body.setOldcode(card.getCardcode());
				cardCommonUCCImpl.save(body);
				response.getWriter().write("success");
				return null;
			}
		}
		else if("devalue".equals(sheetType)){//*********************************卡片减值操作
			String isModifyBody = request.getParameter("isModifyBody");
			String bodyId = "";
			String reduceCheck = "";
			if("true".equals(isModifyBody)){//卡片减值修改
				//得到变动记录的信息并保存
				record = cardCommonUCCImpl.findRecordBybodyId(body.getId().toString());//得到变动记录的信息并修改
				record.setAfter(String.valueOf(body.getJzzb()));
				//将card信息加入到body里部分字段要手动写
				Long id = body.getId();
				Long kpxzid = body.getKpxzid();
				String cardinfoid = body.getCardinfoid();
				Double jzzb = body.getJzzb();
				Double bcjt = body.getBcjt();
				Double jevalue = body.getJevalue();
				card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
				body = cardCommonUCCImpl.card2Body(card);
				body.setId(id);
				body.setKpxzid(kpxzid);
				body.setCardinfoid(cardinfoid);
				body.setJzzb(jzzb);
				body.setBcjt(bcjt);
				body.setJevalue(jevalue);
				cardCommonUCCImpl.update(body);
				cardCommonUCCImpl.updateRecord(record);
			}else{//卡片减值添加
				//将card信息加入到body里部分字段要手动写
				Long kpxzid = body.getKpxzid();
				String cardinfoid = body.getCardinfoid();
				Double jzzb = body.getJzzb();
				Double bcjt = body.getBcjt();
				Double jevalue = body.getJevalue();
				card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
				body = cardCommonUCCImpl.card2Body(card);
				body.setKpxzid(kpxzid);
				body.setCardinfoid(cardinfoid);
				body.setJzzb(jzzb);
				body.setBcjt(bcjt);
				body.setJevalue(jevalue);
				if("0".equals(body.getSfzy().trim())){
					JyzcXx zc = new JyzcXx();
					zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
					if("3".equals(zc.getCZczc())||"4".equals(zc.getCZczc())||"5".equals(zc.getCZczc())){
						reduceCheck = "该卡片所挂接资产在处置中，不能减值！";
					}else{
						bodyId = cardCommonUCCImpl.saveBody(body).toString();
					}
				}
				CaShead head = cardCommonUCCImpl.findCaSheadById(body.getKpxzid().toString());
				//得到变动记录的信息并保存
				if(!"".equals(bodyId)){
					record = new Recordhistory();
					record.setZcId(bodyId);
					record.setPkId(body.getKpxzid().toString());
					record.setBefore(String.valueOf(body.getJzzb()-body.getBcjt()));
					record.setAfter(body.getJzzb().toString());
					record.setChangetype("卡片减值");
					record.setZcType("card");
					record.setName("减值准备");
					record.setChangeinfoid(body.getCardinfoid());
					record.setChangestate("01");
					record.setWfCode(head.getWfconfigCode());//流程
					record.setChangedate(head.getNgrq());
					cardCommonUCCImpl.saveRecord(record);
				}
			}
			request.setAttribute("reduceCheck", reduceCheck);
			request.setAttribute("message", "保存成功！");
			return sheetType;
		}else if("reduce".equals(sheetType)){//*************************************卡片减少时操作
			String isModifyBody = request.getParameter("isModifyBody");
			String reduceCheck = "";
			if("true".equals(isModifyBody)){//卡片减少修改
				String dealmethod = body.getDealmethod();
				String changereason = body.getChangereason();
				Long kpxzid = body.getKpxzid();
				String cardinfoid = body.getCardinfoid();
				Long id = body.getId();
				card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
				body = cardCommonUCCImpl.card2Body(card);
				body.setId(id);
				body.setDealmethod(dealmethod);
				body.setChangereason(changereason);
				body.setKpxzid(kpxzid);
				body.setCardinfoid(cardinfoid);
				cardCommonUCCImpl.update(body);
			}else{//卡片减少添加
				//将card信息加入到body里部分字段要手动写
				String dealmethod = body.getDealmethod();
				String changereason = body.getChangereason();
				Long kpxzid = body.getKpxzid();
				String cardinfoid = body.getCardinfoid();
				card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
				body = cardCommonUCCImpl.card2Body(card);
				body.setDealmethod(dealmethod);
				body.setChangereason(changereason);
				body.setKpxzid(kpxzid);
				body.setCardinfoid(cardinfoid);
				if("0".equals(body.getSfzy().trim())){
					JyzcXx zc = new JyzcXx();
					zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
					if("1".equals(zc.getZlzt())||"3".equals(zc.getCZczc())||"4".equals(zc.getCZczc())||"5".equals(zc.getCZczc())){
						reduceCheck = "该卡片所挂接资产在租赁或处置中，无法减少！";
					}else{
						cardCommonUCCImpl.save(body);
					}
				}
			}
			request.setAttribute("reduceCheck", reduceCheck);
			request.setAttribute("message", "保存成功！");
			return sheetType;
		}else if("modify".equals(sheetType)){//*****************************************卡片修改时操作
			Long headId = Long.parseLong(request.getParameter("headId"));
			String cardId = request.getParameter("cardId");//取得卡片id
			//是否为卡片修改功能里的修改，还是为卡片修改功能里的增加 修改申请单表体时候用到
			String isMModifyBody = request.getParameter("isMModifyBody");
			Cardinfo card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
			String cardType = request.getParameter("cardType");//卡片类型
			body.setChildid(body.getTypecode());
			if (cardType==null||"".equals(cardType)||"null".equals(cardType)){
				cardType = card.getParentid().toString(); //取得卡片类型
			}
			if("true".equals(isMModifyBody)){//是卡片修改或者卡片变动的修改表体信息，那么就更新，否则添加一条数据
				cardCommonUCCImpl.update(body);
				String str[] = new String[1];
				str[0] = body.getId().toString();
				cardCommonUCCImpl.deleteRecord(str);
				cardCommonUCCImpl.compareCardVsBody(body,cardCommonUCCImpl.findCardinfoByCardId(cardId));//根据body和card对比出卡片的变化信息，并存到变动表里，
				request.setAttribute("closewin", "true");//更新后，关闭窗口
			}else{							
				body.setKpxzid(headId);
				body.setKplx(cardType);
				cardCommonUCCImpl.save(body);
				cardCommonUCCImpl.compareCardVsBody(body,cardCommonUCCImpl.findCardinfoByCardId(cardId));//根据body和card对比出卡片的变化信息，并存到变动表里，
			}
			String returnStr = this.chooseCardType(cardType);//选择卡片类型
			request.setAttribute("message", "保存成功");
			request.setAttribute("sheetType", sheetType);
			return returnStr;
		}else if("merge".equals(sheetType)){//******************************************卡片合并时操作
			String headId = request.getParameter("headId");
			String isMMergeBody = request.getParameter("isMMergeBody");//是否为卡片合并功能里的修改，
			if("true".equals(isMMergeBody)){//是卡片修改或者卡片变动的修改表体信息，那么就更新，否则添加一条数据
				cardCommonUCCImpl.update(body);
				String parentid = body.getParentid().toString();
				String returnStr = this.chooseCardType(parentid);
				request.setAttribute("closewin", "true");//更新后，关闭窗口
				request.setAttribute("message", "保存成功");
				request.setAttribute("sheetType", sheetType);
				return returnStr;
			}else{
				String id = request.getParameter("id");
				if(id.startsWith(",")){
					id = id.substring(1);//全选时会把全选按钮空字串带过来，格式如“,1,2”
				}
				String [] ids = id.split(",");//这个是cardinfo的id数组
				//根据ids取得cardinfo信息，并保存到lccardtemp表中
				String s = cardCommonUCCImpl.saveCard4Merge(ids,headId);
				if("退役的卡片不能选择".equals(s)){
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(s);
					return null;
				}
				if(s.length()>0){
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(s+"，不能选为合并卡片！只有同一资产下，相同类型的卡片才能合并！");
				}
				return null;
			}
		}else if("change".equals(sheetType)){//***************************************卡片变动时操作 //这个方法暂时只能单条变动
			Long headId 		= Long.parseLong(request.getParameter("headId"));		//取得表单ID
			String changeway 	= request.getParameter("changeway");	//取得变动方式的id，取的应该是INDIVIDUALTREE表的id
			String changereason = request.getParameter("changereason");	//取得变动原因
			String cardId 		= request.getParameter("cardId");		//取得卡片id
			String changeValue 	= request.getParameter("changeValue");	//取得变动后的值
			String isProportion = request.getParameter("isProportion");//取得是否按比列变动的标志true为是，没有为否
			String []cardIds	= cardId.split(",");	
			head = cardCommonUCCImpl.findCaSheadById(String.valueOf(headId));
			for(int i =0;i<cardIds.length;i++){
				Cardinfo card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
				body = cardCommonUCCImpl.card2Body(card);
				Individualtree tree = cardCommonUCCImpl.getIndividualtreeById(changeway);
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
				body.setKpxzid(headId);
				body.setChangeway(nodevalue);
				body.setChangereason(changereason);
				body.setCardinfoid(cardIds[i]);
				cardCommonUCCImpl.save(body);
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
				record.setWfCode(head.getWfconfigCode());
				//设置审批状态为0：未审批
				record.setZhuangTai("0");
				record.setBiaoming("lccardtemp");
				cardCommonUCCImpl.saveRecord(record);
			}
			request.setAttribute("message", "保存成功");
			return sheetType;
		}else{                               //***************************************卡片新增时操作
			Long headId = Long.parseLong(request.getParameter("headId"));
			String cardType = request.getParameter("cardType");//卡片类型
			String isModifyBody = request.getParameter("isModifyBody");
			String zcType = request.getParameter("zcType");
			if("true".equals(isModifyBody)){
				//modify by lantianbo
			}else{
				body.setKpxzid(headId);
				body.setKplx(cardType);
				body.setParentid(Long.parseLong(cardType));
				body.setChildid(body.getTypecode());
				body.setRzkm(cardCommonUCCImpl.getRzkm(body.getTypecode(), body.getIfjc()));
				if("zyzc".equals(zcType)){
					body.setSfzy("1");
				}else{
					body.setSfzy("0");
				}
			}
			String returnStr = sheetType;
			if("true".equals(isModifyBody)){
				cardCommonUCCImpl.update(body);
				returnStr = this.chooseCardType(cardType);//选择卡片类型
				request.setAttribute("isModifyBody", isModifyBody);
			}else{
				cardCommonUCCImpl.save(body);
			}
			request.setAttribute("message", "保存成功");
			returnStr = this.chooseCardType(cardType);
			return returnStr;
		}
	}
	
	/**
	 * 合并卡片
	 * @return
	 * @throws IOException 
	 */
	public String mergeBody() throws IOException{
		String bodyIds = request.getParameter("bodyIds");
		String sheetType = request.getParameter("sheetType");
		String headId = request.getParameter("headId");
		String baseCardId = request.getParameter("baseCardId");
		if(bodyIds.startsWith(",")){
			bodyIds = bodyIds.substring(1);//全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String [] ids = bodyIds.split(",");//这个是要合并的卡片临时表里的id数组
		try{
			boolean is = cardCommonUCCImpl.mergeBody(ids,baseCardId,headId);//根据所选的卡片合并，ids为合并的卡片id数组，baseCardId为基础卡片，headId为表单id，ybyz,ljzj,jvalue,jevalue
			response.setCharacterEncoding("UTF-8");
			if(is){
				response.getWriter().write("success");
			}else{
				response.getWriter().write("不同类型卡片不能合并！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 查看处理单的表体信息
	 * 从后台检索数据，界面显示。但处于只读状态，不可修改。
	 */
	public String viewBody(){
		String sheetType = request.getParameter("sheetType");//sheetType为操作类型，根据操作类型进入不同处理单页面
		String headId = request.getParameter("headId");
		String bodyId = request.getParameter("bodyId");
		body = cardCommonUCCImpl.findLcCardtempById(bodyId);
		return "viewBody";
	}
	
	/**
	 * 通过cardId查询出cardInfo并保存至body
	 * @return
	 */
	public String getBodyInfo(){
		String cardId = request.getParameter("cardId");
		String sheetType = request.getParameter("sheetType");
		Long headId = Long.parseLong(request.getParameter("headId"));
		String zcid = request.getParameter("zcid");
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", headId.toString());
		if(zcid!=null){
			zc = cardCommonUCCImpl.findJyzcXxByZcId(zcid);
			card.setJyZc(zc);
			body.setZcid(zcid);
			request.setAttribute("zcType", "jyzc");
			chooseData= "true";
			return sheetType;
		}else{
			card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
			if("1".equals(card.getSfzy())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(String.valueOf(card.getZcid())));
			}else {
				request.setAttribute("zcType", "jyzc");
				card.setJyZc(cardCommonUCCImpl.findJyzcXxByZcId(String.valueOf(card.getZcid())));
			}
			body = cardCommonUCCImpl.card2Body(card);
			body.setKplx(card.getParentid().toString());
			body.getParentid();
			body.setKpxzid(headId);
			body.setCardinfoid(card.getId().toString());
			// ************** 得到以下字段的值 *************
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", card.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", card.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", card.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", card.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", card.getTypecode()));
			chooseData= "true";
			return sheetType;
		}
	}
	
	/**
	 * 进入处理单修改表体页面
	 * @throws ParseException 
	 */
	public String modifyBody(){
		String sheetType = request.getParameter("sheetType");//sheetType为操作类型，根据操作类型进入不同处理单页面
		String sfzyrk = request.getParameter("sfzyrk");//sfzyrk：是否自用入库
		if("split".equals(sheetType)){
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			Long parentid = body.getParentid();
			String returnStr = this.chooseCardType(parentid.toString());//选择卡片类型
			// **************判断资产类型**************
			card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
			if("1".equals(body.getSfzy().trim())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(body.getZcid().toString()));
			}else {
				request.setAttribute("zcType", "jyzc");
				card.setJyZc(cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid().toString()));
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", body.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", body.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", body.getTypecode()));
			request.setAttribute("sheetType", sheetType);//sheetType为操作类型，根据操作类型进入不同处理单页面
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("isMSplitBody", "true");//是卡片合并里的修改表体信息
			request.setAttribute("cardType", parentid.toString());//kplx为卡片类型，根据卡片类型进入不同卡片类型页面修改 ,
			return returnStr;
		}
		else if("allocate".equals(sheetType)){
			String isModifyBody = request.getParameter("isModifyBody");
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
			card.setJyZc(zc);
			request.setAttribute("sheetType", sheetType);
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("isModifyBody", isModifyBody);
			return sheetType;
		}
		else if("devalue".equals(sheetType)){       //卡片减值时操作
			String isModifyBody = request.getParameter("isModifyBody");
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			LcCardtemp newBody = cardCommonUCCImpl.findLcCardtempById(bodyId);
			card = cardCommonUCCImpl.findCardinfoByCardId(newBody.getCardinfoid());
			body = cardCommonUCCImpl.card2Body(card);
			body.setId(Long.parseLong(bodyId));
			body.setBoxid(newBody.getBoxid());
			body.setCardinfoid(newBody.getCardinfoid());
			body.setKpxzid(newBody.getKpxzid());
			// **************判断资产类型**************
			if("1".equals(body.getSfzy())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(body.getZcid().toString()));
			}else {
				request.setAttribute("zcType", "jyzc");
				card.setJyZc(cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid().toString()));
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", body.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", body.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", body.getTypecode()));
			request.setAttribute("sheetType", sheetType);
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("isModifyBody", isModifyBody);
			return sheetType;
		}
		else if("reduce".equals(sheetType)){	//卡片减少时操作
			String isModifyBody = request.getParameter("isModifyBody");
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
			// **************判断资产类型**************
			if("1".equals(body.getSfzy())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(body.getZcid().toString()));
			}else {
				request.setAttribute("zcType", "jyzc");
				card.setJyZc(cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid().toString()));
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", body.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", body.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", body.getTypecode()));
			request.setAttribute("sheetType", sheetType);
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("isModifyBody", isModifyBody);
			return sheetType;
		}else if("modify".equals(sheetType)||"change".equals(sheetType)){	//卡片修改和变动时操作
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			changWayList= cardCommonUCCImpl.getChangeReasonWay("");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			String kplx = String.valueOf(body.getParentid());
			String returnStr = this.chooseCardType(kplx);//选择卡片类型
			card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
			// **************判断资产类型**************
			if("1".equals(body.getSfzy())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(body.getZcid().toString()));
			}else {
				request.setAttribute("zcType", "jyzc");
	            try{
				card.setJyZc(cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid().toString()));
	            }catch(Exception e){
	            	e.printStackTrace();
	            }
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", body.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", body.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", body.getTypecode()));
			request.setAttribute("sheetType", sheetType);//sheetType为操作类型，根据操作类型进入不同处理单页面
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("cardId", card.getId().toString());
			request.setAttribute("isMModifyBody", "true");//是卡片修改里的修改表体信息
			request.setAttribute("cardType", kplx);//kplx为卡片类型，根据卡片类型进入不同卡片类型页面修改 ,
			return returnStr;
		}else if("merge".equals(sheetType)){	//卡片合并时候操作
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			Long parentid = body.getParentid();
			String returnStr = this.chooseCardType(parentid.toString());//选择卡片类型
			// **************判断资产类型**************
//			card = cardCommonUCCImpl.findCardinfoByCardId(body.getCardinfoid());
			card = new Cardinfo();
			if("1".equals(body.getSfzy())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(String.valueOf(body.getZcid())));
			}else {
				request.setAttribute("zcType", "jyzc");
				card.setJyZc(cardCommonUCCImpl.findJyzcXxByZcId(String.valueOf(body.getZcid())));
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", body.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", body.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", body.getTypecode()));

			request.setAttribute("sheetType", sheetType);//sheetType为操作类型，根据操作类型进入不同处理单页面
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("isMMergeBody", "true");//是卡片合并里的修改表体信息
			request.setAttribute("cardType", parentid.toString());//kplx为卡片类型，根据卡片类型进入不同卡片类型页面修改 ,
			return returnStr;
		}else{
			String bodyId = request.getParameter("bodyId");
			String headId = request.getParameter("headId");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			if("0".equals(body.getSfzy().trim())){
				JyzcXx zc = new JyzcXx();
				if(body.getZcid()!=null){
					zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
					zcmc = zc.getZcmc()==null?"":zc.getZcmc();
					zcbh = zc.getZcbh()==null?"":zc.getZcbh();
					zczt = zc.getCZczc()==null?"":zc.getCZczc();
				}
				request.setAttribute("zcType", "jyzc");
			}else{
				ZyZc zc = new ZyZc();
				if(body.getZcid()!=null && sfzyrk == null){
					zc = cardCommonUCCImpl.findZyZcById(body.getZcid());
					zcmc = zc.getZcmc()==null?"":zc.getZcmc();
					zcbh = zc.getZcbh()==null?"":zc.getZcbh();
					//zczt = zc.getZczt();
					zczt = zc.getZczt()==null?"":zc.getZczt();
				}else if(body.getZcid()!=null && "true".equals(sfzyrk)){
					String [] bodyIds = new String[1];
					bodyIds[0] = body.getZcid();
					List<ZySbody> bodyList = zCManageBodyUCCimpl.obtainBodyListByBodyIds(bodyIds);
					ZySbody body = bodyList.get(0);
					zcmc = body.getZcmc()==null?"":body.getZcmc();
					zcbh = body.getZcbh()==null?"":body.getZcbh();
					zczt = body.getZczt()==null?"":body.getZczt();
					request.setAttribute("hiddenZCChoiceButton", "yes");
				}
				request.setAttribute("zcType", "zyzc");
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", body.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", body.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", body.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", body.getTypecode()));
			String kplx = body.getKplx();
			body.getParentid();
			String returnStr = this.chooseCardType(kplx);//选择卡片类型
			request.setAttribute("isAddModify", "true");
			if("add".equals(sheetType)){
				request.setAttribute("isModifyBody", "true");//是卡片在新增时候修改新增的卡片
			}
			request.setAttribute("sheetType", sheetType);//sheetType为操作类型，根据操作类型进入不同处理单页面
			request.setAttribute("headId", headId);
			request.setAttribute("bodyId", bodyId);
			request.setAttribute("cardType", kplx);//kplx为卡片类型，根据卡片类型进入不同卡片类型页面修改 ,
			return returnStr;
		}
	}
	
	private String getZyZczt(String zczt2) {
		String zczt = "";
		if(KpglCommon.ZYZC_ZT_CG.equals(zczt2)){
			zczt = "采购";
		}else if(KpglCommon.ZYZC_ZT_ZK.equals(zczt2)){
			zczt = "在库";
		}else if(KpglCommon.ZYZC_ZT_JY.equals(zczt2)){
			zczt = "借用";
		}else if(KpglCommon.ZYZC_ZT_LY.equals(zczt2)){
			zczt = "领用";
		}else if(KpglCommon.ZYZC_ZT_WX.equals(zczt2)){
			zczt = "维修";
		}else if(KpglCommon.ZYZC_ZT_BF.equals(zczt2)){
			zczt = "报废";
		}
		return zczt;
	}

	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	private String getJSON(List bodyList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		JsonConfig jsonConfig = new JsonConfig();
		JSONObject jsonObject = null;
		for(Iterator i = bodyList.iterator(); i.hasNext();){
			LcCardtemp body1  = (LcCardtemp) i.next();
			jsonObject = JSONObject.fromObject(body1,jsonConfig); 
			jsonSB.append(jsonObject.toString());
			if(i.hasNext()){
				jsonSB.append(",");
			}
		}
		jsonSB.append("]");
		jsonSB.append("}");
		return jsonSB.toString();
	}
	
	public String queryCardType(){
		String cardId = request.getParameter("cardId");
		card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
		String cardType ="";
		if(card!=null){
			cardType=String.valueOf(card.getParentid());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(cardType);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @throws IOException 
	 * 
	 */
	public String query4ViewBody() throws IOException {
		String headId = request.getParameter("headId");
		String cardNew = request.getParameter("cardNew");
		List bodyList = null;
		if(cardNew!=null&&cardNew.length()>0){
			bodyList = cardCommonUCCImpl.findLcCardtempsBySheadId(headId,cardNew);
		}else{
			bodyList = cardCommonUCCImpl.findLcCardtempsBySheadId(headId);
		}
		String josnStr = this.getJSON(bodyList, 1, 1, 24);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(josnStr);
		return null;
	}
	
	/**
	 * 新增卡片页面加载房屋及建筑物表体子页面 11个卡片类型
	 */
	public String cardType() {
		String sheetType = request.getParameter("sheetType");
		String headId = "";
		String cardType = "";
		String returnStr = "";
		if("modify".equals(sheetType)||"change".equals(sheetType)){
			headId = request.getParameter("headId");
			String cardId = request.getParameter("cardId");
			card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
			body = cardCommonUCCImpl.card2Body(card);//把card信息转换成body
			body.setCardinfoid(card.getId().toString());
			cardType = card.getParentid().toString();//卡片类型，根据这个跳转到相应的卡片修改类型页面
			// ****************判断资产类型**************
			if("1".equals(card.getSfzy())){
				request.setAttribute("zcType", "zyzc");
				card.setZyZc(cardCommonUCCImpl.findZyZcById(card.getZcid().toString()));
			}else {
				request.setAttribute("zcType", "jyzc");
				JyzcXx x  = cardCommonUCCImpl.findJyzcXxByZcId(card.getZcid().toString());
				card.setJyZc(x);
			}
			// ************** 得到以下字段的值 *************
			bodyValue = new CardNameVO();
			bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue("addmethod", card.getAddtype()));
			bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue("department", card.getGlbm()));
			bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue("department", card.getUsepartment()));
			bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue("userStatus", card.getUsestatus()));
			bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue("assetType", card.getTypecode()));
			request.setAttribute("cardId", String.valueOf(card.getId()));
		}else{
			String zcType = request.getParameter("zcType");
			String bodyId = request.getParameter("bodyId");
			cardType = request.getParameter("cardType");//卡片类型
			headId = request.getParameter("headId");
			body = new LcCardtemp();
			body.setLrrq(new Date());
			request.setAttribute("headId", headId);
			request.setAttribute("zcType", zcType);
		}
		request.setAttribute("sheetType", sheetType);
		returnStr = this.chooseCardType(cardType);//选择卡片类型
		return returnStr;
	}
	/**
	 * 选择卡片类型然后返回转向卡片类型页面的String
	 * @param cardType
	 * @return
	 */
	public String chooseCardType(String cardType) {
		String returnStr = "cardBody";
		if("94".equals(cardType)){//房屋及建筑物 卡片类型在dic_app_asset_state表中,取的是pk_id，一期取的也是这个字段
			returnStr += "House";
		}else if("95".equals(cardType)){//土地
			returnStr += "Ground";
		}else if("96".equals(cardType)){//在建工程
			returnStr += "Project";
		}else if("98".equals(cardType)){//无形资产
			returnStr += "Asset";
		}else if("21628".equals(cardType)){//投资性房屋
			returnStr += "InvestHouse";
		}else if("21629".equals(cardType)){//投资性土地
			returnStr += "InvestGround";
		}else if("93".equals(cardType)){//交通工具
			returnStr += "Traffic";
		}else if("97".equals(cardType)){//电子设备
			returnStr += "Fixture";
		}else if("1668".equals(cardType)){//经营租入固定资产改良
			returnStr += "AssetChange";
		}else if("1669".equals(cardType)){//长期待摊
			returnStr += "LongWait";
		}else if("1670".equals(cardType)){//装修
			returnStr += "Fitment";
		}
		return returnStr;
	}
	
	/**
	 * 打开卡片拆分的页面
	 */
	public String openSplitPage(){
		String sheetType = request.getParameter("sheetType");//sheetType为操作类型，根据操作类型进入不同处理单页面
		String headId = request.getParameter("headId");
		String bodyId = request.getParameter("bodyId");
		if(bodyId.startsWith(",")){
			bodyId = bodyId.substring(1);//全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		body = cardCommonUCCImpl.findLcCardtempById(bodyId);
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", headId);
		return sheetType;
	}
	
	/**
	 * 卡片拆分
	 * @return
	 */
	public String splitCard(){
		Long bodyId = body.getId();
		String headId = request.getParameter("headId");
		this.cardCommonUCCImpl.deleteSplits(headId,bodyId);
		String isYz = request.getParameter("isYz");
		String[] baifen = null;
		String[] yuanzhi1 = null;
		if("true".equals(isYz)){
			baifen = request.getParameterValues("baifen");
			yuanzhi1 = request.getParameterValues("yuanzhi");
		}else{
			String every = request.getParameter("every");
			String flag = every.substring(0,every.length()-1);
			baifen = request.getParameterValues("baifen");
			yuanzhi1 = request.getParameterValues("yuanzhi");
		}
		Double ybyz = body.getYbyz();
		Double ljzj = body.getLjzj();
		Double jzzb = body.getJzzb();
		Double jevalue = body.getJevalue();
		Double ybyz1 = 0.0;
		Double ljzj1 = 0.0;
		Double jzzb1 = 0.0;
		Double jevalue1 = 0.0;
		DecimalFormat r=new DecimalFormat();  
		r.applyPattern("#0.00");//保留小数位数，不足会补零  
		//Double d = new Double(r.format(33.3333333333)).doubleValue();
		boolean isLast = false;
		for(int i=0;i<baifen.length;i++){
			Double yuanzhi = 0D;
			Double zhejiu = 0D;
			Double jianzhi = 0D;
			Double jinge = 0D;
			if(i == baifen.length-1){
				isLast = true;
			}
			if(ybyz!=null){
				yuanzhi = Double.valueOf(yuanzhi1[i]);
				yuanzhi = new Double(r.format(yuanzhi)).doubleValue();
				ybyz1 = ybyz1 + (isLast?0.0D:yuanzhi);
			}
			if(ljzj!=null){
				zhejiu = (ljzj*(Double.valueOf(baifen[i])))/Double.valueOf(100);
				zhejiu = new Double(r.format(zhejiu)).doubleValue();
				ljzj1 = ljzj1 + (isLast?0.0D:zhejiu);
			}
			if(jzzb!=null){
				jianzhi = (jzzb*(Double.valueOf(baifen[i])))/Double.valueOf(100);
				jianzhi = new Double(r.format(jianzhi)).doubleValue();
				jzzb1 = jzzb1 + (isLast?0.0D:jianzhi);
			}
			if(jevalue!=null){
				jinge = (jevalue*(Double.valueOf(baifen[i])))/Double.valueOf(100);
				jinge = new Double(r.format(jinge)).doubleValue();
				jevalue1 = jevalue1 + (isLast?0.0D:jinge);
			}
			LcCardtemp body1 = cardCommonUCCImpl.findLcCardtempById(bodyId.toString());
			LcCardtemp body = new LcCardtemp();
			try {
				BeanUtils.copyProperties(body, body1);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			body.setCardcode("");
			body.setYbyz(isLast?(ybyz-ybyz1):yuanzhi);
			body.setLjzj(isLast?(ljzj-ljzj1):zhejiu);
			body.setBoxid(bodyId.toString());
			body.setJevalue(isLast?(jevalue-jevalue1):jinge);
			body.setJzzb(isLast?(jzzb-jzzb1):jianzhi);
			body.setAddtype("0114");
			body.setState("02");
			cardCommonUCCImpl.save(body);
		}
		LcCardtemp oldbody = new LcCardtemp();
		oldbody = cardCommonUCCImpl.findLcCardtempById(bodyId.toString());
		oldbody.setState("03");
		oldbody.setDealmethod("0213");
		oldbody.setChangereason("1613");
		cardCommonUCCImpl.update(oldbody);
		request.setAttribute("message", "拆分成功");
		return "split";
	}
	
	/**
	 * 通过jyzcId 查询经营资产信息并返回给页面 卡片添加用
	 * @return
	 * @throws IOException
	 */
	public String findJYZCInfoById() throws IOException{
		String zcId = request.getParameter("zcId");
		JyzcXx zc = new JyzcXx();
		zc = cardCommonUCCImpl.findJyzcXxByZcId(zcId);
		String zcInfo = zc.getZcbh()+","+zc.getZcmc()+","+zc.getCZczc();
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(zcInfo);
		return null;
	}
	
	/**
	 * 通过jyzcId 查询自用资产信息并返回给页面 卡片添加用
	 * @return
	 * @throws IOException
	 */
	public String findZYZCInfoById() throws IOException{
		String zcId = request.getParameter("zcId");
		ZyZc zc = new ZyZc();
		zc = cardCommonUCCImpl.findZyZcById(zcId);
		String zcInfo = (zc.getZcbh()==null?"":zc.getZcbh())
					+","+(zc.getZcmc()==null?"":zc.getZcmc())
							+","+(zc.getZczt()==null?"":zc.getZczt());
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(zcInfo);
		return null;
	}
	
	public String checkAllocate() throws IOException{
		String cardId = request.getParameter("cardId");
		String zcInfo = null;
		Cardinfo card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
		if("1".equals(card.getSfzy())){// 自用资产不能调配
			response.setCharacterEncoding("UTF-8");
			zcInfo = "no1";
			response.getWriter().write(zcInfo);
		}else{// 经营性固定资产在处置的三种状态中不能调配
			String zcId = card.getZcid();
			JyzcXx zc = new JyzcXx();
			zc = cardCommonUCCImpl.findJyzcXxByZcId(zcId.toString());
			if("3".equals(zc.getCZczc())||"4".equals(zc.getCZczc())||"5".equals(zc.getCZczc())){
				response.setCharacterEncoding("UTF-8");
				zcInfo = "no2";
				response.getWriter().write(zcInfo);
			}else{
				response.setCharacterEncoding("UTF-8");
				zcInfo = cardId;
				response.getWriter().write(zcInfo);
			}
		}
		return null;
	}
	public String openJichukapianxuzhe(){
		
		return "openJichukapianxuzhe";
	}
	/**
	 * 以下为用到的getter setter
	 * @return
	 */
	public CaShead getHead() {
		return head;
	}

	public void setHead(CaShead head) {
		this.head = head;
	}

	public LcCardtemp getBody() {
		return body;
	}

	public void setBody(LcCardtemp body) {
		this.body = body;
	}

	public List getChangWayList() {
		return changWayList;
	}

	public void setChangWayList(List changWayList) {
		this.changWayList = changWayList;
	}

	public Recordhistory getRecord() {
		return record;
	}

	public void setRecord(Recordhistory record) {
		this.record = record;
	}

	public JyzcXx getZc() {
		return zc;
	}

	public void setZc(JyzcXx zc) {
		this.zc = zc;
	}

	public Cardinfo getCard() {
		return card;
	}

	public void setCard(Cardinfo card) {
		this.card = card;
	}

	public CardNameVO getBodyValue() {
		return bodyValue;
	}

	public void setBodyValue(CardNameVO bodyValue) {
		this.bodyValue = bodyValue;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public String getChooseData() {
		return chooseData;
	}

	public void setChooseData(String chooseData) {
		this.chooseData = chooseData;
	}

	
}
