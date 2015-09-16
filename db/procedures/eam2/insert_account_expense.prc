create or replace procedure insert_account_expense is
begin
   execute immediate 'TRUNCATE TABLE account_expense';
     insert into account_expense
              ( id,djlxbm,djrq
                ,costname,deptname,ybje,fbje,bbje,zy,jfybje,jffbje,jfbbje,ybye,fbye,bbye,cardcode,jbr,lrr,shr,accounttype,accountnumber
              )
       SELECT seq_expense_id as id,t.djlxbm AS ��������,to_date(t.djrq,'yyyy-MM-dd') AS ��������,
       b13.costname AS ��֧��Ŀ,b9.deptname AS ����,
       t.ybje AS ԭ�ҽ��, t.fbje AS ���ҽ��,t.bbje AS ���ҽ��,
       s.zy AS ժҪ,s.jfybje AS �跽ԭ�ҽ��,s.jffbje AS �跽���ҽ��,s.jfbbje AS �跽���ҽ��,
       s.ybye AS ԭ�����,s.fbye AS �������,s.bbye AS �������,s.zyx13 as ��Ƭ���,s.zyx2 as ������,
       expense_username(t.lrr) as ¼����,
       expense_username(t.shr) as �����,
       account_type(b13.costname) as ������Ŀ,
       account_number(b13.costname) as ��������
  FROM erp.erp_arap_djzb t
  INNER JOIN erp.erp_arap_djfb s ON t.vouchid = s.vouchid --�����
  LEFT OUTER JOIN erp.erp_bd_corp b1 ON t.dwbm = b1.pk_corp --��˾����
  LEFT OUTER JOIN erp.erp_arap_djlx b2 ON t.ywbm = b2.djlxoid --�������͵���
  LEFT OUTER JOIN erp.erp_sm_user b3 ON t.lrr = b3.cuserid --��Ա����
  LEFT OUTER JOIN erp.erp_bd_busitype b4 ON t.xslxbm = b4.pk_busitype --ҵ������
  LEFT OUTER JOIN erp.erp_bd_cubasdoc b5 ON t.ddhbbm = b5.pk_cubasdoc --���̵���
  LEFT OUTER JOIN erp.erp_bd_psndoc b6 ON t.sfkr = b6.pk_psndoc --��Ա����
  LEFT OUTER JOIN erp.erp_bd_subjtype b7 ON t.kmbm = b7.pk_subjtype --��ƿ�Ŀ
  LEFT OUTER JOIN erp.erp_bd_balatype b8 ON t.pj_jsfs = b8.pk_balatype --���㷽ʽ
  LEFT OUTER JOIN erp.erp_bd_deptdoc b9 ON s.deptid = b9.pk_deptdoc --���ŵ���
  LEFT OUTER JOIN erp.erp_bd_currtype b10 ON s.bzbm = b10.pk_currtype --���ֵ���
  LEFT OUTER JOIN erp.erp_bd_jobbasfil b11 ON s.xmbm2 = b11.pk_jobbasfil --��Ŀ������
  LEFT OUTER JOIN erp.erp_bd_invbasdoc b12 ON s.chbm_cl = b12.pk_invbasdoc --�������
  LEFT OUTER JOIN erp.erp_bd_costsubj b13 ON s.szxmid = b13.pk_costsubj --��֧��Ŀ
  LEFT OUTER JOIN erp.erp_bd_accid b14 ON s.accountid = b14.pk_accid --�ʻ�����
  LEFT OUTER JOIN erp.erp_bd_payterm b15 ON s.sfkxyh = b15.pk_payterm --�ո���Э��
  LEFT OUTER JOIN erp.erp_bd_jobphase b16 ON s.jobphaseid = b16.pk_jobphase --��Ŀ�׶�
 WHERE NVL(t.dr,0) = 0--������ɾ������
   AND NVL(s.dr,0) = 0;--������ɾ������
    commit;
end insert_account_expense;
/
