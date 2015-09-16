create or replace procedure insert_account_expense is
begin
   execute immediate 'TRUNCATE TABLE account_expense';
     insert into account_expense
              ( id,djlxbm,djrq
                ,costname,deptname,ybje,fbje,bbje,zy,jfybje,jffbje,jfbbje,ybye,fbye,bbye,cardcode,jbr,lrr,shr,accounttype,accountnumber
              )
       SELECT seq_expense_id as id,t.djlxbm AS 单据类型,to_date(t.djrq,'yyyy-MM-dd') AS 单据日期,
       b13.costname AS 收支项目,b9.deptname AS 部门,
       t.ybje AS 原币金额, t.fbje AS 辅币金额,t.bbje AS 本币金额,
       s.zy AS 摘要,s.jfybje AS 借方原币金额,s.jffbje AS 借方辅币金额,s.jfbbje AS 借方本币金额,
       s.ybye AS 原币余额,s.fbye AS 辅币余额,s.bbye AS 本币余额,s.zyx13 as 卡片编号,s.zyx2 as 经办人,
       expense_username(t.lrr) as 录入人,
       expense_username(t.shr) as 审核人,
       account_type(b13.costname) as 费用项目,
       account_number(b13.costname) as 费用种类
  FROM erp.erp_arap_djzb t
  INNER JOIN erp.erp_arap_djfb s ON t.vouchid = s.vouchid --主外键
  LEFT OUTER JOIN erp.erp_bd_corp b1 ON t.dwbm = b1.pk_corp --公司档案
  LEFT OUTER JOIN erp.erp_arap_djlx b2 ON t.ywbm = b2.djlxoid --单据类型档案
  LEFT OUTER JOIN erp.erp_sm_user b3 ON t.lrr = b3.cuserid --人员档案
  LEFT OUTER JOIN erp.erp_bd_busitype b4 ON t.xslxbm = b4.pk_busitype --业务类型
  LEFT OUTER JOIN erp.erp_bd_cubasdoc b5 ON t.ddhbbm = b5.pk_cubasdoc --客商档案
  LEFT OUTER JOIN erp.erp_bd_psndoc b6 ON t.sfkr = b6.pk_psndoc --人员档案
  LEFT OUTER JOIN erp.erp_bd_subjtype b7 ON t.kmbm = b7.pk_subjtype --会计科目
  LEFT OUTER JOIN erp.erp_bd_balatype b8 ON t.pj_jsfs = b8.pk_balatype --结算方式
  LEFT OUTER JOIN erp.erp_bd_deptdoc b9 ON s.deptid = b9.pk_deptdoc --部门档案
  LEFT OUTER JOIN erp.erp_bd_currtype b10 ON s.bzbm = b10.pk_currtype --币种档案
  LEFT OUTER JOIN erp.erp_bd_jobbasfil b11 ON s.xmbm2 = b11.pk_jobbasfil --项目管理档案
  LEFT OUTER JOIN erp.erp_bd_invbasdoc b12 ON s.chbm_cl = b12.pk_invbasdoc --存货档案
  LEFT OUTER JOIN erp.erp_bd_costsubj b13 ON s.szxmid = b13.pk_costsubj --收支项目
  LEFT OUTER JOIN erp.erp_bd_accid b14 ON s.accountid = b14.pk_accid --帐户档案
  LEFT OUTER JOIN erp.erp_bd_payterm b15 ON s.sfkxyh = b15.pk_payterm --收付款协议
  LEFT OUTER JOIN erp.erp_bd_jobphase b16 ON s.jobphaseid = b16.pk_jobphase --项目阶段
 WHERE NVL(t.dr,0) = 0--过滤已删除数据
   AND NVL(s.dr,0) = 0;--过滤已删除数据
    commit;
end insert_account_expense;
/
