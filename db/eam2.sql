---------------------------------------------
-- Export file for user EAM2               --
-- Created by wenhui on 2014/7/24, 9:05:57 --
---------------------------------------------

spool eam2.log

prompt
prompt Creating table ACCOUNT_EXPENSE
prompt ==============================
prompt
create table EAM2.ACCOUNT_EXPENSE
(
  ID            NUMBER not null,
  DJLXBM        VARCHAR2(100),
  DJRQ          DATE,
  COSTNAME      VARCHAR2(100),
  DEPTNAME      VARCHAR2(100),
  YBJE          NUMBER(20,2),
  FBJE          NUMBER(20,2),
  BBJE          NUMBER(20,2),
  ZY            VARCHAR2(500),
  JFYBJE        NUMBER(20,2),
  JFFBJE        NUMBER(20,2),
  JFBBJE        NUMBER(20,2),
  YBYE          NUMBER(20,2),
  FBYE          NUMBER(20,2),
  BBYE          NUMBER(20,2),
  CARDCODE      VARCHAR2(100),
  JBR           VARCHAR2(100),
  LRR           VARCHAR2(100),
  SHR           VARCHAR2(100),
  ACCOUNTTYPE   VARCHAR2(200),
  ACCOUNTNUMBER VARCHAR2(50)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ACCOUNT_EXPENSE.ID
  is 'id';
comment on column EAM2.ACCOUNT_EXPENSE.DJLXBM
  is '��������';
comment on column EAM2.ACCOUNT_EXPENSE.DJRQ
  is '��������';
comment on column EAM2.ACCOUNT_EXPENSE.COSTNAME
  is '��֧��Ŀ';
comment on column EAM2.ACCOUNT_EXPENSE.DEPTNAME
  is '����';
comment on column EAM2.ACCOUNT_EXPENSE.YBJE
  is 'ԭ�ҽ��';
comment on column EAM2.ACCOUNT_EXPENSE.FBJE
  is '���ҽ��';
comment on column EAM2.ACCOUNT_EXPENSE.BBJE
  is '���ҽ��';
comment on column EAM2.ACCOUNT_EXPENSE.ZY
  is 'ժҪ';
comment on column EAM2.ACCOUNT_EXPENSE.JFYBJE
  is '�跽ԭ�ҽ��';
comment on column EAM2.ACCOUNT_EXPENSE.JFFBJE
  is '�跽���ҽ��';
comment on column EAM2.ACCOUNT_EXPENSE.JFBBJE
  is '�跽���ҽ��';
comment on column EAM2.ACCOUNT_EXPENSE.YBYE
  is 'ԭ�����';
comment on column EAM2.ACCOUNT_EXPENSE.FBYE
  is '�������';
comment on column EAM2.ACCOUNT_EXPENSE.BBYE
  is '�������';
comment on column EAM2.ACCOUNT_EXPENSE.CARDCODE
  is '��Ƭ���';
comment on column EAM2.ACCOUNT_EXPENSE.JBR
  is '������';
comment on column EAM2.ACCOUNT_EXPENSE.LRR
  is '¼����';
comment on column EAM2.ACCOUNT_EXPENSE.SHR
  is '�����';
comment on column EAM2.ACCOUNT_EXPENSE.ACCOUNTTYPE
  is '������Ŀ';
comment on column EAM2.ACCOUNT_EXPENSE.ACCOUNTNUMBER
  is '��������';
alter table EAM2.ACCOUNT_EXPENSE
  add constraint PK_AACOUNT_ID primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AE_MACHINE_EQUIPMENT
prompt ===================================
prompt
create table EAM2.AE_MACHINE_EQUIPMENT
(
  ID        VARCHAR2(32) not null,
  LRSJ      DATE,
  ZC_ID     VARCHAR2(32),
  KPBH      VARCHAR2(30),
  SHULIANG  NUMBER,
  CFDD      VARCHAR2(300),
  SFZC      VARCHAR2(20),
  SFXZ      VARCHAR2(20),
  SFTT      VARCHAR2(20),
  SFDBF     VARCHAR2(20),
  JHZY      VARCHAR2(20),
  QTDSFZY   VARCHAR2(20),
  WCZY      VARCHAR2(20),
  XSSYZ     VARCHAR2(200),
  XSSYZDZ   VARCHAR2(300),
  WCZYQKSM  VARCHAR2(2000),
  SFPY      VARCHAR2(20),
  PYYY      VARCHAR2(2000),
  SFPK      VARCHAR2(20),
  PKYY      VARCHAR2(2000),
  TYBS      VARCHAR2(20),
  TYBSYY    VARCHAR2(2000),
  SFYCZ     VARCHAR2(20),
  ZYRFDDZ   VARCHAR2(300),
  SFYZLHT   VARCHAR2(20),
  ZLHTXH    VARCHAR2(200),
  ZLHTQSRQ  DATE,
  ZLQ       NUMBER,
  YZJJG     NUMBER(20,5),
  CZSJ      VARCHAR2(100),
  YUANZHI   NUMBER(20,5),
  JINGE     NUMBER(20,5),
  CZHT      VARCHAR2(20),
  HTBH      VARCHAR2(200),
  CZSR      NUMBER(20,5),
  CZFY      NUMBER(20,5),
  CZSY      NUMBER(20,5),
  CZHSFJSRZ VARCHAR2(20),
  WRZYY     VARCHAR2(2000),
  SFJF      VARCHAR2(20),
  SFDY      VARCHAR2(20),
  SFSS      VARCHAR2(20),
  GZRQ      DATE,
  QYRQ      DATE,
  ZMYZ      NUMBER(20,5),
  ZMJZ      NUMBER(20,5),
  ZMJZZB    NUMBER(20,5),
  ZMJE      NUMBER(20,5),
  ZCGLJY    VARCHAR2(2000),
  BEIZHU    VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.AE_MACHINE_EQUIPMENT
  is '�����豸�˲�������Ϣ��2010��AE_Machine_Equipment';
comment on column EAM2.AE_MACHINE_EQUIPMENT.LRSJ
  is '¼��ʱ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.AE_MACHINE_EQUIPMENT.KPBH
  is '��Ƭ���';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SHULIANG
  is '����';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CFDD
  is '��ŵص�';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFZC
  is '����(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFXZ
  is '����(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFTT
  is '��̭(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFDBF
  is '������(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.JHZY
  is '��������(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.QTDSFZY
  is '��������������(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.WCZY
  is '�޳�ռ��(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.XSSYZ
  is '��ʱʹ����';
comment on column EAM2.AE_MACHINE_EQUIPMENT.XSSYZDZ
  is '��ʱʹ���ߵ�ַ';
comment on column EAM2.AE_MACHINE_EQUIPMENT.WCZYQKSM
  is '���ס���Ѻ�����ϡ��޳�ռ�����˵��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFPY
  is '��ӯ(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.PYYY
  is '��ӯԭ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFPK
  is '�̿�(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.PKYY
  is '�̿�ԭ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.TYBS
  is '���۲�ʵ(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.TYBSYY
  is '���۲�ʵԭ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFYCZ
  is '�Ѵ���(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZYRFDDZ
  is '�����˷�����ַ';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFYZLHT
  is '�Ƿ������޺�ͬ(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZLHTXH
  is '���޺�ͬ���';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZLHTQSRQ
  is '���޺�ͬ��ʼ����';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZLQ
  is '������(��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.YZJJG
  is '�����۸�(Ԫ/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZSJ
  is '����ʱ��(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.YUANZHI
  is 'ԭֵ(���������ֵ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.JINGE
  is '����(���������ֵ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZHT
  is '���ú�ͬ(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.HTBH
  is '��ͬ���';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZSR
  is '��������';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZFY
  is '���÷���';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZSY
  is '��������';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZHSFJSRZ
  is '���ú��Ƿ�ʱ����(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.WRZYY
  is '�Ѵ���δ���˵�ԭ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFJF
  is '�Ƿ����(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFDY
  is '�Ƿ��Ѻ(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFSS
  is '�Ƿ�����(��/��)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.GZRQ
  is '��������';
comment on column EAM2.AE_MACHINE_EQUIPMENT.QYRQ
  is '��������';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMYZ
  is 'ԭֵ�������ֵ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMJZ
  is '��ֵ�������ֵ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMJZZB
  is '��ֵ׼���������ֵ)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMJE
  is '��������ֵ��';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZCGLJY
  is '�ʲ�������';
comment on column EAM2.AE_MACHINE_EQUIPMENT.BEIZHU
  is '��ע';
alter table EAM2.AE_MACHINE_EQUIPMENT
  add constraint PK_AE_MACHINE_EQUIPMENT primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AE_REAL_ESTATE
prompt =============================
prompt
create table EAM2.AE_REAL_ESTATE
(
  ID           VARCHAR2(32) not null,
  LRSJ         DATE,
  ZC_ID        VARCHAR2(32),
  KPBH         VARCHAR2(30),
  DYLB         VARCHAR2(30),
  FDHYYBZ      VARCHAR2(30),
  FWYBZ        VARCHAR2(30),
  TDYBZ        VARCHAR2(30),
  CQZNFBB      VARCHAR2(30),
  PDLY         VARCHAR2(1000),
  FCZSYQR      VARCHAR2(300),
  FCZH         VARCHAR2(100),
  FCZTDWJ      VARCHAR2(100),
  FWQSYXWJ     VARCHAR2(10),
  FWQSJF       VARCHAR2(10),
  FWQSDY       VARCHAR2(10),
  FWQSSS       VARCHAR2(10),
  TDZSYQR      VARCHAR2(100),
  TDZH         VARCHAR2(100),
  TDQSTDWJ     VARCHAR2(100),
  TDQSYXWJ     VARCHAR2(10),
  TDQSSFJF     VARCHAR2(10),
  TDQSSFDY     VARCHAR2(10),
  TDQSSFSS     VARCHAR2(10),
  WTD          VARCHAR2(10),
  SYZKZC       VARCHAR2(10),
  SYZKXZ       VARCHAR2(10),
  SYZKKD       VARCHAR2(10),
  SYZKJHZY     VARCHAR2(10),
  SYZKDSFZY    VARCHAR2(10),
  SYZKWCZY     VARCHAR2(10),
  XSYZ         VARCHAR2(300),
  XSYDZ        VARCHAR2(300),
  ZJGCYSY      VARCHAR2(10),
  ZJGCZC       VARCHAR2(10),
  ZJGCTJ       VARCHAR2(10),
  CQDTXCRQ     DATE,
  CQDTYSFSE    NUMBER(20,5),
  CQDTYJTXYF   NUMBER(10),
  CQDTSCSYYS   NUMBER(10),
  QKSM         VARCHAR2(1000),
  ZFFLTJ       VARCHAR2(10),
  FDFLTJ       VARCHAR2(10),
  ZLQK         VARCHAR2(10),
  ZYRFDDZ      VARCHAR2(1000),
  ZYMJ         NUMBER(20,5),
  SFYZLHT      VARCHAR2(10),
  ZLHTXH       VARCHAR2(100),
  BFZL         VARCHAR2(10),
  ZLHTQSRQ     DATE,
  ZLQ          NUMBER(20,5),
  YZJJG        NUMBER(20,10),
  ZJJGHWYF     VARCHAR2(10),
  TLFWZJJG     NUMBER(20,10),
  ZJAL1ZJ      NUMBER(20,10),
  ZJAL1NAME    VARCHAR2(300),
  ZJAL2ZJ      NUMBER(20,10),
  ZJAL2NAME    VARCHAR2(300),
  ZJAL3ZJ      NUMBER(20,10),
  ZJAL3NAME    VARCHAR2(300),
  NPJZJ        NUMBER(20,5),
  ZJSYL        NUMBER(20,10),
  ZJSFAQZF     VARCHAR2(10),
  ZSQK         VARCHAR2(10),
  SFPY         VARCHAR2(10),
  PYYY         VARCHAR2(1000),
  SFPK         VARCHAR2(10),
  PKYY         VARCHAR2(1000),
  TYBS         VARCHAR2(10),
  TYBSYY       VARCHAR2(1000),
  YCZ          VARCHAR2(10),
  JSGT         VARCHAR2(10),
  ZXF          VARCHAR2(10),
  FCQSYQFCTD   VARCHAR2(10),
  FDDZCXZZCQT  VARCHAR2(10),
  BGYY         VARCHAR2(10),
  SUSHE        VARCHAR2(10),
  FWYTQT       VARCHAR2(10),
  TDGHYT       VARCHAR2(1000),
  TDSJYT       VARCHAR2(1000),
  CZSJ         DATE,
  CZDYZMYZ     NUMBER(20,5),
  CZDYZMJZ     NUMBER(20,5),
  CZHT         VARCHAR2(10),
  HTBH         VARCHAR2(100),
  CZSR         NUMBER(20,5),
  CZFY         NUMBER(20,5),
  CZSY         NUMBER(20,5),
  CSHSFRZ      VARCHAR2(10),
  YCZWRZYY     VARCHAR2(1000),
  FCS          VARCHAR2(100),
  CZTDSYS      VARCHAR2(100),
  QTFYMC       VARCHAR2(200),
  QTFYJE       CHAR(10),
  JZRSF        VARCHAR2(200),
  SFJZJ        VARCHAR2(10),
  ZJSQF        VARCHAR2(200),
  SFYFCZ       VARCHAR2(10),
  FCZSYR       VARCHAR2(200),
  NFGH         VARCHAR2(10),
  BNGHYY       VARCHAR2(1000),
  GHTDCRJ      NUMBER(20,10),
  GHGGWXJJ     NUMBER(20,10),
  GHWYGLF      NUMBER(20,10),
  GHQTQJFMC    VARCHAR2(100),
  GHQTQJFJE    NUMBER(20,10),
  GHYJNFYHJ    NUMBER(20,10),
  GMYX         VARCHAR2(10),
  GMFS         VARCHAR2(100),
  YXGMJYSCBL   NUMBER(20,10),
  DDZFZC       VARCHAR2(1000),
  SSCZJY       VARCHAR2(1000),
  ZXDCKD       VARCHAR2(10),
  ZTZZC        VARCHAR2(10),
  JCRQ         DATE,
  FWJIEGOU     VARCHAR2(100),
  FWYG         VARCHAR2(1000),
  FWBZCG       VARCHAR2(1000),
  FWZCS        VARCHAR2(1000),
  FWZLDJC      VARCHAR2(1000),
  FWFJH        VARCHAR2(1000),
  JZMJ         NUMBER(20,10),
  HSHJZMJ      NUMBER(20,10),
  FWCBDJ       NUMBER(20,10),
  JIEGOU       VARCHAR2(100),
  GGCC         VARCHAR2(100),
  JLDW         VARCHAR2(100),
  SHULINAG     VARCHAR2(100),
  CBDJ         VARCHAR2(100),
  JCSJ         DATE,
  YDXZSFCR     VARCHAR2(10),
  YDXZSFHB     VARCHAR2(10),
  YDXZQT       VARCHAR2(10),
  TDQDRQ       DATE,
  TDZYNX       VARCHAR2(100),
  TDSYSYNX     VARCHAR2(100),
  TDKFCD       VARCHAR2(100),
  TDMJ         NUMBER(20,5),
  TDHSHMJ      NUMBER(20,5),
  TJGCSJYT     VARCHAR2(100),
  TJGCJG       VARCHAR2(100),
  TJGCCS       VARCHAR2(100),
  TJGCJZMJ     NUMBER(20,5),
  TJGCKGRQ     DATE,
  TJGCYJWGRQ   DATE,
  TJGCXXJD     NUMBER(10,5),
  TJGCFKBL     NUMBER(10,5),
  GJGCGSS      NUMBER(10,5),
  TJGCTDCRHT   VARCHAR2(100),
  TJGCYDXK     VARCHAR2(100),
  TJGCGHXK     VARCHAR2(100),
  TJGCKGXK     VARCHAR2(100),
  TJGCJSFS     VARCHAR2(100),
  ZMJZYZ       NUMBER(20,5),
  ZMJZJZ       NUMBER(20,5),
  ZMJZJZZB     NUMBER(20,5),
  ZMJZJE       NUMBER(20,5),
  CFHZMJZYZ    NUMBER(20,5),
  CFHZMJZJZ    NUMBER(20,5),
  CFHZMJZJZZB  NUMBER(20,5),
  ZFHZMJZJE    NUMBER(20,5),
  PGFF         VARCHAR2(100),
  SCFWQCQJZYZ  NUMBER(20,5),
  SCFWQCQJZCXL NUMBER(20,5),
  SCFWQCQJZJZ  NUMBER(20,5),
  XCZKHBD      NUMBER(20,10),
  XCZKWTDZ     NUMBER(20,10),
  XCZKWFCZ     NUMBER(20,10),
  XCZKCZJF     NUMBER(20,10),
  XCZKQT       NUMBER(20,10),
  DXZRZK       NUMBER(20,10),
  QJSFJE       NUMBER(20,10),
  PGJZYZ       NUMBER(20,10),
  PGJZCXL      NUMBER(20,10),
  PGJZJZ       NUMBER(20,10),
  JZZB         NUMBER(20,10),
  ZZL          NUMBER(20,10),
  PGDJ         NUMBER(20,10),
  SFXPG        VARCHAR2(10),
  ZCGLJY       VARCHAR2(200),
  ZJCZYY       VARCHAR2(1000),
  YCZZAYY      VARCHAR2(1000),
  BEIZHU       VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.AE_REAL_ESTATE
  is '���ز��˲�������Ϣ��2010��AE_Real_Estate(Audit estimate)';
comment on column EAM2.AE_REAL_ESTATE.ID
  is 'ID';
comment on column EAM2.AE_REAL_ESTATE.LRSJ
  is '¼��ʱ��';
comment on column EAM2.AE_REAL_ESTATE.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.AE_REAL_ESTATE.KPBH
  is '��Ƭ���';
comment on column EAM2.AE_REAL_ESTATE.DYLB
  is '�������';
comment on column EAM2.AE_REAL_ESTATE.FDHYYBZ
  is '���غ�һ�Ѱ�֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FWYBZ
  is '�����Ѱ�֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDYBZ
  is '�����Ѱ�֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.CQZNFBB
  is 'û�в�Ȩ֤�ܷ񲹰�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.PDLY
  is '�ж�����';
comment on column EAM2.AE_REAL_ESTATE.FCZSYQR
  is '����֤����Ȩ��';
comment on column EAM2.AE_REAL_ESTATE.FCZH
  is '����֤��';
comment on column EAM2.AE_REAL_ESTATE.FCZTDWJ
  is '����֤����ļ�';
comment on column EAM2.AE_REAL_ESTATE.FWQSYXWJ
  is '����Ȩ���ļ�����Ч�ļ�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FWQSJF
  is '����Ȩ���ļ��Ƿ����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FWQSDY
  is '����Ȩ���ļ��Ƿ��Ѻ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FWQSSS
  is '����Ȩ���ļ��Ƿ�����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDZSYQR
  is '����֤ʹ��Ȩ��';
comment on column EAM2.AE_REAL_ESTATE.TDZH
  is '����֤��';
comment on column EAM2.AE_REAL_ESTATE.TDQSTDWJ
  is '����Ȩ���ļ�����ļ�
����ļ�';
comment on column EAM2.AE_REAL_ESTATE.TDQSYXWJ
  is '����Ȩ���ļ�����Ч�ļ�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDQSSFJF
  is '����Ȩ���ļ��Ƿ����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDQSSFDY
  is '����Ȩ���ļ��Ƿ��Ѻ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDQSSFSS
  is '����Ȩ���ļ��Ƿ�����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.WTD
  is '������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SYZKZC
  is '�ʲ�ʹ��״������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SYZKXZ
  is '�ʲ�ʹ��״������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SYZKKD
  is '�ʲ�ʹ��״���յ�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SYZKJHZY
  is '�ʲ�ʹ��״����������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SYZKDSFZY
  is '�ʲ�ʹ��״����������������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SYZKWCZY
  is '�ʲ�ʹ��״���޳�ռ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.XSYZ
  is '��ʱʹ����';
comment on column EAM2.AE_REAL_ESTATE.XSYDZ
  is '��ʱʹ���ߵ�ַ';
comment on column EAM2.AE_REAL_ESTATE.ZJGCYSY
  is '�ڽ�����״����ʹ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZJGCZC
  is '�ڽ�����״������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZJGCTJ
  is '�ڽ�����״��ͣ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.CQDTXCRQ
  is '���ڴ�̯�����γ�����';
comment on column EAM2.AE_REAL_ESTATE.CQDTYSFSE
  is '���ڴ�̯����ԭʼ������';
comment on column EAM2.AE_REAL_ESTATE.CQDTYJTXYF
  is '���ڴ�̯����Ԥ��̯������';
comment on column EAM2.AE_REAL_ESTATE.CQDTSCSYYS
  is '���ڴ�̯�����д���������';
comment on column EAM2.AE_REAL_ESTATE.QKSM
  is '���ס���Ѻ�����ϡ��޳�ռ�����˵��';
comment on column EAM2.AE_REAL_ESTATE.ZFFLTJ
  is '��������ͳ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FDFLTJ
  is '���ط���ͳ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZYRFDDZ
  is '�����˷�����ַ';
comment on column EAM2.AE_REAL_ESTATE.ZYMJ
  is '�������(ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.SFYZLHT
  is '�Ƿ������޺�ͬ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZLHTXH
  is '���޺�ͬ���';
comment on column EAM2.AE_REAL_ESTATE.BFZL
  is '��������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZLHTQSRQ
  is '���޺�ͬ��ʼ����';
comment on column EAM2.AE_REAL_ESTATE.ZLQ
  is '������(��)';
comment on column EAM2.AE_REAL_ESTATE.YZJJG
  is '�����۸�(Ԫ/��/ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.ZJJGHWYF
  is '���۸��Ƿ���ҵ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TLFWZJJG
  is '����ͬ�෿�ݡ����ص����۸�(Ԫ/��/ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL1ZJ
  is '�����1���(Ԫ/��/ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL1NAME
  is '�����1��������';
comment on column EAM2.AE_REAL_ESTATE.ZJAL2ZJ
  is '�����2���(Ԫ/��/ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL2NAME
  is '�����2��������';
comment on column EAM2.AE_REAL_ESTATE.ZJAL3ZJ
  is '�����3���(Ԫ/��/ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL3NAME
  is '�����3��������';
comment on column EAM2.AE_REAL_ESTATE.NPJZJ
  is '��ƽ�����(Ԫ/��)';
comment on column EAM2.AE_REAL_ESTATE.ZJSYL
  is '���������(�����/�ʲ�����ԭֵ)';
comment on column EAM2.AE_REAL_ESTATE.ZJSFAQZF
  is '����Ƿ���֧��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SFPY
  is '��ӯ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.PYYY
  is '��ӯԭ��';
comment on column EAM2.AE_REAL_ESTATE.SFPK
  is '�̿�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.PKYY
  is '�̿�ԭ��';
comment on column EAM2.AE_REAL_ESTATE.TYBS
  is '���۲�ʵ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TYBSYY
  is '���۲�ʵԭ��';
comment on column EAM2.AE_REAL_ESTATE.YCZ
  is '�Ѵ���(��/��)';
comment on column EAM2.AE_REAL_ESTATE.JSGT
  is '��ʣ��̯(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZXF
  is 'װ�޷�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FCQSYQFCTD
  is '�ǳ���ʹ��Ȩ�ķ���������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FDDZCXZZCQT
  is '�ǹ̶��ʲ������ʲ�����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.BGYY
  is '�칫Ӫҵ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.SUSHE
  is '����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FWYTQT
  is '������;����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDGHYT
  is '���ع滮��;';
comment on column EAM2.AE_REAL_ESTATE.TDSJYT
  is '����ʵ����;';
comment on column EAM2.AE_REAL_ESTATE.CZSJ
  is '����ʱ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.CZDYZMYZ
  is '�ʲ����õ��������ֵԭֵ';
comment on column EAM2.AE_REAL_ESTATE.CZDYZMJZ
  is '�ʲ����õ��������ֵ����';
comment on column EAM2.AE_REAL_ESTATE.CZHT
  is '���ú�ͬ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.HTBH
  is '��ͬ���';
comment on column EAM2.AE_REAL_ESTATE.CZSR
  is '��������';
comment on column EAM2.AE_REAL_ESTATE.CZFY
  is '���÷���';
comment on column EAM2.AE_REAL_ESTATE.CZSY
  is '��������';
comment on column EAM2.AE_REAL_ESTATE.CSHSFRZ
  is '���ú��Ƿ�ʱ����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.YCZWRZYY
  is '�Ѵ���δ���˵�ԭ��';
comment on column EAM2.AE_REAL_ESTATE.FCS
  is '����˰(Ԫ/��)';
comment on column EAM2.AE_REAL_ESTATE.CZTDSYS
  is '��������ʹ��˰(Ԫ/��)';
comment on column EAM2.AE_REAL_ESTATE.QTFYMC
  is '������������';
comment on column EAM2.AE_REAL_ESTATE.QTFYJE
  is '�������ý��(Ԫ/��)';
comment on column EAM2.AE_REAL_ESTATE.JZRSF
  is '��ס�����';
comment on column EAM2.AE_REAL_ESTATE.SFJZJ
  is '�Ƿ����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZJSQF
  is '�����ȡ��';
comment on column EAM2.AE_REAL_ESTATE.SFYFCZ
  is '�Ƿ��з���֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FCZSYR
  is '����֤������';
comment on column EAM2.AE_REAL_ESTATE.NFGH
  is '�ܷ����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.BNGHYY
  is '���ܹ���ԭ��';
comment on column EAM2.AE_REAL_ESTATE.GHTDCRJ
  is '����Ӧ�������س��ý�';
comment on column EAM2.AE_REAL_ESTATE.GHGGWXJJ
  is '����Ӧ����Ƿ�ɹ���ά�޻�����';
comment on column EAM2.AE_REAL_ESTATE.GHWYGLF
  is '����Ӧ������ҵ�����';
comment on column EAM2.AE_REAL_ESTATE.GHQTQJFMC
  is '����Ӧ��������Ƿ�ɷ�������';
comment on column EAM2.AE_REAL_ESTATE.GHQTQJFJE
  is '����Ӧ��������Ƿ�ɷ��ý��';
comment on column EAM2.AE_REAL_ESTATE.GHYJNFYHJ
  is '����Ӧ���ɷ��úϼ�';
comment on column EAM2.AE_REAL_ESTATE.GMYX
  is '��������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.GMFS
  is '����ʽ';
comment on column EAM2.AE_REAL_ESTATE.YXGMJYSCBL
  is '����������м۱���%';
comment on column EAM2.AE_REAL_ESTATE.DDZFZC
  is '����ס������';
comment on column EAM2.AE_REAL_ESTATE.SSCZJY
  is '���ᴦ�ý���';
comment on column EAM2.AE_REAL_ESTATE.ZXDCKD
  is 'ר�����Ŀյ�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZTZZC
  is '��Ͷ���ʲ�(��/��)';
comment on column EAM2.AE_REAL_ESTATE.JCRQ
  is '��������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.FWJIEGOU
  is '�ṹ';
comment on column EAM2.AE_REAL_ESTATE.FWYG
  is '�ܸ�(��)';
comment on column EAM2.AE_REAL_ESTATE.FWBZCG
  is '��׼���(��)';
comment on column EAM2.AE_REAL_ESTATE.FWZCS
  is '�ܲ���';
comment on column EAM2.AE_REAL_ESTATE.FWZLDJC
  is '�����ڵڼ���';
comment on column EAM2.AE_REAL_ESTATE.FWFJH
  is '�����';
comment on column EAM2.AE_REAL_ESTATE.JZMJ
  is '�������(M2)';
comment on column EAM2.AE_REAL_ESTATE.HSHJZMJ
  is '��ʵ�����(ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.FWCBDJ
  is '�ɱ�����(Ԫ/M2)';
comment on column EAM2.AE_REAL_ESTATE.JIEGOU
  is '�ṹ
�ṹ';
comment on column EAM2.AE_REAL_ESTATE.GGCC
  is '���ߴ�';
comment on column EAM2.AE_REAL_ESTATE.JLDW
  is '������λ';
comment on column EAM2.AE_REAL_ESTATE.SHULINAG
  is '����';
comment on column EAM2.AE_REAL_ESTATE.CBDJ
  is '�ɱ�����';
comment on column EAM2.AE_REAL_ESTATE.JCSJ
  is '����ʱ��(��/��)';
comment on column EAM2.AE_REAL_ESTATE.YDXZSFCR
  is '�õ����ʳ���(��/��)';
comment on column EAM2.AE_REAL_ESTATE.YDXZSFHB
  is '�õ����ʻ���(��/��)';
comment on column EAM2.AE_REAL_ESTATE.YDXZQT
  is '�õ���������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDQDRQ
  is '����ȡ������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TDZYNX
  is '����׼������';
comment on column EAM2.AE_REAL_ESTATE.TDSYSYNX
  is '����ʣ��ʹ������';
comment on column EAM2.AE_REAL_ESTATE.TDKFCD
  is '���ؿ����̶�';
comment on column EAM2.AE_REAL_ESTATE.TDMJ
  is '�������(ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.TDHSHMJ
  is '���غ�ʵ�����(ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.TJGCSJYT
  is '�������������;';
comment on column EAM2.AE_REAL_ESTATE.TJGCJG
  is '�������̽ṹ';
comment on column EAM2.AE_REAL_ESTATE.TJGCCS
  is '�������̲���';
comment on column EAM2.AE_REAL_ESTATE.TJGCJZMJ
  is '�������̽������(ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.TJGCKGRQ
  is '�������̿�������(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TJGCYJWGRQ
  is '��������Ԥ���깤����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TJGCXXJD
  is '���������������(%)';
comment on column EAM2.AE_REAL_ESTATE.TJGCFKBL
  is '�������̸������(%)';
comment on column EAM2.AE_REAL_ESTATE.GJGCGSS
  is '�������̸�����(Ԫ)';
comment on column EAM2.AE_REAL_ESTATE.TJGCTDCRHT
  is '�����������س��ú�ͬ(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TJGCYDXK
  is '�������̽����õ����֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TJGCGHXK
  is '�������̽����滮���֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TJGCKGXK
  is '�������̽����������֤(��/��)';
comment on column EAM2.AE_REAL_ESTATE.TJGCJSFS
  is '�������̽��㷽ʽ';
comment on column EAM2.AE_REAL_ESTATE.ZMJZYZ
  is '�����ֵԭֵ';
comment on column EAM2.AE_REAL_ESTATE.ZMJZJZ
  is '�����ֵ��ֵ';
comment on column EAM2.AE_REAL_ESTATE.ZMJZJZZB
  is '�����ֵ��ֵ׼��';
comment on column EAM2.AE_REAL_ESTATE.ZMJZJE
  is '�����ֵ����';
comment on column EAM2.AE_REAL_ESTATE.CFHZMJZYZ
  is '��ֺ������ֵԭֵ';
comment on column EAM2.AE_REAL_ESTATE.CFHZMJZJZ
  is '��ֺ������ֵ��ֵ';
comment on column EAM2.AE_REAL_ESTATE.CFHZMJZJZZB
  is '��ֺ������ֵ��ֵ׼��';
comment on column EAM2.AE_REAL_ESTATE.ZFHZMJZJE
  is '��ֺ������ֵ����';
comment on column EAM2.AE_REAL_ESTATE.PGFF
  is '��������';
comment on column EAM2.AE_REAL_ESTATE.SCFWQCQJZYZ
  is '�г�����ȫ��Ȩ��ֵԭֵ';
comment on column EAM2.AE_REAL_ESTATE.SCFWQCQJZCXL
  is '�г�����ȫ��Ȩ��ֵ������%';
comment on column EAM2.AE_REAL_ESTATE.SCFWQCQJZJZ
  is '�г�����ȫ��Ȩ��ֵ��ֵ';
comment on column EAM2.AE_REAL_ESTATE.XCZKHBD
  is 'Ȩ��覴��ۿ�%(��Ҫ�۳��ı���)������';
comment on column EAM2.AE_REAL_ESTATE.XCZKWTDZ
  is 'Ȩ��覴��ۿ�%(��Ҫ�۳��ı���)������֤';
comment on column EAM2.AE_REAL_ESTATE.XCZKWFCZ
  is 'Ȩ��覴��ۿ�%(��Ҫ�۳��ı���)�޷���֤';
comment on column EAM2.AE_REAL_ESTATE.XCZKCZJF
  is 'Ȩ��覴��ۿ�%(��Ҫ�۳��ı���)���ھ���';
comment on column EAM2.AE_REAL_ESTATE.XCZKQT
  is 'Ȩ��覴��ۿ�%(��Ҫ�۳��ı���)����';
comment on column EAM2.AE_REAL_ESTATE.DXZRZK
  is '������ֵ����ת���ۿ�%';
comment on column EAM2.AE_REAL_ESTATE.QJSFJE
  is '������ֵǷ��˰�ѽ��(�������س��ý�)';
comment on column EAM2.AE_REAL_ESTATE.PGJZYZ
  is '������ֵԭֵ';
comment on column EAM2.AE_REAL_ESTATE.PGJZCXL
  is '������ֵ������%';
comment on column EAM2.AE_REAL_ESTATE.PGJZJZ
  is '������ֵ��ֵ';
comment on column EAM2.AE_REAL_ESTATE.JZZB
  is '��ֵ׼��';
comment on column EAM2.AE_REAL_ESTATE.ZZL
  is '��ֵ��%';
comment on column EAM2.AE_REAL_ESTATE.PGDJ
  is '��������(Ԫ/ƽ����)';
comment on column EAM2.AE_REAL_ESTATE.SFXPG
  is '�Ƿ���Ҫ����(��/��)';
comment on column EAM2.AE_REAL_ESTATE.ZCGLJY
  is '�ʲ�������';
comment on column EAM2.AE_REAL_ESTATE.ZJCZYY
  is '������õ�ԭ��';
comment on column EAM2.AE_REAL_ESTATE.YCZZAYY
  is '�д����ϰ���ԭ��';
comment on column EAM2.AE_REAL_ESTATE.BEIZHU
  is '��ע';
alter table EAM2.AE_REAL_ESTATE
  add constraint PK_AE_REAL_ESTATE primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AE_VEHICLE
prompt =========================
prompt
create table EAM2.AE_VEHICLE
(
  ID        VARCHAR2(32) not null,
  LRSJ      DATE,
  ZC_ID     VARCHAR2(32),
  KPBH      VARCHAR2(30),
  SHULIANG  NUMBER,
  SFZC      VARCHAR2(20),
  SFXZ      VARCHAR2(20),
  SFTT      VARCHAR2(20),
  SFDBF     VARCHAR2(20),
  JHZY      VARCHAR2(20),
  QTDSFZY   VARCHAR2(20),
  WCZY      VARCHAR2(20),
  XSSYZ     VARCHAR2(200),
  XSSYZDZ   VARCHAR2(200),
  WCZYQKSM  VARCHAR2(2000),
  SFPY      VARCHAR2(20),
  PYYY      VARCHAR2(20),
  SFPK      VARCHAR2(20),
  PKYY      VARCHAR2(2000),
  SFTYBS    VARCHAR2(20),
  TYBSYY    VARCHAR2(2000),
  SFYCZ     VARCHAR2(20),
  ZYRFDDZ   VARCHAR2(200),
  SFYZLHT   VARCHAR2(20),
  ZLHTXH    VARCHAR2(200),
  ZLHTQSRQ  DATE,
  ZLQ       NUMBER,
  YZJJG     NUMBER(20,5),
  CZSJ      VARCHAR2(100),
  YUANZHI   NUMBER(20,5),
  JINGE     NUMBER(20,5),
  CZHT      VARCHAR2(20),
  HTBH      VARCHAR2(200),
  CZSR      NUMBER(20,5),
  CZFY      NUMBER(20,5),
  CZSY      NUMBER(20,5),
  CZHSFJSRZ VARCHAR2(20),
  WRZYY     VARCHAR2(2000),
  SFJF      VARCHAR2(20),
  SFDY      VARCHAR2(20),
  SFSS      VARCHAR2(20),
  QIJIAN    VARCHAR2(200),
  JINE      VARCHAR2(100),
  GZRQ      VARCHAR2(100),
  QYRQ      VARCHAR2(100),
  YXSLC     VARCHAR2(200),
  ZMYZ      NUMBER(20,5),
  ZMJZ      NUMBER(20,5),
  JZZB      NUMBER(20,5),
  ZMJE      NUMBER(20,5),
  ZCGLJY    VARCHAR2(2000),
  BEIZHU    VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.AE_VEHICLE
  is '�����˲�������Ϣ��2010��AE_Vehicle';
comment on column EAM2.AE_VEHICLE.LRSJ
  is '¼��ʱ��';
comment on column EAM2.AE_VEHICLE.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.AE_VEHICLE.KPBH
  is '��Ƭ���';
comment on column EAM2.AE_VEHICLE.SHULIANG
  is '����';
comment on column EAM2.AE_VEHICLE.SFZC
  is '����(��/��)';
comment on column EAM2.AE_VEHICLE.SFXZ
  is '����(��/��)';
comment on column EAM2.AE_VEHICLE.SFTT
  is '��̭(��/��)';
comment on column EAM2.AE_VEHICLE.SFDBF
  is '������(��/��)';
comment on column EAM2.AE_VEHICLE.JHZY
  is '��������(��/��)';
comment on column EAM2.AE_VEHICLE.QTDSFZY
  is '��������������(��/��)';
comment on column EAM2.AE_VEHICLE.WCZY
  is '�޳�ռ��(��/��)';
comment on column EAM2.AE_VEHICLE.XSSYZ
  is '��ʱʹ����

��ʱʹ����';
comment on column EAM2.AE_VEHICLE.XSSYZDZ
  is '��ʱʹ���ߵ�ַ';
comment on column EAM2.AE_VEHICLE.WCZYQKSM
  is '���ס���Ѻ�����ϡ��޳�ռ�����˵��';
comment on column EAM2.AE_VEHICLE.SFPY
  is '��ӯ(��/��)';
comment on column EAM2.AE_VEHICLE.PYYY
  is '��ӯԭ��';
comment on column EAM2.AE_VEHICLE.SFPK
  is '�̿�(��/��)';
comment on column EAM2.AE_VEHICLE.PKYY
  is '�̿�ԭ��';
comment on column EAM2.AE_VEHICLE.SFTYBS
  is '���۲�ʵ(��/��)';
comment on column EAM2.AE_VEHICLE.TYBSYY
  is '���۲�ʵԭ��';
comment on column EAM2.AE_VEHICLE.SFYCZ
  is '�Ѵ���(��/��)';
comment on column EAM2.AE_VEHICLE.ZYRFDDZ
  is '�����˷�����ַ';
comment on column EAM2.AE_VEHICLE.SFYZLHT
  is '�Ƿ������޺�ͬ(��/��)';
comment on column EAM2.AE_VEHICLE.ZLHTXH
  is '���޺�ͬ���';
comment on column EAM2.AE_VEHICLE.ZLHTQSRQ
  is '���޺�ͬ��ʼ����';
comment on column EAM2.AE_VEHICLE.ZLQ
  is '������(��)';
comment on column EAM2.AE_VEHICLE.YZJJG
  is '�����۸�(Ԫ/��)';
comment on column EAM2.AE_VEHICLE.CZSJ
  is '����ʱ��';
comment on column EAM2.AE_VEHICLE.YUANZHI
  is 'ԭֵ���ʲ����õ��������ֵ��';
comment on column EAM2.AE_VEHICLE.JINGE
  is '����ʲ����õ��������ֵ��';
comment on column EAM2.AE_VEHICLE.CZHT
  is '���ú�ͬ(��/��)';
comment on column EAM2.AE_VEHICLE.HTBH
  is '��ͬ���';
comment on column EAM2.AE_VEHICLE.CZSR
  is '��������';
comment on column EAM2.AE_VEHICLE.CZFY
  is '���÷���';
comment on column EAM2.AE_VEHICLE.CZSY
  is '��������';
comment on column EAM2.AE_VEHICLE.CZHSFJSRZ
  is '���ú��Ƿ�ʱ����(��/��)';
comment on column EAM2.AE_VEHICLE.WRZYY
  is '�Ѵ���δ���˵�ԭ��';
comment on column EAM2.AE_VEHICLE.SFJF
  is '�Ƿ����(��/��)';
comment on column EAM2.AE_VEHICLE.SFDY
  is '�Ƿ��Ѻ(��/��)';
comment on column EAM2.AE_VEHICLE.SFSS
  is '�Ƿ�����(��/��)';
comment on column EAM2.AE_VEHICLE.QIJIAN
  is '�ڼ�';
comment on column EAM2.AE_VEHICLE.JINE
  is '���';
comment on column EAM2.AE_VEHICLE.GZRQ
  is '��������';
comment on column EAM2.AE_VEHICLE.QYRQ
  is '��������';
comment on column EAM2.AE_VEHICLE.YXSLC
  is '����ʻ���(����)';
comment on column EAM2.AE_VEHICLE.ZMYZ
  is 'ԭֵ�������ֵ��';
comment on column EAM2.AE_VEHICLE.ZMJZ
  is '��ֵ�������ֵ��';
comment on column EAM2.AE_VEHICLE.JZZB
  is '��ֵ׼���������ֵ��';
comment on column EAM2.AE_VEHICLE.ZMJE
  is '��������ֵ��';
comment on column EAM2.AE_VEHICLE.ZCGLJY
  is '�ʲ�������';
comment on column EAM2.AE_VEHICLE.BEIZHU
  is '��ע';
alter table EAM2.AE_VEHICLE
  add constraint PK_AE_VEHICLE primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ASSET_CHANGE_LOG
prompt ===============================
prompt
create table EAM2.ASSET_CHANGE_LOG
(
  ID           VARCHAR2(32) not null,
  PERSON_ID    VARCHAR2(32),
  PERSON_NAME  VARCHAR2(300),
  UPDATEDATE   DATE,
  UPDATETYPE   VARCHAR2(50),
  UPOBJ_ID     VARCHAR2(32),
  UPOBJCODE    VARCHAR2(300),
  UPSHEET      VARCHAR2(300),
  UPPROPER     VARCHAR2(300),
  UPBEFOVALUE  VARCHAR2(2000),
  UPAFTERVALUE VARCHAR2(2000),
  SUBSYS       VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ASSET_CHANGE_LOG.PERSON_ID
  is '�޸���ID';
comment on column EAM2.ASSET_CHANGE_LOG.PERSON_NAME
  is '�޸�������';
comment on column EAM2.ASSET_CHANGE_LOG.UPDATEDATE
  is '�޸�ʱ��';
comment on column EAM2.ASSET_CHANGE_LOG.UPDATETYPE
  is '�޸����� �������޸�';
comment on column EAM2.ASSET_CHANGE_LOG.UPOBJ_ID
  is '�޸Ķ���ID';
comment on column EAM2.ASSET_CHANGE_LOG.UPOBJCODE
  is '�޸Ķ�����';
comment on column EAM2.ASSET_CHANGE_LOG.UPSHEET
  is '�޸�ҳǩ';
comment on column EAM2.ASSET_CHANGE_LOG.UPPROPER
  is '�޸�����';
comment on column EAM2.ASSET_CHANGE_LOG.UPBEFOVALUE
  is '�޸�ǰֵ';
comment on column EAM2.ASSET_CHANGE_LOG.UPAFTERVALUE
  is '�޸ĺ�ֵ';
comment on column EAM2.ASSET_CHANGE_LOG.SUBSYS
  is '������ϵͳ';
alter table EAM2.ASSET_CHANGE_LOG
  add constraint PK_ASSET_CHANGE_LOG primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BIZ_BACK_CASH_INFO
prompt =================================
prompt
create table EAM2.BIZ_BACK_CASH_INFO
(
  ID       VARCHAR2(32) not null,
  BIAOTI   VARCHAR2(200),
  BLBM     VARCHAR2(300),
  BIANHAO  VARCHAR2(300),
  JHCD     VARCHAR2(10),
  NGRBH    VARCHAR2(100),
  NGRMC    VARCHAR2(100),
  NGRQ     DATE,
  NGBMBH   VARCHAR2(100),
  NGBMMC   VARCHAR2(100),
  LXDH     VARCHAR2(100),
  HKDBH    VARCHAR2(32),
  HKR      VARCHAR2(100),
  DZRQ     DATE,
  JZDH     VARCHAR2(100),
  DZJE     NUMBER(16,2),
  ZJLY     VARCHAR2(1000),
  BEIZHU   VARCHAR2(1000),
  HKDZT    VARCHAR2(10),
  BZ1      VARCHAR2(1000),
  QRBMBH   VARCHAR2(50),
  QRBMMC   VARCHAR2(1000),
  YWLX     VARCHAR2(100),
  HKQRDH   VARCHAR2(100),
  HQYWQRSJ DATE,
  BZ2      VARCHAR2(1000),
  BLBMBH   VARCHAR2(100),
  FBLSJ    DATE,
  LCMC     VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.BIZ_BACK_CASH_INFO
  is 'ҵ��ؿ���Ϣ��';
comment on column EAM2.BIZ_BACK_CASH_INFO.BLBM
  is '�ؿ�ȷ�ϵ�ҵ����';
comment on column EAM2.BIZ_BACK_CASH_INFO.DZJE
  is '���˽��';
comment on column EAM2.BIZ_BACK_CASH_INFO.BLBMBH
  is '�����ű��';
comment on column EAM2.BIZ_BACK_CASH_INFO.FBLSJ
  is '������ʱ��';
comment on column EAM2.BIZ_BACK_CASH_INFO.LCMC
  is '��������';
alter table EAM2.BIZ_BACK_CASH_INFO
  add constraint PK_BIZ_BACK_CASH_INFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BIZ_BACK_CONFIRM_BODY
prompt ====================================
prompt
create table EAM2.BIZ_BACK_CONFIRM_BODY
(
  ID        VARCHAR2(32) not null,
  HEADID    VARCHAR2(32),
  BZ0       VARCHAR2(100),
  CZ_XMID   VARCHAR2(32),
  CZ_XMBH   VARCHAR2(50),
  CZ_XMMC   VARCHAR2(100),
  CZ_SFWB   VARCHAR2(10),
  CZ_CZSR   NUMBER(16,2),
  CZ_YKCZFY NUMBER(16,2),
  CZ_FYCPJE NUMBER(16,2),
  CZ_CPQR   NUMBER(16,2),
  CZ_SFJS   VARCHAR2(10),
  CZ_BZ     VARCHAR2(1000),
  ZQ_ID     VARCHAR2(32),
  ZQ_MC     VARCHAR2(128),
  ZQ_HSZJXZ NUMBER(16,2),
  ZQ_DYYZ   NUMBER(16,2),
  ZQ_HXSR   VARCHAR2(10),
  ZQ_HXFY   VARCHAR2(10),
  ZQ_HSWB   VARCHAR2(10),
  ZA_LXHSJE NUMBER(16,2),
  ZQ_LXQJ   VARCHAR2(400),
  ZQ_BZ     VARCHAR2(1000),
  QT_HSXZ   VARCHAR2(1000),
  QT_BZ     VARCHAR2(1000),
  GQ_ID     VARCHAR2(32),
  GQ_STBH   VARCHAR2(300),
  GQ_STMC   VARCHAR2(500),
  GQ_SF     VARCHAR2(32),
  GQ_HKXZ   VARCHAR2(100),
  GQ_HSXJJE NUMBER(16,2),
  GQ_QLZT   VARCHAR2(32),
  GQ_BZ     VARCHAR2(1000),
  QS_PC     VARCHAR2(300),
  YSYFZJE   NUMBER(20,2),
  TZZJE     NUMBER(20,2),
  THYSYFZJE NUMBER(20,2),
  SSZJE     NUMBER(20,2),
  SSTZZJE   NUMBER(20,2),
  THSSZJE   NUMBER(20,2),
  QRDLX     VARCHAR2(100),
  SFYBC     VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.HEADID
  is '��Ӧ��ͷID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.BZ0
  is '��ע0_____________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_XMID
  is 'CZ_XM_XX ��ID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_XMBH
  is '������Ŀ���';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_XMMC
  is '������Ŀ����';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_SFWB
  is '�Ƿ������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_CZSR
  is '�����У���������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_YKCZFY
  is '�ѿ۳����÷���';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_FYCPJE
  is '���÷��ó��������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_CPQR
  is '���������ַ����Ƿ�ȷ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_SFJS
  is '����˰���Ƿ��ѽ���';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_BZ
  is '��ע1_____________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_ID
  is 'ծȯID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_MC
  is 'ծȯ����';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HSZJXZ
  is 'ծȯ������տ���';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_DYYZ
  is '��Ӧ��ԭֵ���';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HXSR
  is '�Ƿ��к�������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HXFY
  is '�Ƿ��к�������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HSWB
  is '�Ƿ�������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZA_LXHSJE
  is 'ծȯ��Ϣ������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_LXQJ
  is '��Ϣ�����ڼ�';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_BZ
  is '��ע2______________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QT_HSXZ
  is '����ҵ��_��������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QT_BZ
  is '����ҵ��ע';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_ID
  is 'ʵ��ID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_STBH
  is 'ʵ����';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_STMC
  is 'ʵ������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_SF
  is 'ʵ��ʡ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_HKXZ
  is '�ؿ�����';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_HSXJJE
  is '�����ֽ���';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_QLZT
  is 'ʵ������״̬  CODE��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_BZ
  is '��ע4______________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QS_PC
  is '��������';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.YSYFZJE
  is 'Ӧ��/Ӧ���ܽ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.TZZJE
  is '�����ܽ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.THYSYFZJE
  is '������Ӧ��/Ӧ���ܽ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.SSZJE
  is 'ʵ���ܽ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.SSTZZJE
  is 'ʵ�յ����ܽ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.THSSZJE
  is '������ʵ���ܽ��';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QRDLX
  is 'ȷ�ϵ�����';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.SFYBC
  is '�Ƿ񱣴�';
alter table EAM2.BIZ_BACK_CONFIRM_BODY
  add constraint PK_BIZ_BACK_CONFIRM_BODY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BIZ_BACK_CONFIRM_HEAD
prompt ====================================
prompt
create table EAM2.BIZ_BACK_CONFIRM_HEAD
(
  ID      VARCHAR2(32) not null,
  CASHID  VARCHAR2(32),
  QRBMBH  VARCHAR2(50),
  QRBMMC  VARCHAR2(100),
  QRRBH   VARCHAR2(50),
  QRRMC   VARCHAR2(100),
  BMFZRBH VARCHAR2(50),
  BMFZRMC VARCHAR2(100),
  ISBMHK  VARCHAR2(10),
  QRDBH   VARCHAR2(32),
  QRDLX   VARCHAR2(100),
  QRRQ    DATE,
  BZ0     VARCHAR2(1000),
  SFZZHK  VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.BIZ_BACK_CONFIRM_HEAD
  is '������ȷ�ϵ��ı�ͷ';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.CASHID
  is '��Ӧ�ؿ���Ϣ��ID';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRBMBH
  is 'ȷ�ϲ��ű��';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRBMMC
  is 'ȷ�ϲ�������';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRRBH
  is 'ȷ���˱��';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRRMC
  is 'ȷ��������';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.BMFZRBH
  is '���Ÿ����˱��';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.BMFZRMC
  is '���Ÿ���������';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.ISBMHK
  is '�Ƿ񱾲��Żؿ1��0�� ����ǵĻ���Ҫ��д�������Ϣ';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRDBH
  is 'ȷ�ϵ����';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRDLX
  is ' ȷ�ϵ�����  CODE��';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRRQ
  is 'ȷ������';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.BZ0
  is '�ڻؿ�ȷ�Ͻ׶εı�ע';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.SFZZHK
  is '�Ƿ�Ϊ����ȷ�ϻؿ�';
alter table EAM2.BIZ_BACK_CONFIRM_HEAD
  add constraint PK_BIZ_BACK_CONFIRM_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDHISTORY
prompt ==========================
prompt
create table EAM2.CARDHISTORY
(
  CARDCODE VARCHAR2(100),
  CONTROL  VARCHAR2(10),
  RESULT   VARCHAR2(100),
  ID       NUMBER not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.CARDHISTORY
  add constraint PK_CARDID primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table CARDINFO
prompt =======================
prompt
create table EAM2.CARDINFO
(
  ID                NUMBER not null,
  ZCID              VARCHAR2(32),
  BWID              NUMBER,
  CARDCODE          VARCHAR2(46),
  ZCNAME            VARCHAR2(450),
  SAVEADSRESS       VARCHAR2(4000),
  TYPECODE          VARCHAR2(450),
  GGXH              VARCHAR2(900),
  ADDTYPE           VARCHAR2(460),
  ZJTYPE            VARCHAR2(460),
  IFJC              VARCHAR2(460),
  GLBM              VARCHAR2(450),
  USEPARTMENT       VARCHAR2(450),
  ZJCDBM            VARCHAR2(450),
  USESTATUS         VARCHAR2(460),
  ZCSTATUS          VARCHAR2(460),
  MAINYT            VARCHAR2(4000),
  KSDATE            DATE,
  QYDATE            VARCHAR2(500),
  YBYZ              NUMBER(20,2),
  YZJE              NUMBER(20,2),
  YZJL              NUMBER(20,2),
  LJZJ              NUMBER(20,2),
  JCZ               NUMBER(20,6),
  JCZL              NUMBER(20,4),
  JVALUE            NUMBER(20,2),
  SYYX              NUMBER,
  YJTYF             NUMBER,
  JZZB              NUMBER(20,2),
  JEVALUE           NUMBER(20,2),
  OLDCODE           VARCHAR2(460),
  PGQYZ             VARCHAR2(760),
  PGQLJZJ           VARCHAR2(760),
  BZSM              VARCHAR2(4000),
  FDJHM             VARCHAR2(460),
  CLPXH             VARCHAR2(450),
  TXFF              VARCHAR2(450),
  TXCDBM            VARCHAR2(450),
  TXNX              NUMBER,
  YTXYF             NUMBER,
  YTXE              NUMBER(20,2),
  MONTXE            NUMBER(20,2),
  WTXE              NUMBER(20,2),
  QSZM              VARCHAR2(4000),
  TDZHM             VARCHAR2(450),
  QZSYZ             VARCHAR2(460),
  YSQDJZ            VARCHAR2(760),
  OLDYEARYZ         VARCHAR2(760),
  OLDYEARJZ         VARCHAR2(760),
  OLDJZ             VARCHAR2(760),
  ZYZT              VARCHAR2(460),
  CUPXH             VARCHAR2(760),
  WZYP              VARCHAR2(760),
  NZYP              VARCHAR2(760),
  XSQ               VARCHAR2(760),
  QPXH              VARCHAR2(760),
  NSAVE             VARCHAR2(760),
  SBXLH             VARCHAR2(760),
  GYS               VARCHAR2(760),
  HTHM              VARCHAR2(760),
  BXQ               VARCHAR2(760),
  SMBXQ             VARCHAR2(760),
  SXBXQ             VARCHAR2(760),
  YXTLRY            VARCHAR2(460),
  USERNAME          VARCHAR2(450),
  ZHCFZR            VARCHAR2(460),
  GDZCGLY           VARCHAR2(460),
  ZXRQ              DATE,
  FDZHM             VARCHAR2(300),
  YWDYTD            VARCHAR2(460),
  DYTDZH            VARCHAR2(760),
  DYTDKP            VARCHAR2(460),
  JZMJ              VARCHAR2(760),
  ZDMJ              VARCHAR2(760),
  ZXMJ              VARCHAR2(760),
  ZYZK              VARCHAR2(460),
  RKDH              VARCHAR2(460),
  PARENTID          NUMBER,
  CHILDID           VARCHAR2(460),
  STATE             VARCHAR2(460),
  LCTEMPID          NUMBER,
  LRRQ              DATE,
  ATTACHMENTURL     VARCHAR2(450),
  OLDCARDID         VARCHAR2(760),
  CHANGEREASON      VARCHAR2(460),
  BCJT              NUMBER(20,2),
  FIRSTBRANCH       VARCHAR2(16),
  SYNX              NUMBER,
  ERPASSETCODE      VARCHAR2(1500),
  ERPPK             VARCHAR2(1500),
  ASSETSTATE        VARCHAR2(150),
  MEMO_1            VARCHAR2(150),
  DEALMETHOD        VARCHAR2(150),
  USED_PERSON       VARCHAR2(300),
  USED_WORKFLOW_KEY VARCHAR2(500),
  SFZY              VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CARDINFO
  is '��Ƭ��';
comment on column EAM2.CARDINFO.ID
  is 'ID';
comment on column EAM2.CARDINFO.ZCID
  is '�ʲ�ID';
comment on column EAM2.CARDINFO.BWID
  is '����˵��ID';
comment on column EAM2.CARDINFO.CARDCODE
  is '��Ƭ����';
comment on column EAM2.CARDINFO.ZCNAME
  is '��Ƭ����';
comment on column EAM2.CARDINFO.SAVEADSRESS
  is '��ŵص�';
comment on column EAM2.CARDINFO.TYPECODE
  is '������';
comment on column EAM2.CARDINFO.GGXH
  is '����ͺ�';
comment on column EAM2.CARDINFO.ADDTYPE
  is '���ӷ�ʽ';
comment on column EAM2.CARDINFO.ZJTYPE
  is '�۾ɷ���';
comment on column EAM2.CARDINFO.IFJC
  is '�Ƿ�м�';
comment on column EAM2.CARDINFO.GLBM
  is '������';
comment on column EAM2.CARDINFO.USEPARTMENT
  is 'ʹ�ò���';
comment on column EAM2.CARDINFO.ZJCDBM
  is '�۾ɳе�����';
comment on column EAM2.CARDINFO.USESTATUS
  is 'ʹ��״��';
comment on column EAM2.CARDINFO.ZCSTATUS
  is '�ʲ�״̬';
comment on column EAM2.CARDINFO.MAINYT
  is '��Ҫ��;';
comment on column EAM2.CARDINFO.KSDATE
  is '��ʼʹ������';
comment on column EAM2.CARDINFO.QYDATE
  is '��������';
comment on column EAM2.CARDINFO.YBYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.CARDINFO.YZJE
  is '���۾ɶ�';
comment on column EAM2.CARDINFO.YZJL
  is '���۾���';
comment on column EAM2.CARDINFO.LJZJ
  is '�ۼ��۾�';
comment on column EAM2.CARDINFO.JCZ
  is '����ֵ';
comment on column EAM2.CARDINFO.JCZL
  is '����ֵ��';
comment on column EAM2.CARDINFO.JVALUE
  is '��ֵ';
comment on column EAM2.CARDINFO.SYYX
  is 'ʹ������';
comment on column EAM2.CARDINFO.YJTYF
  is '�Ѽ����·�';
comment on column EAM2.CARDINFO.JZZB
  is '��ֵ׼��';
comment on column EAM2.CARDINFO.JEVALUE
  is '����';
comment on column EAM2.CARDINFO.OLDCODE
  is '�ɿ�Ƭ���';
comment on column EAM2.CARDINFO.PGQYZ
  is '����ǰԭֵ';
comment on column EAM2.CARDINFO.PGQLJZJ
  is '����ǰ�ۼ��۾�';
comment on column EAM2.CARDINFO.BZSM
  is '��ע';
comment on column EAM2.CARDINFO.FDJHM
  is '����������';
comment on column EAM2.CARDINFO.CLPXH
  is '�������պ�';
comment on column EAM2.CARDINFO.TXFF
  is '̯������';
comment on column EAM2.CARDINFO.TXCDBM
  is '̯���е�����';
comment on column EAM2.CARDINFO.TXNX
  is '̯������';
comment on column EAM2.CARDINFO.YTXYF
  is '��̯���·�';
comment on column EAM2.CARDINFO.YTXE
  is '��̯����';
comment on column EAM2.CARDINFO.MONTXE
  is '��̯����';
comment on column EAM2.CARDINFO.WTXE
  is 'δ̯����';
comment on column EAM2.CARDINFO.QSZM
  is 'Ȩ��֤��';
comment on column EAM2.CARDINFO.TDZHM
  is '����֤����';
comment on column EAM2.CARDINFO.QZSYZ
  is 'Ȩ֤������';
comment on column EAM2.CARDINFO.YSQDJZ
  is 'ԭʼȡ�ü�ֵ';
comment on column EAM2.CARDINFO.OLDYEARYZ
  is '2004��1��1��ԭֵ';
comment on column EAM2.CARDINFO.OLDYEARJZ
  is '2004��1��1���ۼ��۾�';
comment on column EAM2.CARDINFO.OLDJZ
  is '2004��1��1�վ���';
comment on column EAM2.CARDINFO.ZYZT
  is '����״̬';
comment on column EAM2.CARDINFO.CUPXH
  is 'CUP�ͺ�';
comment on column EAM2.CARDINFO.WZYP
  is '����Ӳ��';
comment on column EAM2.CARDINFO.NZYP
  is '����Ӳ��';
comment on column EAM2.CARDINFO.XSQ
  is '��ʾ��';
comment on column EAM2.CARDINFO.QPXH
  is 'Ӳ���ͺ�';
comment on column EAM2.CARDINFO.NSAVE
  is '�ڴ�';
comment on column EAM2.CARDINFO.SBXLH
  is '�豸���к�';
comment on column EAM2.CARDINFO.GYS
  is '��Ӧ��';
comment on column EAM2.CARDINFO.HTHM
  is '��ͬ����';
comment on column EAM2.CARDINFO.BXQ
  is '������';
comment on column EAM2.CARDINFO.SMBXQ
  is '���ű�����';
comment on column EAM2.CARDINFO.SXBXQ
  is '���ޱ�����';
comment on column EAM2.CARDINFO.YXTLRY
  is 'ԭϵͳ¼����Ա';
comment on column EAM2.CARDINFO.USERNAME
  is 'ʹ����';
comment on column EAM2.CARDINFO.ZHCFZR
  is '�ۺϴ�������';
comment on column EAM2.CARDINFO.GDZCGLY
  is '�̶��ʲ�����Ա';
comment on column EAM2.CARDINFO.ZXRQ
  is 'ע������';
comment on column EAM2.CARDINFO.FDZHM
  is '����֤����';
comment on column EAM2.CARDINFO.YWDYTD
  is '���޶�Ӧ����';
comment on column EAM2.CARDINFO.DYTDZH
  is '��Ӧ����֤��';
comment on column EAM2.CARDINFO.DYTDKP
  is '��Ӧ����ԭ��Ƭ���';
comment on column EAM2.CARDINFO.JZMJ
  is '�������';
comment on column EAM2.CARDINFO.ZDMJ
  is 'ռ�����';
comment on column EAM2.CARDINFO.ZXMJ
  is 'װ�����';
comment on column EAM2.CARDINFO.ZYZK
  is '����״��';
comment on column EAM2.CARDINFO.RKDH
  is '��ⵥ��';
comment on column EAM2.CARDINFO.PARENTID
  is '����ID';
comment on column EAM2.CARDINFO.CHILDID
  is 'С��code����';
comment on column EAM2.CARDINFO.STATE
  is '״̬��ʶλ(01 ����ʹ��״̬ 02 ����״̬ 03 ע��״̬)';
comment on column EAM2.CARDINFO.LCTEMPID
  is '��Ƭ��ʱ��ID';
comment on column EAM2.CARDINFO.LRRQ
  is 'δ֪����';
comment on column EAM2.CARDINFO.ATTACHMENTURL
  is '����ID';
comment on column EAM2.CARDINFO.OLDCARDID
  is '�ɿ�Ƭ���';
comment on column EAM2.CARDINFO.CHANGEREASON
  is '��������ԭ��';
comment on column EAM2.CARDINFO.BCJT
  is '���μ���';
comment on column EAM2.CARDINFO.FIRSTBRANCH
  is 'һ������';
comment on column EAM2.CARDINFO.SYNX
  is 'ʹ������';
comment on column EAM2.CARDINFO.ERPASSETCODE
  is 'erp�ʲ���ʶ';
comment on column EAM2.CARDINFO.ERPPK
  is 'erp��������';
comment on column EAM2.CARDINFO.ASSETSTATE
  is '��Ӫ����״̬--�ʲ�״̬';
comment on column EAM2.CARDINFO.MEMO_1
  is '�������';
comment on column EAM2.CARDINFO.USED_PERSON
  is '����ʹ�øÿ�Ƭ����';
comment on column EAM2.CARDINFO.USED_WORKFLOW_KEY
  is '����ʹ�øÿ�Ƭ������';
comment on column EAM2.CARDINFO.SFZY
  is '�Ƿ�����';
alter table EAM2.CARDINFO
  add constraint PK_CARDINFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.CARDCODE on EAM2.CARDINFO (CARDCODE)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.ZCBASEINFO_ID on EAM2.CARDINFO (ZCID)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO1
prompt ========================
prompt
create table EAM2.CARDINFO1
(
  ID                NUMBER not null,
  ZCID              VARCHAR2(32),
  BWID              NUMBER,
  CARDCODE          VARCHAR2(46),
  ZCNAME            VARCHAR2(450),
  SAVEADSRESS       VARCHAR2(4000),
  TYPECODE          VARCHAR2(450),
  GGXH              VARCHAR2(900),
  ADDTYPE           VARCHAR2(460),
  ZJTYPE            VARCHAR2(460),
  IFJC              VARCHAR2(460),
  GLBM              VARCHAR2(450),
  USEPARTMENT       VARCHAR2(450),
  ZJCDBM            VARCHAR2(450),
  USESTATUS         VARCHAR2(460),
  ZCSTATUS          VARCHAR2(460),
  MAINYT            VARCHAR2(4000),
  KSDATE            DATE,
  QYDATE            VARCHAR2(500),
  YBYZ              NUMBER(20,2),
  YZJE              NUMBER(20,2),
  YZJL              NUMBER(20,2),
  LJZJ              NUMBER(20,2),
  JCZ               NUMBER(20,6),
  JCZL              NUMBER(20,4),
  JVALUE            NUMBER(20,2),
  SYYX              NUMBER,
  YJTYF             NUMBER,
  JZZB              NUMBER(20,2),
  JEVALUE           NUMBER(20,2),
  OLDCODE           VARCHAR2(460),
  PGQYZ             VARCHAR2(760),
  PGQLJZJ           VARCHAR2(760),
  BZSM              VARCHAR2(4000),
  FDJHM             VARCHAR2(460),
  CLPXH             VARCHAR2(450),
  TXFF              VARCHAR2(450),
  TXCDBM            VARCHAR2(450),
  TXNX              NUMBER,
  YTXYF             NUMBER,
  YTXE              NUMBER(20,2),
  MONTXE            NUMBER(20,2),
  WTXE              NUMBER(20,2),
  QSZM              VARCHAR2(4000),
  TDZHM             VARCHAR2(450),
  QZSYZ             VARCHAR2(460),
  YSQDJZ            VARCHAR2(760),
  OLDYEARYZ         VARCHAR2(760),
  OLDYEARJZ         VARCHAR2(760),
  OLDJZ             VARCHAR2(760),
  ZYZT              VARCHAR2(460),
  CUPXH             VARCHAR2(760),
  WZYP              VARCHAR2(760),
  NZYP              VARCHAR2(760),
  XSQ               VARCHAR2(760),
  QPXH              VARCHAR2(760),
  NSAVE             VARCHAR2(760),
  SBXLH             VARCHAR2(760),
  GYS               VARCHAR2(760),
  HTHM              VARCHAR2(760),
  BXQ               VARCHAR2(760),
  SMBXQ             VARCHAR2(760),
  SXBXQ             VARCHAR2(760),
  YXTLRY            VARCHAR2(460),
  USERNAME          VARCHAR2(450),
  ZHCFZR            VARCHAR2(460),
  GDZCGLY           VARCHAR2(460),
  ZXRQ              DATE,
  FDZHM             VARCHAR2(300),
  YWDYTD            VARCHAR2(460),
  DYTDZH            VARCHAR2(760),
  DYTDKP            VARCHAR2(460),
  JZMJ              VARCHAR2(760),
  ZDMJ              VARCHAR2(760),
  ZXMJ              VARCHAR2(760),
  ZYZK              VARCHAR2(460),
  RKDH              VARCHAR2(460),
  PARENTID          NUMBER,
  CHILDID           VARCHAR2(460),
  STATE             VARCHAR2(460),
  LCTEMPID          NUMBER,
  LRRQ              DATE,
  ATTACHMENTURL     VARCHAR2(450),
  OLDCARDID         VARCHAR2(760),
  CHANGEREASON      VARCHAR2(460),
  BCJT              NUMBER(20,2),
  FIRSTBRANCH       VARCHAR2(16),
  SYNX              NUMBER,
  ERPASSETCODE      VARCHAR2(1500),
  ERPPK             VARCHAR2(1500),
  ASSETSTATE        VARCHAR2(150),
  MEMO_1            VARCHAR2(150),
  DEALMETHOD        VARCHAR2(150),
  USED_PERSON       VARCHAR2(300),
  USED_WORKFLOW_KEY VARCHAR2(500),
  SFZY              VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO20140401
prompt ===============================
prompt
create table EAM2.CARDINFO20140401
(
  CARDCODE     VARCHAR2(46),
  ZCNAME       VARCHAR2(450),
  ERPASSETCODE VARCHAR2(1500),
  YBYZ         NUMBER(20,2),
  LJZJ         NUMBER(20,2)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO20140402
prompt ===============================
prompt
create table EAM2.CARDINFO20140402
(
  CARDCODE     VARCHAR2(46),
  ZCNAME       VARCHAR2(450),
  ERPASSETCODE VARCHAR2(1500),
  YBYZ         NUMBER(20,2),
  LJZJ         NUMBER(20,2)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO20140403
prompt ===============================
prompt
create table EAM2.CARDINFO20140403
(
  CARDCODE     VARCHAR2(46),
  ZCNAME       VARCHAR2(450),
  ERPASSETCODE VARCHAR2(1500),
  YBYZ         NUMBER(20,2),
  LJZJ         NUMBER(20,2)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO20140522
prompt ===============================
prompt
create table EAM2.CARDINFO20140522
(
  CARDCODE     VARCHAR2(46),
  ZCNAME       VARCHAR2(450),
  ERPASSETCODE VARCHAR2(1500),
  YBYZ         NUMBER(20,2),
  LJZJ         NUMBER(20,2)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO2014052201
prompt =================================
prompt
create table EAM2.CARDINFO2014052201
(
  CARDCODE     VARCHAR2(46),
  ZCNAME       VARCHAR2(450),
  ERPASSETCODE VARCHAR2(1500),
  YBYZ         NUMBER(20,2),
  LJZJ         NUMBER(20,2)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARDINFO2014052202
prompt =================================
prompt
create table EAM2.CARDINFO2014052202
(
  CARDCODE     VARCHAR2(46),
  ZCNAME       VARCHAR2(450),
  ERPASSETCODE VARCHAR2(1500),
  YBYZ         NUMBER(20,2),
  LJZJ         NUMBER(20,2),
  STATE        VARCHAR2(46)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARD_ASSET_HISTORY
prompt =================================
prompt
create table EAM2.CARD_ASSET_HISTORY
(
  ID        VARCHAR2(32) not null,
  KP_ID     VARCHAR2(32),
  ZC_ID     VARCHAR2(32),
  GJKSRQ    DATE,
  GJJSRQ    DATE,
  DQGJZT    VARCHAR2(10),
  SFWZKP    VARCHAR2(10),
  ZKPSZKSRQ DATE,
  ZKPSZJSRQ DATE,
  SPZT      VARCHAR2(10),
  ZCZSB_ID  VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CARD_ASSET_HISTORY.KP_ID
  is '��ƬID';
comment on column EAM2.CARD_ASSET_HISTORY.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.CARD_ASSET_HISTORY.GJKSRQ
  is '�ҽӿ�ʼ����';
comment on column EAM2.CARD_ASSET_HISTORY.GJJSRQ
  is '�ҽӽ�������';
comment on column EAM2.CARD_ASSET_HISTORY.DQGJZT
  is '0���ҽ���
1����Ǩ��';
comment on column EAM2.CARD_ASSET_HISTORY.SFWZKP
  is '0����
1����';
comment on column EAM2.CARD_ASSET_HISTORY.ZKPSZKSRQ
  is '����Ƭ���ÿ�ʼ����';
comment on column EAM2.CARD_ASSET_HISTORY.ZKPSZJSRQ
  is '����Ƭ���ý�������';
comment on column EAM2.CARD_ASSET_HISTORY.SPZT
  is '0��δ����
1��������
2������ͬ��
3��������ͬ��';
comment on column EAM2.CARD_ASSET_HISTORY.ZCZSB_ID
  is '�ʲ���ʽ��ID';
alter table EAM2.CARD_ASSET_HISTORY
  add constraint PK_CARD_ASSET_HISTORY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CA_SHEAD
prompt =======================
prompt
create table EAM2.CA_SHEAD
(
  ID            NUMBER not null,
  BIAOTI        VARCHAR2(100),
  BIANHAO       VARCHAR2(300),
  JHCD          VARCHAR2(10),
  NGR           NUMBER,
  LXDH          VARCHAR2(300),
  NGRQ          DATE,
  NGBM          NUMBER,
  NGBMMC        VARCHAR2(300),
  ZJFS          VARCHAR2(10),
  ZYKPXZ        VARCHAR2(10),
  KPBLSM        VARCHAR2(4000),
  ERPCLJG       VARCHAR2(100),
  BZ            VARCHAR2(4000),
  BDLX          VARCHAR2(100),
  NGRMC         VARCHAR2(300),
  WFCONFIG_CODE VARCHAR2(100),
  SENDERP       VARCHAR2(10),
  ERPNOTICE     VARCHAR2(3000),
  ISREJECTED    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CA_SHEAD
  is '��Ƭ���ֱ䶯�ı�ͷ�����������CA_CARDTEMP';
comment on column EAM2.CA_SHEAD.ID
  is '��Ƭ���̱�ID,UUID';
comment on column EAM2.CA_SHEAD.BIAOTI
  is '����';
comment on column EAM2.CA_SHEAD.BIANHAO
  is '�����';
comment on column EAM2.CA_SHEAD.JHCD
  is '�����̶�';
comment on column EAM2.CA_SHEAD.NGR
  is '����˱��';
comment on column EAM2.CA_SHEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.CA_SHEAD.NGRQ
  is '������ڸ�ʽYYYYMMDD';
comment on column EAM2.CA_SHEAD.NGBM
  is '��岿�ű��';
comment on column EAM2.CA_SHEAD.NGBMMC
  is '��岿������';
comment on column EAM2.CA_SHEAD.ZJFS
  is '0��ֱ������
1����������';
comment on column EAM2.CA_SHEAD.ZYKPXZ
  is '���ÿ�Ƭ���� 0 �� 1 ��';
comment on column EAM2.CA_SHEAD.KPBLSM
  is '��Ƭ����˵��';
comment on column EAM2.CA_SHEAD.ERPCLJG
  is 'ERP������';
comment on column EAM2.CA_SHEAD.BZ
  is '��ע';
comment on column EAM2.CA_SHEAD.BDLX
  is '0����Ƭ����1����Ƭ����2����Ƭ�޸�3����Ƭ��ֵ4����Ƭ�䶯5����Ƭ�޸�6����Ƭ�ϲ�7����Ƭ���';
comment on column EAM2.CA_SHEAD.NGRMC
  is '���������';
comment on column EAM2.CA_SHEAD.WFCONFIG_CODE
  is '��������Ӧ����ʵ�����';
comment on column EAM2.CA_SHEAD.SENDERP
  is '����ERP';
comment on column EAM2.CA_SHEAD.ERPNOTICE
  is 'ERP���ؽ��';
comment on column EAM2.CA_SHEAD.ISREJECTED
  is '�Ƿ�ܾ�';
alter table EAM2.CA_SHEAD
  add constraint PK_CA_SHEAD1 primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CODE
prompt ===================
prompt
create table EAM2.CODE
(
  ID           VARCHAR2(32) not null,
  CODE_TYPE    VARCHAR2(100),
  CODE_NAME    VARCHAR2(400),
  CODE_KEY     VARCHAR2(20),
  CODE_VALUE   VARCHAR2(1000),
  ORDER_NUMBER NUMBER(8),
  USABLE       CHAR(1),
  CODE_TAG     VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CODE.ID
  is 'ID,UUID�����¼��';
comment on column EAM2.CODE.CODE_TYPE
  is '�������,��ϸ˵����CODE_CATALOG';
comment on column EAM2.CODE.CODE_NAME
  is '��������,��ϸ˵����CODE_CATALOG';
comment on column EAM2.CODE.CODE_KEY
  is '����,���ֻ�Ӣ��';
comment on column EAM2.CODE.CODE_VALUE
  is '����,����';
comment on column EAM2.CODE.ORDER_NUMBER
  is '��ʾʱ��������';
comment on column EAM2.CODE.USABLE
  is '�������1����0������';
comment on column EAM2.CODE.CODE_TAG
  is '�����һ�����TAG�ֶΣ�ϵͳ����';
alter table EAM2.CODE
  add constraint ID primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CODE_CATALOG
prompt ===========================
prompt
create table EAM2.CODE_CATALOG
(
  CODE_TYPE          VARCHAR2(100) not null,
  CODE_NAME          VARCHAR2(400),
  CODE_TYPE_DESC     VARCHAR2(400),
  CODE_USEDFUNCTIONS VARCHAR2(400),
  WRITER             VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.CODE_CATALOG.CODE_TYPE
  is '�������͵ı��';
comment on column EAM2.CODE_CATALOG.CODE_NAME
  is '�������͵�����';
comment on column EAM2.CODE_CATALOG.CODE_TYPE_DESC
  is '�������͵������������京��';
comment on column EAM2.CODE_CATALOG.CODE_USEDFUNCTIONS
  is '����ϵͳ����Щ���幦��Ҫ�õ�������룬ϵͳ�����á�';
comment on column EAM2.CODE_CATALOG.WRITER
  is '��ϵͳ�м�����һ�������Ա����';
alter table EAM2.CODE_CATALOG
  add constraint PK_CODE_CATALOG primary key (CODE_TYPE)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table CODE_GENERATOR_DETAIL
prompt ====================================
prompt
create table EAM2.CODE_GENERATOR_DETAIL
(
  ID             VARCHAR2(36) not null,
  MODEL_ID       VARCHAR2(36),
  GENERATOR_TYPE NUMBER(2),
  MODEL_NAME     VARCHAR2(16),
  RESET_SEQ      NUMBER(8),
  CURRENT_SEQ    NUMBER(8),
  SEQ_FORMAT     VARCHAR2(32),
  LAST_DATE      DATE
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.CODE_GENERATOR_DETAIL
  add constraint CODE_GENERATOR_DETAIL_PK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CODE_GENERATOR_LOG
prompt =================================
prompt
create table EAM2.CODE_GENERATOR_LOG
(
  ID             VARCHAR2(36) not null,
  MODEL_ID       VARCHAR2(36),
  GENERATED_CODE VARCHAR2(128),
  STATE          NUMBER(2),
  YMD            VARCHAR2(8)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.CODE_GENERATOR_LOG
  add constraint CODE_GENERATOR_LOG_PK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CODE_GENERATOR_MODEL
prompt ===================================
prompt
create table EAM2.CODE_GENERATOR_MODEL
(
  ID        VARCHAR2(36) not null,
  MODEL     VARCHAR2(128),
  CODE_TYPE VARCHAR2(32),
  REMARK    VARCHAR2(256),
  DEPTID    VARCHAR2(36)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.CODE_GENERATOR_MODEL
  add constraint CODE_GENERATOR_MODEL_PK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.CODE_GENERATOR_MODEL
  add constraint CODE_GENERATOR_MODEL_UQ unique (CODE_TYPE, DEPTID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COMMON_ACCORDING
prompt ===============================
prompt
create table EAM2.COMMON_ACCORDING
(
  ID     VARCHAR2(36) not null,
  BDID   VARCHAR2(36) not null,
  BH     VARCHAR2(128),
  BT     VARCHAR2(500),
  NGR    VARCHAR2(32),
  NGRQ   DATE,
  LCMC   VARCHAR2(64),
  URL    VARCHAR2(500),
  LCID   VARCHAR2(128),
  TJR    VARCHAR2(100),
  SOURCE VARCHAR2(32),
  DEL    NUMBER,
  TBDID  VARCHAR2(36),
  SXMS   VARCHAR2(1000),
  FENLEI VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.COMMON_ACCORDING.ID
  is 'UUID';
comment on column EAM2.COMMON_ACCORDING.BDID
  is 'UUID';
comment on column EAM2.COMMON_ACCORDING.BH
  is '���';
comment on column EAM2.COMMON_ACCORDING.BT
  is '����';
comment on column EAM2.COMMON_ACCORDING.NGR
  is '�����';
comment on column EAM2.COMMON_ACCORDING.NGRQ
  is '�������';
comment on column EAM2.COMMON_ACCORDING.LCMC
  is '��������';
comment on column EAM2.COMMON_ACCORDING.URL
  is '��ʾURL';
comment on column EAM2.COMMON_ACCORDING.LCID
  is '����ID';
comment on column EAM2.COMMON_ACCORDING.TJR
  is '����˱��';
comment on column EAM2.COMMON_ACCORDING.TBDID
  is '�����ñ�ID';
comment on column EAM2.COMMON_ACCORDING.SXMS
  is '��������';
comment on column EAM2.COMMON_ACCORDING.FENLEI
  is '����';
alter table EAM2.COMMON_ACCORDING
  add constraint PK_COMMON_ACCORDING primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COMMON_EAM_2_OA
prompt ==============================
prompt
create table EAM2.COMMON_EAM_2_OA
(
  ID          VARCHAR2(36) not null,
  HEADID      VARCHAR2(36),
  BIAOTI      VARCHAR2(100),
  YWZL        VARCHAR2(36),
  YWMC        VARCHAR2(36),
  LCID        VARCHAR2(36),
  URL         VARCHAR2(1000),
  STATUS      VARCHAR2(36),
  NGRID       VARCHAR2(36),
  NGR         VARCHAR2(36),
  NGRQ        DATE,
  UPDATE_DATE DATE,
  RSVD_DATE1  DATE,
  RSVD_DATE2  DATE,
  RSVD_DATE3  DATE,
  RSVD_DATE4  DATE,
  RSVD_NUM1   NUMBER,
  RSVD_NUM2   NUMBER,
  RSVD_NUM3   NUMBER,
  RSVD_STR1   VARCHAR2(200),
  RSVD_STR2   VARCHAR2(200),
  RSVD_STR3   VARCHAR2(200),
  RSVD_STR4   VARCHAR2(200),
  RSVD_STR5   VARCHAR2(200),
  RSVD_STR6   VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.COMMON_EAM_2_OA
  is '����OA��EAMϵͳ�Ĺ����ı�';
comment on column EAM2.COMMON_EAM_2_OA.ID
  is 'ID';
comment on column EAM2.COMMON_EAM_2_OA.HEADID
  is '��ID';
comment on column EAM2.COMMON_EAM_2_OA.BIAOTI
  is '����';
comment on column EAM2.COMMON_EAM_2_OA.YWZL
  is 'ҵ������';
comment on column EAM2.COMMON_EAM_2_OA.YWMC
  is 'ҵ������';
comment on column EAM2.COMMON_EAM_2_OA.LCID
  is 'oa ������ID';
comment on column EAM2.COMMON_EAM_2_OA.URL
  is 'oa��URL';
comment on column EAM2.COMMON_EAM_2_OA.STATUS
  is '����״̬��0:��������2�Ѱ��';
comment on column EAM2.COMMON_EAM_2_OA.NGRID
  is '�����ID';
comment on column EAM2.COMMON_EAM_2_OA.NGR
  is '���������';
comment on column EAM2.COMMON_EAM_2_OA.NGRQ
  is '�������';
comment on column EAM2.COMMON_EAM_2_OA.UPDATE_DATE
  is '��������';
alter table EAM2.COMMON_EAM_2_OA
  add constraint PK_COMMON_EAM_2_OA primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COMMON_TABLE_CATALOG
prompt ===================================
prompt
create table EAM2.COMMON_TABLE_CATALOG
(
  SUBSYSTEM  VARCHAR2(100) not null,
  XH         INTEGER not null,
  TABLENAME  VARCHAR2(100),
  TABLECNAME VARCHAR2(100),
  TABLEDESC  VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.COMMON_TABLE_CATALOG
  is '�˱��������ֵ��ORACLE�汾���˱�Ϊϵͳ����ʹ�á�';
comment on column EAM2.COMMON_TABLE_CATALOG.SUBSYSTEM
  is '������ϵͳ';
comment on column EAM2.COMMON_TABLE_CATALOG.XH
  is '���';
comment on column EAM2.COMMON_TABLE_CATALOG.TABLENAME
  is '���ݱ�����';
comment on column EAM2.COMMON_TABLE_CATALOG.TABLECNAME
  is '���ı�����';
comment on column EAM2.COMMON_TABLE_CATALOG.TABLEDESC
  is '���ݱ�˵��';
alter table EAM2.COMMON_TABLE_CATALOG
  add constraint PK_COMMON_TABLE_CATALOG primary key (SUBSYSTEM, XH)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table CONTRACT
prompt =======================
prompt
create table EAM2.CONTRACT
(
  ID     VARCHAR2(32) not null,
  HTCODE VARCHAR2(100),
  HTTYPE VARCHAR2(50)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_AZRY_XX
prompt =========================
prompt
create table EAM2.CZ_AZRY_XX
(
  ID           VARCHAR2(32) not null,
  CLD_ID       VARCHAR2(32),
  ST_ID        VARCHAR2(32),
  ST_FSXX_ID   VARCHAR2(32),
  ZCBH         VARCHAR2(300),
  RYBH         VARCHAR2(300),
  XINGMING     VARCHAR2(100),
  FYDDH        VARCHAR2(300),
  FGDDH        VARCHAR2(300),
  FAZFS        VARCHAR2(1000),
  FAZFY        NUMBER(20,4),
  CLDZT        VARCHAR2(10),
  GZXX         VARCHAR2(10),
  AZRYSFFSZC   VARCHAR2(10),
  AZRYZCJG     VARCHAR2(1000),
  AZRYZCJIEGUO VARCHAR2(1000),
  AZRYSFQSST   VARCHAR2(10),
  AZRYSTQSQKMS VARCHAR2(1000),
  AZRYSFQSAZXY VARCHAR2(10),
  AZRYXYQSQKMS VARCHAR2(1000),
  AZRYFJXZ_URL VARCHAR2(1000),
  AZRYFJSC_URL VARCHAR2(1000),
  AZXYXZ_URL   VARCHAR2(1000),
  AZXYSC_URL   VARCHAR2(1000),
  FSJAZFY      NUMBER(20,4)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_AZRY_XX.CLD_ID
  is '����ID';
comment on column EAM2.CZ_AZRY_XX.ST_ID
  is '����ʵ��ID';
comment on column EAM2.CZ_AZRY_XX.ST_FSXX_ID
  is 'ʵ�帽����ϢID';
comment on column EAM2.CZ_AZRY_XX.ZCBH
  is '�ʲ����';
comment on column EAM2.CZ_AZRY_XX.RYBH
  is '��Ա���';
comment on column EAM2.CZ_AZRY_XX.XINGMING
  is '����';
comment on column EAM2.CZ_AZRY_XX.FYDDH
  is '�ƶ��绰';
comment on column EAM2.CZ_AZRY_XX.FGDDH
  is '�̶��绰';
comment on column EAM2.CZ_AZRY_XX.FAZFS
  is '���÷�ʽ';
comment on column EAM2.CZ_AZRY_XX.FAZFY
  is '���÷���';
comment on column EAM2.CZ_AZRY_XX.CLDZT
  is '����״̬  0��δ����   1�������� 2��������';
comment on column EAM2.CZ_AZRY_XX.GZXX
  is '���ø�����Ϣ________';
comment on column EAM2.CZ_AZRY_XX.AZRYSFFSZC
  is '������Ա�Ƿ����ٲ�';
comment on column EAM2.CZ_AZRY_XX.AZRYZCJG
  is '������Ա�ٲû���';
comment on column EAM2.CZ_AZRY_XX.AZRYZCJIEGUO
  is '������Ա�ٲý��';
comment on column EAM2.CZ_AZRY_XX.AZRYSFQSST
  is '������Ա�Ƿ�ǩ������';
comment on column EAM2.CZ_AZRY_XX.AZRYSTQSQKMS
  is '������Ա����ǩ���������';
comment on column EAM2.CZ_AZRY_XX.AZRYSFQSAZXY
  is '������Ա�Ƿ�ǩ����Э��';
comment on column EAM2.CZ_AZRY_XX.AZRYXYQSQKMS
  is '������ԱЭ��ǩ���������';
comment on column EAM2.CZ_AZRY_XX.AZRYFJXZ_URL
  is '������Ա��������url';
comment on column EAM2.CZ_AZRY_XX.AZRYFJSC_URL
  is '������Ա����ɾ��url';
comment on column EAM2.CZ_AZRY_XX.AZXYXZ_URL
  is '����Э�������url';
comment on column EAM2.CZ_AZRY_XX.AZXYSC_URL
  is '����Э���ɾ��url';
comment on column EAM2.CZ_AZRY_XX.FSJAZFY
  is 'ʵ�ʰ��÷���';
alter table EAM2.CZ_AZRY_XX
  add constraint PK_CZ_AZRY_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_CZTZFA_XX
prompt ===========================
prompt
create table EAM2.CZ_CZTZFA_XX
(
  ID                VARCHAR2(32) not null,
  LCID              VARCHAR2(32),
  CZTZXMMC          VARCHAR2(300),
  BIANHAO           VARCHAR2(300),
  JHCD              VARCHAR2(10),
  NGRQ              DATE,
  NGBM              VARCHAR2(32),
  NGBMMC            VARCHAR2(300),
  NGR               VARCHAR2(32),
  NGRXM             VARCHAR2(300),
  LXDH              VARCHAR2(300),
  ZCSZWZ            VARCHAR2(400),
  ZCLB              VARCHAR2(100),
  CZSBFS            VARCHAR2(10),
  LCMC              VARCHAR2(300),
  CLDZT             VARCHAR2(10),
  ZCCZSYZD_________ VARCHAR2(10),
  ZCQS              VARCHAR2(300),
  PGJGMC            VARCHAR2(300),
  C_CZFS            VARCHAR2(32),
  ZMYZ              NUMBER(20,4),
  ZMJZ              NUMBER(20,4),
  YJCZFY            NUMBER(20,4),
  PGJZ              NUMBER(20,4),
  YJCZHSJE          NUMBER(20,4),
  YJSSJE            NUMBER(20,4),
  YJSSL             VARCHAR2(100),
  SFYSBD            VARCHAR2(10),
  SFYCZFA           VARCHAR2(10),
  SFYSJQK           VARCHAR2(10),
  SFYPGBG           VARCHAR2(10),
  QTSBCL            VARCHAR2(300),
  SFJPGSC           VARCHAR2(10),
  PGBGSXQJZRQ       DATE,
  CBCS              NUMBER(8),
  HGSCCS            NUMBER(8),
  SBRQ              DATE,
  SLXH              VARCHAR2(300),
  SCCZFAXXID        VARCHAR2(32),
  BEIZHU            VARCHAR2(1000),
  FBLSJ             DATE,
  HQBM              VARCHAR2(300),
  CSCLDID           VARCHAR2(32),
  CJTZSYYZD_______  VARCHAR2(10),
  C_TZYWLX          VARCHAR2(32),
  C_FALB            VARCHAR2(10),
  FAFL              VARCHAR2(10),
  SQFYZJE           NUMBER(20,4),
  SPFYZJE           NUMBER(20,4),
  ZLZJE             NUMBER(20,4),
  HQBMID            VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_CZTZFA_XX.ID
  is 'uuid ����';
comment on column EAM2.CZ_CZTZFA_XX.LCID
  is '����ID';
comment on column EAM2.CZ_CZTZFA_XX.CZTZXMMC
  is '���ã�Ͷ�ʣ���Ŀ����';
comment on column EAM2.CZ_CZTZFA_XX.BIANHAO
  is '���';
comment on column EAM2.CZ_CZTZFA_XX.JHCD
  is 'һ�� ���� �� �ؼ�';
comment on column EAM2.CZ_CZTZFA_XX.NGRQ
  is '�������';
comment on column EAM2.CZ_CZTZFA_XX.NGBM
  is '��岿��';
comment on column EAM2.CZ_CZTZFA_XX.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_CZTZFA_XX.NGR
  is '�����';
comment on column EAM2.CZ_CZTZFA_XX.NGRXM
  is '���������';
comment on column EAM2.CZ_CZTZFA_XX.LXDH
  is '��ϵ�绰';
comment on column EAM2.CZ_CZTZFA_XX.ZCSZWZ
  is '�ʲ�����λ��';
comment on column EAM2.CZ_CZTZFA_XX.ZCLB
  is '����Ͷ���ʲ���� 0����Ӫ�Թ̲� 1��ʵ�����ʲ� 2�� ί����ծ�� 3��ʵ��';
comment on column EAM2.CZ_CZTZFA_XX.CZSBFS
  is '�״Σ�������ر�';
comment on column EAM2.CZ_CZTZFA_XX.LCMC
  is '��������';
comment on column EAM2.CZ_CZTZFA_XX.CLDZT
  is '����״̬  0��δ����   1�������� 2�������� 3�����˻�';
comment on column EAM2.CZ_CZTZFA_XX.ZCQS
  is '�ʲ�Ȩ��';
comment on column EAM2.CZ_CZTZFA_XX.PGJGMC
  is '������������';
comment on column EAM2.CZ_CZTZFA_XX.C_CZFS
  is '���÷�ʽ';
comment on column EAM2.CZ_CZTZFA_XX.ZMYZ
  is '����ԭֵ';
comment on column EAM2.CZ_CZTZFA_XX.ZMJZ
  is '���澻ֵ';
comment on column EAM2.CZ_CZTZFA_XX.YJCZFY
  is 'Ԥ�ƴ��÷���';
comment on column EAM2.CZ_CZTZFA_XX.PGJZ
  is '������ֵ';
comment on column EAM2.CZ_CZTZFA_XX.YJCZHSJE
  is '���鴦�û��ս��';
comment on column EAM2.CZ_CZTZFA_XX.YJSSJE
  is 'Ԥ����ʧ���';
comment on column EAM2.CZ_CZTZFA_XX.YJSSL
  is 'Ԥ����ʧ��';
comment on column EAM2.CZ_CZTZFA_XX.SFYSBD
  is '�Ƿ����걨�� 0���� 1����';
comment on column EAM2.CZ_CZTZFA_XX.SFYCZFA
  is '�Ƿ��д��÷��� 0���� 1����';
comment on column EAM2.CZ_CZTZFA_XX.SFYSJQK
  is '�Ƿ��������� 0���� 1����';
comment on column EAM2.CZ_CZTZFA_XX.SFYPGBG
  is ' �Ƿ����������� 0���� 1����';
comment on column EAM2.CZ_CZTZFA_XX.QTSBCL
  is '�����걨����';
comment on column EAM2.CZ_CZTZFA_XX.SFJPGSC
  is '�Ƿ��������
0����
1����';
comment on column EAM2.CZ_CZTZFA_XX.PGBGSXQJZRQ
  is '��������ʧЧ�ڽ�ֹ����';
comment on column EAM2.CZ_CZTZFA_XX.CBCS
  is '�ر�����';
comment on column EAM2.CZ_CZTZFA_XX.HGSCCS
  is '�Ϲ�������';
comment on column EAM2.CZ_CZTZFA_XX.SBRQ
  is '�걨����';
comment on column EAM2.CZ_CZTZFA_XX.SLXH
  is '�������';
comment on column EAM2.CZ_CZTZFA_XX.SCCZFAXXID
  is '�ϴ��ʲ����÷�����ϢID';
comment on column EAM2.CZ_CZTZFA_XX.BEIZHU
  is '��ע';
comment on column EAM2.CZ_CZTZFA_XX.FBLSJ
  is '������ʱ��';
comment on column EAM2.CZ_CZTZFA_XX.HQBM
  is '��ǩ����';
comment on column EAM2.CZ_CZTZFA_XX.CSCLDID
  is '��ʼ����ID�����ڰ����˻�ʱ����¼�������ʲ�֮��Ĺ�ϵ';
comment on column EAM2.CZ_CZTZFA_XX.C_TZYWLX
  is 'Ͷ��ҵ������';
comment on column EAM2.CZ_CZTZFA_XX.C_FALB
  is '����Ͷ�ʷ������';
comment on column EAM2.CZ_CZTZFA_XX.FAFL
  is '�������� 0���ʲ����� 1���м�Ͷ��';
comment on column EAM2.CZ_CZTZFA_XX.SQFYZJE
  is '��������ܽ��';
comment on column EAM2.CZ_CZTZFA_XX.SPFYZJE
  is '���������ܽ��';
comment on column EAM2.CZ_CZTZFA_XX.ZLZJE
  is '�����ܽ��';
comment on column EAM2.CZ_CZTZFA_XX.HQBMID
  is '��ǩ����ID';
alter table EAM2.CZ_CZTZFA_XX
  add constraint PK_CZ_CZTZFA_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_DISPOSE_TRACK
prompt ===============================
prompt
create table EAM2.CZ_DISPOSE_TRACK
(
  ID            VARCHAR2(32) not null,
  CZGZFS        VARCHAR2(32),
  CZGZHJ        VARCHAR2(32),
  GKPMJGMC      VARCHAR2(1000),
  GKPMSFZJTZJK  VARCHAR2(8),
  GKPMBZZJKYY   VARCHAR2(1000),
  GKPMBLJ       NUMBER(20,2),
  GKPMBLJSFYXXF VARCHAR2(8),
  GKPMYXXFCS    NUMBER(12),
  GKPMMCXFFD    NUMBER(20,2),
  GKPMJTSFGG    VARCHAR2(8),
  PMSFCG        VARCHAR2(8),
  CGPMS         VARCHAR2(32),
  CGPMSJ        DATE,
  CGPMDD        VARCHAR2(100),
  CGPMJMRS      NUMBER(12),
  CGPMCJJ       NUMBER(20,2),
  CGPMMSR       VARCHAR2(32),
  CGPMYJJE      NUMBER(20,2),
  CGPMJKZFFS    VARCHAR2(100),
  CGPMJE        NUMBER(20,2),
  SFWCGH        VARCHAR2(8),
  GPCQJYSMC     VARCHAR2(100),
  GPPGJ         NUMBER(20,2),
  GPQSRQ        DATE,
  GPJSRQ        DATE,
  GPSFCG        VARCHAR2(8),
  GPYXMSRS      NUMBER(12),
  GPCGCJJE      NUMBER(20,2),
  XYZRMSR       VARCHAR2(100),
  XYZRJE        NUMBER(20,2),
  CQSFYSWBC     VARCHAR2(8),
  CQBCWMS       VARCHAR2(1000),
  CQSFYHBBC     VARCHAR2(8),
  CQBCJE        NUMBER(20,2),
  ZXPCFYMC      VARCHAR2(100),
  ZXSJJGMC      VARCHAR2(100),
  ZXZQQCQK      VARCHAR2(1000),
  ZXHKSJ        DATE,
  ZXJE          NUMBER(20,2),
  ZXDJSJ        DATE,
  GQZRSJ        DATE,
  GQZRJE        NUMBER(20,2),
  GQZRMSR       VARCHAR2(100),
  GQZQZRQK      VARCHAR2(1000),
  GQSFWCBG      VARCHAR2(8),
  RYAZSFPQLS    VARCHAR2(8),
  RYAZLSXM      VARCHAR2(100),
  RYAZLSLXFS    VARCHAR2(100),
  RYAZSFFBAZGG  VARCHAR2(8),
  RYAZSTQSQKMS  VARCHAR2(1000),
  RYAZSFQSST    VARCHAR2(8),
  RYAZSFFSZC    VARCHAR2(8),
  RYAZZCJG      VARCHAR2(1000),
  RYAZZCJIEGUO  VARCHAR2(1000),
  RYAZSFQSAZXY  VARCHAR2(8),
  RYAZXYQSQKMS  VARCHAR2(1000),
  XMID          VARCHAR2(32),
  ZCID          VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_DISPOSE_TRACK.ID
  is 'id';
comment on column EAM2.CZ_DISPOSE_TRACK.CZGZFS
  is '���ø��ٷ�ʽ';
comment on column EAM2.CZ_DISPOSE_TRACK.CZGZHJ
  is '���ø��ٻ���';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMJGMC
  is '����������������';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMSFZJTZJK
  is '���������Ƿ��ڽ�Ͷ�н��';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMBZZJKYY
  is '�������������н��ԭ��';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMBLJ
  is '��������������';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMBLJSFYXXF
  is '���������������Ƿ������¸�';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMYXXFCS
  is '�������������¸�����';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMMCXFFD
  is '��������ÿ���¸�����';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMJTSFGG
  is '����������Ͷ�Ƿ񹫸�';
comment on column EAM2.CZ_DISPOSE_TRACK.PMSFCG
  is '�����Ƿ�ɹ�';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMS
  is '�ɹ�����ʦ';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMSJ
  is '�ɹ�����ʱ��';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMDD
  is '�ɹ������ص�';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMJMRS
  is '�ɹ�������������';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMCJJ
  is '�ɹ������ɽ���';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMMSR
  is '�ɹ�����������';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMYJJE
  is '�ɹ�����Ӷ����';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMJKZFFS
  is '�ɹ������ۿ�֧����ʽ';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMJE
  is '�ɹ��������';
comment on column EAM2.CZ_DISPOSE_TRACK.SFWCGH
  is '�Ƿ���ɹ���';
comment on column EAM2.CZ_DISPOSE_TRACK.GPCQJYSMC
  is '���Ʋ�Ȩ����������';
comment on column EAM2.CZ_DISPOSE_TRACK.GPPGJ
  is '����������';
comment on column EAM2.CZ_DISPOSE_TRACK.GPQSRQ
  is '������ʼ����';
comment on column EAM2.CZ_DISPOSE_TRACK.GPJSRQ
  is '���ƽ�������';
comment on column EAM2.CZ_DISPOSE_TRACK.GPSFCG
  is '�����Ƿ�ɹ�';
comment on column EAM2.CZ_DISPOSE_TRACK.GPYXMSRS
  is '���Ƴɹ�������������';
comment on column EAM2.CZ_DISPOSE_TRACK.GPCGCJJE
  is '���Ƴɹ��ɽ����';
comment on column EAM2.CZ_DISPOSE_TRACK.XYZRMSR
  is 'Э��ת��������';
comment on column EAM2.CZ_DISPOSE_TRACK.XYZRJE
  is 'Э��ת�ý��';
comment on column EAM2.CZ_DISPOSE_TRACK.CQSFYSWBC
  is '��Ǩ�Ƿ���ʵ�ﲹ��';
comment on column EAM2.CZ_DISPOSE_TRACK.CQBCWMS
  is '��Ǩ����������';
comment on column EAM2.CZ_DISPOSE_TRACK.CQSFYHBBC
  is '��Ǩ�Ƿ��л��Ҳ���';
comment on column EAM2.CZ_DISPOSE_TRACK.CQBCJE
  is '��Ǩ�������';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXPCFYMC
  is 'ע���Ʋ���Ժ����';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXSJJGMC
  is 'ע����ƻ�������';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXZQQCQK
  is 'ע��ծȨ�峥���';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXHKSJ
  is 'ע���ؿ�ʱ��';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXJE
  is 'ע�����';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXDJSJ
  is 'ע���Ǽ�ʱ��';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZRSJ
  is '��Ȩת��ʱ��';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZRJE
  is '��Ȩת�ý��';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZRMSR
  is '��Ȩת��������';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZQZRQK
  is '��ȨծȨת�����';
comment on column EAM2.CZ_DISPOSE_TRACK.GQSFWCBG
  is '��Ȩ�Ƿ���ɱ��';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFPQLS
  is '��Ա�����Ƿ�Ƹ����ʦ
��ʦ����
�Ƿ�Ƹ����ʦ';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZLSXM
  is '��Ա������ʦ����';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZLSLXFS
  is '��Ա������ʦ��ϵ��ʽ';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFFBAZGG
  is '��Ա�����Ƿ񷢲����ù���';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSTQSQKMS
  is '��Ա��������ǩ���������';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFQSST
  is '��Ա�����Ƿ�ǩ������';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFFSZC
  is '��Ա�����Ƿ����ٲ�';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZZCJG
  is '��Ա�����ٲû���';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZZCJIEGUO
  is '��Ա�����ٲý��';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFQSAZXY
  is '��Ա�����Ƿ�ǩ����Э��';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZXYQSQKMS
  is '��Ա����Э��ǩ���������';
comment on column EAM2.CZ_DISPOSE_TRACK.XMID
  is '��ĿID';
comment on column EAM2.CZ_DISPOSE_TRACK.ZCID
  is '�ʲ�ID';
alter table EAM2.CZ_DISPOSE_TRACK
  add constraint PK_CZ_DISPOSE_TRACK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_DISPOSE_TRACK_ADJUNCT
prompt =======================================
prompt
create table EAM2.CZ_DISPOSE_TRACK_ADJUNCT
(
  ID         VARCHAR2(32) not null,
  TRACKID    VARCHAR2(32),
  FSXXLX     VARCHAR2(32),
  PMWCGPMSJ  DATE,
  PMWCGPMDD  VARCHAR2(100),
  PMWCGJMRS  NUMBER(12),
  PMWCGJMZGJ NUMBER(20,2),
  PMWCGBLJ   NUMBER(20,2),
  SLMC       VARCHAR2(100),
  FYJE       NUMBER(20,2),
  FYZL       VARCHAR2(100),
  QSXZRYXM   VARCHAR2(100),
  QSXZRYLXFS VARCHAR2(100),
  QSXZRYGZDW VARCHAR2(100),
  HKSJ       DATE,
  HKJE       NUMBER(20,2),
  HKFY       NUMBER(20,2),
  HKSR       NUMBER(20,2),
  HKFKR      VARCHAR2(100),
  HKBZ       VARCHAR2(1000),
  PMWCGCS    NUMBER(1),
  LSXM       VARCHAR2(300),
  LXFS       VARCHAR2(300),
  ZXQK       VARCHAR2(2000),
  LRRBH      VARCHAR2(32),
  LRR        VARCHAR2(100),
  LRRQ       DATE
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.ID
  is 'id';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.TRACKID
  is '���ø�������Id';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.FSXXLX
  is '������Ϣ����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGPMSJ
  is '����δ�ɹ�����ʱ��';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGPMDD
  is '����δ�ɹ������ص�';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGJMRS
  is '����δ�ɹ���������';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGJMZGJ
  is '����δ�ɹ�������߼�';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGBLJ
  is '����δ�ɹ�������';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.SLMC
  is '˰������';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.FYJE
  is '���ý��';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.FYZL
  is '��������';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.QSXZRYXM
  is '����С����Ա����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.QSXZRYLXFS
  is '����С����Ա��ϵ��ʽ';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.QSXZRYGZDW
  is '����С����Ա������λ';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKSJ
  is '�ؿ�ʱ��';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKJE
  is '�ؿ���';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKFY
  is '�ؿ����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKSR
  is '�ؿ�����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKFKR
  is '�ؿ����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKBZ
  is '�ؿע';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGCS
  is '����δ�ɹ�����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LSXM
  is '��ʦ����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LXFS
  is '��ʦ��ϵ��ʽ';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.ZXQK
  is 'ִ�����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LRRBH
  is '¼���˱��';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LRR
  is '¼����';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LRRQ
  is '¼������';
alter table EAM2.CZ_DISPOSE_TRACK_ADJUNCT
  add constraint PK_CZ_DISPOSE_TRACK_ADJUNCT primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table CZ_FYSR_MX
prompt =========================
prompt
create table EAM2.CZ_FYSR_MX
(
  ID      VARCHAR2(32) not null,
  BIANHAO VARCHAR2(300),
  CLD_ID  VARCHAR2(32),
  XM_ID   VARCHAR2(32),
  FENLEI  VARCHAR2(10),
  C_FYZL  VARCHAR2(300),
  YJHF    NUMBER(20,4),
  SJZC    NUMBER(20,4),
  BEIZHU  VARCHAR2(1000),
  GHSLMC  VARCHAR2(300),
  GHSLJE  NUMBER(20,4),
  GHFYMC  VARCHAR2(300),
  GHFYJE  NUMBER(20,4),
  HKSJ    DATE,
  HKJE    NUMBER(20,4),
  HKZFYJE NUMBER(20,4),
  HKZSRJE NUMBER(20,4),
  FKR     VARCHAR2(300),
  LRRMC   VARCHAR2(300),
  LRRBH   VARCHAR2(32),
  LRSJ    DATE,
  FYZT    VARCHAR2(10),
  ZCLB    VARCHAR2(10),
  AZCID   VARCHAR2(32),
  AZCBH   VARCHAR2(300),
  BSTID   VARCHAR2(32),
  STBH    VARCHAR2(300),
  BFSXXID VARCHAR2(32),
  BZCBH   VARCHAR2(300),
  ZYZCID  VARCHAR2(32),
  ZYZCBH  VARCHAR2(300),
  JIEDUAN VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_FYSR_MX.ID
  is 'uuid ����';
comment on column EAM2.CZ_FYSR_MX.BIANHAO
  is '��Ŀ���';
comment on column EAM2.CZ_FYSR_MX.CLD_ID
  is '����ID';
comment on column EAM2.CZ_FYSR_MX.XM_ID
  is '��ĿID';
comment on column EAM2.CZ_FYSR_MX.FENLEI
  is '0������
���� 1������';
comment on column EAM2.CZ_FYSR_MX.C_FYZL
  is '��������';
comment on column EAM2.CZ_FYSR_MX.YJHF
  is 'Ԥ�ƻ���';
comment on column EAM2.CZ_FYSR_MX.SJZC
  is 'ʵ��֧��';
comment on column EAM2.CZ_FYSR_MX.BEIZHU
  is '��ע';
comment on column EAM2.CZ_FYSR_MX.GHSLMC
  is '����˰������';
comment on column EAM2.CZ_FYSR_MX.GHSLJE
  is '����˰����';
comment on column EAM2.CZ_FYSR_MX.GHFYMC
  is '������������';
comment on column EAM2.CZ_FYSR_MX.GHFYJE
  is '�������ý��';
comment on column EAM2.CZ_FYSR_MX.HKSJ
  is '�ؿ�ʱ��';
comment on column EAM2.CZ_FYSR_MX.HKJE
  is '�ؿ���';
comment on column EAM2.CZ_FYSR_MX.HKZFYJE
  is '�ؿ��з��ý��';
comment on column EAM2.CZ_FYSR_MX.HKZSRJE
  is '�ؿ���������';
comment on column EAM2.CZ_FYSR_MX.FKR
  is '������';
comment on column EAM2.CZ_FYSR_MX.LRRMC
  is '¼��������';
comment on column EAM2.CZ_FYSR_MX.LRRBH
  is '¼���˱��';
comment on column EAM2.CZ_FYSR_MX.LRSJ
  is '¼��ʱ��';
comment on column EAM2.CZ_FYSR_MX.FYZT
  is '����״̬ 0��������  1��������  2��������';
comment on column EAM2.CZ_FYSR_MX.ZCLB
  is '�����ʲ���� 0����Ӫ�Թ̲� 1��ʵ�����ʲ� 2�� ί����ծ�� 3��ʵ��';
comment on column EAM2.CZ_FYSR_MX.AZCID
  is '��Ӫ�̲�ID';
comment on column EAM2.CZ_FYSR_MX.AZCBH
  is '��Ӫ�̲��ʲ����';
comment on column EAM2.CZ_FYSR_MX.BSTID
  is 'ʵ��ID';
comment on column EAM2.CZ_FYSR_MX.STBH
  is 'ʵ����';
comment on column EAM2.CZ_FYSR_MX.BFSXXID
  is 'ʵ�帽����ϢID';
comment on column EAM2.CZ_FYSR_MX.BZCBH
  is 'ʵ�����ʲ����';
comment on column EAM2.CZ_FYSR_MX.ZYZCID
  is '�����ʲ�ID';
comment on column EAM2.CZ_FYSR_MX.ZYZCBH
  is '�����ʲ����';
comment on column EAM2.CZ_FYSR_MX.JIEDUAN
  is '���ø��ٽ׶� guohufeiyong �������� guohushuikuan ����˰��  chuzhihuikuan ���ûؿ�';
alter table EAM2.CZ_FYSR_MX
  add constraint PK_CZ_FYSR_MX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_FYSR_MX_LSB
prompt =============================
prompt
create table EAM2.CZ_FYSR_MX_LSB
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  BIANHAO VARCHAR2(300),
  ZCID    VARCHAR2(32),
  ZCBH    VARCHAR2(300),
  FYBH    VARCHAR2(300),
  FENLEI  VARCHAR2(10),
  FYZL    VARCHAR2(300),
  YJHF    NUMBER(20,4),
  SJZC    NUMBER(20,4),
  BEIZHU  VARCHAR2(1000),
  LRRMC   VARCHAR2(300),
  LRRBH   VARCHAR2(32),
  LRSJ    DATE,
  FYZT    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_FYSR_MX_LSB.ID
  is 'uuid ����';
comment on column EAM2.CZ_FYSR_MX_LSB.CLD_ID
  is '����ID';
comment on column EAM2.CZ_FYSR_MX_LSB.BIANHAO
  is '���';
comment on column EAM2.CZ_FYSR_MX_LSB.ZCID
  is '�ʲ�ID';
comment on column EAM2.CZ_FYSR_MX_LSB.ZCBH
  is '�ʲ����';
comment on column EAM2.CZ_FYSR_MX_LSB.FYBH
  is '���ñ��';
comment on column EAM2.CZ_FYSR_MX_LSB.FENLEI
  is '0������
���� 1������';
comment on column EAM2.CZ_FYSR_MX_LSB.FYZL
  is '��������';
comment on column EAM2.CZ_FYSR_MX_LSB.YJHF
  is 'Ԥ�ƻ���';
comment on column EAM2.CZ_FYSR_MX_LSB.SJZC
  is 'ʵ��֧��';
comment on column EAM2.CZ_FYSR_MX_LSB.BEIZHU
  is '��ע';
comment on column EAM2.CZ_FYSR_MX_LSB.LRRMC
  is '¼��������';
comment on column EAM2.CZ_FYSR_MX_LSB.LRRBH
  is '¼���˱��';
comment on column EAM2.CZ_FYSR_MX_LSB.LRSJ
  is '¼��ʱ��';
comment on column EAM2.CZ_FYSR_MX_LSB.FYZT
  is '����״̬ 0��������  1��������  2��������';
alter table EAM2.CZ_FYSR_MX_LSB
  add constraint PK_CZ_FYSR_MX_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_HGSH_XX
prompt =========================
prompt
create table EAM2.CZ_HGSH_XX
(
  ID          VARCHAR2(32) not null,
  CLD_ID      VARCHAR2(32),
  BIANHAO     VARCHAR2(300),
  BMLDSPYJ    VARCHAR2(1000),
  PGBGZYXQ    VARCHAR2(300),
  FGLDSPYJ    VARCHAR2(1000),
  WTDWSBWJ    VARCHAR2(1000),
  PGBGJSHYJ   VARCHAR2(1000),
  AYQJXGG     VARCHAR2(1000),
  BTGFZQ      VARCHAR2(1000),
  GXTXGFZQ    VARCHAR2(1000),
  JBRYJQXWW   VARCHAR2(1000),
  GSGF        VARCHAR2(1000),
  NRQXWZ      VARCHAR2(1000),
  XMJBQK      VARCHAR2(1000),
  PGJQSH      VARCHAR2(1000),
  CZFAJFABJ   VARCHAR2(1000),
  CZSY        VARCHAR2(1000),
  CZFY        VARCHAR2(1000),
  BMYJ        VARCHAR2(1000),
  WZGFWW      VARCHAR2(1000),
  GSJZSZQ     VARCHAR2(1000),
  YGYJYCFYJ   VARCHAR2(1000),
  CZFSHG      VARCHAR2(1000),
  CZDJHG      VARCHAR2(1000),
  CZFYHG      VARCHAR2(1000),
  SXFJQQ      VARCHAR2(1000),
  FJPGBGJSHYJ VARCHAR2(1000),
  GGYM        VARCHAR2(1000),
  FJWTDWSBWJ  VARCHAR2(1000),
  XMYGWJ      VARCHAR2(1000),
  FJGSGF      VARCHAR2(1000),
  GGNRGFWZ    VARCHAR2(1000),
  GGMZSXYQ    VARCHAR2(1000),
  SHJL        VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_HGSH_XX
  is '������Ŀ�Ϲ��������Ϣ��';
comment on column EAM2.CZ_HGSH_XX.ID
  is 'uuid������';
comment on column EAM2.CZ_HGSH_XX.CLD_ID
  is '����ID';
comment on column EAM2.CZ_HGSH_XX.BIANHAO
  is '���';
comment on column EAM2.CZ_HGSH_XX.BMLDSPYJ
  is '�����쵼�������';
comment on column EAM2.CZ_HGSH_XX.PGBGZYXQ
  is '������������Ч��';
comment on column EAM2.CZ_HGSH_XX.FGLDSPYJ
  is '�ֹ��쵼�������';
comment on column EAM2.CZ_HGSH_XX.WTDWSBWJ
  is 'ί�е�λ�ϱ��ļ�';
comment on column EAM2.CZ_HGSH_XX.PGBGJSHYJ
  is '�������漰������';
comment on column EAM2.CZ_HGSH_XX.AYQJXGG
  is '��Ҫ����й���';
comment on column EAM2.CZ_HGSH_XX.BTGFZQ
  is '����淶׼ȷ';
comment on column EAM2.CZ_HGSH_XX.GXTXGFZQ
  is '������д�淶׼ȷ';
comment on column EAM2.CZ_HGSH_XX.JBRYJQXWW
  is '�����������������';
comment on column EAM2.CZ_HGSH_XX.GSGF
  is '��ʽ�淶';
comment on column EAM2.CZ_HGSH_XX.NRQXWZ
  is '������������';
comment on column EAM2.CZ_HGSH_XX.XMJBQK
  is '��Ŀ�������';
comment on column EAM2.CZ_HGSH_XX.PGJQSH
  is '�����������';
comment on column EAM2.CZ_HGSH_XX.CZFAJFABJ
  is '���÷����������Ƚ�';
comment on column EAM2.CZ_HGSH_XX.CZSY
  is '��������';
comment on column EAM2.CZ_HGSH_XX.CZFY
  is '���÷���';
comment on column EAM2.CZ_HGSH_XX.BMYJ
  is '�������';
comment on column EAM2.CZ_HGSH_XX.WZGFWW
  is '���ֹ淶����';
comment on column EAM2.CZ_HGSH_XX.GSJZSZQ
  is '��������ʵ׼ȷ';
comment on column EAM2.CZ_HGSH_XX.YGYJYCFYJ
  is '�й�����г������';
comment on column EAM2.CZ_HGSH_XX.CZFSHG
  is '���÷�ʽ�Ϲ�';
comment on column EAM2.CZ_HGSH_XX.CZDJHG
  is '���ö��ۺϹ�';
comment on column EAM2.CZ_HGSH_XX.CZFYHG
  is '���÷��úϹ�';
comment on column EAM2.CZ_HGSH_XX.SXFJQQ
  is '���踽����ȫ';
comment on column EAM2.CZ_HGSH_XX.FJPGBGJSHYJ
  is '�����������漰������';
comment on column EAM2.CZ_HGSH_XX.GGYM
  is '����ҳ��';
comment on column EAM2.CZ_HGSH_XX.FJWTDWSBWJ
  is '����ί�е�λ�ϱ��ļ�';
comment on column EAM2.CZ_HGSH_XX.XMYGWJ
  is '��Ŀ�й��ļ�';
comment on column EAM2.CZ_HGSH_XX.FJGSGF
  is '������ʽ�淶';
comment on column EAM2.CZ_HGSH_XX.GGNRGFWZ
  is '�������ݹ淶����';
comment on column EAM2.CZ_HGSH_XX.GGMZSXYQ
  is '��������ʱ��Ҫ��';
comment on column EAM2.CZ_HGSH_XX.SHJL
  is '��˽���';
alter table EAM2.CZ_HGSH_XX
  add constraint PK_CZ_HGSH_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_HYXX
prompt ======================
prompt
create table EAM2.CZ_HYXX
(
  ID          VARCHAR2(32) not null,
  SPSJ        DATE,
  C_SPFS      VARCHAR2(32),
  HYCS        VARCHAR2(300),
  SPZCR       VARCHAR2(32),
  ZCRXM       VARCHAR2(300),
  SPWY        VARCHAR2(300),
  HBR         VARCHAR2(32),
  HBRXM       VARCHAR2(300),
  HYJYZLR     VARCHAR2(32),
  HYJYZLRXM   VARCHAR2(300),
  SPZT        VARCHAR2(10),
  HYDD        VARCHAR2(300),
  LC_ID       VARCHAR2(300),
  NGBM        VARCHAR2(300),
  NGBMMC      VARCHAR2(300),
  HYJYZLRBMID VARCHAR2(32),
  HYJYZLRBMMC VARCHAR2(300),
  ZCRBMID     VARCHAR2(32),
  ZCRBMMC     VARCHAR2(300),
  HYLX        VARCHAR2(10),
  SFFSCL      VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_HYXX
  is '������Ϣ';
comment on column EAM2.CZ_HYXX.ID
  is 'uuid������';
comment on column EAM2.CZ_HYXX.SPSJ
  is '����ʱ��';
comment on column EAM2.CZ_HYXX.C_SPFS
  is '������ʽ';
comment on column EAM2.CZ_HYXX.HYCS
  is '�������';
comment on column EAM2.CZ_HYXX.SPZCR
  is '����������';
comment on column EAM2.CZ_HYXX.ZCRXM
  is '��������������';
comment on column EAM2.CZ_HYXX.SPWY
  is '����ίԱ';
comment on column EAM2.CZ_HYXX.HBR
  is '�㱨��';
comment on column EAM2.CZ_HYXX.HBRXM
  is '�㱨������';
comment on column EAM2.CZ_HYXX.HYJYZLR
  is '�����Ҫ������';
comment on column EAM2.CZ_HYXX.HYJYZLRXM
  is '�����Ҫ����������';
comment on column EAM2.CZ_HYXX.SPZT
  is '����״̬   0:�ϻ��У���֯�����
1:�����Ҫ�����ˣ����ͻ����Ҫ���ں�
2:������ϣ�OA���ػ����Ҫ��Ϣ��';
comment on column EAM2.CZ_HYXX.HYDD
  is '����ص�';
comment on column EAM2.CZ_HYXX.LC_ID
  is '����ID';
comment on column EAM2.CZ_HYXX.NGBM
  is '��岿��';
comment on column EAM2.CZ_HYXX.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_HYXX.HYJYZLRBMID
  is '�����Ҫ��������������ID';
comment on column EAM2.CZ_HYXX.HYJYZLRBMMC
  is '�����Ҫ������������������';
comment on column EAM2.CZ_HYXX.ZCRBMID
  is '������������������ID';
comment on column EAM2.CZ_HYXX.ZCRBMMC
  is '����������������������';
comment on column EAM2.CZ_HYXX.HYLX
  is '��������';
comment on column EAM2.CZ_HYXX.SFFSCL
  is '�Ƿ�����ίԱ���� 0���� 1 ��';
alter table EAM2.CZ_HYXX
  add constraint PK_CZ_HYXX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_NOTICE_BODY
prompt =============================
prompt
create table EAM2.CZ_NOTICE_BODY
(
  ID     VARCHAR2(32) not null,
  CLD_ID VARCHAR2(32),
  CCB_ID VARCHAR2(32),
  ZC_ID  VARCHAR2(32),
  ZCMS   VARCHAR2(1000),
  CZYSBS VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_NOTICE_BODY
  is '���ù������';
comment on column EAM2.CZ_NOTICE_BODY.ID
  is 'ID';
comment on column EAM2.CZ_NOTICE_BODY.CLD_ID
  is '����ID';
comment on column EAM2.CZ_NOTICE_BODY.CCB_ID
  is '�ʲ����ڱ�ID';
comment on column EAM2.CZ_NOTICE_BODY.ZC_ID
  is '�����ʲ�ID';
comment on column EAM2.CZ_NOTICE_BODY.ZCMS
  is '�ʲ�����';
comment on column EAM2.CZ_NOTICE_BODY.CZYSBS
  is '�ʲ�������˼��ʾ';
alter table EAM2.CZ_NOTICE_BODY
  add constraint PK_CZ_NOTICE_BODY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_NOTICE_HEAD
prompt =============================
prompt
create table EAM2.CZ_NOTICE_HEAD
(
  ID         VARCHAR2(32) not null,
  LIUCHENGID VARCHAR2(32),
  BIAOTI     VARCHAR2(300),
  CHENGSON   VARCHAR2(300),
  BIANHAO    VARCHAR2(300),
  JHCD       VARCHAR2(32),
  NIGAOREN   VARCHAR2(32),
  NIGAORENXM VARCHAR2(300),
  NGBM       VARCHAR2(32),
  NGBMMC     VARCHAR2(300),
  NGRQ       DATE,
  LXDH       VARCHAR2(300),
  FBRQ       DATE,
  GGYXQ      VARCHAR2(300),
  YYYXQ      VARCHAR2(300),
  GGLXR      VARCHAR2(300),
  GGLXDH     VARCHAR2(300),
  GGLXYJ     VARCHAR2(300),
  JBDH       VARCHAR2(300),
  JBYJ       VARCHAR2(300),
  JYDXZG     VARCHAR2(1000),
  JYTJ       VARCHAR2(1000),
  ZCLYBM     VARCHAR2(32),
  BEIZHU     VARCHAR2(1000),
  LCMC       VARCHAR2(100),
  CLDZT      VARCHAR2(100),
  HQBMID     VARCHAR2(300),
  HQBM       VARCHAR2(300),
  SFHCGG     VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_NOTICE_HEAD
  is '���ù����ͷ';
comment on column EAM2.CZ_NOTICE_HEAD.LIUCHENGID
  is '����ID';
comment on column EAM2.CZ_NOTICE_HEAD.BIAOTI
  is '����';
comment on column EAM2.CZ_NOTICE_HEAD.CHENGSON
  is '����';
comment on column EAM2.CZ_NOTICE_HEAD.BIANHAO
  is '���';
comment on column EAM2.CZ_NOTICE_HEAD.JHCD
  is '�����̶ȣ�һ�� ���� �� �ؼ�';
comment on column EAM2.CZ_NOTICE_HEAD.NIGAOREN
  is '�����';
comment on column EAM2.CZ_NOTICE_HEAD.NIGAORENXM
  is '���������';
comment on column EAM2.CZ_NOTICE_HEAD.NGBM
  is '��岿��';
comment on column EAM2.CZ_NOTICE_HEAD.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_NOTICE_HEAD.NGRQ
  is '�������';
comment on column EAM2.CZ_NOTICE_HEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.CZ_NOTICE_HEAD.FBRQ
  is '���淢������';
comment on column EAM2.CZ_NOTICE_HEAD.GGYXQ
  is '������Ч��';
comment on column EAM2.CZ_NOTICE_HEAD.YYYXQ
  is '������ѯ��������Ч��';
comment on column EAM2.CZ_NOTICE_HEAD.GGLXR
  is '������ϵ��';
comment on column EAM2.CZ_NOTICE_HEAD.GGLXDH
  is '������ϵ�绰';
comment on column EAM2.CZ_NOTICE_HEAD.GGLXYJ
  is '������ϵ�����ʼ�';
comment on column EAM2.CZ_NOTICE_HEAD.JBDH
  is '���ų⡢������ѯ������ľٱ��绰';
comment on column EAM2.CZ_NOTICE_HEAD.JBYJ
  is '���ų⡢������ѯ������ľٱ������ʼ�';
comment on column EAM2.CZ_NOTICE_HEAD.JYDXZG
  is '���׶����ʸ�';
comment on column EAM2.CZ_NOTICE_HEAD.JYTJ
  is '��������';
comment on column EAM2.CZ_NOTICE_HEAD.ZCLYBM
  is '�����ʲ���Դ����';
comment on column EAM2.CZ_NOTICE_HEAD.BEIZHU
  is '������Ҫ˵�������';
comment on column EAM2.CZ_NOTICE_HEAD.LCMC
  is '��������  ���ù���';
comment on column EAM2.CZ_NOTICE_HEAD.CLDZT
  is '0��δ����   1�������� 2��������';
comment on column EAM2.CZ_NOTICE_HEAD.HQBMID
  is '��ǩ����ID';
comment on column EAM2.CZ_NOTICE_HEAD.HQBM
  is '�й���Ͷ��ǩ����';
comment on column EAM2.CZ_NOTICE_HEAD.SFHCGG
  is '�Ƿ�ϳɹ��� 0����  1����';
alter table EAM2.CZ_NOTICE_HEAD
  add constraint PK_CZ_NOTICE_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_PGSC_JL
prompt =========================
prompt
create table EAM2.CZ_PGSC_JL
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  OLD_ID  VARCHAR2(32),
  PID     VARCHAR2(32),
  CODE    VARCHAR2(300),
  VALUE   VARCHAR2(2000),
  C_SCJL  VARCHAR2(32),
  TJYJR   VARCHAR2(32),
  TJYJRXM VARCHAR2(300),
  TJRQ    DATE,
  JLXZ    VARCHAR2(10),
  BEIZHU  VARCHAR2(1000),
  SFXXZ   VARCHAR2(10),
  BGWTBZ  VARCHAR2(1000),
  TJPC    NUMBER,
  SCBZ    VARCHAR2(2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_PGSC_JL
  is '�������̽��ۺ����ս��ۡ�';
comment on column EAM2.CZ_PGSC_JL.ID
  is 'uuid ����';
comment on column EAM2.CZ_PGSC_JL.CLD_ID
  is '����ID';
comment on column EAM2.CZ_PGSC_JL.OLD_ID
  is 'ԭ֪ʶ��ID';
comment on column EAM2.CZ_PGSC_JL.PID
  is 'PID';
comment on column EAM2.CZ_PGSC_JL.CODE
  is '�����ֶ�';
comment on column EAM2.CZ_PGSC_JL.VALUE
  is '����';
comment on column EAM2.CZ_PGSC_JL.C_SCJL
  is '������';
comment on column EAM2.CZ_PGSC_JL.TJYJR
  is '�ύ�����';
comment on column EAM2.CZ_PGSC_JL.TJYJRXM
  is '�ύ���������';
comment on column EAM2.CZ_PGSC_JL.TJRQ
  is '�ύ����';
comment on column EAM2.CZ_PGSC_JL.JLXZ
  is '0�����̽���
1�����ս���
2���˻ؽ���';
comment on column EAM2.CZ_PGSC_JL.BEIZHU
  is '�Ƿ��Ѿ��ύ0��δ�ύ��1�����ύ';
comment on column EAM2.CZ_PGSC_JL.SFXXZ
  is '�Ƿ���֪ʶ������ 0���� 1����';
comment on column EAM2.CZ_PGSC_JL.BGWTBZ
  is '�������ⱸע';
comment on column EAM2.CZ_PGSC_JL.TJPC
  is '�ύ����';
comment on column EAM2.CZ_PGSC_JL.SCBZ
  is 'ɾ����־ ';
alter table EAM2.CZ_PGSC_JL
  add constraint PK_CZ_PGSC_JL primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_PGSC_SJK
prompt ==========================
prompt
create table EAM2.CZ_PGSC_SJK
(
  ID         VARCHAR2(32) not null,
  LXDH       VARCHAR2(300),
  SBSJ       DATE,
  JINGBANREN VARCHAR2(300),
  BCTJRQ     DATE,
  SCJL       VARCHAR2(1000),
  CJSJ       DATE,
  BIANHAO    VARCHAR2(300),
  SCXM       VARCHAR2(300),
  SCYD       VARCHAR2(300),
  JTYJ       VARCHAR2(1000),
  YJTS       NUMBER(8),
  BIAOTI     VARCHAR2(300),
  PGJG       VARCHAR2(300),
  C_BGLX     VARCHAR2(32),
  SHENGFEN   VARCHAR2(300),
  KPBH       VARCHAR2(300),
  ZCMC       VARCHAR2(300),
  ZCLB       VARCHAR2(32),
  JIZHUNRI   DATE,
  MUDI       VARCHAR2(1000),
  FANGFA     VARCHAR2(1000),
  JZLB       VARCHAR2(32),
  JZRZMYZ    NUMBER(20,4),
  JZRZMJZ    NUMBER(20,4),
  JZRJZCZMZ  NUMBER(20,4),
  PGZ        NUMBER(20,4),
  PGZJZ      NUMBER(20,4),
  ZJFD       NUMBER(7,4),
  SPJG       VARCHAR2(1000),
  SPSJ       DATE,
  SPWYJ      VARCHAR2(1000),
  BEIZHU     VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.CZ_PGSC_SJK
  is '�ʲ���������������ݿ�';
comment on column EAM2.CZ_PGSC_SJK.LXDH
  is '��ϵ����';
comment on column EAM2.CZ_PGSC_SJK.SBSJ
  is '�걨ʱ��';
comment on column EAM2.CZ_PGSC_SJK.JINGBANREN
  is '������';
comment on column EAM2.CZ_PGSC_SJK.BCTJRQ
  is '�����ύ����';
comment on column EAM2.CZ_PGSC_SJK.SCJL
  is '������';
comment on column EAM2.CZ_PGSC_SJK.CJSJ
  is '����ʱ��';
comment on column EAM2.CZ_PGSC_SJK.BIANHAO
  is '���';
comment on column EAM2.CZ_PGSC_SJK.SCXM
  is '�����Ŀ';
comment on column EAM2.CZ_PGSC_SJK.SCYD
  is '���Ҫ��';
comment on column EAM2.CZ_PGSC_SJK.JTYJ
  is '�������';
comment on column EAM2.CZ_PGSC_SJK.YJTS
  is '�������';
comment on column EAM2.CZ_PGSC_SJK.BIAOTI
  is '����';
comment on column EAM2.CZ_PGSC_SJK.PGJG
  is '��������';
comment on column EAM2.CZ_PGSC_SJK.C_BGLX
  is '��������';
comment on column EAM2.CZ_PGSC_SJK.SHENGFEN
  is 'ʡ��';
comment on column EAM2.CZ_PGSC_SJK.KPBH
  is '��Ƭ���';
comment on column EAM2.CZ_PGSC_SJK.ZCMC
  is '�ʲ�����';
comment on column EAM2.CZ_PGSC_SJK.ZCLB
  is '�ʲ����';
comment on column EAM2.CZ_PGSC_SJK.JIZHUNRI
  is '��׼��';
comment on column EAM2.CZ_PGSC_SJK.MUDI
  is 'Ŀ��';
comment on column EAM2.CZ_PGSC_SJK.FANGFA
  is '����';
comment on column EAM2.CZ_PGSC_SJK.JZLB
  is '��ֵ����';
comment on column EAM2.CZ_PGSC_SJK.JZRZMYZ
  is '��׼������ԭֵ';
comment on column EAM2.CZ_PGSC_SJK.JZRZMJZ
  is '��׼��/��������澻ֵ';
comment on column EAM2.CZ_PGSC_SJK.JZRJZCZMZ
  is '��׼�վ��ʲ�����ֵ';
comment on column EAM2.CZ_PGSC_SJK.PGZ
  is '����ֵ';
comment on column EAM2.CZ_PGSC_SJK.PGZJZ
  is '����ֵ-��ֵ��ԭֵ��';
comment on column EAM2.CZ_PGSC_SJK.ZJFD
  is '��������';
comment on column EAM2.CZ_PGSC_SJK.SPJG
  is '�������';
comment on column EAM2.CZ_PGSC_SJK.SPSJ
  is '����ʱ��';
comment on column EAM2.CZ_PGSC_SJK.SPWYJ
  is '����ί���';
comment on column EAM2.CZ_PGSC_SJK.BEIZHU
  is '��ע';
alter table EAM2.CZ_PGSC_SJK
  add constraint PK_CZ_PGSC_SJK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table CZ_PGSC_ZSKWH_CLD
prompt ================================
prompt
create table EAM2.CZ_PGSC_ZSKWH_CLD
(
  ID         VARCHAR2(32) not null,
  LIUCHENGID VARCHAR2(32),
  BIAOTI     VARCHAR2(300),
  BIANHAO    VARCHAR2(300),
  JHCD       VARCHAR2(10),
  NIGAOREN   VARCHAR2(32),
  NIGAORENXM VARCHAR2(300),
  NGBM       VARCHAR2(32),
  NGBMMC     VARCHAR2(300),
  LXDH       VARCHAR2(30),
  BLBM       VARCHAR2(300),
  BLBMBH     VARCHAR2(32),
  NGRQ       DATE,
  C_BGLX     VARCHAR2(32),
  LSSCCS     NUMBER(8),
  PGJG       VARCHAR2(300),
  PGJZR      DATE,
  PGZZ       NUMBER(20,4),
  ZCZMJZ     NUMBER(20,4),
  ZJZ        NUMBER(20,4),
  ZJFD       NUMBER(20,4),
  PGMD       VARCHAR2(1000),
  SCSJ       DATE,
  BCCLTJSJ   DATE,
  C_SCJL     VARCHAR2(32),
  CLDZT      VARCHAR2(10),
  SCSCCLD_ID VARCHAR2(32),
  LCMC       VARCHAR2(100),
  PGZCLB     VARCHAR2(10),
  FBLSJ      DATE,
  ZCZMYZ     NUMBER(20,4),
  JZRZMJZ    NUMBER(20,4)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_PGSC_ZSKWH_CLD
  is '����������鴦��
���֪ʶ�⴦��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ID
  is 'uuid ����';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LIUCHENGID
  is '����ID';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BIAOTI
  is '����';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BIANHAO
  is '���';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.JHCD
  is '�����̶�';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NIGAOREN
  is '�����';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NIGAORENXM
  is '���������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NGBM
  is '��岿��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LXDH
  is '��ϵ�绰';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BLBM
  is '������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BLBMBH
  is '�����ű��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NGRQ
  is '�������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.C_BGLX
  is '��������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LSSCCS
  is '��ʷ������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGJG
  is '��������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGJZR
  is '��׼��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGZZ
  is '������ֵ����Ԫ��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZCZMJZ
  is '�ʲ������ֵ����ֵ';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZJZ
  is '����ֵ����ֵ';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZJFD
  is '�������Ȼ���ֵ';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGMD
  is '����Ŀ��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.SCSJ
  is '���ʱ��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BCCLTJSJ
  is '��������ύʱ��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.C_SCJL
  is '0  ͨ�����������1
ͨ�������ο������2
��ͨ��
3���߱������������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.CLDZT
  is '����״̬  0��δ����   1�������� 2�������� 3�����˻�';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.SCSCCLD_ID
  is '�ϴ���鴦��ID';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LCMC
  is '��������';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGZCLB
  is '�����ʲ���� 0����Ӫ�Թ̲� 1��ʵ�����ʲ� 2 ��ί����ծ�� 3��ʵ�壨��Ȩ�� 4��ծȨ';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.FBLSJ
  is '������ʱ��';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZCZMYZ
  is '����ԭֵ����ֵ';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.JZRZMJZ
  is '��׼�������ֵ����';
alter table EAM2.CZ_PGSC_ZSKWH_CLD
  add constraint PK_CZ_PGSC_ZSKWH_CLD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_PGXX_LSB
prompt ==========================
prompt
create table EAM2.CZ_PGXX_LSB
(
  ID            VARCHAR2(32) not null,
  CZPGSCCLID    VARCHAR2(32),
  ZCID          VARCHAR2(32),
  JYGCZCBH      VARCHAR2(32),
  ZCMC          VARCHAR2(300),
  SFMC          VARCHAR2(300),
  ZCLB          VARCHAR2(10),
  ZCLBBM        VARCHAR2(10),
  ZKPBH         VARCHAR2(300),
  ZCYBYZ        NUMBER(20,4),
  ZCZMJZ        NUMBER(20,4),
  JINGZHI       NUMBER(20,4),
  DKZH          VARCHAR2(300),
  WDID          VARCHAR2(32),
  CZCMC         VARCHAR2(300),
  CSJZYR        VARCHAR2(300),
  CZCBH         VARCHAR2(300),
  CCFWZ         VARCHAR2(300),
  CZCLX         VARCHAR2(10),
  STID          VARCHAR2(32),
  STMC          VARCHAR2(300),
  STZCMC        VARCHAR2(300),
  STFSXXID      VARCHAR2(32),
  STZCBH        VARCHAR2(300),
  STTZCLX       VARCHAR2(10),
  STZCLB        VARCHAR2(300),
  STSJZYR       VARCHAR2(300),
  STCFWZ        VARCHAR2(300),
  PGJG          VARCHAR2(300),
  PINGGUZHI     NUMBER(20,4),
  C_JZLX        VARCHAR2(32),
  C_CZFS        VARCHAR2(32),
  PGFF          VARCHAR2(32),
  PGJZR         DATE,
  BEIZHU        VARCHAR2(1000),
  PGMD          VARCHAR2(1000),
  JZRZMJZ       NUMBER(20,4),
  PGZCLB        VARCHAR2(10),
  ZJZ           NUMBER(20,4),
  ZJFD          NUMBER(20,4),
  SPZT          VARCHAR2(10),
  BXE           NUMBER(20,4),
  XZLB_________ VARCHAR2(100),
  GQSTID        VARCHAR2(32),
  GQSTMC        VARCHAR2(300),
  GQSTSF        VARCHAR2(32),
  GQSTZL        VARCHAR2(100),
  GQSTGLBM      VARCHAR2(32),
  GQSTWTGLJG    VARCHAR2(32),
  GQJZRJZCZ     NUMBER(20,4),
  ZQID          VARCHAR2(32),
  ZQZL          VARCHAR2(10),
  ZWRMC         VARCHAR2(300),
  GRZYE         NUMBER(20,2),
  PGJZRZMZQZ    NUMBER(20,2),
  ZYZCID        VARCHAR2(32),
  ZYZCBH        VARCHAR2(300),
  ZYZCMC        VARCHAR2(300),
  ZYKPBH        VARCHAR2(300),
  ZYKPMC        VARCHAR2(300),
  ZYCCYZ        NUMBER(20,4),
  ZYBGDD        VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_PGXX_LSB.ID
  is 'uuid����';
comment on column EAM2.CZ_PGXX_LSB.CZPGSCCLID
  is '����������鴦��ID';
comment on column EAM2.CZ_PGXX_LSB.ZCID
  is '��Ӫ�̲�ID';
comment on column EAM2.CZ_PGXX_LSB.JYGCZCBH
  is '��Ӫ�̲��ʲ����';
comment on column EAM2.CZ_PGXX_LSB.ZCMC
  is '��Ӫ�̲��ʲ�����';
comment on column EAM2.CZ_PGXX_LSB.SFMC
  is '�ʲ�����ʡ������';
comment on column EAM2.CZ_PGXX_LSB.ZCLB
  is '�ʲ����';
comment on column EAM2.CZ_PGXX_LSB.ZCLBBM
  is '�ʲ�������';
comment on column EAM2.CZ_PGXX_LSB.ZKPBH
  is '����Ƭ���';
comment on column EAM2.CZ_PGXX_LSB.ZCYBYZ
  is '�ʲ�ԭ��ԭֵ';
comment on column EAM2.CZ_PGXX_LSB.ZCZMJZ
  is '�ʲ������ֵ�㣨���';
comment on column EAM2.CZ_PGXX_LSB.JINGZHI
  is '��ֵ��Ԫ��          ��ֵ-��ֵ׼��=����';
comment on column EAM2.CZ_PGXX_LSB.DKZH
  is '�����˺�';
comment on column EAM2.CZ_PGXX_LSB.WDID
  is 'ί�д���ID';
comment on column EAM2.CZ_PGXX_LSB.CZCMC
  is '��ծ��������';
comment on column EAM2.CZ_PGXX_LSB.CSJZYR
  is '��ծ���ʲ�ʵ��ռ����';
comment on column EAM2.CZ_PGXX_LSB.CZCBH
  is '��ծ���ʲ����';
comment on column EAM2.CZ_PGXX_LSB.CCFWZ
  is '��ծ���ڴ��λ��';
comment on column EAM2.CZ_PGXX_LSB.CZCLX
  is '��ծ���ʲ�����';
comment on column EAM2.CZ_PGXX_LSB.STID
  is 'ʵ��ID';
comment on column EAM2.CZ_PGXX_LSB.STMC
  is 'ʵ������';
comment on column EAM2.CZ_PGXX_LSB.STZCMC
  is 'ʵ�����ʲ�����';
comment on column EAM2.CZ_PGXX_LSB.STFSXXID
  is 'ʵ�帽����ϢID';
comment on column EAM2.CZ_PGXX_LSB.STZCBH
  is 'ʵ�����ʲ����';
comment on column EAM2.CZ_PGXX_LSB.STTZCLX
  is 'ʵ�����ʲ�����';
comment on column EAM2.CZ_PGXX_LSB.STZCLB
  is '�ʲ����';
comment on column EAM2.CZ_PGXX_LSB.STSJZYR
  is '�ʲ�ʵ��ռ����';
comment on column EAM2.CZ_PGXX_LSB.STCFWZ
  is 'ʵ�����ʲ����λ��';
comment on column EAM2.CZ_PGXX_LSB.PGJG
  is '��������';
comment on column EAM2.CZ_PGXX_LSB.PINGGUZHI
  is '����ֵ��Ԫ��';
comment on column EAM2.CZ_PGXX_LSB.C_JZLX
  is '��ֵ����';
comment on column EAM2.CZ_PGXX_LSB.C_CZFS
  is '���÷�ʽ';
comment on column EAM2.CZ_PGXX_LSB.PGFF
  is '��������';
comment on column EAM2.CZ_PGXX_LSB.PGJZR
  is '������׼��';
comment on column EAM2.CZ_PGXX_LSB.BEIZHU
  is '��ע';
comment on column EAM2.CZ_PGXX_LSB.PGMD
  is '����Ŀ��';
comment on column EAM2.CZ_PGXX_LSB.JZRZMJZ
  is '��׼�������ֵ��Ԫ��';
comment on column EAM2.CZ_PGXX_LSB.PGZCLB
  is '�����ʲ���� 0����Ӫ�Թ̲� 1��ʵ�����ʲ� 2 ί����ծ��';
comment on column EAM2.CZ_PGXX_LSB.ZJZ
  is '����ֵ������ֵ-�����ֵ=����ֵ��';
comment on column EAM2.CZ_PGXX_LSB.ZJFD
  is '�������ȣ�����ֵ/�����ֵ=�������ȣ�';
comment on column EAM2.CZ_PGXX_LSB.SPZT
  is '����״̬ 0��δ����   1�������� 2��������';
comment on column EAM2.CZ_PGXX_LSB.BXE
  is '���ֶ�';
comment on column EAM2.CZ_PGXX_LSB.XZLB_________
  is '�������ʲ����__________';
comment on column EAM2.CZ_PGXX_LSB.GQSTID
  is '��Ȩʵ��ID';
comment on column EAM2.CZ_PGXX_LSB.GQSTMC
  is '��Ȩʵ������';
comment on column EAM2.CZ_PGXX_LSB.GQSTSF
  is '��Ȩʵ��ʡ��';
comment on column EAM2.CZ_PGXX_LSB.GQSTZL
  is '��Ȩʵ������';
comment on column EAM2.CZ_PGXX_LSB.GQSTGLBM
  is '��Ȩʵ�������';
comment on column EAM2.CZ_PGXX_LSB.GQSTWTGLJG
  is '��Ȩʵ��ί�й������';
comment on column EAM2.CZ_PGXX_LSB.GQJZRJZCZ
  is '��׼�����澻�ʲ�ֵ';
comment on column EAM2.CZ_PGXX_LSB.ZQID
  is 'ծȨID';
comment on column EAM2.CZ_PGXX_LSB.ZQZL
  is 'ծȨ���� 0��ȫ��  1���Ŵ�ת�� 2�� ����ת��  3������
';
comment on column EAM2.CZ_PGXX_LSB.ZWRMC
  is 'ծ��������';
comment on column EAM2.CZ_PGXX_LSB.GRZYE
  is '����ծ���';
comment on column EAM2.CZ_PGXX_LSB.PGJZRZMZQZ
  is '������׼������ծȨֵ';
comment on column EAM2.CZ_PGXX_LSB.ZYZCID
  is '�����ʲ�ID';
comment on column EAM2.CZ_PGXX_LSB.ZYZCBH
  is '�����ʲ����';
comment on column EAM2.CZ_PGXX_LSB.ZYZCMC
  is '�����ʲ�����';
comment on column EAM2.CZ_PGXX_LSB.ZYKPBH
  is '�����ʲ���Ƭ���';
comment on column EAM2.CZ_PGXX_LSB.ZYKPMC
  is '�����ʲ���Ƭ����';
comment on column EAM2.CZ_PGXX_LSB.ZYCCYZ
  is '�����ʲ��Ʋ�ԭֵ';
comment on column EAM2.CZ_PGXX_LSB.ZYBGDD
  is '�����ʲ����ܵص�';
alter table EAM2.CZ_PGXX_LSB
  add constraint PK_CZ_PGXX_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_SCZSK
prompt =======================
prompt
create table EAM2.CZ_SCZSK
(
  ID    VARCHAR2(32) not null,
  PID   VARCHAR2(32),
  CODE  NUMBER,
  VALUE VARCHAR2(1000),
  SCBZ  VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_SCZSK
  is '���֪ʶ��';
comment on column EAM2.CZ_SCZSK.ID
  is 'uuid����';
comment on column EAM2.CZ_SCZSK.PID
  is 'PID';
comment on column EAM2.CZ_SCZSK.CODE
  is 'CODE';
comment on column EAM2.CZ_SCZSK.SCBZ
  is 'ɾ����־';
alter table EAM2.CZ_SCZSK
  add constraint PK_CZ_SCZSK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_SCZSK_BDXX
prompt ============================
prompt
create table EAM2.CZ_SCZSK_BDXX
(
  ID     VARCHAR2(32) not null,
  CLD_ID VARCHAR2(32),
  BDQFID VARCHAR2(32),
  BDHFID VARCHAR2(32),
  BDFS   VARCHAR2(20),
  BDQBH  VARCHAR2(300),
  BDHBH  VARCHAR2(300),
  BDQZ   VARCHAR2(1000),
  BDHZ   VARCHAR2(1000),
  ZSK_ID VARCHAR2(32),
  SPJG   VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_SCZSK_BDXX
  is '���֪ʶ��䶯��Ϣ';
comment on column EAM2.CZ_SCZSK_BDXX.ID
  is 'uuid������';
comment on column EAM2.CZ_SCZSK_BDXX.CLD_ID
  is '����ID';
comment on column EAM2.CZ_SCZSK_BDXX.BDQFID
  is '�䶯ǰ��ID';
comment on column EAM2.CZ_SCZSK_BDXX.BDHFID
  is '�䶯��ID';
comment on column EAM2.CZ_SCZSK_BDXX.BDFS
  is '�䶯��ʽ  �޸ģ�Ǩ�ƣ�ɾ��';
comment on column EAM2.CZ_SCZSK_BDXX.BDQBH
  is '�䶯ǰ���';
comment on column EAM2.CZ_SCZSK_BDXX.BDHBH
  is '�䶯����';
comment on column EAM2.CZ_SCZSK_BDXX.BDQZ
  is '�䶯ǰֵ';
comment on column EAM2.CZ_SCZSK_BDXX.BDHZ
  is '�䶯��ֵ';
comment on column EAM2.CZ_SCZSK_BDXX.ZSK_ID
  is 'ԭʼ֪ʶ��ID';
comment on column EAM2.CZ_SCZSK_BDXX.SPJG
  is '�������  δͨ��   ͨ��';
alter table EAM2.CZ_SCZSK_BDXX
  add constraint PK_CZ_SCZSK_BDXX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_SCZSK_HEAD
prompt ============================
prompt
create table EAM2.CZ_SCZSK_HEAD
(
  ID         VARCHAR2(32) not null,
  LIUCHENGID VARCHAR2(32),
  BIAOTI     VARCHAR2(300),
  BIANHAO    VARCHAR2(300),
  JHCD       VARCHAR2(10),
  NIGAOREN   VARCHAR2(32),
  NIGAORENXM VARCHAR2(300),
  NGBM       VARCHAR2(32),
  NGBMMC     VARCHAR2(300),
  LXDH       VARCHAR2(30),
  BLBM       VARCHAR2(300),
  BLBMBH     VARCHAR2(32),
  NGRQ       DATE,
  SPRID      VARCHAR2(32),
  SPRMC      VARCHAR2(100),
  SPRQ       DATE,
  BDZT       CHAR(1),
  SHEETTYPE  VARCHAR2(40)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_SCZSK_HEAD
  is '���֪ʶ�⴦��';
comment on column EAM2.CZ_SCZSK_HEAD.ID
  is 'uuid ����';
comment on column EAM2.CZ_SCZSK_HEAD.LIUCHENGID
  is '����ID';
comment on column EAM2.CZ_SCZSK_HEAD.BIAOTI
  is '����';
comment on column EAM2.CZ_SCZSK_HEAD.BIANHAO
  is '���';
comment on column EAM2.CZ_SCZSK_HEAD.JHCD
  is '�����̶�';
comment on column EAM2.CZ_SCZSK_HEAD.NIGAOREN
  is '�����';
comment on column EAM2.CZ_SCZSK_HEAD.NIGAORENXM
  is '���������';
comment on column EAM2.CZ_SCZSK_HEAD.NGBM
  is '��岿��';
comment on column EAM2.CZ_SCZSK_HEAD.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_SCZSK_HEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.CZ_SCZSK_HEAD.BLBM
  is '������';
comment on column EAM2.CZ_SCZSK_HEAD.BLBMBH
  is '�����ű��';
comment on column EAM2.CZ_SCZSK_HEAD.NGRQ
  is '�������';
comment on column EAM2.CZ_SCZSK_HEAD.SPRID
  is '������';
comment on column EAM2.CZ_SCZSK_HEAD.SPRMC
  is '����������';
comment on column EAM2.CZ_SCZSK_HEAD.SPRQ
  is '��������';
comment on column EAM2.CZ_SCZSK_HEAD.BDZT
  is '��״̬0δ�ύ1���ύ2������';
comment on column EAM2.CZ_SCZSK_HEAD.SHEETTYPE
  is '������';
alter table EAM2.CZ_SCZSK_HEAD
  add constraint PK_CZ_SCZSK_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_SCZSK_LSB
prompt ===========================
prompt
create table EAM2.CZ_SCZSK_LSB
(
  ID     VARCHAR2(32) not null,
  CLD_ID VARCHAR2(32),
  PID    VARCHAR2(32),
  CODE   NUMBER,
  VALUE  VARCHAR2(1000),
  SCBZ   VARCHAR2(10),
  ZSK_ID VARCHAR2(32),
  ZJBZ   VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_SCZSK_LSB
  is '���֪ʶ����ʱ��';
comment on column EAM2.CZ_SCZSK_LSB.ID
  is 'uuid������';
comment on column EAM2.CZ_SCZSK_LSB.CLD_ID
  is '����ID';
comment on column EAM2.CZ_SCZSK_LSB.PID
  is 'PID';
comment on column EAM2.CZ_SCZSK_LSB.CODE
  is 'CODE';
comment on column EAM2.CZ_SCZSK_LSB.VALUE
  is 'VALUE';
comment on column EAM2.CZ_SCZSK_LSB.SCBZ
  is 'ɾ����־';
comment on column EAM2.CZ_SCZSK_LSB.ZSK_ID
  is '֪ʶ��ID';
comment on column EAM2.CZ_SCZSK_LSB.ZJBZ
  is '���ӱ�ʶ';
alter table EAM2.CZ_SCZSK_LSB
  add constraint PK_CZ_SCZSK_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_STCZTZ
prompt ========================
prompt
create table EAM2.CZ_STCZTZ
(
  ID             VARCHAR2(32) not null,
  LC_ID          VARCHAR2(32),
  CZXMMC         VARCHAR2(300),
  BIANHAO        VARCHAR2(300),
  CHENGSONG      VARCHAR2(300),
  JHCD           VARCHAR2(10),
  NGBMMC         VARCHAR2(300),
  NGBM           VARCHAR2(32),
  NGRXM          VARCHAR2(300),
  NGR            VARCHAR2(32),
  NGRQ           DATE,
  LXDH           VARCHAR2(300),
  CZSBFS         VARCHAR2(30),
  HQBM           VARCHAR2(300),
  STID           VARCHAR2(32),
  ZCBH           VARCHAR2(300),
  STMC           VARCHAR2(300),
  STSCSF         VARCHAR2(400),
  STXZ           VARCHAR2(1000),
  STLX           VARCHAR2(10),
  STYWYXZC       VARCHAR2(30),
  STYWRY         VARCHAR2(30),
  DJTSTYZR       VARCHAR2(30),
  FZJE           NUMBER(20,4),
  RYAZFYSFXJTDF  VARCHAR2(30),
  DFJE           NUMBER(20,4),
  GSZMNSFYYSFZJE VARCHAR2(30),
  YJFZJE         NUMBER(20,4),
  AZRS           NUMBER(8),
  AZFY           NUMBER(20,4),
  AZSM           VARCHAR2(1000),
  C_CZFS         VARCHAR2(32),
  JYDX           VARCHAR2(1000),
  ZCPGZ          NUMBER(20,4),
  STPGZ          NUMBER(20,4),
  PGJG           VARCHAR2(300),
  ZZC            NUMBER(20,4),
  FUZHAI         NUMBER(20,4),
  GUBEN          VARCHAR2(300),
  JZC            NUMBER(20,4),
  SHOURU         NUMBER(20,4),
  JLR            NUMBER(20,4),
  SFSH           VARCHAR2(10),
  LCMC           VARCHAR2(300),
  CLDZT          VARCHAR2(10),
  CBCS           NUMBER(8),
  HGSCCS         NUMBER(8),
  SBRQ           DATE,
  SLXH           VARCHAR2(300),
  SCFAXXID       VARCHAR2(32),
  BEIZHU         VARCHAR2(1000),
  TZYWLX         VARCHAR2(300),
  ZMZCZE         NUMBER(20,4),
  ZMZCFZ         NUMBER(20,4),
  FBLSJ          DATE,
  TZFS           VARCHAR2(32),
  TZJE           NUMBER(20,2),
  CZFS           VARCHAR2(32),
  CZJE           NUMBER(20,2),
  GQGC           VARCHAR2(2000),
  ZZQK           VARCHAR2(2000),
  BGDZ           VARCHAR2(300),
  STRS           INTEGER,
  ZMTZ           NUMBER(20,4),
  C_WTGLJG       VARCHAR2(32),
  C_GLBM         VARCHAR2(32),
  CZYGSNSQK      VARCHAR2(300),
  ZYYW           VARCHAR2(1000),
  HQBMID         VARCHAR2(300),
  C_FALB         VARCHAR2(10),
  FAFL           VARCHAR2(10),
  SQFYZJE        NUMBER(20,4),
  SPFYZJE        NUMBER(20,4)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_STCZTZ
  is 'ʵ�����崦����Ա���ü�ʵ��м�Ͷ��';
comment on column EAM2.CZ_STCZTZ.ID
  is 'uuid ����';
comment on column EAM2.CZ_STCZTZ.LC_ID
  is '����ID';
comment on column EAM2.CZ_STCZTZ.CZXMMC
  is '������Ŀ����';
comment on column EAM2.CZ_STCZTZ.BIANHAO
  is '���';
comment on column EAM2.CZ_STCZTZ.CHENGSONG
  is '����';
comment on column EAM2.CZ_STCZTZ.JHCD
  is '�����̶�    һ�� ���� �� �ؼ�';
comment on column EAM2.CZ_STCZTZ.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_STCZTZ.NGBM
  is '��岿��';
comment on column EAM2.CZ_STCZTZ.NGRXM
  is '���������';
comment on column EAM2.CZ_STCZTZ.NGR
  is '�����';
comment on column EAM2.CZ_STCZTZ.NGRQ
  is '�������';
comment on column EAM2.CZ_STCZTZ.LXDH
  is '��ϵ�绰';
comment on column EAM2.CZ_STCZTZ.CZSBFS
  is '�����걨��ʽ    �״Σ� ����� �ر�';
comment on column EAM2.CZ_STCZTZ.HQBM
  is '��ǩ���ţ���Ա���ã�';
comment on column EAM2.CZ_STCZTZ.STID
  is 'ʵ��ID';
comment on column EAM2.CZ_STCZTZ.ZCBH
  is '�ʲ����';
comment on column EAM2.CZ_STCZTZ.STMC
  is 'ʵ������';
comment on column EAM2.CZ_STCZTZ.STSCSF
  is 'ʵ������ʡ��';
comment on column EAM2.CZ_STCZTZ.STXZ
  is 'ʵ����״';
comment on column EAM2.CZ_STCZTZ.STLX
  is 'ʵ�����ͣ�0����ѯ��ʵ��1������ѯ��ʵ��2���ⲿʵ��';
comment on column EAM2.CZ_STCZTZ.STYWYXZC
  is 'ʵ��������Ч�ʲ� �� ����';
comment on column EAM2.CZ_STCZTZ.STYWRY
  is 'ʵ��������Ա';
comment on column EAM2.CZ_STCZTZ.DJTSTYZR
  is '�Խ�Ͷ�Ƿ��и�ծ   �� ����';
comment on column EAM2.CZ_STCZTZ.FZJE
  is '��ծ���';
comment on column EAM2.CZ_STCZTZ.RYAZFYSFXJTDF
  is '��Ա���÷����Ƿ��轨Ͷ�渶  �ǣ���';
comment on column EAM2.CZ_STCZTZ.DFJE
  is '�渶���';
comment on column EAM2.CZ_STCZTZ.GSZMNSFYYSFZJE
  is '��˾�������Ƿ���Ԥ�Ƹ�ծ���  �� ��';
comment on column EAM2.CZ_STCZTZ.YJFZJE
  is 'Ԥ�Ƹ�ծ���';
comment on column EAM2.CZ_STCZTZ.AZRS
  is '��������';
comment on column EAM2.CZ_STCZTZ.AZFY
  is '�����ܷ���';
comment on column EAM2.CZ_STCZTZ.AZSM
  is '����˵��';
comment on column EAM2.CZ_STCZTZ.C_CZFS
  is '���÷�ʽ';
comment on column EAM2.CZ_STCZTZ.JYDX
  is '���׶���';
comment on column EAM2.CZ_STCZTZ.ZCPGZ
  is '�ʲ�����ֵ';
comment on column EAM2.CZ_STCZTZ.STPGZ
  is 'ʵ������ֵ';
comment on column EAM2.CZ_STCZTZ.PGJG
  is '��������';
comment on column EAM2.CZ_STCZTZ.ZZC
  is '���ʲ�';
comment on column EAM2.CZ_STCZTZ.FUZHAI
  is '��ծ';
comment on column EAM2.CZ_STCZTZ.GUBEN
  is '�ɱ�';
comment on column EAM2.CZ_STCZTZ.JZC
  is '���ʲ�';
comment on column EAM2.CZ_STCZTZ.SHOURU
  is '����';
comment on column EAM2.CZ_STCZTZ.JLR
  is '������';
comment on column EAM2.CZ_STCZTZ.SFSH
  is '�Ƿ����ϻ�  �� ��';
comment on column EAM2.CZ_STCZTZ.LCMC
  is '��������';
comment on column EAM2.CZ_STCZTZ.CLDZT
  is '����״̬  0��δ����   1�������� 2�������� 3�����˻�';
comment on column EAM2.CZ_STCZTZ.CBCS
  is '�ر�����';
comment on column EAM2.CZ_STCZTZ.HGSCCS
  is '�Ϲ�������';
comment on column EAM2.CZ_STCZTZ.SBRQ
  is '�걨����';
comment on column EAM2.CZ_STCZTZ.SLXH
  is '�������';
comment on column EAM2.CZ_STCZTZ.SCFAXXID
  is '�ϴη�����ϢID';
comment on column EAM2.CZ_STCZTZ.BEIZHU
  is '��ע';
comment on column EAM2.CZ_STCZTZ.TZYWLX
  is 'Ͷ��ҵ������';
comment on column EAM2.CZ_STCZTZ.ZMZCZE
  is '�����ʲ��ܶ�';
comment on column EAM2.CZ_STCZTZ.ZMZCFZ
  is '�����ʲ���ծ';
comment on column EAM2.CZ_STCZTZ.FBLSJ
  is '������ʱ��';
comment on column EAM2.CZ_STCZTZ.TZFS
  is 'Ͷ�ʷ�ʽ';
comment on column EAM2.CZ_STCZTZ.TZJE
  is 'Ͷ�ʽ��';
comment on column EAM2.CZ_STCZTZ.CZFS
  is '���ʷ�ʽ';
comment on column EAM2.CZ_STCZTZ.CZJE
  is '���ʽ��';
comment on column EAM2.CZ_STCZTZ.GQGC
  is '��Ȩ����';
comment on column EAM2.CZ_STCZTZ.ZZQK
  is '�������';
comment on column EAM2.CZ_STCZTZ.BGDZ
  is '�칫��ַ';
comment on column EAM2.CZ_STCZTZ.STRS
  is 'ʵ����������';
comment on column EAM2.CZ_STCZTZ.ZMTZ
  is '����Ͷ��(Ԫ)';
comment on column EAM2.CZ_STCZTZ.C_WTGLJG
  is 'ί�й������';
comment on column EAM2.CZ_STCZTZ.C_GLBM
  is 'ʵ�������ֵ��';
comment on column EAM2.CZ_STCZTZ.CZYGSNSQK
  is '�����빤���������';
comment on column EAM2.CZ_STCZTZ.ZYYW
  is '��Ӫҵ��';
comment on column EAM2.CZ_STCZTZ.HQBMID
  is '��ǩ����ID';
comment on column EAM2.CZ_STCZTZ.C_FALB
  is '����Ͷ�ʷ������';
comment on column EAM2.CZ_STCZTZ.FAFL
  is '�������� 0���ʲ����� 1���м�Ͷ��';
comment on column EAM2.CZ_STCZTZ.SQFYZJE
  is '��������ܽ��';
comment on column EAM2.CZ_STCZTZ.SPFYZJE
  is '���������ܽ��';
alter table EAM2.CZ_STCZTZ
  add constraint PK_CZ_STCZTZ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_WNB
prompt =====================
prompt
create table EAM2.CZ_WNB
(
  WNB_ID  VARCHAR2(100) not null,
  XM_ID   VARCHAR2(100),
  ZC_ID   VARCHAR2(100),
  ZC_CODE VARCHAR2(100),
  ZD_NAME VARCHAR2(1000),
  COL1    VARCHAR2(1000),
  COL2    VARCHAR2(1000),
  COL3    VARCHAR2(1000),
  COL4    VARCHAR2(1000),
  COL5    VARCHAR2(1000),
  COL6    VARCHAR2(1000),
  COL7    VARCHAR2(1000),
  COL8    VARCHAR2(1000),
  COL9    VARCHAR2(1000),
  COL10   VARCHAR2(1000),
  COL11   VARCHAR2(1000),
  COL12   VARCHAR2(1000),
  COL13   VARCHAR2(1000),
  COL14   VARCHAR2(1000),
  COL15   VARCHAR2(1000),
  COL16   VARCHAR2(1000),
  COL17   VARCHAR2(1000),
  COL18   VARCHAR2(1000),
  COL19   VARCHAR2(1000),
  COL20   VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.CZ_WNB
  add constraint PK_WNB_ID primary key (WNB_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_WNBCOL
prompt ========================
prompt
create table EAM2.CZ_WNBCOL
(
  WNBCOLID   VARCHAR2(32) not null,
  ZD_CODE    VARCHAR2(100),
  ZD_NAME    VARCHAR2(100),
  COL_ID     VARCHAR2(100) not null,
  COL_NAME   VARCHAR2(100),
  COL_TYPE   VARCHAR2(100),
  INPUT_TYPE VARCHAR2(100),
  INPUT_SIZE VARCHAR2(100),
  ISLIST     CHAR(1)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_WNBCOL.WNBCOLID
  is '������Ǩ��Hibernate��ʹ��ϰ�ߣ�����һ��Ψһ����';

prompt
prompt Creating table CZ_XMJA
prompt ======================
prompt
create table EAM2.CZ_XMJA
(
  ID       VARCHAR2(32) not null,
  LC_ID    VARCHAR2(32),
  BIANHAO  VARCHAR2(300),
  BIAOTI   VARCHAR2(300),
  JHCD     VARCHAR2(32),
  NGBMMC   VARCHAR2(300),
  NGBM     VARCHAR2(32),
  NGRXM    VARCHAR2(300),
  NGR      VARCHAR2(32),
  NGRQ     DATE,
  LXDH     VARCHAR2(300),
  BEIZHU   VARCHAR2(1000),
  CHENGSON VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.CZ_XMJA.JHCD
  is 'һ�� ���� �� �ؼ�';
alter table EAM2.CZ_XMJA
  add constraint PK_CZ_XMJA primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table CZ_XMJA_BODY
prompt ===========================
prompt
create table EAM2.CZ_XMJA_BODY
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  XM_ID   VARCHAR2(32),
  SJCZSR  NUMBER(20,4),
  SJCZFY  NUMBER(20,4),
  SFQSXY  VARCHAR2(100),
  XYQSSJ  DATE,
  KPSFJS  VARCHAR2(100),
  FYSFJQ  VARCHAR2(100),
  SFYYLWT VARCHAR2(100),
  BEIZHU  VARCHAR2(1000),
  SQRQ    DATE,
  SPZT    VARCHAR2(100),
  SFQBJA  VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.CZ_XMJA_BODY.CLD_ID
  is '�᰸����id';
comment on column EAM2.CZ_XMJA_BODY.XM_ID
  is '������Ŀ��Ϣ��CZ_XM_XX��id';
comment on column EAM2.CZ_XMJA_BODY.SJCZSR
  is 'ʵ�ʴ�������';
comment on column EAM2.CZ_XMJA_BODY.SJCZFY
  is 'ʵ�ʴ��÷���';
comment on column EAM2.CZ_XMJA_BODY.SFQSXY
  is '�Ƿ�ǩ��ת��Э��';
comment on column EAM2.CZ_XMJA_BODY.XYQSSJ
  is 'Э��ǩ�����Ŀ���ʱ��';
comment on column EAM2.CZ_XMJA_BODY.KPSFJS
  is '��Ƭ�Ƿ����';
comment on column EAM2.CZ_XMJA_BODY.FYSFJQ
  is '�����Ƿ����';
comment on column EAM2.CZ_XMJA_BODY.SFYYLWT
  is '�Ƿ�����������';
comment on column EAM2.CZ_XMJA_BODY.BEIZHU
  is '��ע';
comment on column EAM2.CZ_XMJA_BODY.SQRQ
  is '�������ڣ�������ڣ�';
comment on column EAM2.CZ_XMJA_BODY.SPZT
  is '����״̬��0��δ������1�������У�2����������';
comment on column EAM2.CZ_XMJA_BODY.SFQBJA
  is '�Ƿ�ȫ���᰸';
alter table EAM2.CZ_XMJA_BODY
  add constraint PK_CZ_XMJA_BODY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XMJA_HEAD
prompt ===========================
prompt
create table EAM2.CZ_XMJA_HEAD
(
  ID         VARCHAR2(32) not null,
  LIUCHENGID VARCHAR2(32),
  BIANHAO    VARCHAR2(300),
  BIAOTI     VARCHAR2(300),
  JHCD       VARCHAR2(32),
  NGBMMC     VARCHAR2(300),
  NGBM       VARCHAR2(32),
  NIGAORENXM VARCHAR2(300),
  NIGAOREN   VARCHAR2(32),
  NGRQ       DATE,
  LXDH       VARCHAR2(300),
  BEIZHU     VARCHAR2(1000),
  CHENGSON   VARCHAR2(300),
  LCMC       VARCHAR2(100),
  CLDZT      VARCHAR2(100),
  HQBM       VARCHAR2(300),
  HQBMID     VARCHAR2(300),
  JAXMLX     VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_XMJA_HEAD
  is '������Ŀ����᰸��ͷ
Ͷ����Ŀ���������ͷ
Ͷ����Ŀ�����ͷ';
comment on column EAM2.CZ_XMJA_HEAD.ID
  is 'uuid ����';
comment on column EAM2.CZ_XMJA_HEAD.LIUCHENGID
  is '����ID';
comment on column EAM2.CZ_XMJA_HEAD.BIANHAO
  is '���';
comment on column EAM2.CZ_XMJA_HEAD.BIAOTI
  is '����';
comment on column EAM2.CZ_XMJA_HEAD.JHCD
  is '�����̶�';
comment on column EAM2.CZ_XMJA_HEAD.NGBMMC
  is '��岿������';
comment on column EAM2.CZ_XMJA_HEAD.NGBM
  is '��岿��';
comment on column EAM2.CZ_XMJA_HEAD.NIGAORENXM
  is '���������';
comment on column EAM2.CZ_XMJA_HEAD.NIGAOREN
  is '�����';
comment on column EAM2.CZ_XMJA_HEAD.NGRQ
  is '�������';
comment on column EAM2.CZ_XMJA_HEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.CZ_XMJA_HEAD.BEIZHU
  is 'V';
comment on column EAM2.CZ_XMJA_HEAD.CHENGSON
  is '����';
comment on column EAM2.CZ_XMJA_HEAD.LCMC
  is '��������';
comment on column EAM2.CZ_XMJA_HEAD.CLDZT
  is '����״̬  0��δ����   1�������� 2�������� ';
comment on column EAM2.CZ_XMJA_HEAD.HQBM
  is '�й���Ͷ��ǩ����';
comment on column EAM2.CZ_XMJA_HEAD.HQBMID
  is '��ǩ����ID';
comment on column EAM2.CZ_XMJA_HEAD.JAXMLX
  is '�᰸��Ŀ���� 0��ͨ���ʲ�����  1��ʵ�壨ʵ�����崦�ú�ʵ����Ա���ã�';
alter table EAM2.CZ_XMJA_HEAD
  add constraint PK_CZ_XMJA_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XMXX_LSB
prompt ==========================
prompt
create table EAM2.CZ_XMXX_LSB
(
  ID        VARCHAR2(32) not null,
  BIANHAO   VARCHAR2(300),
  CZXMMC    VARCHAR2(300),
  HBR       VARCHAR2(32),
  HBRXM     VARCHAR2(300),
  JCSLXR    VARCHAR2(32),
  JCSLXRXM  VARCHAR2(300),
  YJHZR     VARCHAR2(32),
  YJHZRXM   VARCHAR2(300),
  HY_ID     VARCHAR2(32),
  SPJL      VARCHAR2(10),
  SFBA      VARCHAR2(10),
  ZHUANGTAI VARCHAR2(10),
  FENLEI    VARCHAR2(100),
  SLXH      VARCHAR2(300),
  SBRQ      DATE,
  PXXH      INTEGER,
  CLD_ID    VARCHAR2(32),
  YJHZRBMID VARCHAR2(32),
  YJHZRBMMC VARCHAR2(300),
  CZSX      VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_XMXX_LSB
  is '����Ͷ����Ŀ��Ϣ��ʱ��';
comment on column EAM2.CZ_XMXX_LSB.ID
  is 'uuid������';
comment on column EAM2.CZ_XMXX_LSB.BIANHAO
  is '���';
comment on column EAM2.CZ_XMXX_LSB.CZXMMC
  is '������Ŀ����';
comment on column EAM2.CZ_XMXX_LSB.HBR
  is '�㱨��';
comment on column EAM2.CZ_XMXX_LSB.HBRXM
  is '�㱨������';
comment on column EAM2.CZ_XMXX_LSB.JCSLXR
  is '�������ϯ��';
comment on column EAM2.CZ_XMXX_LSB.JCSLXRXM
  is '�������ϯ������';
comment on column EAM2.CZ_XMXX_LSB.YJHZR
  is '���������';
comment on column EAM2.CZ_XMXX_LSB.YJHZRXM
  is '�������������';
comment on column EAM2.CZ_XMXX_LSB.HY_ID
  is '������ϢID';
comment on column EAM2.CZ_XMXX_LSB.SPJL
  is '�������� 0����ͬ��
1��ͬ��';
comment on column EAM2.CZ_XMXX_LSB.SFBA
  is '�Ƿ񱸰� 0����
1����';
comment on column EAM2.CZ_XMXX_LSB.ZHUANGTAI
  is '״̬
0��δ�ϻ�
1���ϻ���
2���ϻ����
3: ίԱ�ύ����У�����ίԱ���Ϻ�
4: ίԱ�ύ�����ϣ����е�ίԱ�ύ�����
5: �������ύ����У����췢�͵��������������ڣ�
6: ��������У��������ύ�����ϣ�';
comment on column EAM2.CZ_XMXX_LSB.FENLEI
  is '����  0����Ӫ�Թ̲����� 1��ʵ�����ʲ� 2��ί����ծ�� 3��ʵ�����崦�� 4��ʵ����Ա���� 5���м�Ͷ��';
comment on column EAM2.CZ_XMXX_LSB.SLXH
  is '�������';
comment on column EAM2.CZ_XMXX_LSB.SBRQ
  is '�걨����';
comment on column EAM2.CZ_XMXX_LSB.PXXH
  is '��Ŀ���';
comment on column EAM2.CZ_XMXX_LSB.CLD_ID
  is '������Ŀ�Ĵ���Id';
comment on column EAM2.CZ_XMXX_LSB.YJHZRBMID
  is '�����������������ID';
comment on column EAM2.CZ_XMXX_LSB.YJHZRBMMC
  is '���������������������';
comment on column EAM2.CZ_XMXX_LSB.CZSX
  is '����ʱ��';
alter table EAM2.CZ_XMXX_LSB
  add constraint PK_CZ_XMXX_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XM_SPW_YJ
prompt ===========================
prompt
create table EAM2.CZ_XM_SPW_YJ
(
  ID       VARCHAR2(32) not null,
  XM_ID    VARCHAR2(32),
  SPWY     VARCHAR2(32),
  SPWYXM   VARCHAR2(300),
  SFTJSPYJ VARCHAR2(10),
  SPYJJY   VARCHAR2(1000),
  QTQK     VARCHAR2(1000),
  TYYJSJ   DATE,
  SFWZCR   VARCHAR2(10),
  TONGYI   NUMBER,
  BUTONGYI NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XM_SPW_YJ_0619
prompt ================================
prompt
create table EAM2.CZ_XM_SPW_YJ_0619
(
  ID       VARCHAR2(32) not null,
  XM_ID    VARCHAR2(32),
  SPWY     VARCHAR2(32),
  SPWYXM   VARCHAR2(300),
  SFTJSPYJ VARCHAR2(10),
  SPYJJY   VARCHAR2(1000),
  QTQK     VARCHAR2(1000),
  TYYJSJ   DATE,
  SFWZCR   VARCHAR2(10),
  TONGYI   NUMBER,
  BUTONGYI NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XM_SPW_YJ_0620
prompt ================================
prompt
create table EAM2.CZ_XM_SPW_YJ_0620
(
  ID       VARCHAR2(32) not null,
  XM_ID    VARCHAR2(32),
  SPWY     VARCHAR2(32),
  SPWYXM   VARCHAR2(300),
  SFTJSPYJ VARCHAR2(10),
  SPYJJY   VARCHAR2(1000),
  QTQK     VARCHAR2(1000),
  TYYJSJ   DATE,
  SFWZCR   VARCHAR2(10),
  TONGYI   NUMBER,
  BUTONGYI NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XM_SPW_YJ_BAK
prompt ===============================
prompt
create table EAM2.CZ_XM_SPW_YJ_BAK
(
  ID       VARCHAR2(32) not null,
  XM_ID    VARCHAR2(32),
  SPWY     VARCHAR2(32),
  SPWYXM   VARCHAR2(300),
  SFTJSPYJ VARCHAR2(10),
  SPYJJY   VARCHAR2(1000),
  QTQK     VARCHAR2(1000),
  TYYJSJ   DATE,
  SFWZCR   VARCHAR2(10),
  TONGYI   NUMBER,
  BUTONGYI NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_XM_SPW_YJ_BAK
  is '��Ŀ����ίԱ�����Ϣ';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.XM_ID
  is '������ĿID';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SPWY
  is '����ίԱ��������';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SPWYXM
  is '����ίԱ������������';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SFTJSPYJ
  is '�Ƿ��ύ�������  0����
1����';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SPYJJY
  is '��������ͽ���';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.QTQK
  is '�������';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.TYYJSJ
  is '�ύ���ʱ��';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SFWZCR
  is '�Ƿ�Ϊ������ 0����
1����';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.TONGYI
  is 'ͬ��';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.BUTONGYI
  is '��ͬ��';
alter table EAM2.CZ_XM_SPW_YJ_BAK
  add constraint PK_CZ_XM_SPW_YJ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_XM_XX
prompt =======================
prompt
create table EAM2.CZ_XM_XX
(
  ID        VARCHAR2(32) not null,
  BIANHAO   VARCHAR2(300),
  CZXMMC    VARCHAR2(300),
  HBR       VARCHAR2(32),
  HBRXM     VARCHAR2(300),
  JCSLXR    VARCHAR2(32),
  JCSLXRXM  VARCHAR2(300),
  YJHZR     VARCHAR2(32),
  YJHZRXM   VARCHAR2(300),
  HY_ID     VARCHAR2(32),
  SPJL      VARCHAR2(10),
  SFBA      VARCHAR2(10),
  ZHUANGTAI VARCHAR2(10),
  FENLEI    VARCHAR2(100),
  FWWH      VARCHAR2(300),
  SLXH      VARCHAR2(300),
  SBRQ      DATE,
  CLD_ID    VARCHAR2(32),
  XMLSB     VARCHAR2(32),
  JACLD_ID  VARCHAR2(32),
  CZSX      VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_XM_XX
  is '������Ŀ��Ϣ��';
comment on column EAM2.CZ_XM_XX.ID
  is 'uuid������';
comment on column EAM2.CZ_XM_XX.BIANHAO
  is '���';
comment on column EAM2.CZ_XM_XX.CZXMMC
  is '������Ŀ����';
comment on column EAM2.CZ_XM_XX.HBR
  is '�㱨��';
comment on column EAM2.CZ_XM_XX.HBRXM
  is '�㱨������';
comment on column EAM2.CZ_XM_XX.JCSLXR
  is '�������ϯ��';
comment on column EAM2.CZ_XM_XX.JCSLXRXM
  is '�������ϯ������';
comment on column EAM2.CZ_XM_XX.YJHZR
  is '���������';
comment on column EAM2.CZ_XM_XX.YJHZRXM
  is '�������������';
comment on column EAM2.CZ_XM_XX.HY_ID
  is '������ϢID';
comment on column EAM2.CZ_XM_XX.SPJL
  is '�������� 0����ͬ��
1��ͬ��';
comment on column EAM2.CZ_XM_XX.SFBA
  is '�Ƿ񱸰� 0����
1����';
comment on column EAM2.CZ_XM_XX.ZHUANGTAI
  is '״̬ 0�����÷���δִ��
1�����÷���ִ����
2���ѽ᰸


';
comment on column EAM2.CZ_XM_XX.FENLEI
  is '���� 0����Ӫ�Թ̲�����
1��ʵ�����ʲ�
2��ί����ծ��
3���м�Ͷ��';
comment on column EAM2.CZ_XM_XX.FWWH
  is '�����ĺ�';
comment on column EAM2.CZ_XM_XX.SLXH
  is '�������';
comment on column EAM2.CZ_XM_XX.SBRQ
  is '�걨����';
comment on column EAM2.CZ_XM_XX.CLD_ID
  is '������Ŀ�Ĵ���Id';
comment on column EAM2.CZ_XM_XX.XMLSB
  is '��Ŀ��ʱ��id';
comment on column EAM2.CZ_XM_XX.CZSX
  is '����ʱ��';
alter table EAM2.CZ_XM_XX
  add constraint PK_CZ_XM_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CZ_ZC_XX
prompt =======================
prompt
create table EAM2.CZ_ZC_XX
(
  ID               VARCHAR2(32) not null,
  CLD_ID           VARCHAR2(32),
  ZCLB             VARCHAR2(10),
  AZCID            VARCHAR2(32),
  AZCBH            VARCHAR2(300),
  AZCMC            VARCHAR2(300),
  AZKPBH           VARCHAR2(300),
  AZKPMC           VARCHAR2(300),
  AZCGLBM          VARCHAR2(32),
  AZCGLBMMC        VARCHAR2(300),
  AZCSYBM          VARCHAR2(32),
  AZCSYBMMC        VARCHAR2(300),
  AZMYZ            NUMBER(20,4),
  AZMJZ            NUMBER(20,4),
  APGJZ            NUMBER(20,4),
  AC_ZCDQ          VARCHAR2(30),
  AC_JYFL          VARCHAR2(30),
  AZYNX            VARCHAR2(100),
  AQYRQ            VARCHAR2(100),
  AYSYNX           VARCHAR2(100),
  ASKSYNX          VARCHAR2(100),
  AC_YT            VARCHAR2(30),
  AC_ZCZC          VARCHAR2(30),
  AC_JBHBH         VARCHAR2(32),
  AC_EJFHBH        VARCHAR2(32),
  AC_FYZL          VARCHAR2(32),
  ABLSM            VARCHAR2(1000),
  ASQJE            NUMBER(20,4),
  ASDJE            NUMBER(20,4),
  ASQFYMX          VARCHAR2(2000),
  JYDX             VARCHAR2(30),
  ZLQSRQ           DATE,
  ZLDQRQ           DATE,
  CZR              VARCHAR2(300),
  YXZLMJ           NUMBER(20,4),
  YXZJZJE          NUMBER(20,4),
  CZYT             VARCHAR2(1000),
  YXZQ             VARCHAR2(50),
  ZLSM             VARCHAR2(1000),
  AFYMC            VARCHAR2(300),
  BSTID            VARCHAR2(32),
  STBH             VARCHAR2(300),
  BSTMC            VARCHAR2(300),
  BFSXXID          VARCHAR2(32),
  BZCBH            VARCHAR2(300),
  BZCMC            VARCHAR2(300),
  BSTZCLX          VARCHAR2(10),
  BSJZYR           VARCHAR2(300),
  BPGZ             NUMBER(20,4),
  BCFWZ            VARCHAR2(300),
  CDKZH            VARCHAR2(300),
  CZCBH            VARCHAR2(300),
  CZCMC            VARCHAR2(300),
  CZCLX            VARCHAR2(10),
  CSJZYR           VARCHAR2(300),
  CCFWZ            VARCHAR2(300),
  CPGZ             NUMBER(20,4),
  ZHUANGTAI        VARCHAR2(10),
  DQSHCS           INTEGER,
  C_SHENGFEN       VARCHAR2(32),
  C_DIJISHI        VARCHAR2(32),
  C_GLBM           VARCHAR2(32),
  C_WTGLJG         VARCHAR2(32),
  ZYYW             VARCHAR2(1000),
  CZYGSNSQK        VARCHAR2(300),
  BGDZ             VARCHAR2(300),
  ZZQK             VARCHAR2(2000),
  ZMTZ             NUMBER(20,4),
  STRS             INTEGER,
  ZZC              NUMBER(20,4),
  FUZHAI           NUMBER(20,4),
  GUBEN            VARCHAR2(300),
  JZC              NUMBER(20,4),
  STSR             NUMBER(20,4),
  JLR              NUMBER(20,4),
  ZCBH             VARCHAR2(300),
  ZCMC             VARCHAR2(300),
  TZZCLB           VARCHAR2(32),
  SHENGFEN         VARCHAR2(300),
  ZCGLBMMC         VARCHAR2(300),
  ZYZCID           VARCHAR2(32),
  ZYZCBH           VARCHAR2(300),
  ZYZCMC           VARCHAR2(300),
  ZYKPBH           VARCHAR2(300),
  ZYKPMC           VARCHAR2(300),
  ZYCCYZ           NUMBER(20,4),
  ZYBGDD           VARCHAR2(1000),
  C_ZCQS           VARCHAR2(32),
  C_CZFS           VARCHAR2(32),
  FZQ_ID           VARCHAR2(32),
  FZQXM_ID         VARCHAR2(32),
  FZQXMMC          VARCHAR2(300),
  JHFHID           VARCHAR2(32),
  JHFHBM           VARCHAR2(32),
  JHFHMC           VARCHAR2(100),
  ZQZLID           VARCHAR2(32),
  ZQZLBM           VARCHAR2(100),
  ZQZLMC           VARCHAR2(400),
  ZQMC             VARCHAR2(200),
  DQR              DATE,
  YZMJ             NUMBER(20,4),
  ZJM              NUMBER(20,4),
  ZDMJ             NUMBER(20,4),
  AC_ZCLX          VARCHAR2(100),
  STLX             VARCHAR2(10),
  SFCZWB           VARCHAR2(10),
  CJTZSYYZD_______ VARCHAR2(10),
  TZZCBH           VARCHAR2(100),
  TZZCMC           VARCHAR2(300),
  TZZCGLBM         VARCHAR2(100),
  TZZCDZ           VARCHAR2(300),
  TZZCID           VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.CZ_ZC_XX
  is '�����ʲ���Ϣ';
comment on column EAM2.CZ_ZC_XX.ID
  is 'uuid ����';
comment on column EAM2.CZ_ZC_XX.CLD_ID
  is '����ID';
comment on column EAM2.CZ_ZC_XX.ZCLB
  is '����Ͷ���ʲ���� 0����Ӫ�Թ̲� 1��ʵ�����ʲ� 2�� ί����ծ�� 3��ʵ��';
comment on column EAM2.CZ_ZC_XX.AZCID
  is '��Ӫ�̲�ID';
comment on column EAM2.CZ_ZC_XX.AZCBH
  is '��Ӫ�̲��ʲ����';
comment on column EAM2.CZ_ZC_XX.AZCMC
  is '��Ӫ�̲��ʲ�����';
comment on column EAM2.CZ_ZC_XX.AZKPBH
  is '����Ƭ���';
comment on column EAM2.CZ_ZC_XX.AZKPMC
  is '����Ƭ����';
comment on column EAM2.CZ_ZC_XX.AZCGLBM
  is '��Ӫ�Թ̲�������';
comment on column EAM2.CZ_ZC_XX.AZCGLBMMC
  is '��Ӫ�Թ̲�����������';
comment on column EAM2.CZ_ZC_XX.AZCSYBM
  is '��Ӫ�Թ̲�ʹ�ò���';
comment on column EAM2.CZ_ZC_XX.AZCSYBMMC
  is '��Ӫ�Թ̲�ʹ�ò�������';
comment on column EAM2.CZ_ZC_XX.AZMYZ
  is '�ʲ�����ԭֵ';
comment on column EAM2.CZ_ZC_XX.AZMJZ
  is '�ʲ����澻ֵ';
comment on column EAM2.CZ_ZC_XX.APGJZ
  is '�ʲ�������ֵ';
comment on column EAM2.CZ_ZC_XX.AC_ZCDQ
  is '����,���������ֵ��';
comment on column EAM2.CZ_ZC_XX.AC_JYFL
  is '��Ӫ���ࣺ1��Ӫ�� 2���������3�ӿ촦����4�д����ϰ���5�̿��򱨷���';
comment on column EAM2.CZ_ZC_XX.AZYNX
  is '׼������';
comment on column EAM2.CZ_ZC_XX.AQYRQ
  is '��������';
comment on column EAM2.CZ_ZC_XX.AYSYNX
  is '��ʹ������';
comment on column EAM2.CZ_ZC_XX.ASKSYNX
  is '�п�ʹ������';
comment on column EAM2.CZ_ZC_XX.AC_YT
  is '��;';
comment on column EAM2.CZ_ZC_XX.AC_ZCZC
  is '�ʲ�״̬';
comment on column EAM2.CZ_ZC_XX.AC_JBHBH
  is '������ (һ��������)';
comment on column EAM2.CZ_ZC_XX.AC_EJFHBH
  is '��������(����������)';
comment on column EAM2.CZ_ZC_XX.AC_FYZL
  is '��������';
comment on column EAM2.CZ_ZC_XX.ABLSM
  is '����˵��';
comment on column EAM2.CZ_ZC_XX.ASQJE
  is 'ÿ���ʲ���������ֵ';
comment on column EAM2.CZ_ZC_XX.ASDJE
  is 'ÿ���ʲ��󶨽����ֵ';
comment on column EAM2.CZ_ZC_XX.ASQFYMX
  is '���������ϸ';
comment on column EAM2.CZ_ZC_XX.JYDX
  is '���С��ǽ���';
comment on column EAM2.CZ_ZC_XX.ZLQSRQ
  is '������ʼ����';
comment on column EAM2.CZ_ZC_XX.ZLDQRQ
  is '���޵�������';
comment on column EAM2.CZ_ZC_XX.CZR
  is '�ʲ�������';
comment on column EAM2.CZ_ZC_XX.YXZLMJ
  is '�����������';
comment on column EAM2.CZ_ZC_XX.YXZJZJE
  is '��������ܽ��';
comment on column EAM2.CZ_ZC_XX.CZYT
  is '������;';
comment on column EAM2.CZ_ZC_XX.YXZQ
  is '��������';
comment on column EAM2.CZ_ZC_XX.ZLSM
  is '����˵��';
comment on column EAM2.CZ_ZC_XX.AFYMC
  is '��������';
comment on column EAM2.CZ_ZC_XX.BSTID
  is 'ʵ��ID';
comment on column EAM2.CZ_ZC_XX.STBH
  is 'ʵ����';
comment on column EAM2.CZ_ZC_XX.BSTMC
  is 'ʵ������';
comment on column EAM2.CZ_ZC_XX.BFSXXID
  is 'ʵ�帽����ϢID';
comment on column EAM2.CZ_ZC_XX.BZCBH
  is 'ʵ�����ʲ����';
comment on column EAM2.CZ_ZC_XX.BZCMC
  is 'ʵ�����ʲ�����';
comment on column EAM2.CZ_ZC_XX.BSTZCLX
  is 'ʵ�����ʲ�����';
comment on column EAM2.CZ_ZC_XX.BSJZYR
  is '�ʲ�ʵ��ռ����';
comment on column EAM2.CZ_ZC_XX.BPGZ
  is 'ʵ�����ʲ�����ֵ';
comment on column EAM2.CZ_ZC_XX.BCFWZ
  is 'ʵ�����ʲ����λ��';
comment on column EAM2.CZ_ZC_XX.CDKZH
  is '�����˺�';
comment on column EAM2.CZ_ZC_XX.CZCBH
  is '��ծ���ʲ����';
comment on column EAM2.CZ_ZC_XX.CZCMC
  is '��ծ��������';
comment on column EAM2.CZ_ZC_XX.CZCLX
  is '��ծ���ʲ�����';
comment on column EAM2.CZ_ZC_XX.CSJZYR
  is '��ծ���ʲ�ʵ��ռ����';
comment on column EAM2.CZ_ZC_XX.CCFWZ
  is '��ծ���ڴ��λ��';
comment on column EAM2.CZ_ZC_XX.CPGZ
  is '��ծ������ֵ';
comment on column EAM2.CZ_ZC_XX.ZHUANGTAI
  is '״̬ 0��δ���� 1�������� 2�������� 3���������� 4 ��ɾ��';
comment on column EAM2.CZ_ZC_XX.DQSHCS
  is '��ǰ�ϻ����';
comment on column EAM2.CZ_ZC_XX.C_SHENGFEN
  is 'ʵ�������ֵ��';
comment on column EAM2.CZ_ZC_XX.C_DIJISHI
  is 'ʵ�������ֵ��';
comment on column EAM2.CZ_ZC_XX.C_GLBM
  is 'ʵ�������ֵ��';
comment on column EAM2.CZ_ZC_XX.C_WTGLJG
  is 'ί�й������';
comment on column EAM2.CZ_ZC_XX.ZYYW
  is '��Ӫҵ��';
comment on column EAM2.CZ_ZC_XX.CZYGSNSQK
  is '�����빤���������';
comment on column EAM2.CZ_ZC_XX.BGDZ
  is '�칫��ַ';
comment on column EAM2.CZ_ZC_XX.ZZQK
  is '�������';
comment on column EAM2.CZ_ZC_XX.ZMTZ
  is '����Ͷ��(Ԫ)';
comment on column EAM2.CZ_ZC_XX.STRS
  is 'ʵ����������';
comment on column EAM2.CZ_ZC_XX.ZZC
  is '���ʲ�';
comment on column EAM2.CZ_ZC_XX.FUZHAI
  is '��ծ';
comment on column EAM2.CZ_ZC_XX.GUBEN
  is '�ɱ�';
comment on column EAM2.CZ_ZC_XX.JZC
  is '���ʲ�';
comment on column EAM2.CZ_ZC_XX.STSR
  is 'ʵ������';
comment on column EAM2.CZ_ZC_XX.JLR
  is '������';
comment on column EAM2.CZ_ZC_XX.ZCBH
  is '�ʲ����';
comment on column EAM2.CZ_ZC_XX.ZCMC
  is '�ʲ�����';
comment on column EAM2.CZ_ZC_XX.TZZCLB
  is 'Ͷ���ʲ����';
comment on column EAM2.CZ_ZC_XX.SHENGFEN
  is '�ʲ�����ʡ��';
comment on column EAM2.CZ_ZC_XX.ZCGLBMMC
  is '�ʲ�����������';
comment on column EAM2.CZ_ZC_XX.ZYZCID
  is '�����ʲ�ID';
comment on column EAM2.CZ_ZC_XX.ZYZCBH
  is '�����ʲ����';
comment on column EAM2.CZ_ZC_XX.ZYZCMC
  is '�����ʲ�����';
comment on column EAM2.CZ_ZC_XX.ZYKPBH
  is '�����ʲ���Ƭ���';
comment on column EAM2.CZ_ZC_XX.ZYKPMC
  is '�����ʲ���Ƭ����';
comment on column EAM2.CZ_ZC_XX.ZYCCYZ
  is '�����ʲ��Ʋ�ԭֵ';
comment on column EAM2.CZ_ZC_XX.ZYBGDD
  is '�����ʲ����ܵص�';
comment on column EAM2.CZ_ZC_XX.C_ZCQS
  is '�ʲ�Ȩ��';
comment on column EAM2.CZ_ZC_XX.C_CZFS
  is '���÷�ʽ';
comment on column EAM2.CZ_ZC_XX.FZQ_ID
  is 'ծȯID,UUID';
comment on column EAM2.CZ_ZC_XX.FZQXM_ID
  is 'ծȯ��ĿID';
comment on column EAM2.CZ_ZC_XX.FZQXMMC
  is 'ծȯ��Ŀ����';
comment on column EAM2.CZ_ZC_XX.JHFHID
  is '��INDIVIDTREE��ѡȡ,����Ϊdepartment';
comment on column EAM2.CZ_ZC_XX.JHFHBM
  is '���з��б���,INDIVIDTREE';
comment on column EAM2.CZ_ZC_XX.JHFHMC
  is '���з�������,INDIVIDTREE';
comment on column EAM2.CZ_ZC_XX.ZQZLID
  is 'ծȯ����ID,����CODE��';
comment on column EAM2.CZ_ZC_XX.ZQZLBM
  is 'ծȯ�������,����CODE��';
comment on column EAM2.CZ_ZC_XX.ZQZLMC
  is 'ծȯ��������,����CODE��';
comment on column EAM2.CZ_ZC_XX.ZQMC
  is 'ծȯ����';
comment on column EAM2.CZ_ZC_XX.DQR
  is '������';
comment on column EAM2.CZ_ZC_XX.YZMJ
  is '�������';
comment on column EAM2.CZ_ZC_XX.ZJM
  is '�����';
comment on column EAM2.CZ_ZC_XX.ZDMJ
  is 'ռ�����';
comment on column EAM2.CZ_ZC_XX.AC_ZCLX
  is '��Ӫ�Թ̶��ʲ��ʲ�����';
comment on column EAM2.CZ_ZC_XX.STLX
  is 'ʵ������';
comment on column EAM2.CZ_ZC_XX.SFCZWB
  is '�Ƿ������';
comment on column EAM2.CZ_ZC_XX.CJTZSYYZD_______
  is '�м�Ͷ������ҵ������ʹ���ֶ�';
comment on column EAM2.CZ_ZC_XX.TZZCBH
  is 'Ͷ���ʲ����
';
comment on column EAM2.CZ_ZC_XX.TZZCMC
  is 'Ͷ���ʲ�����
';
comment on column EAM2.CZ_ZC_XX.TZZCGLBM
  is 'Ͷ���ʲ�����������';
comment on column EAM2.CZ_ZC_XX.TZZCDZ
  is 'Ͷ���ʲ���ַ
';
comment on column EAM2.CZ_ZC_XX.TZZCID
  is 'Ͷ���ʲ�ID';
alter table EAM2.CZ_ZC_XX
  add constraint PK_CZ_ZC_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEBT_INFO
prompt ========================
prompt
create table EAM2.DEBT_INFO
(
  ID        VARCHAR2(32) not null,
  ZQRMC     VARCHAR2(300),
  ZQRID     VARCHAR2(32),
  ZWRMC     VARCHAR2(300),
  ZWRID     VARCHAR2(32),
  GLSTLX    VARCHAR2(10),
  GRZYE     NUMBER(20,2),
  BJ        NUMBER(20,2),
  LX        NUMBER(20,2),
  HJ        NUMBER(20,2),
  BZID      VARCHAR2(32),
  BZBM      VARCHAR2(100),
  BZMC      VARCHAR2(400),
  HTJE      NUMBER(20,2),
  HTBH      VARCHAR2(32),
  HTQSRQ    DATE,
  HTZZRQ    DATE,
  DBLXID    VARCHAR2(32),
  DBLXBM    VARCHAR2(100),
  DBLXMC    VARCHAR2(400),
  DBHTBH    VARCHAR2(32),
  DBHTJE    NUMBER(20,2),
  DBWZLBID  VARCHAR2(32),
  DBWZLBBH  VARCHAR2(100),
  DBWZLBMC  VARCHAR2(400),
  BZRMC     VARCHAR2(100),
  SFSS      VARCHAR2(10),
  SSFY      NUMBER(20,2),
  SFYSXFLWS VARCHAR2(10),
  ZHTSFSS   VARCHAR2(10),
  DBHTSFSS  VARCHAR2(10),
  FSHX      VARCHAR2(10),
  DJZR      VARCHAR2(400),
  BEIZHU    VARCHAR2(4000),
  CZZT      VARCHAR2(10),
  SHENGFEN  VARCHAR2(32),
  ZQZL      VARCHAR2(10),
  DJZRJE    NUMBER(20,4),
  DBFS      VARCHAR2(32),
  ZQJE      NUMBER(20,4),
  SSSX      VARCHAR2(400),
  BZRDSM    VARCHAR2(2000),
  ZWRQKJS   VARCHAR2(2000),
  FZJS      VARCHAR2(2000),
  ZQQX      NUMBER,
  HTMC      VARCHAR2(300),
  DYZYCC    VARCHAR2(400),
  SFBC      VARCHAR2(10),
  ZWRBH     VARCHAR2(300),
  C_ZCQS    VARCHAR2(32),
  WTRMC     VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.DEBT_INFO
  is '��Ͷ��ʵ��ծȨծ����Ϣ��';
comment on column EAM2.DEBT_INFO.ZQRMC
  is 'ծȨ�����ư����й���Ͷ���ڲ�ʵ��';
comment on column EAM2.DEBT_INFO.ZQRID
  is 'ծȨ��ID�����ծȨ�����й���Ͷ��id��¼�й���Ͷ��ţ�������ڲ�ʵ�壬��¼�ڲ�ʵ��id';
comment on column EAM2.DEBT_INFO.ZWRMC
  is 'ծ��������';
comment on column EAM2.DEBT_INFO.ZWRID
  is 'ծ����ID';
comment on column EAM2.DEBT_INFO.GLSTLX
  is '�ڲ�ʵ�塢�ⲿʵ��';
comment on column EAM2.DEBT_INFO.GRZYE
  is '����ծ���';
comment on column EAM2.DEBT_INFO.BJ
  is '����';
comment on column EAM2.DEBT_INFO.LX
  is '��Ϣ';
comment on column EAM2.DEBT_INFO.HJ
  is '�ϼ�';
comment on column EAM2.DEBT_INFO.BZID
  is '��ͬ������ID,��ӦCODE��';
comment on column EAM2.DEBT_INFO.BZBM
  is '���ֱ��룬ȡ��CODE��';
comment on column EAM2.DEBT_INFO.BZMC
  is '�������ƣ�ȡ��CODE��';
comment on column EAM2.DEBT_INFO.HTJE
  is '��ͬ���ԭ�ҽ��';
comment on column EAM2.DEBT_INFO.HTBH
  is '��ͬ�������';
comment on column EAM2.DEBT_INFO.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.DEBT_INFO.HTZZRQ
  is '��ͬ��ֹ����';
comment on column EAM2.DEBT_INFO.DBLXID
  is '��������ID,ȡ��CODE��';
comment on column EAM2.DEBT_INFO.DBLXBM
  is '�������ͱ���';
comment on column EAM2.DEBT_INFO.DBLXMC
  is '������������';
comment on column EAM2.DEBT_INFO.DBHTBH
  is '������ͬ���';
comment on column EAM2.DEBT_INFO.DBHTJE
  is '������ͬ���';
comment on column EAM2.DEBT_INFO.DBWZLBID
  is '�����������ID';
comment on column EAM2.DEBT_INFO.DBWZLBBH
  is '�������������';
comment on column EAM2.DEBT_INFO.DBWZLBMC
  is '���������������';
comment on column EAM2.DEBT_INFO.BZRMC
  is '��֤������';
comment on column EAM2.DEBT_INFO.SFSS
  is '1������0������';
comment on column EAM2.DEBT_INFO.SSFY
  is '���Ϸ���';
comment on column EAM2.DEBT_INFO.SFYSXFLWS
  is '1��0��';
comment on column EAM2.DEBT_INFO.ZHTSFSS
  is '1��0��';
comment on column EAM2.DEBT_INFO.DBHTSFSS
  is '1��0��';
comment on column EAM2.DEBT_INFO.FSHX
  is '1��0��';
comment on column EAM2.DEBT_INFO.DJZR
  is '�Լ�ת�����';
comment on column EAM2.DEBT_INFO.BEIZHU
  is '��ע';
comment on column EAM2.DEBT_INFO.CZZT
  is '����״̬ 0δ���� 1��������2���Ѵ���';
comment on column EAM2.DEBT_INFO.SHENGFEN
  is 'ʡ��';
comment on column EAM2.DEBT_INFO.ZQZL
  is 'ծȨ���� 0��ȫ��  1���Ŵ�ת�� 2�� ����ת��  3������
';
comment on column EAM2.DEBT_INFO.DJZRJE
  is '�Լ�ת�ý��';
comment on column EAM2.DEBT_INFO.DBFS
  is '������ʽ';
comment on column EAM2.DEBT_INFO.ZQJE
  is 'ծȨ���';
comment on column EAM2.DEBT_INFO.SSSX
  is '����ʱЧ';
comment on column EAM2.DEBT_INFO.BZRDSM
  is '��֤�˵�˵��';
comment on column EAM2.DEBT_INFO.ZWRQKJS
  is 'ծ�����������';
comment on column EAM2.DEBT_INFO.FZJS
  is '��ծ����';
comment on column EAM2.DEBT_INFO.ZQQX
  is 'ծȨ���ޣ��죩';
comment on column EAM2.DEBT_INFO.HTMC
  is '��ͬ����';
comment on column EAM2.DEBT_INFO.DYZYCC
  is '��Ѻ��Ѻ�Ʋ�';
comment on column EAM2.DEBT_INFO.SFBC
  is '			�Ƿ񱣴�';
comment on column EAM2.DEBT_INFO.ZWRBH
  is 'ծ���˱�ţ����ʵ�����ڲ�ʵ�壬���ʲ����';
alter table EAM2.DEBT_INFO
  add constraint PK_DEBT_INFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEBT_INFO_LSB
prompt ============================
prompt
create table EAM2.DEBT_INFO_LSB
(
  ID        VARCHAR2(32) not null,
  CLD_ID    VARCHAR2(32),
  ZQXX_ID   VARCHAR2(32),
  ZQRMC     VARCHAR2(300),
  ZQRID     VARCHAR2(32),
  ZWRBH     VARCHAR2(300),
  ZWRMC     VARCHAR2(300),
  ZWRID     VARCHAR2(32),
  GLSTLX    VARCHAR2(10),
  GRZYE     NUMBER(20,2),
  BJ        NUMBER(20,2),
  LX        NUMBER(20,2),
  HJ        NUMBER(20,2),
  BZID      VARCHAR2(32),
  BZBM      VARCHAR2(100),
  BZMC      VARCHAR2(400),
  HTJE      NUMBER(20,2),
  HTBH      VARCHAR2(32),
  HTQSRQ    DATE,
  HTZZRQ    DATE,
  DBLXID    VARCHAR2(32),
  DBLXBM    VARCHAR2(100),
  DBLXMC    VARCHAR2(400),
  DBHTBH    VARCHAR2(32),
  DBHTJE    NUMBER(20,2),
  DBWZLBID  VARCHAR2(32),
  DBWZLBBH  VARCHAR2(100),
  DBWZLBMC  VARCHAR2(400),
  BZRMC     VARCHAR2(100),
  SFSS      VARCHAR2(10),
  SSFY      NUMBER(20,2),
  SFYSXFLWS VARCHAR2(10),
  ZHTSFSS   VARCHAR2(10),
  DBHTSFSS  VARCHAR2(10),
  FSHX      VARCHAR2(10),
  DJZR      VARCHAR2(400),
  BEIZHU    VARCHAR2(4000),
  CZZT      VARCHAR2(10),
  SHENGFEN  VARCHAR2(32),
  ZQZL      VARCHAR2(10),
  DJZRJE    NUMBER(20,4),
  DBFS      VARCHAR2(32),
  ZQJE      NUMBER(20,4),
  SSSX      VARCHAR2(400),
  BZRDSM    VARCHAR2(2000),
  ZWRQKJS   VARCHAR2(2000),
  FZJS      VARCHAR2(2000),
  ZQQX      NUMBER,
  HTMC      VARCHAR2(300),
  DYZYCC    VARCHAR2(400),
  SFBC      VARCHAR2(10),
  C_ZCQS    VARCHAR2(32),
  WTRMC     VARCHAR2(300),
  ZRJE      NUMBER(20,4),
  CLDZT     VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.DEBT_INFO_LSB
  is '��Ͷ��ʵ��ծȨծ����Ϣ��ʱ��';
comment on column EAM2.DEBT_INFO_LSB.CLD_ID
  is '����ID';
comment on column EAM2.DEBT_INFO_LSB.ZQXX_ID
  is 'ծȨ��Ϣ��ID';
comment on column EAM2.DEBT_INFO_LSB.ZQRMC
  is 'ծȨ�����ư����й���Ͷ���ڲ�ʵ��';
comment on column EAM2.DEBT_INFO_LSB.ZQRID
  is 'ծȨ��ID�����ծȨ�����й���Ͷ��id��¼�й���Ͷ��ţ�������ڲ�ʵ�壬��¼�ڲ�ʵ��id';
comment on column EAM2.DEBT_INFO_LSB.ZWRBH
  is 'ծ���˱�ţ����ʵ�����ڲ�ʵ�壬���ʲ����';
comment on column EAM2.DEBT_INFO_LSB.ZWRMC
  is 'ծ��������';
comment on column EAM2.DEBT_INFO_LSB.ZWRID
  is 'ծ����ID';
comment on column EAM2.DEBT_INFO_LSB.GLSTLX
  is '�ڲ�ʵ�塢�ⲿʵ��';
comment on column EAM2.DEBT_INFO_LSB.GRZYE
  is '����ծ���';
comment on column EAM2.DEBT_INFO_LSB.BJ
  is '����';
comment on column EAM2.DEBT_INFO_LSB.LX
  is '��Ϣ';
comment on column EAM2.DEBT_INFO_LSB.HJ
  is '�ϼ�';
comment on column EAM2.DEBT_INFO_LSB.BZID
  is '��ͬ������ID,��ӦCODE��';
comment on column EAM2.DEBT_INFO_LSB.BZBM
  is '���ֱ��룬ȡ��CODE��';
comment on column EAM2.DEBT_INFO_LSB.BZMC
  is '�������ƣ�ȡ��CODE��';
comment on column EAM2.DEBT_INFO_LSB.HTJE
  is '��ͬ���ԭ�ҽ��';
comment on column EAM2.DEBT_INFO_LSB.HTBH
  is '��ͬ�������';
comment on column EAM2.DEBT_INFO_LSB.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.DEBT_INFO_LSB.HTZZRQ
  is '��ͬ��ֹ����';
comment on column EAM2.DEBT_INFO_LSB.DBLXID
  is '��������ID,ȡ��CODE��';
comment on column EAM2.DEBT_INFO_LSB.DBLXBM
  is '�������ͱ���';
comment on column EAM2.DEBT_INFO_LSB.DBLXMC
  is '������������';
comment on column EAM2.DEBT_INFO_LSB.DBHTBH
  is '������ͬ���';
comment on column EAM2.DEBT_INFO_LSB.DBHTJE
  is '������ͬ���';
comment on column EAM2.DEBT_INFO_LSB.DBWZLBID
  is '�����������ID';
comment on column EAM2.DEBT_INFO_LSB.DBWZLBBH
  is '�������������';
comment on column EAM2.DEBT_INFO_LSB.DBWZLBMC
  is '���������������';
comment on column EAM2.DEBT_INFO_LSB.BZRMC
  is '��֤������';
comment on column EAM2.DEBT_INFO_LSB.SFSS
  is '1������0������';
comment on column EAM2.DEBT_INFO_LSB.SSFY
  is '���Ϸ���';
comment on column EAM2.DEBT_INFO_LSB.SFYSXFLWS
  is '1��0��';
comment on column EAM2.DEBT_INFO_LSB.ZHTSFSS
  is '1��0��';
comment on column EAM2.DEBT_INFO_LSB.DBHTSFSS
  is '1��0��';
comment on column EAM2.DEBT_INFO_LSB.FSHX
  is '1��0��';
comment on column EAM2.DEBT_INFO_LSB.DJZR
  is '�Լ�ת�����';
comment on column EAM2.DEBT_INFO_LSB.BEIZHU
  is '��ע';
comment on column EAM2.DEBT_INFO_LSB.CZZT
  is '����״̬ 0δ���� 1��������2���Ѵ���';
comment on column EAM2.DEBT_INFO_LSB.SHENGFEN
  is 'ʡ��';
comment on column EAM2.DEBT_INFO_LSB.ZQZL
  is 'ծȨ���� 0��ȫ��  1���Ŵ�ת�� 2�� ����ת��  3������
';
comment on column EAM2.DEBT_INFO_LSB.DJZRJE
  is '�Լ�ת�ý��';
comment on column EAM2.DEBT_INFO_LSB.DBFS
  is '������ʽ';
comment on column EAM2.DEBT_INFO_LSB.ZQJE
  is 'ծȨ���';
comment on column EAM2.DEBT_INFO_LSB.SSSX
  is '����ʱЧ';
comment on column EAM2.DEBT_INFO_LSB.BZRDSM
  is '��֤�˵�˵��';
comment on column EAM2.DEBT_INFO_LSB.ZWRQKJS
  is 'ծ�����������';
comment on column EAM2.DEBT_INFO_LSB.FZJS
  is '��ծ����';
comment on column EAM2.DEBT_INFO_LSB.ZQQX
  is 'ծȨ���ޣ��죩';
comment on column EAM2.DEBT_INFO_LSB.HTMC
  is '��ͬ����';
comment on column EAM2.DEBT_INFO_LSB.DYZYCC
  is '��Ѻ��Ѻ�Ʋ�';
comment on column EAM2.DEBT_INFO_LSB.SFBC
  is '�Ƿ񱣴�';
comment on column EAM2.DEBT_INFO_LSB.C_ZCQS
  is '�ʲ�Ȩ��';
comment on column EAM2.DEBT_INFO_LSB.WTRMC
  is 'ί��������';
comment on column EAM2.DEBT_INFO_LSB.ZRJE
  is 'ת�ý��';
comment on column EAM2.DEBT_INFO_LSB.CLDZT
  is '����״̬  0��δ����   1�������� 2��������';
alter table EAM2.DEBT_INFO_LSB
  add constraint PK_DEBT_INFO_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEBT_WORKLOG
prompt ===========================
prompt
create table EAM2.DEBT_WORKLOG
(
  ID      VARCHAR2(32) not null,
  CSR     VARCHAR2(100),
  CSRMC   VARCHAR2(100),
  CSSJ    DATE,
  CSFS    VARCHAR2(100),
  ZWFZR   VARCHAR2(100),
  ZWFZRDH VARCHAR2(100),
  BLJG    VARCHAR2(100),
  BZ      VARCHAR2(4000),
  ZQID    VARCHAR2(32),
  SFBC    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.DEBT_WORKLOG
  is 'DEBT_WORKLOG';
comment on column EAM2.DEBT_WORKLOG.ID
  is 'ծȨ������־ID,UUID';
comment on column EAM2.DEBT_WORKLOG.CSR
  is '������ID';
comment on column EAM2.DEBT_WORKLOG.CSRMC
  is '����������';
comment on column EAM2.DEBT_WORKLOG.CSSJ
  is '����ʱ��';
comment on column EAM2.DEBT_WORKLOG.CSFS
  is '���շ�ʽ';
comment on column EAM2.DEBT_WORKLOG.ZWFZR
  is 'ծ������';
comment on column EAM2.DEBT_WORKLOG.ZWFZRDH
  is 'ծ�����˵绰';
comment on column EAM2.DEBT_WORKLOG.BLJG
  is '������';
comment on column EAM2.DEBT_WORKLOG.BZ
  is '��ע';
comment on column EAM2.DEBT_WORKLOG.ZQID
  is '��ӦծȯID';
comment on column EAM2.DEBT_WORKLOG.SFBC
  is '�Ƿ񱣴�';
alter table EAM2.DEBT_WORKLOG
  add constraint PK_DEBT_WORKLOG primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table DIC_APP_ASSETTYPE1
prompt =================================
prompt
create table EAM2.DIC_APP_ASSETTYPE1
(
  TYPECODE      VARCHAR2(50),
  TYPEORDER     NUMBER,
  TYPEAREA      VARCHAR2(200),
  TYPENAME      VARCHAR2(100),
  ORGID         VARCHAR2(200),
  MEMO_1        VARCHAR2(200),
  MEMO_2        VARCHAR2(200),
  ASSETTYPE1_ID VARCHAR2(50) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.DIC_APP_ASSETTYPE1
  is 'DIC_APP_ASSETTYPE1';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPECODE
  is '���ڳ����в�ѯʹ��';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPEORDER
  is '���ڿ��Ʒ������б����ʾ˳��';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPEAREA
  is '���ڿ��Ʋ�ͬ���ݷ����ڲ�ͬ��ҵ��ģ������ʾ';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPENAME
  is '��ҳ����չ�ָ��û��ķ�������';
comment on column EAM2.DIC_APP_ASSETTYPE1.ORGID
  is '���Ʋ�ͬ���ݷ����ڲ�ͬ�Ĳ����ڲ���ʾ��';
comment on column EAM2.DIC_APP_ASSETTYPE1.MEMO_1
  is '���ں������Ե���չ';
comment on column EAM2.DIC_APP_ASSETTYPE1.MEMO_2
  is '���ں������Ե���չ';
comment on column EAM2.DIC_APP_ASSETTYPE1.ASSETTYPE1_ID
  is '���� sequence';
alter table EAM2.DIC_APP_ASSETTYPE1
  add constraint PK_DIC_APP_ASSETTYPE1 primary key (ASSETTYPE1_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DIC_APP_ASSETTYPE2
prompt =================================
prompt
create table EAM2.DIC_APP_ASSETTYPE2
(
  TYPECODE      VARCHAR2(50),
  MAINCODE      VARCHAR2(50),
  TYPEORDER     NUMBER,
  TYPENAME      VARCHAR2(100),
  ORGID         VARCHAR2(200),
  MEMO_1        VARCHAR2(200),
  MEMO_2        VARCHAR2(200),
  ASSETTYPE2_ID VARCHAR2(50) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.DIC_APP_ASSETTYPE2.TYPECODE
  is '���ڳ����в�ѯʹ��';
comment on column EAM2.DIC_APP_ASSETTYPE2.MAINCODE
  is '��һ������Ĵ���';
comment on column EAM2.DIC_APP_ASSETTYPE2.TYPEORDER
  is '���ڿ��Ʒ������б����ʾ˳��';
comment on column EAM2.DIC_APP_ASSETTYPE2.TYPENAME
  is '��ҳ����չ�ָ��û��ķ�������';
comment on column EAM2.DIC_APP_ASSETTYPE2.ORGID
  is '���Ʋ�ͬ���ݷ����ڲ�ͬ�Ĳ����ڲ���ʾ��';
comment on column EAM2.DIC_APP_ASSETTYPE2.MEMO_1
  is '���ں������Ե���չ';
comment on column EAM2.DIC_APP_ASSETTYPE2.MEMO_2
  is '���ں������Ե���չ';
comment on column EAM2.DIC_APP_ASSETTYPE2.ASSETTYPE2_ID
  is '���� sequence';
alter table EAM2.DIC_APP_ASSETTYPE2
  add constraint PK_DIC_APP_ASSETTYPE2 primary key (ASSETTYPE2_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.DIC_APP_ASSETTYPE2
  add constraint FK_DIC_APP_ASSETTYPE2 foreign key (MAINCODE)
  references EAM2.DIC_APP_ASSETTYPE1 (ASSETTYPE1_ID) on delete set null;

prompt
prompt Creating table DIC_APP_ASSETTYPE3
prompt =================================
prompt
create table EAM2.DIC_APP_ASSETTYPE3
(
  TYPECODE      VARCHAR2(50),
  MAINCODE      VARCHAR2(50),
  SECONDCODE    VARCHAR2(50),
  TYPEORDER     NUMBER,
  TYPENAME      VARCHAR2(100),
  ORGID         VARCHAR2(200),
  MEMO_1        VARCHAR2(200),
  MEMO_2        VARCHAR2(200),
  ASSETTYPE3_ID NVARCHAR2(32) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.DIC_APP_ASSETTYPE3.TYPECODE
  is '���ڳ����в�ѯʹ��';
comment on column EAM2.DIC_APP_ASSETTYPE3.MAINCODE
  is '��һ������Ĵ���';
comment on column EAM2.DIC_APP_ASSETTYPE3.SECONDCODE
  is '�ڶ�������Ĵ���';
comment on column EAM2.DIC_APP_ASSETTYPE3.TYPEORDER
  is '���ڿ��Ʒ������б����ʾ˳��';
comment on column EAM2.DIC_APP_ASSETTYPE3.TYPENAME
  is '��ҳ����չ�ָ��û��ķ�������';
comment on column EAM2.DIC_APP_ASSETTYPE3.ORGID
  is '���Ʋ�ͬ���ݷ����ڲ�ͬ�Ĳ����ڲ���ʾ��';
comment on column EAM2.DIC_APP_ASSETTYPE3.MEMO_1
  is '���ں������Ե���չ';
comment on column EAM2.DIC_APP_ASSETTYPE3.MEMO_2
  is '���ں������Ե���չ';
comment on column EAM2.DIC_APP_ASSETTYPE3.ASSETTYPE3_ID
  is '���� sequence';
alter table EAM2.DIC_APP_ASSETTYPE3
  add constraint PK_DIC_APP_ASSETTYPE3 primary key (ASSETTYPE3_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.DIC_APP_ASSETTYPE3
  add constraint FK_DIC_APP_ASSETTYPE31 foreign key (MAINCODE)
  references EAM2.DIC_APP_ASSETTYPE1 (ASSETTYPE1_ID) on delete set null;
alter table EAM2.DIC_APP_ASSETTYPE3
  add constraint FK_DIC_APP_ASSETTYPE32 foreign key (SECONDCODE)
  references EAM2.DIC_APP_ASSETTYPE2 (ASSETTYPE2_ID) on delete set null;

prompt
prompt Creating table DIC_APP_ASSET_STATE
prompt ==================================
prompt
create table EAM2.DIC_APP_ASSET_STATE
(
  CODE      VARCHAR2(20),
  NAME      VARCHAR2(100),
  TYPE      CHAR(20),
  TYPEINFO  VARCHAR2(100),
  PARENTID  VARCHAR2(20),
  PK_ID     NUMBER not null,
  TYPEORDER NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.DIC_APP_ASSET_STATE
  is '�ʲ��ֵ�״̬��';
comment on column EAM2.DIC_APP_ASSET_STATE.CODE
  is '״̬����';
comment on column EAM2.DIC_APP_ASSET_STATE.NAME
  is '״̬����';
comment on column EAM2.DIC_APP_ASSET_STATE.TYPE
  is '�ֵ�����';
comment on column EAM2.DIC_APP_ASSET_STATE.TYPEINFO
  is '��������';
comment on column EAM2.DIC_APP_ASSET_STATE.PARENTID
  is '���ڵ����';
comment on column EAM2.DIC_APP_ASSET_STATE.TYPEORDER
  is '��������';
alter table EAM2.DIC_APP_ASSET_STATE
  add constraint PK_DIC_APP_ASSET_STATE primary key (PK_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_BXMX
prompt =======================
prompt
create table EAM2.ERP_BXMX
(
  ID          NUMBER not null,
  EAMPK       VARCHAR2(100),
  ERPPK       VARCHAR2(100),
  BILLCODE    VARCHAR2(100),
  ERPBILLPK   VARCHAR2(100),
  ERPBILLCODE VARCHAR2(100),
  MONEY       NUMBER(20,8),
  SFWB        VARCHAR2(100),
  BACKUP1     VARCHAR2(100),
  BACKUP2     VARCHAR2(100),
  BACKUP3     VARCHAR2(100),
  BACKUP4     VARCHAR2(100),
  BACKUP5     VARCHAR2(100),
  BACKUP6     VARCHAR2(100),
  BACKUP7     VARCHAR2(100),
  BACKUP8     VARCHAR2(100),
  BACKUP9     VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_BXMX
  add constraint PK_ERP_BXMX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_CARDADDSEND
prompt ==============================
prompt
create table EAM2.ERP_CARDADDSEND
(
  BDH       VARCHAR2(200),
  DYPK      VARCHAR2(200),
  ID        NUMBER not null,
  FHXX      VARCHAR2(200),
  ERPZCBM   VARCHAR2(200),
  SFBH      VARCHAR2(200),
  ERPKPBM   VARCHAR2(200),
  FHBM      VARCHAR2(200),
  KPID      VARCHAR2(200),
  GSBM      VARCHAR2(200),
  ZIBM      VARCHAR2(200),
  ZCMC      VARCHAR2(200),
  KSSYRQ    VARCHAR2(200),
  BZMC      VARCHAR2(200),
  BZCW      VARCHAR2(200),
  LRRMC     VARCHAR2(200),
  LRRQ      VARCHAR2(200),
  SYRBM     VARCHAR2(200),
  GGXH      VARCHAR2(200),
  CFDD      VARCHAR2(200),
  GZLDW     VARCHAR2(200),
  ZJFSBM    VARCHAR2(200),
  ZCTH      VARCHAR2(200),
  SYBMBM    VARCHAR2(200),
  GLBMBM    VARCHAR2(200),
  ZJCDBM    VARCHAR2(200),
  HJN       VARCHAR2(200),
  HJY       VARCHAR2(200),
  YBYZ      VARCHAR2(200),
  BBYZ      VARCHAR2(200),
  FBYZ      VARCHAR2(200),
  GZZL      VARCHAR2(200),
  SYYX      VARCHAR2(200),
  LJZJ      VARCHAR2(200),
  LJGZL     VARCHAR2(200),
  JZZB      VARCHAR2(200),
  YJTYF     VARCHAR2(200),
  YGZL      VARCHAR2(200),
  DWZJ      VARCHAR2(200),
  JCZL      VARCHAR2(200),
  JCZ       VARCHAR2(200),
  YZKPBJ    VARCHAR2(200),
  ZCLBBM    VARCHAR2(200),
  SYZKBM    VARCHAR2(200),
  JZFABM    VARCHAR2(200),
  XMDABM    VARCHAR2(200),
  GYSBM     VARCHAR2(200),
  LY        VARCHAR2(200),
  YRJE      VARCHAR2(200),
  YRLJZJ    VARCHAR2(200),
  YRYZ      VARCHAR2(200),
  CPUXH     VARCHAR2(200),
  BXQ       VARCHAR2(200),
  BZ        VARCHAR2(200),
  CLPZH     VARCHAR2(200),
  DYTDZSYQR VARCHAR2(200),
  FDJHM     VARCHAR2(200),
  FCZHM     VARCHAR2(200),
  JJMJ      VARCHAR2(200),
  JE        VARCHAR2(200),
  JZ        VARCHAR2(200),
  JKPBH     VARCHAR2(200),
  LBBM      VARCHAR2(200),
  LBMC      VARCHAR2(200),
  NC        VARCHAR2(200),
  NZYP      VARCHAR2(200),
  PGQLJZJ   VARCHAR2(200),
  PGQYZ     VARCHAR2(200),
  QYRQ      VARCHAR2(200),
  QSZM      VARCHAR2(200),
  QZSYZ     VARCHAR2(200),
  SMBXQ     VARCHAR2(200),
  SBXLH     VARCHAR2(200),
  SFJC      VARCHAR2(200),
  SXBXQ     VARCHAR2(200),
  TDZHM     VARCHAR2(200),
  WZYP      VARCHAR2(200),
  XTXSQ     VARCHAR2(200),
  YWDYTD    VARCHAR2(200),
  YXTRRY    VARCHAR2(200),
  YZJE      VARCHAR2(200),
  YZJL      VARCHAR2(200),
  ZYZT      VARCHAR2(200),
  ZDMJ      VARCHAR2(200),
  ZYYT      VARCHAR2(200),
  ZXRQ      VARCHAR2(200),
  ZXMJ      VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.ERP_CARDADDSEND
  add constraint PK_ERP_CARDADDSEND primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table ERP_CARDBDSEND
prompt =============================
prompt
create table EAM2.ERP_CARDBDSEND
(
  ID         NUMBER not null,
  ASSET_CODE VARCHAR2(100),
  CARD_CODE  VARCHAR2(100),
  EAMCODE    VARCHAR2(100),
  ERPCODE    VARCHAR2(100),
  ERPPK      VARCHAR2(100),
  SFBH       VARCHAR2(100),
  SPTG       VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_CARDBDSEND
  add constraint PK_ERP_CARDBDSEND primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_CARDCFSEND
prompt =============================
prompt
create table EAM2.ERP_CARDCFSEND
(
  ID         NUMBER not null,
  EAMCODE    VARCHAR2(200),
  EAMPK      VARCHAR2(200),
  EAMNOTICE  VARCHAR2(200),
  ERPCODEPK  VARCHAR2(200),
  ERPCODE    VARCHAR2(200),
  ERPPK      VARCHAR2(200),
  RETURNCODE VARCHAR2(200),
  ERRORINFO  VARCHAR2(200),
  IFBH       VARCHAR2(200),
  CARDID     VARCHAR2(200),
  SFCODE     VARCHAR2(200),
  TYPECODE   VARCHAR2(200),
  JSTYPE     VARCHAR2(200),
  ZCCODE     VARCHAR2(200),
  BBYZ       VARCHAR2(200),
  FBYZ       VARCHAR2(200),
  GLBM       VARCHAR2(200),
  GLBMID     VARCHAR2(200),
  JZZB       VARCHAR2(200),
  JCZ        VARCHAR2(200),
  JCZL       VARCHAR2(200),
  JE         VARCHAR2(200),
  JZ         VARCHAR2(200),
  CARDCODE   VARCHAR2(200),
  STARTDATE  VARCHAR2(200),
  LJZJ       VARCHAR2(200),
  SYBMID     VARCHAR2(200),
  SYZKID     VARCHAR2(200),
  NUM        VARCHAR2(200),
  YBYZ       VARCHAR2(200),
  ZJFSID     VARCHAR2(200),
  ZJCDBM     VARCHAR2(200),
  ZJFFID     VARCHAR2(200),
  ZCLBID     VARCHAR2(200),
  ZCNAME     VARCHAR2(200),
  ZDR        VARCHAR2(200),
  ZDRQ       VARCHAR2(200),
  BHLY       VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_CARDCFSEND
  add constraint PK_ERP_CARDCFSEND primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_CARDHBSEND
prompt =============================
prompt
create table EAM2.ERP_CARDHBSEND
(
  ID          NUMBER not null,
  EAMCODEPK   VARCHAR2(100),
  EAMCODE     VARCHAR2(100),
  ACARDCODE   VARCHAR2(100),
  AZCCODE     VARCHAR2(100),
  BCARDCODE   VARCHAR2(100),
  BCARDCODEPK VARCHAR2(100),
  BZCCODE     VARCHAR2(100),
  BILLCODE    VARCHAR2(100),
  BILLCODEPK  VARCHAR2(100),
  SFBH        VARCHAR2(100),
  SFTG        VARCHAR2(100),
  BHNOTICE    VARCHAR2(100),
  STATUS      VARCHAR2(100),
  BACKUP1     VARCHAR2(100),
  BACKUP2     VARCHAR2(100),
  BACKUP3     VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_CARDHBSEND
  add constraint PK_ERP_CARDHBSEND primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_CARDJZ
prompt =========================
prompt
create table EAM2.ERP_CARDJZ
(
  ID        NUMBER not null,
  SFJS      VARCHAR2(100),
  LCCODE    VARCHAR2(100),
  EAMCODE   VARCHAR2(100),
  EAMPK     VARCHAR2(100),
  ERPCODE   VARCHAR2(100),
  ERPCODEPK VARCHAR2(100),
  ERPPK     VARCHAR2(100),
  CARDCODE  VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.ERP_CARDJZ
  add constraint PK_ERP_CARDJZ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table ERP_CARDREDUCESEND
prompt =================================
prompt
create table EAM2.ERP_CARDREDUCESEND
(
  ID        NUMBER not null,
  ERPPK     VARCHAR2(200),
  ERPCODEPK VARCHAR2(200),
  ERPDJH    VARCHAR2(200),
  EAMPK     VARCHAR2(200),
  EAMDJH    VARCHAR2(200),
  EAMSPYJ   VARCHAR2(200),
  JGDM      VARCHAR2(200),
  CWXX      VARCHAR2(200),
  KPBM      VARCHAR2(200),
  ZCBM      VARCHAR2(200),
  ZCMC      VARCHAR2(200),
  ZCLB      VARCHAR2(200),
  GGXH      VARCHAR2(200),
  JSFS      VARCHAR2(200),
  JSYY      VARCHAR2(200),
  SYZK      VARCHAR2(200),
  GLBM      VARCHAR2(200),
  SYBM      VARCHAR2(200),
  SYR       VARCHAR2(200),
  KSSYRQ    VARCHAR2(200),
  SYNX      VARCHAR2(200),
  SKSYNX    VARCHAR2(200),
  YJTZJYF   VARCHAR2(200),
  YBYZ      VARCHAR2(200),
  FBYZ      VARCHAR2(200),
  LJZJ      VARCHAR2(200),
  JZ        VARCHAR2(200),
  JZZB      VARCHAR2(200),
  JE        VARCHAR2(200),
  JCZ       VARCHAR2(200),
  BZ        VARCHAR2(200),
  ZDRID     VARCHAR2(200),
  ZDRQ      VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_CARDREDUCESEND
  add constraint PK_ERP_CARDREDUCESEND primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_CARDSPDADDSEND
prompt =================================
prompt
create table EAM2.ERP_CARDSPDADDSEND
(
  ID      NUMBER not null,
  BDH     VARCHAR2(200),
  DYPK    VARCHAR2(200),
  ERPZCBM VARCHAR2(200),
  ERPKPBM VARCHAR2(200),
  FHBM    VARCHAR2(200),
  FHXX    VARCHAR2(200),
  SFBH    VARCHAR2(200),
  KPID    VARCHAR2(200),
  GSBM    VARCHAR2(200),
  DJH     VARCHAR2(200),
  SQDWBM  VARCHAR2(200),
  SQBMBM  VARCHAR2(200),
  SQRQ    VARCHAR2(200),
  SQLY    VARCHAR2(3000),
  JBRBM   VARCHAR2(200),
  ZDRBM   VARCHAR2(200),
  ZDRQ    VARCHAR2(200),
  SHRBM   VARCHAR2(200),
  SHRQ    VARCHAR2(200),
  JE      VARCHAR2(200),
  SL      VARCHAR2(200),
  ZJFS    VARCHAR2(200),
  SFCJ    VARCHAR2(200),
  SYYX    VARCHAR2(200),
  SYZK    VARCHAR2(200),
  LBBM    VARCHAR2(200),
  ZCBM    VARCHAR2(200),
  ZCMC    VARCHAR2(200),
  SYBMBM  VARCHAR2(200),
  GGXH    VARCHAR2(200),
  CFDD    VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_CARDSPDADDSEND
  add constraint PK_ERP_CARDSPDADDSEND primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_DATEINFO
prompt ===========================
prompt
create table EAM2.ERP_DATEINFO
(
  ID        NUMBER not null,
  TABLENAME VARCHAR2(100),
  INFO      VARCHAR2(400),
  STATE     VARCHAR2(100),
  RESULT    VARCHAR2(100),
  ERRORDATE VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_DATEINFO
  add constraint DATEINFO_PK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_FYSPD
prompt ========================
prompt
create table EAM2.ERP_FYSPD
(
  ID      NUMBER not null,
  SFJS    VARCHAR2(100),
  BDOCID  VARCHAR2(100),
  BILL    VARCHAR2(100),
  ERPBILL VARCHAR2(100),
  EAMPK   VARCHAR2(100),
  ERPPK   VARCHAR2(100),
  SFSC    VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_FYSPD
  add constraint PK_ERP_FYSPD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_HISTORY
prompt ==========================
prompt
create table EAM2.ERP_HISTORY
(
  ID           INTEGER not null,
  SENDDATE     DATE,
  EAMCODE      VARCHAR2(100),
  SEND         CLOB,
  RECEIVE      CLOB,
  WFCONFIG_KEY VARCHAR2(300),
  SENDER       VARCHAR2(150),
  APPPERSON    VARCHAR2(150)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_HISTORY
  add constraint PK_ERP_HISTORY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERP_USERMAP
prompt ==========================
prompt
create table EAM2.ERP_USERMAP
(
  EAMUSER  VARCHAR2(100),
  ERPUSER  VARCHAR2(100),
  EAMCHINA VARCHAR2(100),
  ID       NUMBER not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.ERP_USERMAP
  add constraint PKID primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table E_T_CLD
prompt ======================
prompt
create table EAM2.E_T_CLD
(
  CLDBH   NUMBER(22),
  ZT      VARCHAR2(40),
  CS      VARCHAR2(40),
  SQQR    DATE,
  SQBM    VARCHAR2(40),
  SXLX    VARCHAR2(40),
  JBR     VARCHAR2(40),
  JBRDH   VARCHAR2(40),
  HQBM    VARCHAR2(40),
  SFSJFY  NUMBER(2),
  SQFYZJE NUMBER(18,2),
  SPFYZJE NUMBER(18,2),
  FJBT    VARCHAR2(40),
  FJ      BLOB,
  LCBH    VARCHAR2(200),
  RWBH    VARCHAR2(200),
  TID     NUMBER(22) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.E_T_CLD
  add constraint PK_E_T_CLD primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table E_T_CLD_L_ZC
prompt ===========================
prompt
create table EAM2.E_T_CLD_L_ZC
(
  TID   CHAR(18) not null,
  ZCBH  NUMBER(22),
  CLDBH NUMBER(22)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.E_T_CLD_L_ZC
  add constraint PK_E_T_CLD_L_ZC primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table E_T_COUNTERSIGN
prompt ==============================
prompt
create table EAM2.E_T_COUNTERSIGN
(
  TID        NUMBER(22),
  TITLE      VARCHAR2(200),
  DEPTID     NUMBER(22),
  ASSIGNID   NUMBER(22),
  PIID       VARCHAR2(255),
  CREATTIME  TIMESTAMP(6),
  ISFINISHED NUMBER(1),
  BIZ_PIID   VARCHAR2(255),
  HEADID     VARCHAR2(255),
  HEAD_TYPE  VARCHAR2(255),
  URL        VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.E_T_COUNTERSIGN.TID
  is '���';
comment on column EAM2.E_T_COUNTERSIGN.TITLE
  is '�������';
comment on column EAM2.E_T_COUNTERSIGN.DEPTID
  is '��ǩ���ű��';
comment on column EAM2.E_T_COUNTERSIGN.ASSIGNID
  is '�����˱��';
comment on column EAM2.E_T_COUNTERSIGN.PIID
  is '����ʵ�����';
comment on column EAM2.E_T_COUNTERSIGN.CREATTIME
  is '����ʱ��';
comment on column EAM2.E_T_COUNTERSIGN.ISFINISHED
  is '�Ƿ����(0δ��ɣ�1�����)';
comment on column EAM2.E_T_COUNTERSIGN.BIZ_PIID
  is 'ҵ��ʵ�������';
comment on column EAM2.E_T_COUNTERSIGN.HEADID
  is 'ҵ�񵥱��';
comment on column EAM2.E_T_COUNTERSIGN.HEAD_TYPE
  is 'ҵ������';
comment on column EAM2.E_T_COUNTERSIGN.URL
  is 'ҵ�񵥲�ѯ��ϸurl';

prompt
prompt Creating table E_T_COUNTERSIGN_PARTICIPANT
prompt ==========================================
prompt
create table EAM2.E_T_COUNTERSIGN_PARTICIPANT
(
  TID                 NUMBER(22),
  USERID              NUMBER,
  TIME                TIMESTAMP(6),
  SYS_UPDATE_USER     NUMBER(22),
  SYS_UPDATE_TIME     TIMESTAMP(6),
  COUNTERSIGNID       NUMBER(22),
  ISFINISHED          NUMBER(1),
  ASSIGNPERSONID      NUMBER(22),
  ASSIGNTASKID        NUMBER(22),
  PIID                VARCHAR2(255),
  TASKID              VARCHAR2(255),
  ASSIGNPARTICIPANTID NUMBER(22)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.TID
  is '���';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.USERID
  is '�����߱��';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.TIME
  is 'ί��ʱ��';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.COUNTERSIGNID
  is '��ǩ����¼���';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ISFINISHED
  is '�Ƿ����(0δ��ɣ�1�����)';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ASSIGNPERSONID
  is '��ǩ�˱��';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ASSIGNTASKID
  is '��ǩ����';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.PIID
  is '�û�ǩ��������ʵ�����';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.TASKID
  is '�û�ǩ����������';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ASSIGNPARTICIPANTID
  is 'ָ�ɼ�ǩ��¼���';

prompt
prompt Creating table E_T_LC_YJ
prompt ========================
prompt
create table EAM2.E_T_LC_YJ
(
  YJTJSJ  DATE,
  YJTJR   VARCHAR2(40),
  YJMC    VARCHAR2(40),
  TID     NUMBER(22) not null,
  YJNR    VARCHAR2(2000),
  CLDBH   NUMBER(22),
  DEPT_ID NUMBER(22),
  YJLX    VARCHAR2(20),
  HJ      VARCHAR2(2000),
  FLCBH   NUMBER(22),
  ZZYJ    VARCHAR2(20),
  MKMC    VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.E_T_LC_YJ.YJTJSJ
  is '����ύʱ��';
comment on column EAM2.E_T_LC_YJ.YJTJR
  is '����ύ��';
comment on column EAM2.E_T_LC_YJ.YJMC
  is '�������';
comment on column EAM2.E_T_LC_YJ.TID
  is '�������';
comment on column EAM2.E_T_LC_YJ.YJNR
  is '�������';
comment on column EAM2.E_T_LC_YJ.CLDBH
  is 'ҵ������';
comment on column EAM2.E_T_LC_YJ.DEPT_ID
  is '���ű��';
comment on column EAM2.E_T_LC_YJ.YJLX
  is '�������';
comment on column EAM2.E_T_LC_YJ.HJ
  is '���ڻ���';
comment on column EAM2.E_T_LC_YJ.FLCBH
  is '�����̱��';
comment on column EAM2.E_T_LC_YJ.ZZYJ
  is '�������';
alter table EAM2.E_T_LC_YJ
  add constraint PK_E_T_LC_YJ primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table E_T_ZC
prompt =====================
prompt
create table EAM2.E_T_ZC
(
  ZCBH   NUMBER(22) not null,
  ZCLX   NUMBER(2),
  ZCJYFL NUMBER(2),
  ZCMC   VARCHAR2(40),
  ZCLB   NUMBER(2),
  ZCDQ   NUMBER(10),
  CFDD   NUMBER(10),
  ZJFS   NUMBER(2),
  YT     VARCHAR2(40),
  JBDW   VARCHAR2(40),
  ZCXXDZ VARCHAR2(40),
  ZCZC   NUMBER(2),
  GLBM   VARCHAR2(40),
  SYBM   VARCHAR2(40),
  KSSYRQ DATE,
  LRRQ   TIMESTAMP(6),
  LRR    VARCHAR2(40),
  TID    NUMBER(22) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.E_T_ZC
  add constraint PK_E_T_ZC primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table INDIVIDUALTREE
prompt =============================
prompt
create table EAM2.INDIVIDUALTREE
(
  CATEGORYID       VARCHAR2(32) not null,
  PARENTCATEGORYID VARCHAR2(32),
  CATEGORYNAME     VARCHAR2(200),
  ACTIVITYSTATUS   VARCHAR2(4),
  OPERATELEVEL     VARCHAR2(200),
  URL              VARCHAR2(200),
  TREETYPE         VARCHAR2(200),
  NODEORDER        NUMBER,
  NODEVALUE        VARCHAR2(20),
  HASCHILD         VARCHAR2(10),
  COLONIZEVALUE    VARCHAR2(200),
  LEAF             NUMBER,
  NODETAG          VARCHAR2(200),
  ROOTNOTE         VARCHAR2(4)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.INDIVIDUALTREE
  is '��Ƭר���ֵ�';
comment on column EAM2.INDIVIDUALTREE.CATEGORYID
  is 'Id,ԭ�м�¼�������¼�¼����UUID';
comment on column EAM2.INDIVIDUALTREE.PARENTCATEGORYID
  is '���ڵ�Id';
comment on column EAM2.INDIVIDUALTREE.CATEGORYNAME
  is '�ڵ�����';
comment on column EAM2.INDIVIDUALTREE.ACTIVITYSTATUS
  is '�״̬Y��ЧN��Ч';
comment on column EAM2.INDIVIDUALTREE.OPERATELEVEL
  is 'Ȩ��(�����ֶ�)';
comment on column EAM2.INDIVIDUALTREE.URL
  is 'url��ַ(�����ֶ�)';
comment on column EAM2.INDIVIDUALTREE.TREETYPE
  is '��������,����ֶ������ĸ�������';
comment on column EAM2.INDIVIDUALTREE.NODEORDER
  is 'ͬһ����µ�˳��';
comment on column EAM2.INDIVIDUALTREE.NODEVALUE
  is '������������ʵ��ֵ,����ֵ';
comment on column EAM2.INDIVIDUALTREE.HASCHILD
  is '�Ƿ����ӽ��ı�־ 0:û���ӽ�㣬1���ӽڵ�';
comment on column EAM2.INDIVIDUALTREE.COLONIZEVALUE
  is '��չ���ԣ��û���һЩ�����ֵ��';
comment on column EAM2.INDIVIDUALTREE.LEAF
  is '�Ƿ���Ҷ�ӽڵ�,������Haschild�ظ�';
comment on column EAM2.INDIVIDUALTREE.NODETAG
  is '�ڵ����չTAG��ϵͳ����';
comment on column EAM2.INDIVIDUALTREE.ROOTNOTE
  is 'Y�Ǹ��ڵ�';
alter table EAM2.INDIVIDUALTREE
  add constraint PK_INDIVIDUALTREE primary key (CATEGORYID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INDIVIDUALTREE_CATALOG
prompt =====================================
prompt
create table EAM2.INDIVIDUALTREE_CATALOG
(
  TREETYPE               VARCHAR2(200),
  TREENAME               VARCHAR2(200),
  TREETYPE_DESC          VARCHAR2(2000),
  TREETYPE_USEDFUNCTIONS VARCHAR2(2000),
  WRITER                 VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREETYPE
  is '��������Ӣ����';
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREENAME
  is '��������������';
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREETYPE_DESC
  is '����Ӧ���͵���ϸ����';
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREETYPE_USEDFUNCTIONS
  is '������Ӧ��ϵͳ�кδ���ʹ�������';
comment on column EAM2.INDIVIDUALTREE_CATALOG.WRITER
  is '������Ϣ��¼����Ա';

prompt
prompt Creating table JBPM4_DEPLOYMENT
prompt ===============================
prompt
create table EAM2.JBPM4_DEPLOYMENT
(
  DBID_      NUMBER(19) not null,
  NAME_      CLOB,
  TIMESTAMP_ NUMBER(19),
  STATE_     VARCHAR2(255 CHAR)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_DEPLOYMENT
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_DEPLOYPROP
prompt ===============================
prompt
create table EAM2.JBPM4_DEPLOYPROP
(
  DBID_       NUMBER(19) not null,
  DEPLOYMENT_ NUMBER(19),
  OBJNAME_    VARCHAR2(255 CHAR),
  KEY_        VARCHAR2(255 CHAR),
  STRINGVAL_  VARCHAR2(255 CHAR),
  LONGVAL_    NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_DEPLOYPROP
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_DEPLOYPROP
  add constraint FK_DEPLPROP_DEPL foreign key (DEPLOYMENT_)
  references EAM2.JBPM4_DEPLOYMENT (DBID_);
create index EAM2.IDX_DEPLPROP_DEPL on EAM2.JBPM4_DEPLOYPROP (DEPLOYMENT_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_EXECUTION
prompt ==============================
prompt
create table EAM2.JBPM4_EXECUTION
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255 CHAR) not null,
  DBVERSION_     NUMBER(10) not null,
  ACTIVITYNAME_  VARCHAR2(255 CHAR),
  PROCDEFID_     VARCHAR2(255 CHAR),
  HASVARS_       NUMBER(1),
  NAME_          VARCHAR2(255 CHAR),
  KEY_           VARCHAR2(255 CHAR),
  ID_            VARCHAR2(255 CHAR),
  STATE_         VARCHAR2(255 CHAR),
  SUSPHISTSTATE_ VARCHAR2(255 CHAR),
  PRIORITY_      NUMBER(10),
  HISACTINST_    NUMBER(19),
  PARENT_        NUMBER(19),
  INSTANCE_      NUMBER(19),
  SUPEREXEC_     NUMBER(19),
  SUBPROCINST_   NUMBER(19),
  PARENT_IDX_    NUMBER(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_EXECUTION
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_EXECUTION
  add unique (ID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_EXECUTION
  add constraint FK_EXEC_INSTANCE foreign key (INSTANCE_)
  references EAM2.JBPM4_EXECUTION (DBID_);
alter table EAM2.JBPM4_EXECUTION
  add constraint FK_EXEC_PARENT foreign key (PARENT_)
  references EAM2.JBPM4_EXECUTION (DBID_);
alter table EAM2.JBPM4_EXECUTION
  add constraint FK_EXEC_SUBPI foreign key (SUBPROCINST_)
  references EAM2.JBPM4_EXECUTION (DBID_);
alter table EAM2.JBPM4_EXECUTION
  add constraint FK_EXEC_SUPEREXEC foreign key (SUPEREXEC_)
  references EAM2.JBPM4_EXECUTION (DBID_);
create index EAM2.IDX_EXEC_INSTANCE on EAM2.JBPM4_EXECUTION (INSTANCE_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_EXEC_PARENT on EAM2.JBPM4_EXECUTION (PARENT_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_EXEC_SUBPI on EAM2.JBPM4_EXECUTION (SUBPROCINST_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_EXEC_SUPEREXEC on EAM2.JBPM4_EXECUTION (SUPEREXEC_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_EXECUTION_COP_20130506
prompt ===========================================
prompt
create table EAM2.JBPM4_EXECUTION_COP_20130506
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255 CHAR) not null,
  DBVERSION_     NUMBER(10) not null,
  ACTIVITYNAME_  VARCHAR2(255 CHAR),
  PROCDEFID_     VARCHAR2(255 CHAR),
  HASVARS_       NUMBER(1),
  NAME_          VARCHAR2(255 CHAR),
  KEY_           VARCHAR2(255 CHAR),
  ID_            VARCHAR2(255 CHAR),
  STATE_         VARCHAR2(255 CHAR),
  SUSPHISTSTATE_ VARCHAR2(255 CHAR),
  PRIORITY_      NUMBER(10),
  HISACTINST_    NUMBER(19),
  PARENT_        NUMBER(19),
  INSTANCE_      NUMBER(19),
  SUPEREXEC_     NUMBER(19),
  SUBPROCINST_   NUMBER(19),
  PARENT_IDX_    NUMBER(10)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_HIST_PROCINST
prompt ==================================
prompt
create table EAM2.JBPM4_HIST_PROCINST
(
  DBID_        NUMBER(19) not null,
  DBVERSION_   NUMBER(10) not null,
  ID_          VARCHAR2(255 CHAR),
  PROCDEFID_   VARCHAR2(255 CHAR),
  KEY_         VARCHAR2(255 CHAR),
  START_       TIMESTAMP(6),
  END_         TIMESTAMP(6),
  DURATION_    NUMBER(19),
  STATE_       VARCHAR2(255 CHAR),
  ENDACTIVITY_ VARCHAR2(255 CHAR),
  NEXTIDX_     NUMBER(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_PROCINST
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_HIST_TASK
prompt ==============================
prompt
create table EAM2.JBPM4_HIST_TASK
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  EXECUTION_ VARCHAR2(255 CHAR),
  OUTCOME_   VARCHAR2(255 CHAR),
  ASSIGNEE_  VARCHAR2(255 CHAR),
  PRIORITY_  NUMBER(10),
  STATE_     VARCHAR2(255 CHAR),
  CREATE_    TIMESTAMP(6),
  END_       TIMESTAMP(6),
  DURATION_  NUMBER(19),
  NEXTIDX_   NUMBER(10),
  SUPERTASK_ NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_TASK
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_TASK
  add constraint FK_HSUPERT_SUB foreign key (SUPERTASK_)
  references EAM2.JBPM4_HIST_TASK (DBID_);
create index EAM2.IDX_HSUPERT_SUB on EAM2.JBPM4_HIST_TASK (SUPERTASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_HIST_ACTINST
prompt =================================
prompt
create table EAM2.JBPM4_HIST_ACTINST
(
  DBID_          NUMBER(19) not null,
  CLASS_         VARCHAR2(255 CHAR) not null,
  DBVERSION_     NUMBER(10) not null,
  HPROCI_        NUMBER(19),
  TYPE_          VARCHAR2(255 CHAR),
  EXECUTION_     VARCHAR2(255 CHAR),
  ACTIVITY_NAME_ VARCHAR2(255 CHAR),
  START_         TIMESTAMP(6),
  END_           TIMESTAMP(6),
  DURATION_      NUMBER(19),
  TRANSITION_    VARCHAR2(255 CHAR),
  NEXTIDX_       NUMBER(10),
  HTASK_         NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_ACTINST
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_ACTINST
  add constraint FK_HACTI_HPROCI foreign key (HPROCI_)
  references EAM2.JBPM4_HIST_PROCINST (DBID_);
alter table EAM2.JBPM4_HIST_ACTINST
  add constraint FK_HTI_HTASK foreign key (HTASK_)
  references EAM2.JBPM4_HIST_TASK (DBID_);
create index EAM2.IDX_HACTI_HPROCI on EAM2.JBPM4_HIST_ACTINST (HPROCI_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_HTI_HTASK on EAM2.JBPM4_HIST_ACTINST (HTASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_HIST_VAR
prompt =============================
prompt
create table EAM2.JBPM4_HIST_VAR
(
  DBID_        NUMBER(19) not null,
  DBVERSION_   NUMBER(10) not null,
  PROCINSTID_  VARCHAR2(255 CHAR),
  EXECUTIONID_ VARCHAR2(255 CHAR),
  VARNAME_     VARCHAR2(255 CHAR),
  VALUE_       VARCHAR2(255 CHAR),
  HPROCI_      NUMBER(19),
  HTASK_       NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_HIST_VAR
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_HIST_VAR
  add constraint FK_HVAR_HPROCI foreign key (HPROCI_)
  references EAM2.JBPM4_HIST_PROCINST (DBID_);
alter table EAM2.JBPM4_HIST_VAR
  add constraint FK_HVAR_HTASK foreign key (HTASK_)
  references EAM2.JBPM4_HIST_TASK (DBID_);
create index EAM2.IDX_HVAR_HPROCI on EAM2.JBPM4_HIST_VAR (HPROCI_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_HVAR_HTASK on EAM2.JBPM4_HIST_VAR (HTASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_HIST_DETAIL
prompt ================================
prompt
create table EAM2.JBPM4_HIST_DETAIL
(
  DBID_       NUMBER(19) not null,
  CLASS_      VARCHAR2(255 CHAR) not null,
  DBVERSION_  NUMBER(10) not null,
  USERID_     VARCHAR2(255 CHAR),
  TIME_       TIMESTAMP(6),
  HPROCI_     NUMBER(19),
  HPROCIIDX_  NUMBER(10),
  HACTI_      NUMBER(19),
  HACTIIDX_   NUMBER(10),
  HTASK_      NUMBER(19),
  HTASKIDX_   NUMBER(10),
  HVAR_       NUMBER(19),
  HVARIDX_    NUMBER(10),
  MESSAGE_    CLOB,
  OLD_STR_    VARCHAR2(255 CHAR),
  NEW_STR_    VARCHAR2(255 CHAR),
  OLD_INT_    NUMBER(10),
  NEW_INT_    NUMBER(10),
  OLD_TIME_   TIMESTAMP(6),
  NEW_TIME_   TIMESTAMP(6),
  PARENT_     NUMBER(19),
  PARENT_IDX_ NUMBER(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_DETAIL
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_HIST_DETAIL
  add constraint FK_HDETAIL_HACTI foreign key (HACTI_)
  references EAM2.JBPM4_HIST_ACTINST (DBID_);
alter table EAM2.JBPM4_HIST_DETAIL
  add constraint FK_HDETAIL_HPROCI foreign key (HPROCI_)
  references EAM2.JBPM4_HIST_PROCINST (DBID_);
alter table EAM2.JBPM4_HIST_DETAIL
  add constraint FK_HDETAIL_HTASK foreign key (HTASK_)
  references EAM2.JBPM4_HIST_TASK (DBID_);
alter table EAM2.JBPM4_HIST_DETAIL
  add constraint FK_HDETAIL_HVAR foreign key (HVAR_)
  references EAM2.JBPM4_HIST_VAR (DBID_);
create index EAM2.IDX_HDET_HACTI on EAM2.JBPM4_HIST_DETAIL (HACTI_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_HDET_HPROCI on EAM2.JBPM4_HIST_DETAIL (HPROCI_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_HDET_HTASK on EAM2.JBPM4_HIST_DETAIL (HTASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_HDET_HVAR on EAM2.JBPM4_HIST_DETAIL (HVAR_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_ID_GROUP
prompt =============================
prompt
create table EAM2.JBPM4_ID_GROUP
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  ID_        VARCHAR2(255 CHAR),
  NAME_      VARCHAR2(255 CHAR),
  TYPE_      VARCHAR2(255 CHAR),
  PARENT_    NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_ID_GROUP
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_ID_GROUP
  add constraint FK_GROUP_PARENT foreign key (PARENT_)
  references EAM2.JBPM4_ID_GROUP (DBID_);
create index EAM2.IDX_GROUP_PARENT on EAM2.JBPM4_ID_GROUP (PARENT_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_ID_USER
prompt ============================
prompt
create table EAM2.JBPM4_ID_USER
(
  DBID_          NUMBER(19) not null,
  DBVERSION_     NUMBER(10) not null,
  ID_            VARCHAR2(255 CHAR),
  PASSWORD_      VARCHAR2(255 CHAR),
  GIVENNAME_     VARCHAR2(255 CHAR),
  FAMILYNAME_    VARCHAR2(255 CHAR),
  BUSINESSEMAIL_ VARCHAR2(255 CHAR)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_ID_USER
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_ID_MEMBERSHIP
prompt ==================================
prompt
create table EAM2.JBPM4_ID_MEMBERSHIP
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  USER_      NUMBER(19),
  GROUP_     NUMBER(19),
  NAME_      VARCHAR2(255 CHAR)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_ID_MEMBERSHIP
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_ID_MEMBERSHIP
  add constraint FK_MEM_GROUP foreign key (GROUP_)
  references EAM2.JBPM4_ID_GROUP (DBID_);
alter table EAM2.JBPM4_ID_MEMBERSHIP
  add constraint FK_MEM_USER foreign key (USER_)
  references EAM2.JBPM4_ID_USER (DBID_);
create index EAM2.IDX_MEM_GROUP on EAM2.JBPM4_ID_MEMBERSHIP (GROUP_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_MEM_USER on EAM2.JBPM4_ID_MEMBERSHIP (USER_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_LOB
prompt ========================
prompt
create table EAM2.JBPM4_LOB
(
  DBID_       NUMBER(19) not null,
  DBVERSION_  NUMBER(10) not null,
  BLOB_VALUE_ BLOB,
  DEPLOYMENT_ NUMBER(19),
  NAME_       CLOB
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_LOB
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_LOB
  add constraint FK_LOB_DEPLOYMENT foreign key (DEPLOYMENT_)
  references EAM2.JBPM4_DEPLOYMENT (DBID_);
create index EAM2.IDX_LOB_DEPLOYMENT on EAM2.JBPM4_LOB (DEPLOYMENT_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_JOB
prompt ========================
prompt
create table EAM2.JBPM4_JOB
(
  DBID_            NUMBER(19) not null,
  CLASS_           VARCHAR2(255 CHAR) not null,
  DBVERSION_       NUMBER(10) not null,
  DUEDATE_         TIMESTAMP(6),
  STATE_           VARCHAR2(255 CHAR),
  ISEXCLUSIVE_     NUMBER(1),
  LOCKOWNER_       VARCHAR2(255 CHAR),
  LOCKEXPTIME_     TIMESTAMP(6),
  EXCEPTION_       CLOB,
  RETRIES_         NUMBER(10),
  PROCESSINSTANCE_ NUMBER(19),
  EXECUTION_       NUMBER(19),
  CFG_             NUMBER(19),
  SIGNAL_          VARCHAR2(255 CHAR),
  EVENT_           VARCHAR2(255 CHAR),
  REPEAT_          VARCHAR2(255 CHAR)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_JOB
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_JOB
  add constraint FK_JOB_CFG foreign key (CFG_)
  references EAM2.JBPM4_LOB (DBID_);
create index EAM2.IDX_JOBDUEDATE on EAM2.JBPM4_JOB (DUEDATE_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_JOBLOCKEXP on EAM2.JBPM4_JOB (LOCKEXPTIME_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_JOBRETRIES on EAM2.JBPM4_JOB (RETRIES_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_JOB_CFG on EAM2.JBPM4_JOB (CFG_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_JOB_EXE on EAM2.JBPM4_JOB (EXECUTION_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
create index EAM2.IDX_JOB_PRINST on EAM2.JBPM4_JOB (PROCESSINSTANCE_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_LOB_TEMP
prompt =============================
prompt
create table EAM2.JBPM4_LOB_TEMP
(
  DBID_       NUMBER(19) not null,
  DBVERSION_  NUMBER(10) not null,
  BLOB_VALUE_ BLOB,
  DEPLOYMENT_ NUMBER(19),
  NAME_       CLOB
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_SWIMLANE
prompt =============================
prompt
create table EAM2.JBPM4_SWIMLANE
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  NAME_      VARCHAR2(255 CHAR),
  ASSIGNEE_  VARCHAR2(255 CHAR),
  EXECUTION_ NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_SWIMLANE
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_SWIMLANE
  add constraint FK_SWIMLANE_EXEC foreign key (EXECUTION_)
  references EAM2.JBPM4_EXECUTION (DBID_);
create index EAM2.IDX_SWIMLANE_EXEC on EAM2.JBPM4_SWIMLANE (EXECUTION_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_TASK
prompt =========================
prompt
create table EAM2.JBPM4_TASK
(
  DBID_          NUMBER(19) not null,
  CLASS_         CHAR(1 CHAR) not null,
  DBVERSION_     NUMBER(10) not null,
  NAME_          VARCHAR2(255 CHAR),
  DESCR_         CLOB,
  STATE_         VARCHAR2(255 CHAR),
  SUSPHISTSTATE_ VARCHAR2(255 CHAR),
  ASSIGNEE_      VARCHAR2(255 CHAR),
  FORM_          VARCHAR2(255 CHAR),
  PRIORITY_      NUMBER(10),
  CREATE_        TIMESTAMP(6),
  DUEDATE_       TIMESTAMP(6),
  PROGRESS_      NUMBER(10),
  SIGNALLING_    NUMBER(1),
  EXECUTION_ID_  VARCHAR2(255 CHAR),
  ACTIVITY_NAME_ VARCHAR2(255 CHAR),
  HASVARS_       NUMBER(1),
  SUPERTASK_     NUMBER(19),
  EXECUTION_     NUMBER(19),
  PROCINST_      NUMBER(19),
  SWIMLANE_      NUMBER(19),
  TASKDEFNAME_   VARCHAR2(255 CHAR)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_TASK
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_TASK
  add constraint FK_TASK_SUPERTASK foreign key (SUPERTASK_)
  references EAM2.JBPM4_TASK (DBID_);
alter table EAM2.JBPM4_TASK
  add constraint FK_TASK_SWIML foreign key (SWIMLANE_)
  references EAM2.JBPM4_SWIMLANE (DBID_);
create index EAM2.IDX_TASK_SUPERTASK on EAM2.JBPM4_TASK (SUPERTASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_PARTICIPATION
prompt ==================================
prompt
create table EAM2.JBPM4_PARTICIPATION
(
  DBID_      NUMBER(19) not null,
  DBVERSION_ NUMBER(10) not null,
  GROUPID_   VARCHAR2(255 CHAR),
  USERID_    VARCHAR2(255 CHAR),
  TYPE_      VARCHAR2(255 CHAR),
  TASK_      NUMBER(19),
  SWIMLANE_  NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_PARTICIPATION
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.JBPM4_PARTICIPATION
  add constraint FK_PART_SWIMLANE foreign key (SWIMLANE_)
  references EAM2.JBPM4_SWIMLANE (DBID_);
alter table EAM2.JBPM4_PARTICIPATION
  add constraint FK_PART_TASK foreign key (TASK_)
  references EAM2.JBPM4_TASK (DBID_);
create index EAM2.IDX_PART_TASK on EAM2.JBPM4_PARTICIPATION (TASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JBPM4_PROPERTY
prompt =============================
prompt
create table EAM2.JBPM4_PROPERTY
(
  KEY_     VARCHAR2(255 CHAR) not null,
  VERSION_ NUMBER(10) not null,
  VALUE_   VARCHAR2(255 CHAR)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_PROPERTY
  add primary key (KEY_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_VARIABLE
prompt =============================
prompt
create table EAM2.JBPM4_VARIABLE
(
  DBID_         NUMBER(19) not null,
  CLASS_        VARCHAR2(255 CHAR) not null,
  DBVERSION_    NUMBER(10) not null,
  KEY_          VARCHAR2(255 CHAR),
  CONVERTER_    VARCHAR2(255 CHAR),
  HIST_         NUMBER(1),
  EXECUTION_    NUMBER(19),
  TASK_         NUMBER(19),
  LOB_          NUMBER(19),
  DATE_VALUE_   TIMESTAMP(6),
  DOUBLE_VALUE_ FLOAT,
  CLASSNAME_    VARCHAR2(255 CHAR),
  LONG_VALUE_   NUMBER(19),
  STRING_VALUE_ VARCHAR2(255 CHAR),
  TEXT_VALUE_   CLOB,
  EXESYS_       NUMBER(19)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_VARIABLE
  add primary key (DBID_)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JBPM4_VARIABLE
  add constraint FK_VAR_EXECUTION foreign key (EXECUTION_)
  references EAM2.JBPM4_EXECUTION (DBID_);
alter table EAM2.JBPM4_VARIABLE
  add constraint FK_VAR_EXESYS foreign key (EXESYS_)
  references EAM2.JBPM4_EXECUTION (DBID_);
alter table EAM2.JBPM4_VARIABLE
  add constraint FK_VAR_LOB foreign key (LOB_)
  references EAM2.JBPM4_LOB (DBID_);
alter table EAM2.JBPM4_VARIABLE
  add constraint FK_VAR_TASK foreign key (TASK_)
  references EAM2.JBPM4_TASK (DBID_);
create index EAM2.IDX_VAR_EXECUTION on EAM2.JBPM4_VARIABLE (EXECUTION_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_VAR_EXESYS on EAM2.JBPM4_VARIABLE (EXESYS_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_VAR_LOB on EAM2.JBPM4_VARIABLE (LOB_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_VAR_TASK on EAM2.JBPM4_VARIABLE (TASK_)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JBPM4_VARIABLE_TEMP
prompt ==================================
prompt
create table EAM2.JBPM4_VARIABLE_TEMP
(
  DBID_         NUMBER(19) not null,
  CLASS_        VARCHAR2(255 CHAR) not null,
  DBVERSION_    NUMBER(10) not null,
  KEY_          VARCHAR2(255 CHAR),
  CONVERTER_    VARCHAR2(255 CHAR),
  HIST_         NUMBER(1),
  EXECUTION_    NUMBER(19),
  TASK_         NUMBER(19),
  LOB_          NUMBER(19),
  DATE_VALUE_   TIMESTAMP(6),
  DOUBLE_VALUE_ FLOAT,
  CLASSNAME_    VARCHAR2(255 CHAR),
  LONG_VALUE_   NUMBER(19),
  STRING_VALUE_ VARCHAR2(255 CHAR),
  TEXT_VALUE_   CLOB,
  EXESYS_       NUMBER(19)
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_GCTB_XX
prompt ===========================
prompt
create table EAM2.JJZC_GCTB_XX
(
  ID          VARCHAR2(32) not null,
  CLD_ID      VARCHAR2(32),
  ZC_ID       VARCHAR2(32),
  BXGSMC      VARCHAR2(300),
  SYXBF       NUMBER(20,4),
  SYXKSRQ     DATE,
  SYXJSRQ     DATE,
  JQXBF       NUMBER(20,4),
  JQXKSRQ     DATE,
  JQXJSRQ     DATE,
  SFHJ        NUMBER(20,4),
  CCSJE       NUMBER(20,4),
  PJTBZE      NUMBER(20,4),
  GCTBKSRQ    DATE,
  GCTBJSRQ    DATE,
  CCYQXTBZCZE NUMBER(20,4),
  CZYQXFL     NUMBER(7,4),
  CZYQXZK     NUMBER(7,4),
  CZYQXBF     NUMBER(20,4),
  JQSHXTBZCZE NUMBER(20,4),
  JQSHXFL     NUMBER(7,4),
  JQSHXZK     NUMBER(7,4),
  JIQISHXBF   NUMBER(20,4),
  GGZRXBE     NUMBER(20,4),
  GGZRXBXFL   NUMBER(7,4),
  GGZRXBF     NUMBER(20,4),
  SPZT        VARCHAR2(10),
  TBLX        VARCHAR2(10),
  CLQNTPJE    NUMBER(20,4),
  TBZE        NUMBER(20,4),
  TBZHJ       NUMBER(20,4)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JJZC_GCTB_XX
  is '�̲�Ͷ����Ϣ';
comment on column EAM2.JJZC_GCTB_XX.CLD_ID
  is '����ID';
comment on column EAM2.JJZC_GCTB_XX.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JJZC_GCTB_XX.BXGSMC
  is '���չ�˾����';
comment on column EAM2.JJZC_GCTB_XX.SYXBF
  is '��ҵ�ձ���';
comment on column EAM2.JJZC_GCTB_XX.SYXKSRQ
  is '��ҵ�տ�ʼ����';
comment on column EAM2.JJZC_GCTB_XX.SYXJSRQ
  is '��ҵ�ս�������';
comment on column EAM2.JJZC_GCTB_XX.JQXBF
  is '��ǿ�ձ���';
comment on column EAM2.JJZC_GCTB_XX.JQXKSRQ
  is '��ǿ�տ�ʼ����';
comment on column EAM2.JJZC_GCTB_XX.JQXJSRQ
  is '��ǿ�ս�������';
comment on column EAM2.JJZC_GCTB_XX.SFHJ
  is '˰�Ѻϼ�';
comment on column EAM2.JJZC_GCTB_XX.CCSJE
  is '����˰���';
comment on column EAM2.JJZC_GCTB_XX.PJTBZE
  is '����ȥ��ƽ��Ͷ���ܶ�';
comment on column EAM2.JJZC_GCTB_XX.GCTBKSRQ
  is '�̲�Ͷ����ʼ����';
comment on column EAM2.JJZC_GCTB_XX.GCTBJSRQ
  is '�̲�Ͷ����������';
comment on column EAM2.JJZC_GCTB_XX.CCYQXTBZCZE
  is '�Ʋ�һ����Ͷ���ʲ��ܶ�';
comment on column EAM2.JJZC_GCTB_XX.CZYQXFL
  is '�Ʋ�һ���շ���';
comment on column EAM2.JJZC_GCTB_XX.CZYQXZK
  is '�Ʋ�һ�����ۿ�';
comment on column EAM2.JJZC_GCTB_XX.CZYQXBF
  is '�Ʋ�һ���ձ���';
comment on column EAM2.JJZC_GCTB_XX.JQSHXTBZCZE
  is '��������Ͷ���ʲ��ܶ�';
comment on column EAM2.JJZC_GCTB_XX.JQSHXFL
  is '�������շ���';
comment on column EAM2.JJZC_GCTB_XX.JQSHXZK
  is '���������ۿ�';
comment on column EAM2.JJZC_GCTB_XX.JIQISHXBF
  is '�������ձ���';
comment on column EAM2.JJZC_GCTB_XX.GGZRXBE
  is '���������ձ���';
comment on column EAM2.JJZC_GCTB_XX.GGZRXBXFL
  is '�����������ۿ�';
comment on column EAM2.JJZC_GCTB_XX.GGZRXBF
  is '���������ձ���';
comment on column EAM2.JJZC_GCTB_XX.SPZT
  is '����״̬  0��δ����
1��������
2����������';
comment on column EAM2.JJZC_GCTB_XX.TBLX
  is 'Ͷ������0������Ͷ�� 1���ǳ���Ͷ��';
comment on column EAM2.JJZC_GCTB_XX.CLQNTPJE
  is '����ȥ��Ͷ��ƽ����';
comment on column EAM2.JJZC_GCTB_XX.TBZE
  is '�ǳ���Ͷ���ܶ�';
comment on column EAM2.JJZC_GCTB_XX.TBZHJ
  is 'Ͷ���ܺϼ�';
alter table EAM2.JJZC_GCTB_XX
  add constraint PK_JJZC_GCTB_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_HTQS_HEAD
prompt =============================
prompt
create table EAM2.JJZC_HTQS_HEAD
(
  ID        VARCHAR2(32) not null,
  LC_ID     VARCHAR2(32),
  BIAOTI    VARCHAR2(300),
  BIANHAO   VARCHAR2(300),
  JHCD      VARCHAR2(10),
  NGR       VARCHAR2(32),
  NGRMC     VARCHAR2(300),
  LXDH      VARCHAR2(300),
  NGRQ      DATE,
  NGBM      VARCHAR2(32),
  NGBMMC    VARCHAR2(300),
  BEIZHU    VARCHAR2(1000),
  YWLX      VARCHAR2(10),
  LCMC      VARCHAR2(32),
  SFBB      VARCHAR2(10),
  SHEETTYPE VARCHAR2(300),
  QSPC      VARCHAR2(300),
  QSLX      VARCHAR2(100),
  YSYFZJE   NUMBER(20,2),
  TZZJE     NUMBER(20,2),
  THYSYFZJE NUMBER(20,2),
  SSZJE     NUMBER(20,2),
  SSTZZJE   NUMBER(20,2),
  THSSZJE   NUMBER(20,2),
  ZHUANGTAI VARCHAR2(10),
  CHENGSONG VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.JJZC_HTQS_HEAD.ID
  is 'ID';
comment on column EAM2.JJZC_HTQS_HEAD.LC_ID
  is '����ID';
comment on column EAM2.JJZC_HTQS_HEAD.BIAOTI
  is '����';
comment on column EAM2.JJZC_HTQS_HEAD.BIANHAO
  is '���';
comment on column EAM2.JJZC_HTQS_HEAD.JHCD
  is '�����̶�';
comment on column EAM2.JJZC_HTQS_HEAD.NGR
  is '����˱��';
comment on column EAM2.JJZC_HTQS_HEAD.NGRMC
  is '���������';
comment on column EAM2.JJZC_HTQS_HEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.JJZC_HTQS_HEAD.NGRQ
  is '�������';
comment on column EAM2.JJZC_HTQS_HEAD.NGBM
  is '��岿��';
comment on column EAM2.JJZC_HTQS_HEAD.NGBMMC
  is '��岿������';
comment on column EAM2.JJZC_HTQS_HEAD.BEIZHU
  is '��ע';
comment on column EAM2.JJZC_HTQS_HEAD.YWLX
  is '0��ȷȨ����
1�����¸���
2��ҵ��ά��
3��������������';
comment on column EAM2.JJZC_HTQS_HEAD.LCMC
  is '��������';
comment on column EAM2.JJZC_HTQS_HEAD.SFBB
  is '��岿���Ƿ�Ϊ����  0����
1����';
comment on column EAM2.JJZC_HTQS_HEAD.SHEETTYPE
  is '������';
comment on column EAM2.JJZC_HTQS_HEAD.QSPC
  is '��������';
comment on column EAM2.JJZC_HTQS_HEAD.QSLX
  is '��������';
comment on column EAM2.JJZC_HTQS_HEAD.YSYFZJE
  is 'Ӧ��/Ӧ���ܽ��';
comment on column EAM2.JJZC_HTQS_HEAD.TZZJE
  is '�����ܽ��';
comment on column EAM2.JJZC_HTQS_HEAD.THYSYFZJE
  is '������Ӧ��/Ӧ���ܽ��';
comment on column EAM2.JJZC_HTQS_HEAD.SSZJE
  is 'ʵ���ܽ��';
comment on column EAM2.JJZC_HTQS_HEAD.SSTZZJE
  is 'ʵ�յ����ܽ��';
comment on column EAM2.JJZC_HTQS_HEAD.THSSZJE
  is '������ʵ���ܽ��';
comment on column EAM2.JJZC_HTQS_HEAD.ZHUANGTAI
  is '״̬ 1������ 2������';
comment on column EAM2.JJZC_HTQS_HEAD.CHENGSONG
  is '����';
alter table EAM2.JJZC_HTQS_HEAD
  add constraint PK_JJZC_HTQS_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_HT_BX
prompt =========================
prompt
create table EAM2.JJZC_HT_BX
(
  ID          VARCHAR2(32) not null,
  CLD_ID      VARCHAR2(32),
  HTBH        VARCHAR2(300),
  SWHTBH      VARCHAR2(300),
  HTLX        VARCHAR2(30),
  C_HTZT      VARCHAR2(30),
  C_YJFH      VARCHAR2(30),
  BXGSMC      VARCHAR2(300),
  BXGSDZ      VARCHAR2(300),
  BXGSLXR     VARCHAR2(300),
  LXRDH       VARCHAR2(300),
  CPH         VARCHAR2(300),
  SYXBF       NUMBER(20,4),
  SYXKSRQ     DATE,
  SYXJSRQ     DATE,
  JQXBF       NUMBER(20,4),
  JQXKSRQ     DATE,
  JQXJSRQ     DATE,
  CCSJE       NUMBER(20,4),
  SFHJ        NUMBER(20,4),
  JIQISHXBXFL NUMBER(7,4),
  JIQISHXBF   NUMBER(20,4),
  JIQIXKSRQ   DATE,
  JIQIXJSRQ   DATE,
  GGZRXBXFL   NUMBER(7,4),
  GGZRXBF     NUMBER(20,4),
  GGZRXKSRQ   DATE,
  GGZRXJSRQ   DATE,
  CCXBXFL     NUMBER(7,4),
  CCXBF       NUMBER(20,4),
  CCXKSRQ     DATE,
  CCXJSRQ     DATE,
  HTQSRQ      DATE,
  HTDQRQ      DATE,
  SPZT        VARCHAR2(10),
  ZCID        VARCHAR2(32),
  ZCBH        VARCHAR2(300),
  ZCMC        VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.JJZC_HT_BX.ID
  is 'uuid������';
comment on column EAM2.JJZC_HT_BX.CLD_ID
  is '����ID';
comment on column EAM2.JJZC_HT_BX.HTBH
  is '��ͬ���';
comment on column EAM2.JJZC_HT_BX.SWHTBH
  is 'ʵ���ͬ���';
comment on column EAM2.JJZC_HT_BX.HTLX
  is '��ͬ����  ���պ�ͬ �ǳ��պ�ͬ';
comment on column EAM2.JJZC_HT_BX.C_HTZT
  is '��ͬ״̬';
comment on column EAM2.JJZC_HT_BX.C_YJFH
  is 'һ������';
comment on column EAM2.JJZC_HT_BX.BXGSMC
  is '���չ�˾����';
comment on column EAM2.JJZC_HT_BX.BXGSDZ
  is '���չ�˾��ַ';
comment on column EAM2.JJZC_HT_BX.BXGSLXR
  is '���չ�˾��ϵ��';
comment on column EAM2.JJZC_HT_BX.LXRDH
  is '��ϵ�˵绰';
comment on column EAM2.JJZC_HT_BX.CPH
  is '���ƺ�';
comment on column EAM2.JJZC_HT_BX.SYXBF
  is '��ҵ�ձ���';
comment on column EAM2.JJZC_HT_BX.SYXKSRQ
  is '��ҵ�տ�ʼ����';
comment on column EAM2.JJZC_HT_BX.SYXJSRQ
  is '��ҵ�ս�������';
comment on column EAM2.JJZC_HT_BX.JQXBF
  is '��ǿ�ձ���';
comment on column EAM2.JJZC_HT_BX.JQXKSRQ
  is '��ǿ�տ�ʼ����';
comment on column EAM2.JJZC_HT_BX.JQXJSRQ
  is '��ǿ�ս�������';
comment on column EAM2.JJZC_HT_BX.CCSJE
  is '����˰���';
comment on column EAM2.JJZC_HT_BX.SFHJ
  is '˰�Ѻϼ�';
comment on column EAM2.JJZC_HT_BX.JIQISHXBXFL
  is '�������ձ��շ���';
comment on column EAM2.JJZC_HT_BX.JIQISHXBF
  is '�������ձ���';
comment on column EAM2.JJZC_HT_BX.JIQIXKSRQ
  is '�����տ�ʼ����';
comment on column EAM2.JJZC_HT_BX.JIQIXJSRQ
  is '�����ս�������';
comment on column EAM2.JJZC_HT_BX.GGZRXBXFL
  is '���������ձ��շ���';
comment on column EAM2.JJZC_HT_BX.GGZRXBF
  is '���������ձ���';
comment on column EAM2.JJZC_HT_BX.GGZRXKSRQ
  is '���������տ�ʼ����';
comment on column EAM2.JJZC_HT_BX.GGZRXJSRQ
  is '���������ս�������';
comment on column EAM2.JJZC_HT_BX.CCXBXFL
  is '�Ʋ��ձ��շ���';
comment on column EAM2.JJZC_HT_BX.CCXBF
  is '�Ʋ��ձ���';
comment on column EAM2.JJZC_HT_BX.CCXKSRQ
  is '�Ʋ��տ�ʼ����';
comment on column EAM2.JJZC_HT_BX.CCXJSRQ
  is '�Ʋ��ս�������';
comment on column EAM2.JJZC_HT_BX.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.JJZC_HT_BX.HTDQRQ
  is '��ͬ��������';
comment on column EAM2.JJZC_HT_BX.SPZT
  is '����״̬  0��δ����
1��������
2����������';
comment on column EAM2.JJZC_HT_BX.ZCID
  is '�ʲ�ID';
comment on column EAM2.JJZC_HT_BX.ZCBH
  is '�ʲ����';
comment on column EAM2.JJZC_HT_BX.ZCMC
  is '�ʲ�����';
alter table EAM2.JJZC_HT_BX
  add constraint PK_JJZC_HT_BX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JJZC_HT_BXZCGX
prompt =============================
prompt
create table EAM2.JJZC_HT_BXZCGX
(
  ID      VARCHAR2(32) not null,
  ZC_ID   VARCHAR2(32) not null,
  BXHT_ID VARCHAR2(32),
  SPZT    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.JJZC_HT_BXZCGX
  is '�ǳ���һ�ź�ͬ���ն����ʲ�����¼��ͬ���ʲ���ϵ��Ϣ';
comment on column EAM2.JJZC_HT_BXZCGX.ID
  is 'uuid������';
comment on column EAM2.JJZC_HT_BXZCGX.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JJZC_HT_BXZCGX.BXHT_ID
  is '���պ�ͬID';
comment on column EAM2.JJZC_HT_BXZCGX.SPZT
  is '����״̬  0��δ����
1��������
2����������';
alter table EAM2.JJZC_HT_BXZCGX
  add constraint PK_JJZC_HT_BXZCGX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JJZC_HT_JDZJ
prompt ===========================
prompt
create table EAM2.JJZC_HT_JDZJ
(
  ID       VARCHAR2(32) not null,
  HT_ID    VARCHAR2(32),
  KSRQ     DATE,
  JSRQ     DATE,
  BIANDONG NUMBER(20,4),
  YZJ      NUMBER(20,2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JJZC_HT_JDZJ
  is '���޺�ͬ�׶����';
comment on column EAM2.JJZC_HT_JDZJ.ID
  is 'ID';
comment on column EAM2.JJZC_HT_JDZJ.HT_ID
  is '��ͬID';
comment on column EAM2.JJZC_HT_JDZJ.KSRQ
  is '��ʼ����';
comment on column EAM2.JJZC_HT_JDZJ.JSRQ
  is '��������';
comment on column EAM2.JJZC_HT_JDZJ.BIANDONG
  is '�䶯';
comment on column EAM2.JJZC_HT_JDZJ.YZJ
  is '�����';
alter table EAM2.JJZC_HT_JDZJ
  add constraint PK_JJZC_HT_JDZJ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_HT_JDZJ_LSB
prompt ===============================
prompt
create table EAM2.JJZC_HT_JDZJ_LSB
(
  ID       VARCHAR2(32) not null,
  HT_ID    VARCHAR2(32),
  KSRQ     DATE,
  JSRQ     DATE,
  BIANDONG NUMBER(20,4),
  YZJ      NUMBER(20,2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JJZC_HT_JDZJ_LSB
  is '���޺�ͬ�׶������ʱ��';
comment on column EAM2.JJZC_HT_JDZJ_LSB.ID
  is 'ID';
comment on column EAM2.JJZC_HT_JDZJ_LSB.HT_ID
  is '��ͬID';
comment on column EAM2.JJZC_HT_JDZJ_LSB.KSRQ
  is '��ʼ����';
comment on column EAM2.JJZC_HT_JDZJ_LSB.JSRQ
  is '��������';
comment on column EAM2.JJZC_HT_JDZJ_LSB.BIANDONG
  is '�䶯';
comment on column EAM2.JJZC_HT_JDZJ_LSB.YZJ
  is '�����';
alter table EAM2.JJZC_HT_JDZJ_LSB
  add constraint PK_JJZC_HT_JDZJ_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_HT_ZLWG
prompt ===========================
prompt
create table EAM2.JJZC_HT_ZLWG
(
  ID         VARCHAR2(32) not null,
  ZCID       VARCHAR2(32),
  ZCBH       VARCHAR2(300),
  ZCMC       VARCHAR2(300),
  SWHTBH     VARCHAR2(100),
  C_HTLX     VARCHAR2(50),
  HTBH       VARCHAR2(300),
  C_HTZT     VARCHAR2(50),
  CZR        VARCHAR2(300),
  C_CZRXZ    VARCHAR2(32),
  CZLXR      VARCHAR2(300),
  CZFLXDH    VARCHAR2(300),
  JBRLXDH    VARCHAR2(300),
  JYDX       VARCHAR2(50),
  CZSL       NUMBER(20,4),
  YZJ        NUMBER(20,4),
  ZJSFHWYF   VARCHAR2(100),
  ZJSFHSDF   VARCHAR2(100),
  ZJJG       NUMBER(20,4),
  JSFS       VARCHAR2(50),
  C_ZJJSFS   VARCHAR2(32),
  DDTLFWZJJG NUMBER(20,4),
  LJZJ       NUMBER(20,4),
  YAJIN      NUMBER(20,4),
  YSYJ       NUMBER(20,4),
  WYJ        NUMBER(20,4),
  YSWYJ      NUMBER(20,4),
  HTQSRQ     DATE,
  HTDQRQ     DATE,
  MZQSRQ     DATE,
  MZDQRQ     DATE,
  SCQSRQ     DATE,
  ZLQSTZJE   NUMBER(20,4),
  SCQSJZRQ   DATE,
  CZRDZ      VARCHAR2(300),
  CZRFDDZ    VARCHAR2(300),
  ZLYT       VARCHAR2(1000),
  ZJSYCBL    NUMBER(20,4),
  LRR        VARCHAR2(300),
  LRRQ       DATE,
  WGHTBZ     VARCHAR2(300),
  C_YJFH     VARCHAR2(32),
  C_WTGLDW   VARCHAR2(32),
  WTGLYZ     NUMBER(20,4),
  WTFYBI     NUMBER(20,4),
  WTGLJG     NUMBER(20,4),
  WTGLSL     NUMBER(20,4),
  YWTGLF     NUMBER(20,4),
  LJSSWGF    NUMBER(20,4),
  LJYSWGF    NUMBER(20,4),
  DLDW       VARCHAR2(300),
  KPBH       VARCHAR2(300),
  HTSFTQZZ   VARCHAR2(10),
  HTZZRQ     DATE,
  ZZBLSM     VARCHAR2(1000),
  C_ZZYY     VARCHAR2(32),
  BODYIDLOCK VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JJZC_HT_ZLWG
  is '����ί�ܺ�ͬ';
comment on column EAM2.JJZC_HT_ZLWG.ID
  is 'ID';
comment on column EAM2.JJZC_HT_ZLWG.ZCID
  is '�ʲ�ID';
comment on column EAM2.JJZC_HT_ZLWG.ZCBH
  is '�ʲ����';
comment on column EAM2.JJZC_HT_ZLWG.ZCMC
  is '�ʲ�����';
comment on column EAM2.JJZC_HT_ZLWG.SWHTBH
  is 'ʵ���ͬ���';
comment on column EAM2.JJZC_HT_ZLWG.C_HTLX
  is '��ͬ����';
comment on column EAM2.JJZC_HT_ZLWG.HTBH
  is '��ͬ���';
comment on column EAM2.JJZC_HT_ZLWG.C_HTZT
  is '��ͬ״̬';
comment on column EAM2.JJZC_HT_ZLWG.CZR
  is '������';
comment on column EAM2.JJZC_HT_ZLWG.C_CZRXZ
  is '����������';
comment on column EAM2.JJZC_HT_ZLWG.CZLXR
  is '������ϵ��';
comment on column EAM2.JJZC_HT_ZLWG.CZFLXDH
  is '���ⷽ��ϵ�绰';
comment on column EAM2.JJZC_HT_ZLWG.JBRLXDH
  is '��������ϵ�绰';
comment on column EAM2.JJZC_HT_ZLWG.JYDX
  is '���׶���';
comment on column EAM2.JJZC_HT_ZLWG.CZSL
  is '��������';
comment on column EAM2.JJZC_HT_ZLWG.YZJ
  is '�����';
comment on column EAM2.JJZC_HT_ZLWG.ZJSFHWYF
  is '����������';
comment on column EAM2.JJZC_HT_ZLWG.ZJSFHSDF
  is '��������������';
comment on column EAM2.JJZC_HT_ZLWG.ZJJG
  is '���۸�';
comment on column EAM2.JJZC_HT_ZLWG.JSFS
  is '���㷽ʽ';
comment on column EAM2.JJZC_HT_ZLWG.C_ZJJSFS
  is '���֧����ʽ';
comment on column EAM2.JJZC_HT_ZLWG.DDTLFWZJJG
  is '����ͬ�෿�����۸�';
comment on column EAM2.JJZC_HT_ZLWG.LJZJ
  is '�ۼ����';
comment on column EAM2.JJZC_HT_ZLWG.YAJIN
  is 'Ѻ��';
comment on column EAM2.JJZC_HT_ZLWG.YSYJ
  is '����Ѻ��';
comment on column EAM2.JJZC_HT_ZLWG.WYJ
  is 'ΥԼ��';
comment on column EAM2.JJZC_HT_ZLWG.YSWYJ
  is '����ΥԼ��';
comment on column EAM2.JJZC_HT_ZLWG.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.JJZC_HT_ZLWG.HTDQRQ
  is '��ͬ��������';
comment on column EAM2.JJZC_HT_ZLWG.MZQSRQ
  is '������ʼ����';
comment on column EAM2.JJZC_HT_ZLWG.MZDQRQ
  is '���⵽������';
comment on column EAM2.JJZC_HT_ZLWG.SCQSRQ
  is '�ϴ���������';
comment on column EAM2.JJZC_HT_ZLWG.ZLQSTZJE
  is '����������';
comment on column EAM2.JJZC_HT_ZLWG.SCQSJZRQ
  is '�ϴ������������';
comment on column EAM2.JJZC_HT_ZLWG.CZRDZ
  is '�����˵�ַ';
comment on column EAM2.JJZC_HT_ZLWG.CZRFDDZ
  is '�����˷�����ַ';
comment on column EAM2.JJZC_HT_ZLWG.ZLYT
  is '������;';
comment on column EAM2.JJZC_HT_ZLWG.ZJSYCBL
  is '�������ɱ���';
comment on column EAM2.JJZC_HT_ZLWG.LRR
  is '¼����';
comment on column EAM2.JJZC_HT_ZLWG.LRRQ
  is '¼������';
comment on column EAM2.JJZC_HT_ZLWG.WGHTBZ
  is 'ί�ܺ�ͬ����';
comment on column EAM2.JJZC_HT_ZLWG.C_YJFH
  is 'һ������';
comment on column EAM2.JJZC_HT_ZLWG.C_WTGLDW
  is 'ί�й���λ';
comment on column EAM2.JJZC_HT_ZLWG.WTGLYZ
  is 'ί�й���ԭֵ';
comment on column EAM2.JJZC_HT_ZLWG.WTFYBI
  is 'ί�з��ñ���';
comment on column EAM2.JJZC_HT_ZLWG.WTGLJG
  is 'ί�й���۸�';
comment on column EAM2.JJZC_HT_ZLWG.WTGLSL
  is 'ί�й�������';
comment on column EAM2.JJZC_HT_ZLWG.YWTGLF
  is '��ί�й����';
comment on column EAM2.JJZC_HT_ZLWG.LJSSWGF
  is '�ۼ�ʵ��ί�ܷ�';
comment on column EAM2.JJZC_HT_ZLWG.LJYSWGF
  is '�ۼ�Ӧ��ί�ܷ�';
comment on column EAM2.JJZC_HT_ZLWG.DLDW
  is '������λ';
comment on column EAM2.JJZC_HT_ZLWG.KPBH
  is '����Ƭ���';
comment on column EAM2.JJZC_HT_ZLWG.HTSFTQZZ
  is '��ͬ�Ƿ���ǰ��ֹ 0����
1����';
comment on column EAM2.JJZC_HT_ZLWG.HTZZRQ
  is '��ͬ��ֹ����';
comment on column EAM2.JJZC_HT_ZLWG.ZZBLSM
  is '��ֹ����˵��';
comment on column EAM2.JJZC_HT_ZLWG.C_ZZYY
  is '��ֹԭ��';
comment on column EAM2.JJZC_HT_ZLWG.BODYIDLOCK
  is '��ʶ�Ƿ����ڱ����� ��¼����body��id';
alter table EAM2.JJZC_HT_ZLWG
  add constraint PK_JJZC_HT_ZLWG primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_HT_ZLWG_LSB
prompt ===============================
prompt
create table EAM2.JJZC_HT_ZLWG_LSB
(
  ID         VARCHAR2(32) not null,
  CLD_ID     VARCHAR2(32),
  ZCID       VARCHAR2(32),
  ZCBH       VARCHAR2(300),
  ZCMC       VARCHAR2(300),
  SWHTBH     VARCHAR2(100),
  C_HTLX     VARCHAR2(50),
  HTBH       VARCHAR2(300),
  C_HTZT     VARCHAR2(50),
  CZR        VARCHAR2(300),
  C_CZRXZ    VARCHAR2(32),
  CZLXR      VARCHAR2(300),
  CZFLXDH    VARCHAR2(300),
  JBRLXDH    VARCHAR2(300),
  JYDX       VARCHAR2(50),
  CZSL       NUMBER(20,4),
  YZJ        NUMBER(20,4),
  ZJSFHWYF   VARCHAR2(100),
  ZJSFHSDF   VARCHAR2(100),
  ZJJG       NUMBER(20,4),
  JSFS       VARCHAR2(50),
  C_ZJJSFS   VARCHAR2(32),
  DDTLFWZJJG NUMBER(20,4),
  LJZJ       NUMBER(20,4),
  YAJIN      NUMBER(20,4),
  YSYJ       NUMBER(20,4),
  WYJ        NUMBER(20,4),
  YSWYJ      NUMBER(20,4),
  HTQSRQ     DATE,
  HTDQRQ     DATE,
  MZQSRQ     DATE,
  MZDQRQ     DATE,
  SCQSRQ     DATE,
  ZLQSTZJE   NUMBER(20,4),
  SCQSJZRQ   DATE,
  CZRDZ      VARCHAR2(300),
  CZRFDDZ    VARCHAR2(300),
  ZLYT       VARCHAR2(1000),
  ZJSYCBL    NUMBER(20,4),
  LRR        VARCHAR2(300),
  LRRQ       DATE,
  WGHTBZ     VARCHAR2(300),
  C_YJFH     VARCHAR2(32),
  C_WTGLDW   VARCHAR2(32),
  WTGLYZ     NUMBER(20,4),
  WTFYBI     NUMBER(20,4),
  WTGLJG     NUMBER(20,4),
  WTGLSL     NUMBER(20,4),
  YWTGLF     NUMBER(20,4),
  LJSSWGF    NUMBER(20,4),
  LJYSWGF    NUMBER(20,4),
  DLDW       VARCHAR2(300),
  KPBH       VARCHAR2(300),
  HTSFTQZZ   VARCHAR2(10),
  HTZZRQ     DATE,
  ZZBLSM     VARCHAR2(1000),
  C_ZZYY     VARCHAR2(32),
  LCMC       VARCHAR2(10),
  SPZT       VARCHAR2(10),
  NGRQ       DATE
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JJZC_HT_ZLWG_LSB
  is '��¼��������صĺ�ͬ��Ϣ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ID
  is 'ID';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CLD_ID
  is '����ID';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZCID
  is '�ʲ�ID';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZCBH
  is '�ʲ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZCMC
  is '�ʲ�����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SWHTBH
  is 'ʵ���ͬ���';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_HTLX
  is '��ͬ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTBH
  is '��ͬ���';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_HTZT
  is '��ͬ״̬';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZR
  is '������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_CZRXZ
  is '����������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZLXR
  is '������ϵ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZFLXDH
  is '���ⷽ��ϵ�绰';
comment on column EAM2.JJZC_HT_ZLWG_LSB.JBRLXDH
  is '��������ϵ�绰';
comment on column EAM2.JJZC_HT_ZLWG_LSB.JYDX
  is '���׶���';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZSL
  is '��������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YZJ
  is '�����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJSFHWYF
  is '����������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJSFHSDF
  is '��������������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJJG
  is '���۸�';
comment on column EAM2.JJZC_HT_ZLWG_LSB.JSFS
  is '���㷽ʽ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_ZJJSFS
  is '���֧����ʽ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.DDTLFWZJJG
  is '����ͬ�෿�����۸�';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LJZJ
  is '�ۼ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YAJIN
  is 'Ѻ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YSYJ
  is '����Ѻ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WYJ
  is 'ΥԼ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YSWYJ
  is '����ΥԼ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTDQRQ
  is '��ͬ��������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.MZQSRQ
  is '������ʼ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.MZDQRQ
  is '���⵽������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SCQSRQ
  is '�ϴ���������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZLQSTZJE
  is '����������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SCQSJZRQ
  is '�ϴ������ֹ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZRDZ
  is '�����˵�ַ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZRFDDZ
  is '�����˷�����ַ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZLYT
  is '������;';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJSYCBL
  is '�������ɱ���';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LRR
  is '¼����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LRRQ
  is '¼������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WGHTBZ
  is 'ί�ܺ�ͬ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_YJFH
  is 'һ������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_WTGLDW
  is 'ί�й���λ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTGLYZ
  is 'ί�й���ԭֵ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTFYBI
  is 'ί�з��ñ���';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTGLJG
  is 'ί�й���۸�';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTGLSL
  is 'ί�й�������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YWTGLF
  is '��ί�й����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LJSSWGF
  is '�ۼ�ʵ��ί�ܷ�';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LJYSWGF
  is '�ۼ�Ӧ��ί�ܷ�';
comment on column EAM2.JJZC_HT_ZLWG_LSB.DLDW
  is '������λ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.KPBH
  is '����Ƭ���';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTSFTQZZ
  is '��ͬ�Ƿ���ǰ��ֹ0����
1����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTZZRQ
  is '��ͬ��ֹ����';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZZBLSM
  is '��ֹ����˵��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_ZZYY
  is '��ֹԭ��';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LCMC
  is '0����ͬ����
1����ͬ�䶯
2����ͬ��ֹ';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SPZT
  is '����״̬ 0��δ����
1��������
2����������';
comment on column EAM2.JJZC_HT_ZLWG_LSB.NGRQ
  is '�������';
alter table EAM2.JJZC_HT_ZLWG_LSB
  add constraint PK_JJZC_HT_ZLWG_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JJZC_TBGC_XX
prompt ===========================
prompt
create table EAM2.JJZC_TBGC_XX
(
  ID      VARCHAR2(32) not null,
  ZC_ID   VARCHAR2(32) not null,
  GCTB_ID VARCHAR2(32),
  TBJE    NUMBER(20,4),
  SPZT    VARCHAR2(10),
  CLD_ID  VARCHAR2(32),
  TBLB    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JJZC_TBGC_XX
  is 'Ͷ���̲���Ϣ';
comment on column EAM2.JJZC_TBGC_XX.ID
  is 'uuid������';
comment on column EAM2.JJZC_TBGC_XX.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JJZC_TBGC_XX.GCTB_ID
  is '�̲�Ͷ����ϢID';
comment on column EAM2.JJZC_TBGC_XX.TBJE
  is 'Ͷ�����';
comment on column EAM2.JJZC_TBGC_XX.SPZT
  is '����״̬  0��δ����
1��������
2����������';
comment on column EAM2.JJZC_TBGC_XX.CLD_ID
  is '����ID';
comment on column EAM2.JJZC_TBGC_XX.TBLB
  is 'Ͷ�����  0������  1���ǳ���';
alter table EAM2.JJZC_TBGC_XX
  add constraint PK_JJZC_TBGC_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_HEAD
prompt ========================
prompt
create table EAM2.JYZC_HEAD
(
  ID             VARCHAR2(32) not null,
  LC_ID          VARCHAR2(32),
  BIAOTI         VARCHAR2(300),
  BIANHAO        VARCHAR2(300),
  JHCD           VARCHAR2(10),
  NGR            VARCHAR2(32),
  NGRMC          VARCHAR2(300),
  LXDH           VARCHAR2(300),
  NGRQ           DATE,
  NGBM           VARCHAR2(32),
  NGBMMC         VARCHAR2(300),
  CHENGSONG      VARCHAR2(300),
  PDJG           VARCHAR2(10),
  HQBM           VARCHAR2(300),
  BEIZHU         VARCHAR2(1000),
  YWLX           VARCHAR2(100),
  SFSJFY         VARCHAR2(100),
  LCMC           VARCHAR2(100),
  DESCRIBE       VARCHAR2(3000),
  APPLY_MONEY    NUMBER(20,2),
  APPROVE_MONEY  NUMBER(20,2),
  MONEY_APPROVED NUMBER(20,2),
  ISREJECTED     VARCHAR2(10),
  ERPNOTICE      VARCHAR2(3000),
  REGION         VARCHAR2(300),
  SENDERP        VARCHAR2(10),
  XLID           VARCHAR2(20),
  SHEETTYPE      VARCHAR2(300),
  HQBMID         VARCHAR2(300),
  SYHQBM         VARCHAR2(300),
  SYHQBMID       VARCHAR2(300),
  CLD_ZT         VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_HEAD
  is '��Ӫ�Թ̲���ͷ';
comment on column EAM2.JYZC_HEAD.ID
  is '�ʲ���ͷID,UUID';
comment on column EAM2.JYZC_HEAD.LC_ID
  is '����ID';
comment on column EAM2.JYZC_HEAD.BIAOTI
  is '����';
comment on column EAM2.JYZC_HEAD.BIANHAO
  is '���';
comment on column EAM2.JYZC_HEAD.JHCD
  is '�����̶ȣ�һ�㣬�����ؼ�';
comment on column EAM2.JYZC_HEAD.NGR
  is '�����';
comment on column EAM2.JYZC_HEAD.NGRMC
  is '���������';
comment on column EAM2.JYZC_HEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.JYZC_HEAD.NGRQ
  is '�������';
comment on column EAM2.JYZC_HEAD.NGBM
  is '��岿��';
comment on column EAM2.JYZC_HEAD.NGBMMC
  is '��岿������';
comment on column EAM2.JYZC_HEAD.CHENGSONG
  is '����';
comment on column EAM2.JYZC_HEAD.PDJG
  is '�̵��� 0����ӯ1���̿�';
comment on column EAM2.JYZC_HEAD.HQBM
  is '��ǩ����';
comment on column EAM2.JYZC_HEAD.BEIZHU
  is '��ע';
comment on column EAM2.JYZC_HEAD.YWLX
  is 'ҵ������ 0��ȷȨ���� 1�����¸��� 2��ҵ��ά�� 3��������������';
comment on column EAM2.JYZC_HEAD.SFSJFY
  is '�Ƿ��漰���� 0���� 1����';
comment on column EAM2.JYZC_HEAD.LCMC
  is '�������� 0���ʲ����� 1���ʲ��䶯 2���̵���� 3���ճ����� 4���ʲ�����';
comment on column EAM2.JYZC_HEAD.DESCRIBE
  is '������;';
comment on column EAM2.JYZC_HEAD.APPLY_MONEY
  is '������ý��';
comment on column EAM2.JYZC_HEAD.APPROVE_MONEY
  is '�������ý��';
comment on column EAM2.JYZC_HEAD.MONEY_APPROVED
  is '�ѱ������';
comment on column EAM2.JYZC_HEAD.ISREJECTED
  is '�Ƿ�ܾ�
';
comment on column EAM2.JYZC_HEAD.ERPNOTICE
  is 'ERP���ؽ��';
comment on column EAM2.JYZC_HEAD.REGION
  is '�洢һ��������Ϣ������ERP��Ҫ';
comment on column EAM2.JYZC_HEAD.SENDERP
  is '����ERP

';
comment on column EAM2.JYZC_HEAD.XLID
  is '����erpʹ��';
comment on column EAM2.JYZC_HEAD.SHEETTYPE
  is '������';
comment on column EAM2.JYZC_HEAD.HQBMID
  is '��ǩ����ID';
comment on column EAM2.JYZC_HEAD.SYHQBM
  is '����ʵҵ��ǩ����';
comment on column EAM2.JYZC_HEAD.SYHQBMID
  is '����ʵҵ��ǩ����ID';
comment on column EAM2.JYZC_HEAD.CLD_ZT
  is '����״̬';
alter table EAM2.JYZC_HEAD
  add constraint PK_JYZC_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_HTQS_BODY
prompt =============================
prompt
create table EAM2.JYZC_HTQS_BODY
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  HT_ID   VARCHAR2(32),
  HTBH    VARCHAR2(20),
  ZC_ID   VARCHAR2(32),
  ZCBH    VARCHAR2(20),
  ZCMC    VARCHAR2(200),
  C_ZCLX  VARCHAR2(30),
  QSKSRQ  DATE,
  QSJZRQ  DATE,
  YSZJ    NUMBER(20,2),
  XGHYSZJ NUMBER(20,2),
  YSXGYY  VARCHAR2(1000),
  SSZJ    NUMBER(20,2),
  SCBDJE  NUMBER(20,2),
  BCBDJE  NUMBER(20,2),
  QSTZJE  NUMBER(20,2),
  TZYY    VARCHAR2(200),
  MEMO    VARCHAR2(200),
  SPZT    VARCHAR2(10),
  QSPC    VARCHAR2(300),
  C_HTLX  VARCHAR2(32),
  MZQ     VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_HTQS_BODY
  is '��ͬ�������';
comment on column EAM2.JYZC_HTQS_BODY.ID
  is 'uuid������';
comment on column EAM2.JYZC_HTQS_BODY.CLD_ID
  is '����ID';
comment on column EAM2.JYZC_HTQS_BODY.HT_ID
  is '��ͬID';
comment on column EAM2.JYZC_HTQS_BODY.HTBH
  is '��ͬ���';
comment on column EAM2.JYZC_HTQS_BODY.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JYZC_HTQS_BODY.ZCBH
  is '�ʲ����';
comment on column EAM2.JYZC_HTQS_BODY.ZCMC
  is '�ʲ�����';
comment on column EAM2.JYZC_HTQS_BODY.C_ZCLX
  is '�ʲ�����';
comment on column EAM2.JYZC_HTQS_BODY.QSKSRQ
  is '���㿪ʼ����';
comment on column EAM2.JYZC_HTQS_BODY.QSJZRQ
  is '�����������';
comment on column EAM2.JYZC_HTQS_BODY.YSZJ
  is 'Ӧ�����';
comment on column EAM2.JYZC_HTQS_BODY.XGHYSZJ
  is '�޸ĺ�Ӧ�����';
comment on column EAM2.JYZC_HTQS_BODY.YSXGYY
  is 'Ӧ���޸�ԭ��';
comment on column EAM2.JYZC_HTQS_BODY.SSZJ
  is 'ʵ�����';
comment on column EAM2.JYZC_HTQS_BODY.SCBDJE
  is 'ʵ�ձ䶯���';
comment on column EAM2.JYZC_HTQS_BODY.BCBDJE
  is '���α䶯���';
comment on column EAM2.JYZC_HTQS_BODY.QSTZJE
  is '����������';
comment on column EAM2.JYZC_HTQS_BODY.TZYY
  is '����ԭ��';
comment on column EAM2.JYZC_HTQS_BODY.MEMO
  is '��ע';
comment on column EAM2.JYZC_HTQS_BODY.SPZT
  is '����״̬0��δ����
1��������
2����������';
comment on column EAM2.JYZC_HTQS_BODY.QSPC
  is '��������';
comment on column EAM2.JYZC_HTQS_BODY.C_HTLX
  is '��ͬ����';
comment on column EAM2.JYZC_HTQS_BODY.MZQ
  is '������';
alter table EAM2.JYZC_HTQS_BODY
  add constraint PK_JYZC_HTQS_BODY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_JYZL_BF
prompt ===========================
prompt
create table EAM2.JYZC_JYZL_BF
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  ZC_ID   VARCHAR2(32),
  JYDX    VARCHAR2(30),
  C_JBHSF VARCHAR2(32),
  C_EJJBH VARCHAR2(30),
  ZLQSRQ  DATE,
  ZLDQRQ  DATE,
  CZR     VARCHAR2(300),
  YXZLMJ  NUMBER(20,4),
  YXZJZJE NUMBER(20,4),
  CZYT    VARCHAR2(1000),
  YXZQ    VARCHAR2(50),
  ZLSM    VARCHAR2(1000),
  BGSM    VARCHAR2(1000),
  TZRQ    DATE,
  TZYY    VARCHAR2(1000),
  TZBLSM  VARCHAR2(1000),
  LRRQ    DATE,
  HTJYDX  VARCHAR2(30),
  HTCZR   VARCHAR2(300),
  HTQSRQ  DATE,
  HTDQRQ  DATE,
  HTZLYT  VARCHAR2(1000),
  HTID    VARCHAR2(32),
  DLDW    VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EAM2.JYZC_JYZL_BF
  add constraint PK_JYZC_JYZL_BF primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_JYZL_HEAD
prompt =============================
prompt
create table EAM2.JYZC_JYZL_HEAD
(
  ID        VARCHAR2(32) not null,
  LC_ID     VARCHAR2(32),
  BIAOTI    VARCHAR2(300),
  CHENGSONG VARCHAR2(300),
  BIANHAO   VARCHAR2(300),
  JHCD      VARCHAR2(10),
  NGRQ      DATE,
  NGBM      VARCHAR2(32),
  NGBMMC    VARCHAR2(300),
  NGR       VARCHAR2(32),
  NGRMC     VARCHAR2(300),
  LXDH      VARCHAR2(300),
  YWLX      VARCHAR2(10),
  HQBM      VARCHAR2(100),
  FJBT      VARCHAR2(1000),
  BEIZHU    VARCHAR2(1000),
  SHEETTYPE VARCHAR2(300),
  HQBMID    VARCHAR2(300),
  SYHQBM    VARCHAR2(300),
  SYHQBMID  VARCHAR2(300),
  CLD_ZT    VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.JYZC_JYZL_HEAD.YWLX
  is '0������
1�����
2������';
comment on column EAM2.JYZC_JYZL_HEAD.HQBMID
  is '��ǩ����ID';
comment on column EAM2.JYZC_JYZL_HEAD.SYHQBM
  is '����ʵҵ��ǩ����';
comment on column EAM2.JYZC_JYZL_HEAD.SYHQBMID
  is '����ʵҵ��ǩ����ID';
comment on column EAM2.JYZC_JYZL_HEAD.CLD_ZT
  is '����״̬';
alter table EAM2.JYZC_JYZL_HEAD
  add constraint PK_JYZC_JYZL_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_JYZL_LSB
prompt ============================
prompt
create table EAM2.JYZC_JYZL_LSB
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  ZC_ID   VARCHAR2(32),
  JYDX    VARCHAR2(30),
  C_JBHSF VARCHAR2(32),
  C_EJJBH VARCHAR2(30),
  ZLQSRQ  DATE,
  ZLDQRQ  DATE,
  CZR     VARCHAR2(300),
  YXZLMJ  NUMBER(20,4),
  YXZJZJE NUMBER(20,4),
  CZYT    VARCHAR2(1000),
  YXZQ    VARCHAR2(50),
  ZLSM    VARCHAR2(1000),
  BGSM    VARCHAR2(1000),
  TZRQ    DATE,
  TZYY    VARCHAR2(1000),
  TZBLSM  VARCHAR2(1000),
  SPZT    VARCHAR2(10),
  JYZL_ID VARCHAR2(32),
  HTJYDX  VARCHAR2(30),
  HTCZR   VARCHAR2(300),
  HTQSRQ  DATE,
  HTDQRQ  DATE,
  HTZLYT  VARCHAR2(1000),
  HTID    VARCHAR2(32),
  DLDW    VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_JYZL_LSB
  is '��Ӫ������ʱ��';
comment on column EAM2.JYZC_JYZL_LSB.ID
  is 'uuid������';
comment on column EAM2.JYZC_JYZL_LSB.CLD_ID
  is '����ID';
comment on column EAM2.JYZC_JYZL_LSB.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JYZC_JYZL_LSB.JYDX
  is '���С��ǽ���';
comment on column EAM2.JYZC_JYZL_LSB.C_JBHSF
  is '������ʡ��';
comment on column EAM2.JYZC_JYZL_LSB.C_EJJBH
  is '����������';
comment on column EAM2.JYZC_JYZL_LSB.ZLQSRQ
  is '������ʼ����';
comment on column EAM2.JYZC_JYZL_LSB.ZLDQRQ
  is '���޵�������';
comment on column EAM2.JYZC_JYZL_LSB.CZR
  is '�ʲ�������';
comment on column EAM2.JYZC_JYZL_LSB.YXZLMJ
  is '�����������';
comment on column EAM2.JYZC_JYZL_LSB.YXZJZJE
  is '��������ܽ��';
comment on column EAM2.JYZC_JYZL_LSB.CZYT
  is '������;';
comment on column EAM2.JYZC_JYZL_LSB.YXZQ
  is '��������';
comment on column EAM2.JYZC_JYZL_LSB.ZLSM
  is '����˵��';
comment on column EAM2.JYZC_JYZL_LSB.BGSM
  is '���˵��';
comment on column EAM2.JYZC_JYZL_LSB.TZRQ
  is '��������';
comment on column EAM2.JYZC_JYZL_LSB.TZYY
  is '����ԭ��';
comment on column EAM2.JYZC_JYZL_LSB.TZBLSM
  is '�������˵��';
comment on column EAM2.JYZC_JYZL_LSB.SPZT
  is '����״̬ 0��δ���� 1�������� 2��������';
comment on column EAM2.JYZC_JYZL_LSB.JYZL_ID
  is '��Ӫ������Ϣ��ID';
comment on column EAM2.JYZC_JYZL_LSB.HTJYDX
  is '��ͬ���׶���';
comment on column EAM2.JYZC_JYZL_LSB.HTCZR
  is '��ͬ�г�����';
comment on column EAM2.JYZC_JYZL_LSB.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.JYZC_JYZL_LSB.HTDQRQ
  is '��ͬ��������';
comment on column EAM2.JYZC_JYZL_LSB.HTZLYT
  is '��ͬ��������;';
comment on column EAM2.JYZC_JYZL_LSB.HTID
  is '��ͬID';
comment on column EAM2.JYZC_JYZL_LSB.DLDW
  is '������λ';
alter table EAM2.JYZC_JYZL_LSB
  add constraint PK_JYZC_JYZL_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_JYZL_XX
prompt ===========================
prompt
create table EAM2.JYZC_JYZL_XX
(
  ID      VARCHAR2(32) not null,
  CLD_ID  VARCHAR2(32),
  ZC_ID   VARCHAR2(32),
  JYDX    VARCHAR2(30),
  C_JBHSF VARCHAR2(32),
  C_EJJBH VARCHAR2(30),
  ZLQSRQ  DATE,
  ZLDQRQ  DATE,
  CZR     VARCHAR2(300),
  YXZLMJ  NUMBER(20,4),
  YXZJZJE NUMBER(20,4),
  CZYT    VARCHAR2(1000),
  YXZQ    VARCHAR2(50),
  ZLSM    VARCHAR2(1000),
  BGSM    VARCHAR2(1000),
  TZRQ    DATE,
  TZYY    VARCHAR2(1000),
  TZBLSM  VARCHAR2(1000),
  LRRQ    DATE,
  HTJYDX  VARCHAR2(30),
  HTCZR   VARCHAR2(300),
  HTQSRQ  DATE,
  HTDQRQ  DATE,
  HTZLYT  VARCHAR2(1000),
  HTID    VARCHAR2(32),
  DLDW    VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.JYZC_JYZL_XX.CLD_ID
  is '����ID';
comment on column EAM2.JYZC_JYZL_XX.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JYZC_JYZL_XX.JYDX
  is '���С��ǽ���';
comment on column EAM2.JYZC_JYZL_XX.C_JBHSF
  is '������ʡ��';
comment on column EAM2.JYZC_JYZL_XX.C_EJJBH
  is '����������';
comment on column EAM2.JYZC_JYZL_XX.ZLQSRQ
  is '������ʼ����';
comment on column EAM2.JYZC_JYZL_XX.ZLDQRQ
  is '���޵�������';
comment on column EAM2.JYZC_JYZL_XX.CZR
  is '�ʲ�������';
comment on column EAM2.JYZC_JYZL_XX.YXZLMJ
  is '�����������';
comment on column EAM2.JYZC_JYZL_XX.YXZJZJE
  is '��������ܽ��';
comment on column EAM2.JYZC_JYZL_XX.CZYT
  is '������;';
comment on column EAM2.JYZC_JYZL_XX.YXZQ
  is '��������';
comment on column EAM2.JYZC_JYZL_XX.ZLSM
  is '����˵��';
comment on column EAM2.JYZC_JYZL_XX.BGSM
  is '���˵��';
comment on column EAM2.JYZC_JYZL_XX.TZRQ
  is '��������';
comment on column EAM2.JYZC_JYZL_XX.TZYY
  is '����ԭ��';
comment on column EAM2.JYZC_JYZL_XX.TZBLSM
  is '�������˵��';
comment on column EAM2.JYZC_JYZL_XX.LRRQ
  is '¼������';
comment on column EAM2.JYZC_JYZL_XX.HTJYDX
  is '��ͬ���׶���';
comment on column EAM2.JYZC_JYZL_XX.HTCZR
  is '��ͬ�г�����';
comment on column EAM2.JYZC_JYZL_XX.HTQSRQ
  is '��ͬ��ʼ����';
comment on column EAM2.JYZC_JYZL_XX.HTDQRQ
  is '��ͬ��������';
comment on column EAM2.JYZC_JYZL_XX.HTZLYT
  is '��ͬ��������;';
comment on column EAM2.JYZC_JYZL_XX.HTID
  is '��ͬID';
comment on column EAM2.JYZC_JYZL_XX.DLDW
  is '������λ';
alter table EAM2.JYZC_JYZL_XX
  add constraint PK_JYZC_JYZL_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_PDKP_XX
prompt ===========================
prompt
create table EAM2.JYZC_PDKP_XX
(
  ID          VARCHAR2(32) not null,
  CLD_ID      VARCHAR2(32),
  ZC_ID       VARCHAR2(32),
  ZC_LSB_ID   VARCHAR2(32),
  KP_ID       VARCHAR2(32),
  CARDCODE    VARCHAR2(46),
  ZCNAME      VARCHAR2(450),
  GLBM        VARCHAR2(450),
  USEPARTMENT VARCHAR2(450),
  FIRSTBRANCH VARCHAR2(16),
  SPZT        VARCHAR2(30),
  YBYZ        NUMBER(20,2),
  PDZT        VARCHAR2(30)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_PDKP_XX
  is '��¼�̿����ʲ��Ŀ�Ƭ��Ϣ��';
comment on column EAM2.JYZC_PDKP_XX.CLD_ID
  is '����ID';
comment on column EAM2.JYZC_PDKP_XX.ZC_ID
  is '�ʲ���Ϣ��ID';
comment on column EAM2.JYZC_PDKP_XX.ZC_LSB_ID
  is '�ʲ���ʱ��ID';
comment on column EAM2.JYZC_PDKP_XX.KP_ID
  is '��Ƭ��Ϣ��ID';
comment on column EAM2.JYZC_PDKP_XX.CARDCODE
  is '��Ƭ����';
comment on column EAM2.JYZC_PDKP_XX.ZCNAME
  is '��Ƭ����';
comment on column EAM2.JYZC_PDKP_XX.GLBM
  is '������';
comment on column EAM2.JYZC_PDKP_XX.USEPARTMENT
  is 'ʹ�ò���';
comment on column EAM2.JYZC_PDKP_XX.FIRSTBRANCH
  is 'һ������';
comment on column EAM2.JYZC_PDKP_XX.SPZT
  is '����״̬';
comment on column EAM2.JYZC_PDKP_XX.YBYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.JYZC_PDKP_XX.PDZT
  is '�̵�״̬';
alter table EAM2.JYZC_PDKP_XX
  add constraint PK_JYZC_PDKP_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_RISK
prompt ========================
prompt
create table EAM2.JYZC_RISK
(
  ID       VARCHAR2(32) not null,
  C_FXLX   VARCHAR2(32),
  FXBH     VARCHAR2(300),
  FXMS     VARCHAR2(1000),
  FXZT     VARCHAR2(10),
  FXKZ     VARCHAR2(1000),
  LRRQ     DATE,
  LRRBH    VARCHAR2(32),
  LRR      VARCHAR2(300),
  ZCZSB_ID VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.JYZC_RISK
  is '��Ӫ�Թ̶��ʲ�������Ϣ';
comment on column EAM2.JYZC_RISK.ID
  is '����ID,UUID';
comment on column EAM2.JYZC_RISK.C_FXLX
  is '�������ͣ������ֵ��';
comment on column EAM2.JYZC_RISK.FXBH
  is '���ձ��';
comment on column EAM2.JYZC_RISK.FXMS
  is '��������';
comment on column EAM2.JYZC_RISK.FXZT
  is '����״̬ 0���� 1��ִ���� 2���ر�';
comment on column EAM2.JYZC_RISK.FXKZ
  is '���տ���';
comment on column EAM2.JYZC_RISK.LRRQ
  is '¼������';
comment on column EAM2.JYZC_RISK.LRRBH
  is '¼���˱��';
comment on column EAM2.JYZC_RISK.LRR
  is '¼����';
comment on column EAM2.JYZC_RISK.ZCZSB_ID
  is '�ʲ���ʽ��ID';
alter table EAM2.JYZC_RISK
  add constraint PK_JYZC_RISK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JYZC_RISK_LSB
prompt ============================
prompt
create table EAM2.JYZC_RISK_LSB
(
  ID        VARCHAR2(32) not null,
  C_FXLX    VARCHAR2(32),
  FXBH      VARCHAR2(300),
  FXMS      VARCHAR2(1000),
  FXZT      VARCHAR2(10),
  FXKZ      VARCHAR2(1000),
  LRRQ      DATE,
  LRRBH     VARCHAR2(32),
  LRR       VARCHAR2(300),
  ZC_ID     VARCHAR2(32),
  ZHUANGTAI VARCHAR2(10),
  CLD_ID    VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.JYZC_RISK_LSB
  is '��Ӫ�Թ̶��ʲ�������Ϣ';
comment on column EAM2.JYZC_RISK_LSB.ID
  is '����ID,UUID';
comment on column EAM2.JYZC_RISK_LSB.C_FXLX
  is '�������ͣ������ֵ��';
comment on column EAM2.JYZC_RISK_LSB.FXBH
  is '���ձ��';
comment on column EAM2.JYZC_RISK_LSB.FXMS
  is '��������';
comment on column EAM2.JYZC_RISK_LSB.FXZT
  is '����״̬ 0���� 1��ִ���� 2���ر�';
comment on column EAM2.JYZC_RISK_LSB.FXKZ
  is '���տ���';
comment on column EAM2.JYZC_RISK_LSB.LRRQ
  is '¼������';
comment on column EAM2.JYZC_RISK_LSB.LRRBH
  is '¼���˱��';
comment on column EAM2.JYZC_RISK_LSB.LRR
  is '¼����';
comment on column EAM2.JYZC_RISK_LSB.ZC_ID
  is '�ʲ���ʱ��ID';
comment on column EAM2.JYZC_RISK_LSB.ZHUANGTAI
  is '״̬ 0��δ���� 1�������� 2������ͬ�� 3��������ͬ��';
comment on column EAM2.JYZC_RISK_LSB.CLD_ID
  is '����ID';
alter table EAM2.JYZC_RISK_LSB
  add constraint PK_JYZC_RISK_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table JYZC_SQSDFY_XX
prompt =============================
prompt
create table EAM2.JYZC_SQSDFY_XX
(
  ID     VARCHAR2(32) not null,
  ZC_ID  VARCHAR2(32),
  XMMC   VARCHAR2(300),
  SQJE   NUMBER(20,4),
  SDJE   NUMBER(20,4),
  SJFY   NUMBER(20,2),
  SPZT   VARCHAR2(2),
  CLD_ID VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_SQSDFY_XX
  is '�����󶨷�����ϸ';
comment on column EAM2.JYZC_SQSDFY_XX.ID
  is '�������ID,UUID';
comment on column EAM2.JYZC_SQSDFY_XX.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.JYZC_SQSDFY_XX.XMMC
  is '��Ŀ����';
comment on column EAM2.JYZC_SQSDFY_XX.SQJE
  is '������';
comment on column EAM2.JYZC_SQSDFY_XX.SDJE
  is '�󶨽��';
comment on column EAM2.JYZC_SQSDFY_XX.SJFY
  is 'ʵ�ʷ���';
comment on column EAM2.JYZC_SQSDFY_XX.SPZT
  is '����״̬0δ�ύ1������2����ͨ��3������ͨ��';
comment on column EAM2.JYZC_SQSDFY_XX.CLD_ID
  is '����ID';
alter table EAM2.JYZC_SQSDFY_XX
  add constraint PK_JYZC_SQSDFY_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_XX
prompt ======================
prompt
create table EAM2.JYZC_XX
(
  ID        VARCHAR2(32) not null,
  C_ZCLX    VARCHAR2(20),
  C_ZCZLBM  VARCHAR2(300),
  C_ZCDQ    VARCHAR2(32),
  ZCBH      VARCHAR2(300),
  ZCMC      VARCHAR2(450),
  C_JYFL    VARCHAR2(32),
  XXDZ      VARCHAR2(1000),
  C_YT      VARCHAR2(32),
  JBDW      VARCHAR2(450),
  C_ZJFS    VARCHAR2(32),
  QSQK      VARCHAR2(1000),
  ZWHJ      VARCHAR2(1000),
  C_ZCZC    VARCHAR2(32),
  KSSYRQ    DATE,
  EJDQ      VARCHAR2(32),
  C_YJWTJG  VARCHAR2(32),
  C_ERWTJG  VARCHAR2(32),
  LRRQ      DATE,
  LRR       VARCHAR2(300),
  JCRQ      DATE,
  FWJG      VARCHAR2(300),
  YANGAO    VARCHAR2(300),
  BZCG      VARCHAR2(300),
  ZCS       VARCHAR2(300),
  ZLZDJC    VARCHAR2(300),
  FJH       VARCHAR2(300),
  JZMJ      VARCHAR2(300),
  CBDJ      VARCHAR2(300),
  FDFLFW    CHAR(2),
  C_YWTD    VARCHAR2(46),
  FCZSYQR   VARCHAR2(100),
  FCZH      VARCHAR2(300),
  FCZTDWJ   VARCHAR2(300),
  FCZWYXWJ  VARCHAR2(100),
  FWYBZ     VARCHAR2(10),
  FCZBLSJ   VARCHAR2(300),
  KONGDI    VARCHAR2(10),
  C_YDXZ    VARCHAR2(300),
  TDMJ      VARCHAR2(300),
  QDRQ      VARCHAR2(100),
  ZYNX      VARCHAR2(100),
  SYSYNX    VARCHAR2(100),
  KFCD      VARCHAR2(1000),
  FDFLTD    VARCHAR2(10),
  TDZSYQR   VARCHAR2(300),
  TDZH      VARCHAR2(300),
  TDZTDWJ   VARCHAR2(300),
  TDWYXWJ   VARCHAR2(10),
  TDYBZ     VARCHAR2(10),
  TDZBLSJ   DATE,
  GZWJG     VARCHAR2(1000),
  GGCC      VARCHAR2(1000),
  JLDW      VARCHAR2(300),
  GZWSL     NUMBER(4),
  GZWCBDJ   NUMBER(20,2),
  GZWJCSJ   VARCHAR2(200),
  FDHY      VARCHAR2(10),
  FDHYYBZ   VARCHAR2(10),
  FDHYQZH   VARCHAR2(300),
  TSLX      VARCHAR2(300),
  WFBZYY    VARCHAR2(1000),
  LZQWB     VARCHAR2(10),
  CLPH      VARCHAR2(300),
  CLXSZSYR  VARCHAR2(300),
  CLMCJGGXH VARCHAR2(300),
  GZRQ      VARCHAR2(100),
  QYRQ      VARCHAR2(100),
  YXSLC     NUMBER(20,2),
  SBMC      VARCHAR2(300),
  GGXH      VARCHAR2(300),
  SCCJ      VARCHAR2(300),
  C_JLDW    VARCHAR2(300),
  SBSL      NUMBER(22),
  ZLZT      VARCHAR2(10),
  C_ZCQS    VARCHAR2(32),
  WTRMC     VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_XX
  is '��¼�ʲ�������������ͨ���ߡ��豸��������������Ϣ�ͻ�����Ϣ��';
comment on column EAM2.JYZC_XX.ID
  is '��Ӫ�Թ̶��ʲ�ID,UUID';
comment on column EAM2.JYZC_XX.C_ZCLX
  is '�ʲ�����:����������ͨ�����豸���豸������  �������ֵ��';
comment on column EAM2.JYZC_XX.C_ZCZLBM
  is '�ʲ��������,���������ֵ��';
comment on column EAM2.JYZC_XX.C_ZCDQ
  is '����,���������ֵ��';
comment on column EAM2.JYZC_XX.ZCBH
  is 'ϵͳ��һ�������Զ�����';
comment on column EAM2.JYZC_XX.ZCMC
  is '�ʲ�����';
comment on column EAM2.JYZC_XX.C_JYFL
  is '��Ӫ���ࣺ1��Ӫ�� 2���������3�ӿ촦����4�д����ϰ���5�̿��򱨷���';
comment on column EAM2.JYZC_XX.XXDZ
  is '��ϸ��ַ';
comment on column EAM2.JYZC_XX.C_YT
  is '��;';
comment on column EAM2.JYZC_XX.JBDW
  is '���쵥λ';
comment on column EAM2.JYZC_XX.C_ZJFS
  is '���ӷ�ʽ';
comment on column EAM2.JYZC_XX.QSQK
  is 'Ȩ�����';
comment on column EAM2.JYZC_XX.ZWHJ
  is '��Χ����';
comment on column EAM2.JYZC_XX.C_ZCZC
  is '�ʲ�״̬';
comment on column EAM2.JYZC_XX.KSSYRQ
  is '��ʼʹ������';
comment on column EAM2.JYZC_XX.EJDQ
  is '��������';
comment on column EAM2.JYZC_XX.C_YJWTJG
  is 'һ��ί�л���';
comment on column EAM2.JYZC_XX.C_ERWTJG
  is '����ί�л���';
comment on column EAM2.JYZC_XX.LRRQ
  is 'ϵͳ��ǰ����';
comment on column EAM2.JYZC_XX.LRR
  is '¼����';
comment on column EAM2.JYZC_XX.JCRQ
  is '��������';
comment on column EAM2.JYZC_XX.FWJG
  is '���ݽṹ';
comment on column EAM2.JYZC_XX.YANGAO
  is '�ܸ�(��)';
comment on column EAM2.JYZC_XX.BZCG
  is '��׼���(��)';
comment on column EAM2.JYZC_XX.ZCS
  is '�ܲ���';
comment on column EAM2.JYZC_XX.ZLZDJC
  is '�����ڵڼ���';
comment on column EAM2.JYZC_XX.FJH
  is '�����';
comment on column EAM2.JYZC_XX.JZMJ
  is '�������(M2)';
comment on column EAM2.JYZC_XX.CBDJ
  is '�ɱ�����';
comment on column EAM2.JYZC_XX.FDFLFW
  is '���ط��뷿�� 0����1����';
comment on column EAM2.JYZC_XX.C_YWTD
  is '��������  0����� 1������';
comment on column EAM2.JYZC_XX.FCZSYQR
  is '����֤����Ȩ��';
comment on column EAM2.JYZC_XX.FCZH
  is '����֤��';
comment on column EAM2.JYZC_XX.FCZTDWJ
  is '����֤����ļ�';
comment on column EAM2.JYZC_XX.FCZWYXWJ
  is '����֤����Ч�ļ� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.FWYBZ
  is '�����Ѱ�֤ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.FCZBLSJ
  is '����֤����ʱ��';
comment on column EAM2.JYZC_XX.KONGDI
  is '�յ� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.C_YDXZ
  is '�õ�����';
comment on column EAM2.JYZC_XX.TDMJ
  is '�������';
comment on column EAM2.JYZC_XX.QDRQ
  is 'ȡ������';
comment on column EAM2.JYZC_XX.ZYNX
  is '׼������';
comment on column EAM2.JYZC_XX.SYSYNX
  is 'ʣ��ʹ������';
comment on column EAM2.JYZC_XX.KFCD
  is '�����̶�';
comment on column EAM2.JYZC_XX.FDFLTD
  is '���ط������� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.TDZSYQR
  is '����֤ʹ��Ȩ��';
comment on column EAM2.JYZC_XX.TDZH
  is '����֤��';
comment on column EAM2.JYZC_XX.TDZTDWJ
  is '����֤����ļ�';
comment on column EAM2.JYZC_XX.TDWYXWJ
  is '��������Ч�ļ� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.TDYBZ
  is '�����Ѱ�֤ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.TDZBLSJ
  is '����֤����ʱ��';
comment on column EAM2.JYZC_XX.GZWJG
  is '������ṹ';
comment on column EAM2.JYZC_XX.GGCC
  is '���ߴ�';
comment on column EAM2.JYZC_XX.JLDW
  is '������λ';
comment on column EAM2.JYZC_XX.GZWSL
  is '����������';
comment on column EAM2.JYZC_XX.GZWCBDJ
  is '������ɱ�����';
comment on column EAM2.JYZC_XX.GZWJCSJ
  is '�����ｨ��ʱ��';
comment on column EAM2.JYZC_XX.FDHY
  is '���غ�һ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.FDHYYBZ
  is '���غ�һ�Ѱ�֤ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.FDHYQZH
  is '���غ�һȨ֤��';
comment on column EAM2.JYZC_XX.TSLX
  is '��������';
comment on column EAM2.JYZC_XX.WFBZYY
  is '�޷���֤��ԭ��';
comment on column EAM2.JYZC_XX.LZQWB
  is '��֤ȫδ�� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX.CLPH
  is '�����ƺ�';
comment on column EAM2.JYZC_XX.CLXSZSYR
  is '������ʻ֤������';
comment on column EAM2.JYZC_XX.CLMCJGGXH
  is '�������Ƽ�����ͺ�';
comment on column EAM2.JYZC_XX.GZRQ
  is '��������';
comment on column EAM2.JYZC_XX.QYRQ
  is '��������';
comment on column EAM2.JYZC_XX.YXSLC
  is '����ʻ���';
comment on column EAM2.JYZC_XX.SBMC
  is '�豸����';
comment on column EAM2.JYZC_XX.GGXH
  is '����ͺ�';
comment on column EAM2.JYZC_XX.SCCJ
  is '��������';
comment on column EAM2.JYZC_XX.C_JLDW
  is '�豸������λ';
comment on column EAM2.JYZC_XX.SBSL
  is '�豸����';
comment on column EAM2.JYZC_XX.ZLZT
  is '��ǰ����״̬ 0������ 1������';
comment on column EAM2.JYZC_XX.C_ZCQS
  is '�ʲ�Ȩ��';
comment on column EAM2.JYZC_XX.WTRMC
  is 'ί��������';
alter table EAM2.JYZC_XX
  add constraint PK_JYZC_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_XX_LSB
prompt ==========================
prompt
create table EAM2.JYZC_XX_LSB
(
  ID        VARCHAR2(32) not null,
  CLD_ID    VARCHAR2(32),
  C_ZCZLBM  VARCHAR2(300),
  C_ZCLX    VARCHAR2(20),
  C_ZCDQ    VARCHAR2(32),
  ZCBH      VARCHAR2(300),
  ZCMC      VARCHAR2(450),
  C_JYFL    VARCHAR2(32),
  XXDZ      VARCHAR2(1000),
  C_YT      VARCHAR2(32),
  JBDW      VARCHAR2(450),
  C_ZJFS    VARCHAR2(32),
  QSQK      VARCHAR2(1000),
  ZWHJ      VARCHAR2(1000),
  C_ZCZC    VARCHAR2(32),
  KSSYRQ    DATE,
  EJDQ      VARCHAR2(32),
  C_YJWTJG  VARCHAR2(32),
  C_ERWTJG  VARCHAR2(32),
  LRRQ      DATE,
  LRR       VARCHAR2(300),
  JCRQ      DATE,
  FWJG      VARCHAR2(300),
  YANGAO    VARCHAR2(300),
  BZCG      VARCHAR2(300),
  ZCS       VARCHAR2(300),
  ZLZDJC    VARCHAR2(300),
  FJH       VARCHAR2(300),
  JZMJ      VARCHAR2(300),
  CBDJ      VARCHAR2(300),
  FDFLFW    VARCHAR2(10),
  C_YWTD    VARCHAR2(10),
  FCZSYQR   VARCHAR2(300),
  FCZH      VARCHAR2(300),
  FCZTDWJ   VARCHAR2(300),
  FCZWYXWJ  VARCHAR2(10),
  FWYBZ     VARCHAR2(10),
  FCZBLSJ   VARCHAR2(300),
  KONGDI    VARCHAR2(10),
  C_YDXZ    VARCHAR2(300),
  TDMJ      VARCHAR2(300),
  QDRQ      VARCHAR2(100),
  ZYNX      VARCHAR2(100),
  SYSYNX    VARCHAR2(100),
  KFCD      VARCHAR2(1000),
  FDFLTD    VARCHAR2(10),
  TDZSYQR   VARCHAR2(300),
  TDZH      VARCHAR2(300),
  TDZTDWJ   VARCHAR2(300),
  TDWYXWJ   VARCHAR2(10),
  TDYBZ     VARCHAR2(10),
  TDZBLSJ   DATE,
  GZWJG     VARCHAR2(1000),
  GGCC      VARCHAR2(1000),
  JLDW      VARCHAR2(300),
  GZWSL     NUMBER(4),
  GZWCBDJ   NUMBER(20,2),
  GZWJCSJ   VARCHAR2(200),
  FDHY      VARCHAR2(10),
  FDHYYBZ   VARCHAR2(10),
  FDHYQZH   VARCHAR2(300),
  TSLX      VARCHAR2(300),
  WFBZYY    VARCHAR2(1000),
  LZQWB     VARCHAR2(10),
  CLPH      VARCHAR2(300),
  CLXSZSYR  VARCHAR2(300),
  CLMCJGGXH VARCHAR2(300),
  GZRQ      VARCHAR2(100),
  QYRQ      VARCHAR2(100),
  YXSLC     NUMBER(20,2),
  SBMC      VARCHAR2(300),
  GGXH      VARCHAR2(300),
  SCCJ      VARCHAR2(300),
  C_JLDW    VARCHAR2(300),
  SBSL      NUMBER,
  SPZT      VARCHAR2(10),
  C_JBHBH   VARCHAR2(32),
  C_EJFHBH  VARCHAR2(32),
  C_FYZL    VARCHAR2(32),
  BLSM      VARCHAR2(1000),
  XLID      VARCHAR2(20),
  YSYNX     VARCHAR2(100),
  SKSYNX    VARCHAR2(100),
  C_ZCQS    VARCHAR2(32),
  WTRMC     VARCHAR2(300),
  SJHF      NUMBER(20,2),
  C_JSFS    VARCHAR2(32),
  C_BZ      VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.JYZC_XX_LSB
  is '��¼�ʲ�������������ͨ���ߡ��豸��������������Ϣ�ͻ�����Ϣ��';
comment on column EAM2.JYZC_XX_LSB.ID
  is '��Ӫ�ʲ���ʱ��ID,UUID';
comment on column EAM2.JYZC_XX_LSB.CLD_ID
  is '����ID';
comment on column EAM2.JYZC_XX_LSB.C_ZCZLBM
  is '�ʲ��������,���������ֵ��';
comment on column EAM2.JYZC_XX_LSB.C_ZCLX
  is '�ʲ����� ����������ͨ�����豸���豸������  �����ֵ��';
comment on column EAM2.JYZC_XX_LSB.C_ZCDQ
  is '����';
comment on column EAM2.JYZC_XX_LSB.ZCBH
  is '�ʲ����';
comment on column EAM2.JYZC_XX_LSB.ZCMC
  is '�ʲ�����';
comment on column EAM2.JYZC_XX_LSB.C_JYFL
  is '��Ӫ���� 1��Ӫ��2���������3�ӿ촦����4�д����ϰ���5�̿��򱨷���';
comment on column EAM2.JYZC_XX_LSB.XXDZ
  is '��ϸ��ַ';
comment on column EAM2.JYZC_XX_LSB.C_YT
  is '��;';
comment on column EAM2.JYZC_XX_LSB.JBDW
  is '���쵥λ';
comment on column EAM2.JYZC_XX_LSB.C_ZJFS
  is '���ӷ�ʽ';
comment on column EAM2.JYZC_XX_LSB.QSQK
  is 'Ȩ�����';
comment on column EAM2.JYZC_XX_LSB.ZWHJ
  is '��Χ����';
comment on column EAM2.JYZC_XX_LSB.C_ZCZC
  is '�ʲ�״̬';
comment on column EAM2.JYZC_XX_LSB.KSSYRQ
  is '��ʼʹ������';
comment on column EAM2.JYZC_XX_LSB.EJDQ
  is '��������';
comment on column EAM2.JYZC_XX_LSB.C_YJWTJG
  is 'һ��ί�л���';
comment on column EAM2.JYZC_XX_LSB.C_ERWTJG
  is '����ί�л���';
comment on column EAM2.JYZC_XX_LSB.LRRQ
  is '¼������ ϵͳ��ǰ����';
comment on column EAM2.JYZC_XX_LSB.LRR
  is '¼����';
comment on column EAM2.JYZC_XX_LSB.JCRQ
  is '��������';
comment on column EAM2.JYZC_XX_LSB.FWJG
  is '���ݽṹ';
comment on column EAM2.JYZC_XX_LSB.YANGAO
  is '�ܸ�(��)';
comment on column EAM2.JYZC_XX_LSB.BZCG
  is '��׼���(��)';
comment on column EAM2.JYZC_XX_LSB.ZCS
  is '�ܲ���';
comment on column EAM2.JYZC_XX_LSB.ZLZDJC
  is '�����ڵڼ���';
comment on column EAM2.JYZC_XX_LSB.FJH
  is '�����';
comment on column EAM2.JYZC_XX_LSB.JZMJ
  is '�������(M2)';
comment on column EAM2.JYZC_XX_LSB.CBDJ
  is '�ɱ�����';
comment on column EAM2.JYZC_XX_LSB.FDFLFW
  is '���ط��뷿��0����1����';
comment on column EAM2.JYZC_XX_LSB.C_YWTD
  is '�������� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.FCZSYQR
  is '����֤����Ȩ��';
comment on column EAM2.JYZC_XX_LSB.FCZH
  is '����֤��';
comment on column EAM2.JYZC_XX_LSB.FCZTDWJ
  is '����֤����ļ�';
comment on column EAM2.JYZC_XX_LSB.FCZWYXWJ
  is '����֤����Ч�ļ� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.FWYBZ
  is '�����Ѱ�֤ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.FCZBLSJ
  is '����֤����ʱ��';
comment on column EAM2.JYZC_XX_LSB.KONGDI
  is '�յ� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.C_YDXZ
  is '�õ�����';
comment on column EAM2.JYZC_XX_LSB.TDMJ
  is '�������';
comment on column EAM2.JYZC_XX_LSB.QDRQ
  is 'ȡ������';
comment on column EAM2.JYZC_XX_LSB.ZYNX
  is '׼������';
comment on column EAM2.JYZC_XX_LSB.SYSYNX
  is 'ʣ��ʹ������';
comment on column EAM2.JYZC_XX_LSB.KFCD
  is '�����̶�';
comment on column EAM2.JYZC_XX_LSB.FDFLTD
  is '���ط������� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.TDZSYQR
  is '����֤ʹ��Ȩ��';
comment on column EAM2.JYZC_XX_LSB.TDZH
  is '����֤��';
comment on column EAM2.JYZC_XX_LSB.TDZTDWJ
  is '����֤����ļ�';
comment on column EAM2.JYZC_XX_LSB.TDWYXWJ
  is '��������Ч�ļ� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.TDYBZ
  is '�����Ѱ�֤ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.TDZBLSJ
  is '����֤����ʱ��';
comment on column EAM2.JYZC_XX_LSB.GZWJG
  is '������ṹ';
comment on column EAM2.JYZC_XX_LSB.GGCC
  is '���ߴ�';
comment on column EAM2.JYZC_XX_LSB.JLDW
  is '������λ';
comment on column EAM2.JYZC_XX_LSB.GZWSL
  is '����������';
comment on column EAM2.JYZC_XX_LSB.GZWCBDJ
  is '������ɱ�����';
comment on column EAM2.JYZC_XX_LSB.GZWJCSJ
  is '�����ｨ��ʱ��';
comment on column EAM2.JYZC_XX_LSB.FDHY
  is '���غ�һ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.FDHYYBZ
  is '���غ�һ�Ѱ�֤ �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.FDHYQZH
  is '���غ�һȨ֤��';
comment on column EAM2.JYZC_XX_LSB.TSLX
  is '��������';
comment on column EAM2.JYZC_XX_LSB.WFBZYY
  is '�޷���֤��ԭ��';
comment on column EAM2.JYZC_XX_LSB.LZQWB
  is '��֤ȫδ�� �ǡ���  0����� 1������';
comment on column EAM2.JYZC_XX_LSB.CLPH
  is '�����ƺ�';
comment on column EAM2.JYZC_XX_LSB.CLXSZSYR
  is '������ʻ֤������';
comment on column EAM2.JYZC_XX_LSB.CLMCJGGXH
  is '�������Ƽ�����ͺ�';
comment on column EAM2.JYZC_XX_LSB.GZRQ
  is '��������';
comment on column EAM2.JYZC_XX_LSB.QYRQ
  is '��������';
comment on column EAM2.JYZC_XX_LSB.YXSLC
  is '����ʻ���';
comment on column EAM2.JYZC_XX_LSB.SBMC
  is '�豸����';
comment on column EAM2.JYZC_XX_LSB.GGXH
  is '����ͺ�';
comment on column EAM2.JYZC_XX_LSB.SCCJ
  is '��������';
comment on column EAM2.JYZC_XX_LSB.C_JLDW
  is '�豸������λ';
comment on column EAM2.JYZC_XX_LSB.SBSL
  is '�豸����';
comment on column EAM2.JYZC_XX_LSB.SPZT
  is '����״̬ 0��δ����1��������2��������';
comment on column EAM2.JYZC_XX_LSB.C_JBHBH
  is '������';
comment on column EAM2.JYZC_XX_LSB.C_EJFHBH
  is '��������';
comment on column EAM2.JYZC_XX_LSB.C_FYZL
  is '��������';
comment on column EAM2.JYZC_XX_LSB.BLSM
  is '����˵��';
comment on column EAM2.JYZC_XX_LSB.XLID
  is '����erp���к�';
comment on column EAM2.JYZC_XX_LSB.YSYNX
  is '��ʹ������';
comment on column EAM2.JYZC_XX_LSB.SKSYNX
  is '�п�ʹ������';
comment on column EAM2.JYZC_XX_LSB.C_ZCQS
  is '�ʲ�Ȩ��';
comment on column EAM2.JYZC_XX_LSB.WTRMC
  is 'ί����';
comment on column EAM2.JYZC_XX_LSB.SJHF
  is 'ʵ�ʻ���';
comment on column EAM2.JYZC_XX_LSB.C_JSFS
  is '���㷽ʽ';
comment on column EAM2.JYZC_XX_LSB.C_BZ
  is '����';
alter table EAM2.JYZC_XX_LSB
  add constraint PK_JYZC_XX_LSB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JYZC_ZL_BGMX
prompt ===========================
prompt
create table EAM2.JYZC_ZL_BGMX
(
  ID      VARCHAR2(32) not null,
  JYZL_ID VARCHAR2(32),
  BGSX    VARCHAR2(300),
  BGQNR   VARCHAR2(1000),
  BGHNR   VARCHAR2(1000),
  SPZT    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.JYZC_ZL_BGMX.ID
  is 'uuid ������';
comment on column EAM2.JYZC_ZL_BGMX.JYZL_ID
  is '��Ӫ����ID';
comment on column EAM2.JYZC_ZL_BGMX.BGSX
  is '�������';
comment on column EAM2.JYZC_ZL_BGMX.BGQNR
  is '���ǰ����';
comment on column EAM2.JYZC_ZL_BGMX.BGHNR
  is '���������';
comment on column EAM2.JYZC_ZL_BGMX.SPZT
  is '����״̬ 0��δ����  1�������� 2��������';
alter table EAM2.JYZC_ZL_BGMX
  add constraint PK_JYZC_ZL_BGMX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table KP_RZKM_DZB
prompt ==========================
prompt
create table EAM2.KP_RZKM_DZB
(
  ID   VARCHAR2(300) not null,
  KMBH VARCHAR2(300),
  RZKM VARCHAR2(300),
  SFCJ CHAR(2),
  LBMC VARCHAR2(300),
  QYRQ DATE,
  TYRQ DATE,
  DQZT CHAR(2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.KP_RZKM_DZB.ID
  is '���˿�Ŀ���ձ�ID,UUID';
comment on column EAM2.KP_RZKM_DZB.KMBH
  is '��Ŀ���';
comment on column EAM2.KP_RZKM_DZB.RZKM
  is '���˿�Ŀ����';
comment on column EAM2.KP_RZKM_DZB.SFCJ
  is '0����1����';
comment on column EAM2.KP_RZKM_DZB.LBMC
  is '��Ƭ�����룬����DIC_APP_STATE���б���';
comment on column EAM2.KP_RZKM_DZB.QYRQ
  is '��������';
comment on column EAM2.KP_RZKM_DZB.TYRQ
  is 'ͣ������,���δͣ�ã����ֶ�Ϊ��';
comment on column EAM2.KP_RZKM_DZB.DQZT
  is '0��ͣ��1������';
alter table EAM2.KP_RZKM_DZB
  add constraint PK_KP_RZKM_DZB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LC_CARDTEMP
prompt ==========================
prompt
create table EAM2.LC_CARDTEMP
(
  ID                NUMBER not null,
  KPXZID            NUMBER,
  WFCONFIG_CODE     VARCHAR2(100),
  BWID              NUMBER,
  CARDCODE          VARCHAR2(46),
  ZCID              VARCHAR2(32),
  ZCNAME            VARCHAR2(450),
  SAVEADSRESS       VARCHAR2(4000),
  TYPECODE          VARCHAR2(450),
  GGXH              VARCHAR2(900),
  ADDTYPE           VARCHAR2(460),
  ZJTYPE            VARCHAR2(460),
  IFJC              VARCHAR2(460),
  GLBM              VARCHAR2(450),
  USEPARTMENT       VARCHAR2(450),
  ZJCDBM            VARCHAR2(450),
  USESTATUS         VARCHAR2(460),
  ZCSTATUS          VARCHAR2(460),
  MAINYT            VARCHAR2(4000),
  KSDATE            DATE,
  QYDATE            VARCHAR2(500),
  YBYZ              NUMBER(20,2),
  YZJE              NUMBER(20,2),
  YZJL              NUMBER(20,2),
  LJZJ              NUMBER(20,2),
  JCZ               NUMBER(20,6),
  JCZL              NUMBER(20,4),
  JVALUE            NUMBER(20,2),
  SYYX              NUMBER,
  YJTYF             NUMBER,
  JZZB              NUMBER(20,2),
  JEVALUE           NUMBER(20,2),
  OLDCODE           VARCHAR2(460),
  PGQYZ             VARCHAR2(760),
  PGQLJZJ           VARCHAR2(760),
  BZSM              VARCHAR2(4000),
  YXTLRY            VARCHAR2(460),
  FDJHM             VARCHAR2(460),
  CLPXH             VARCHAR2(450),
  TXFF              VARCHAR2(450),
  TXCDBM            VARCHAR2(450),
  TXNX              NUMBER,
  YTXYF             NUMBER,
  YTXE              NUMBER(20,2),
  MONTXE            NUMBER(20,2),
  WTXE              NUMBER(20,2),
  QSZM              VARCHAR2(4000),
  TDZHM             VARCHAR2(450),
  QZSYZ             VARCHAR2(460),
  YSQDJZ            VARCHAR2(760),
  OLDYEARYZ         VARCHAR2(760),
  OLDYEARJZ         VARCHAR2(760),
  OLDJZ             VARCHAR2(760),
  ZYZT              VARCHAR2(460),
  CUPXH             VARCHAR2(760),
  WZYP              VARCHAR2(760),
  NZYP              VARCHAR2(760),
  XSQ               VARCHAR2(760),
  QPXH              VARCHAR2(760),
  NSAVE             VARCHAR2(760),
  SBXLH             VARCHAR2(760),
  GYS               VARCHAR2(760),
  HTHM              VARCHAR2(760),
  BXQ               VARCHAR2(760),
  SMBXQ             VARCHAR2(760),
  SXBXQ             VARCHAR2(760),
  USERNAME          VARCHAR2(450),
  ZHCFZR            VARCHAR2(460),
  GDZCGLY           VARCHAR2(460),
  ZXRQ              DATE,
  FDZHM             VARCHAR2(300),
  YWDYTD            VARCHAR2(460),
  DYTDZH            VARCHAR2(760),
  DYTDKP            VARCHAR2(460),
  JZMJ              VARCHAR2(760),
  ZDMJ              VARCHAR2(760),
  ZXMJ              VARCHAR2(760),
  ZYZK              VARCHAR2(460),
  RKDH              VARCHAR2(460),
  PARENTID          NUMBER,
  CHILDID           VARCHAR2(460),
  STATE             VARCHAR2(460),
  CARDINFOID        VARCHAR2(32),
  BOXID             VARCHAR2(32),
  LRRQ              DATE,
  ATTACHMENTURL     VARCHAR2(450),
  OLDCARDID         VARCHAR2(760),
  CHANGEREASON      VARCHAR2(460),
  BCJT              NUMBER(20,2),
  FIRSTBRANCH       VARCHAR2(16),
  CHANGEWAY         VARCHAR2(32),
  SYNX              NUMBER,
  ERPASSETCODE      VARCHAR2(1500),
  ERPPK             VARCHAR2(1500),
  BEFORECHANGEVALUE VARCHAR2(3000),
  ASSETSTATE        VARCHAR2(150),
  LINESTATE         VARCHAR2(10),
  COULDBATCHMODIFY  VARCHAR2(10),
  MEMO_1            VARCHAR2(150),
  DEALMETHOD        VARCHAR2(150),
  EAMTIMESTAMP      DATE,
  CARD_STATE        VARCHAR2(10),
  USED_PERSON       VARCHAR2(300),
  USED_WORKFLOW_KEY VARCHAR2(500),
  RZKM              VARCHAR2(100),
  TXYX              NUMBER,
  YTXL              NUMBER(10,5),
  KPLX              VARCHAR2(20),
  SFZY              VARCHAR2(10),
  SYRBM             VARCHAR2(100),
  SYRRC             VARCHAR2(100),
  LCTEMPID          NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.LC_CARDTEMP
  is '��Ƭ��(����)';
comment on column EAM2.LC_CARDTEMP.ID
  is 'ID';
comment on column EAM2.LC_CARDTEMP.KPXZID
  is '��ID';
comment on column EAM2.LC_CARDTEMP.WFCONFIG_CODE
  is '���̱��';
comment on column EAM2.LC_CARDTEMP.BWID
  is '����˵��ID';
comment on column EAM2.LC_CARDTEMP.CARDCODE
  is '��Ƭ����';
comment on column EAM2.LC_CARDTEMP.ZCID
  is '�ʲ�ID';
comment on column EAM2.LC_CARDTEMP.ZCNAME
  is '��Ƭ����';
comment on column EAM2.LC_CARDTEMP.SAVEADSRESS
  is '��ŵص�';
comment on column EAM2.LC_CARDTEMP.TYPECODE
  is '������';
comment on column EAM2.LC_CARDTEMP.GGXH
  is '����ͺ�';
comment on column EAM2.LC_CARDTEMP.ADDTYPE
  is '���ӷ�ʽ';
comment on column EAM2.LC_CARDTEMP.ZJTYPE
  is '�۾ɷ���';
comment on column EAM2.LC_CARDTEMP.IFJC
  is '�Ƿ�м�';
comment on column EAM2.LC_CARDTEMP.GLBM
  is '������';
comment on column EAM2.LC_CARDTEMP.USEPARTMENT
  is 'ʹ�ò���';
comment on column EAM2.LC_CARDTEMP.ZJCDBM
  is '�۾ɳе�����';
comment on column EAM2.LC_CARDTEMP.USESTATUS
  is 'ʹ��״��';
comment on column EAM2.LC_CARDTEMP.ZCSTATUS
  is '�ʲ�״̬';
comment on column EAM2.LC_CARDTEMP.MAINYT
  is '��Ҫ��;';
comment on column EAM2.LC_CARDTEMP.KSDATE
  is '��ʼʹ������';
comment on column EAM2.LC_CARDTEMP.QYDATE
  is '��������';
comment on column EAM2.LC_CARDTEMP.YBYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.LC_CARDTEMP.YZJE
  is '���۾ɶ�';
comment on column EAM2.LC_CARDTEMP.YZJL
  is '���۾���';
comment on column EAM2.LC_CARDTEMP.LJZJ
  is '�ۼ��۾�';
comment on column EAM2.LC_CARDTEMP.JCZ
  is '����ֵ';
comment on column EAM2.LC_CARDTEMP.JCZL
  is '����ֵ��';
comment on column EAM2.LC_CARDTEMP.JVALUE
  is '��ֵ';
comment on column EAM2.LC_CARDTEMP.SYYX
  is 'ʹ������';
comment on column EAM2.LC_CARDTEMP.YJTYF
  is '�Ѽ����·�';
comment on column EAM2.LC_CARDTEMP.JZZB
  is '��ֵ׼��';
comment on column EAM2.LC_CARDTEMP.JEVALUE
  is '����';
comment on column EAM2.LC_CARDTEMP.OLDCODE
  is '�ɿ�Ƭ���';
comment on column EAM2.LC_CARDTEMP.PGQYZ
  is '����ǰԭֵ';
comment on column EAM2.LC_CARDTEMP.PGQLJZJ
  is '����ǰ�ۼ��۾�';
comment on column EAM2.LC_CARDTEMP.BZSM
  is '��ע';
comment on column EAM2.LC_CARDTEMP.YXTLRY
  is 'ԭϵͳ¼����Ա';
comment on column EAM2.LC_CARDTEMP.FDJHM
  is '����������';
comment on column EAM2.LC_CARDTEMP.CLPXH
  is '�������պ�';
comment on column EAM2.LC_CARDTEMP.TXFF
  is '̯������';
comment on column EAM2.LC_CARDTEMP.TXCDBM
  is '̯���е�����';
comment on column EAM2.LC_CARDTEMP.TXNX
  is '̯������';
comment on column EAM2.LC_CARDTEMP.YTXYF
  is '��̯���·�';
comment on column EAM2.LC_CARDTEMP.YTXE
  is '��̯����';
comment on column EAM2.LC_CARDTEMP.MONTXE
  is '��̯����';
comment on column EAM2.LC_CARDTEMP.WTXE
  is 'δ̯����';
comment on column EAM2.LC_CARDTEMP.QSZM
  is 'Ȩ��֤��';
comment on column EAM2.LC_CARDTEMP.TDZHM
  is '����֤����';
comment on column EAM2.LC_CARDTEMP.QZSYZ
  is 'Ȩ֤������';
comment on column EAM2.LC_CARDTEMP.YSQDJZ
  is 'ԭʼȡ�ü�ֵ';
comment on column EAM2.LC_CARDTEMP.OLDYEARYZ
  is '2004��1��1��ԭֵ';
comment on column EAM2.LC_CARDTEMP.OLDYEARJZ
  is '2004��1��1���ۼ��۾�';
comment on column EAM2.LC_CARDTEMP.OLDJZ
  is '2004��1��1�վ���';
comment on column EAM2.LC_CARDTEMP.ZYZT
  is '����״̬';
comment on column EAM2.LC_CARDTEMP.CUPXH
  is 'CUP�ͺ�';
comment on column EAM2.LC_CARDTEMP.WZYP
  is '����Ӳ��';
comment on column EAM2.LC_CARDTEMP.NZYP
  is '����Ӳ��';
comment on column EAM2.LC_CARDTEMP.XSQ
  is '��ʾ��';
comment on column EAM2.LC_CARDTEMP.QPXH
  is 'Ӳ���ͺ�';
comment on column EAM2.LC_CARDTEMP.NSAVE
  is '�ڴ�';
comment on column EAM2.LC_CARDTEMP.SBXLH
  is '�豸���к�';
comment on column EAM2.LC_CARDTEMP.GYS
  is '��Ӧ��';
comment on column EAM2.LC_CARDTEMP.HTHM
  is '��ͬ����';
comment on column EAM2.LC_CARDTEMP.BXQ
  is '������';
comment on column EAM2.LC_CARDTEMP.SMBXQ
  is '���ű�����';
comment on column EAM2.LC_CARDTEMP.SXBXQ
  is '���ޱ�����';
comment on column EAM2.LC_CARDTEMP.USERNAME
  is 'ʹ����';
comment on column EAM2.LC_CARDTEMP.ZHCFZR
  is '�ۺϴ�������';
comment on column EAM2.LC_CARDTEMP.GDZCGLY
  is '�̶��ʲ�����Ա';
comment on column EAM2.LC_CARDTEMP.ZXRQ
  is 'ע������';
comment on column EAM2.LC_CARDTEMP.FDZHM
  is '����֤����';
comment on column EAM2.LC_CARDTEMP.YWDYTD
  is '���޶�Ӧ����';
comment on column EAM2.LC_CARDTEMP.DYTDZH
  is '��Ӧ����֤��';
comment on column EAM2.LC_CARDTEMP.DYTDKP
  is '��Ӧ����ԭ��Ƭ���';
comment on column EAM2.LC_CARDTEMP.JZMJ
  is '�������';
comment on column EAM2.LC_CARDTEMP.ZDMJ
  is 'ռ�����';
comment on column EAM2.LC_CARDTEMP.ZXMJ
  is 'װ�����';
comment on column EAM2.LC_CARDTEMP.ZYZK
  is '����״��';
comment on column EAM2.LC_CARDTEMP.RKDH
  is '��ⵥ��';
comment on column EAM2.LC_CARDTEMP.PARENTID
  is '����ID';
comment on column EAM2.LC_CARDTEMP.CHILDID
  is 'С��code����';
comment on column EAM2.LC_CARDTEMP.STATE
  is '״̬��ʶλ(01 ����ʹ��״̬ 02 ����״̬ 03 ע��״̬)';
comment on column EAM2.LC_CARDTEMP.CARDINFOID
  is '��ֺϲ���Ŀ�ƬID';
comment on column EAM2.LC_CARDTEMP.BOXID
  is '��ֺϲ�ǰ�Ŀ�Ƭ';
comment on column EAM2.LC_CARDTEMP.LRRQ
  is 'δ֪����';
comment on column EAM2.LC_CARDTEMP.ATTACHMENTURL
  is '����ID';
comment on column EAM2.LC_CARDTEMP.OLDCARDID
  is '�ɿ�Ƭ���';
comment on column EAM2.LC_CARDTEMP.CHANGEREASON
  is '��������ԭ��';
comment on column EAM2.LC_CARDTEMP.BCJT
  is '���μ���';
comment on column EAM2.LC_CARDTEMP.FIRSTBRANCH
  is 'һ������';
comment on column EAM2.LC_CARDTEMP.CHANGEWAY
  is '��Ƭ�䶯��ʽ';
comment on column EAM2.LC_CARDTEMP.SYNX
  is 'ʹ������';
comment on column EAM2.LC_CARDTEMP.ERPASSETCODE
  is 'erp�ʲ���ʶ';
comment on column EAM2.LC_CARDTEMP.ERPPK
  is 'erp��������';
comment on column EAM2.LC_CARDTEMP.BEFORECHANGEVALUE
  is '�޸�ǰֵ���γ�һ���ַ�����ϴ洢';
comment on column EAM2.LC_CARDTEMP.ASSETSTATE
  is '��Ӫ����״̬--�ʲ�״̬';
comment on column EAM2.LC_CARDTEMP.LINESTATE
  is '�û�erp�����Ժ�������ʾ��״̬';
comment on column EAM2.LC_CARDTEMP.COULDBATCHMODIFY
  is '���岻��';
comment on column EAM2.LC_CARDTEMP.MEMO_1
  is '�������';
comment on column EAM2.LC_CARDTEMP.DEALMETHOD
  is '�䶯��ʽ';
comment on column EAM2.LC_CARDTEMP.EAMTIMESTAMP
  is 'EAMϵͳʱ���';
comment on column EAM2.LC_CARDTEMP.CARD_STATE
  is '��Ƭ״̬';
comment on column EAM2.LC_CARDTEMP.USED_PERSON
  is '����ʹ�øÿ�Ƭ����';
comment on column EAM2.LC_CARDTEMP.USED_WORKFLOW_KEY
  is '����ʹ�øÿ�Ƭ������';
comment on column EAM2.LC_CARDTEMP.RZKM
  is '���˿�Ŀ����';
comment on column EAM2.LC_CARDTEMP.TXYX
  is '̯������';
comment on column EAM2.LC_CARDTEMP.YTXL
  is '��̯����';
comment on column EAM2.LC_CARDTEMP.KPLX
  is '��Ƭ���ͣ��ӿ�Ƭ������ɵõ��Ĵ���';
comment on column EAM2.LC_CARDTEMP.SFZY
  is '�Ƿ������ÿ�Ƭ';
comment on column EAM2.LC_CARDTEMP.SYRBM
  is 'ʹ���˱���';
comment on column EAM2.LC_CARDTEMP.SYRRC
  is 'ʹ��������';
comment on column EAM2.LC_CARDTEMP.LCTEMPID
  is '��Ƭ��ʱ��ID';

prompt
prompt Creating table LC_CARDTEMP_BACKUP
prompt =================================
prompt
create table EAM2.LC_CARDTEMP_BACKUP
(
  ID                NUMBER not null,
  KPXZID            NUMBER,
  WFCONFIG_CODE     VARCHAR2(100),
  BWID              NUMBER,
  CARDCODE          VARCHAR2(46),
  ZCID              VARCHAR2(32),
  ZCNAME            VARCHAR2(450),
  SAVEADSRESS       VARCHAR2(4000),
  TYPECODE          VARCHAR2(450),
  GGXH              VARCHAR2(900),
  ADDTYPE           VARCHAR2(460),
  ZJTYPE            VARCHAR2(460),
  IFJC              VARCHAR2(460),
  GLBM              VARCHAR2(450),
  USEPARTMENT       VARCHAR2(450),
  ZJCDBM            VARCHAR2(450),
  USESTATUS         VARCHAR2(460),
  ZCSTATUS          VARCHAR2(460),
  MAINYT            VARCHAR2(4000),
  KSDATE            DATE,
  QYDATE            VARCHAR2(500),
  YBYZ              NUMBER(20,2),
  YZJE              NUMBER(20,2),
  YZJL              NUMBER(20,2),
  LJZJ              NUMBER(20,2),
  JCZ               NUMBER(20,6),
  JCZL              NUMBER(20,4),
  JVALUE            NUMBER(20,2),
  SYYX              NUMBER,
  YJTYF             NUMBER,
  JZZB              NUMBER(20,2),
  JEVALUE           NUMBER(20,2),
  OLDCODE           VARCHAR2(460),
  PGQYZ             VARCHAR2(760),
  PGQLJZJ           VARCHAR2(760),
  BZSM              VARCHAR2(4000),
  YXTLRY            VARCHAR2(460),
  FDJHM             VARCHAR2(460),
  CLPXH             VARCHAR2(450),
  TXFF              VARCHAR2(450),
  TXCDBM            VARCHAR2(450),
  TXNX              NUMBER,
  YTXYF             NUMBER,
  YTXE              NUMBER(20,2),
  MONTXE            NUMBER(20,2),
  WTXE              NUMBER(20,2),
  QSZM              VARCHAR2(4000),
  TDZHM             VARCHAR2(450),
  QZSYZ             VARCHAR2(460),
  YSQDJZ            VARCHAR2(760),
  OLDYEARYZ         VARCHAR2(760),
  OLDYEARJZ         VARCHAR2(760),
  OLDJZ             VARCHAR2(760),
  ZYZT              VARCHAR2(460),
  CUPXH             VARCHAR2(760),
  WZYP              VARCHAR2(760),
  NZYP              VARCHAR2(760),
  XSQ               VARCHAR2(760),
  QPXH              VARCHAR2(760),
  NSAVE             VARCHAR2(760),
  SBXLH             VARCHAR2(760),
  GYS               VARCHAR2(760),
  HTHM              VARCHAR2(760),
  BXQ               VARCHAR2(760),
  SMBXQ             VARCHAR2(760),
  SXBXQ             VARCHAR2(760),
  USERNAME          VARCHAR2(450),
  ZHCFZR            VARCHAR2(460),
  GDZCGLY           VARCHAR2(460),
  ZXRQ              DATE,
  FDZHM             VARCHAR2(300),
  YWDYTD            VARCHAR2(460),
  DYTDZH            VARCHAR2(760),
  DYTDKP            VARCHAR2(460),
  JZMJ              VARCHAR2(760),
  ZDMJ              VARCHAR2(760),
  ZXMJ              VARCHAR2(760),
  ZYZK              VARCHAR2(460),
  RKDH              VARCHAR2(460),
  PARENTID          NUMBER,
  CHILDID           VARCHAR2(460),
  STATE             VARCHAR2(460),
  CARDINFOID        VARCHAR2(32),
  BOXID             VARCHAR2(32),
  LRRQ              DATE,
  ATTACHMENTURL     VARCHAR2(450),
  OLDCARDID         VARCHAR2(760),
  CHANGEREASON      VARCHAR2(460),
  BCJT              NUMBER(20,2),
  FIRSTBRANCH       VARCHAR2(16),
  CHANGEWAY         VARCHAR2(32),
  SYNX              NUMBER,
  ERPASSETCODE      VARCHAR2(1500),
  ERPPK             VARCHAR2(1500),
  BEFORECHANGEVALUE VARCHAR2(3000),
  ASSETSTATE        VARCHAR2(150),
  LINESTATE         VARCHAR2(10),
  COULDBATCHMODIFY  VARCHAR2(10),
  MEMO_1            VARCHAR2(150),
  DEALMETHOD        VARCHAR2(150),
  EAMTIMESTAMP      DATE,
  CARD_STATE        VARCHAR2(10),
  USED_PERSON       VARCHAR2(300),
  USED_WORKFLOW_KEY VARCHAR2(500),
  RZKM              VARCHAR2(100),
  TXYX              NUMBER,
  YTXL              NUMBER(10,5),
  KPLX              VARCHAR2(20),
  SFZY              VARCHAR2(10),
  SYRBM             VARCHAR2(100),
  SYRRC             VARCHAR2(100),
  LCTEMPID          NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on table EAM2.LC_CARDTEMP_BACKUP
  is '��Ƭ��(����)';
comment on column EAM2.LC_CARDTEMP_BACKUP.ID
  is 'ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.KPXZID
  is '��ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.WFCONFIG_CODE
  is '���̱��';
comment on column EAM2.LC_CARDTEMP_BACKUP.BWID
  is '����˵��ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.CARDCODE
  is '��Ƭ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZCID
  is '�ʲ�ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZCNAME
  is '��Ƭ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.SAVEADSRESS
  is '��ŵص�';
comment on column EAM2.LC_CARDTEMP_BACKUP.TYPECODE
  is '������';
comment on column EAM2.LC_CARDTEMP_BACKUP.GGXH
  is '����ͺ�';
comment on column EAM2.LC_CARDTEMP_BACKUP.ADDTYPE
  is '���ӷ�ʽ';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZJTYPE
  is '�۾ɷ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.IFJC
  is '�Ƿ�м�';
comment on column EAM2.LC_CARDTEMP_BACKUP.GLBM
  is '������';
comment on column EAM2.LC_CARDTEMP_BACKUP.USEPARTMENT
  is 'ʹ�ò���';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZJCDBM
  is '�۾ɳе�����';
comment on column EAM2.LC_CARDTEMP_BACKUP.USESTATUS
  is 'ʹ��״��';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZCSTATUS
  is '�ʲ�״̬';
comment on column EAM2.LC_CARDTEMP_BACKUP.MAINYT
  is '��Ҫ��;';
comment on column EAM2.LC_CARDTEMP_BACKUP.KSDATE
  is '��ʼʹ������';
comment on column EAM2.LC_CARDTEMP_BACKUP.QYDATE
  is '��������';
comment on column EAM2.LC_CARDTEMP_BACKUP.YBYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.LC_CARDTEMP_BACKUP.YZJE
  is '���۾ɶ�';
comment on column EAM2.LC_CARDTEMP_BACKUP.YZJL
  is '���۾���';
comment on column EAM2.LC_CARDTEMP_BACKUP.LJZJ
  is '�ۼ��۾�';
comment on column EAM2.LC_CARDTEMP_BACKUP.JCZ
  is '����ֵ';
comment on column EAM2.LC_CARDTEMP_BACKUP.JCZL
  is '����ֵ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.JVALUE
  is '��ֵ';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYYX
  is 'ʹ������';
comment on column EAM2.LC_CARDTEMP_BACKUP.YJTYF
  is '�Ѽ����·�';
comment on column EAM2.LC_CARDTEMP_BACKUP.JZZB
  is '��ֵ׼��';
comment on column EAM2.LC_CARDTEMP_BACKUP.JEVALUE
  is '����';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDCODE
  is '�ɿ�Ƭ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.PGQYZ
  is '����ǰԭֵ';
comment on column EAM2.LC_CARDTEMP_BACKUP.PGQLJZJ
  is '����ǰ�ۼ��۾�';
comment on column EAM2.LC_CARDTEMP_BACKUP.BZSM
  is '��ע';
comment on column EAM2.LC_CARDTEMP_BACKUP.YXTLRY
  is 'ԭϵͳ¼����Ա';
comment on column EAM2.LC_CARDTEMP_BACKUP.FDJHM
  is '����������';
comment on column EAM2.LC_CARDTEMP_BACKUP.CLPXH
  is '�������պ�';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXFF
  is '̯������';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXCDBM
  is '̯���е�����';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXNX
  is '̯������';
comment on column EAM2.LC_CARDTEMP_BACKUP.YTXYF
  is '��̯���·�';
comment on column EAM2.LC_CARDTEMP_BACKUP.YTXE
  is '��̯����';
comment on column EAM2.LC_CARDTEMP_BACKUP.MONTXE
  is '��̯����';
comment on column EAM2.LC_CARDTEMP_BACKUP.WTXE
  is 'δ̯����';
comment on column EAM2.LC_CARDTEMP_BACKUP.QSZM
  is 'Ȩ��֤��';
comment on column EAM2.LC_CARDTEMP_BACKUP.TDZHM
  is '����֤����';
comment on column EAM2.LC_CARDTEMP_BACKUP.QZSYZ
  is 'Ȩ֤������';
comment on column EAM2.LC_CARDTEMP_BACKUP.YSQDJZ
  is 'ԭʼȡ�ü�ֵ';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDYEARYZ
  is '2004��1��1��ԭֵ';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDYEARJZ
  is '2004��1��1���ۼ��۾�';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDJZ
  is '2004��1��1�վ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZYZT
  is '����״̬';
comment on column EAM2.LC_CARDTEMP_BACKUP.CUPXH
  is 'CUP�ͺ�';
comment on column EAM2.LC_CARDTEMP_BACKUP.WZYP
  is '����Ӳ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.NZYP
  is '����Ӳ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.XSQ
  is '��ʾ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.QPXH
  is 'Ӳ���ͺ�';
comment on column EAM2.LC_CARDTEMP_BACKUP.NSAVE
  is '�ڴ�';
comment on column EAM2.LC_CARDTEMP_BACKUP.SBXLH
  is '�豸���к�';
comment on column EAM2.LC_CARDTEMP_BACKUP.GYS
  is '��Ӧ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.HTHM
  is '��ͬ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.BXQ
  is '������';
comment on column EAM2.LC_CARDTEMP_BACKUP.SMBXQ
  is '���ű�����';
comment on column EAM2.LC_CARDTEMP_BACKUP.SXBXQ
  is '���ޱ�����';
comment on column EAM2.LC_CARDTEMP_BACKUP.USERNAME
  is 'ʹ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZHCFZR
  is '�ۺϴ�������';
comment on column EAM2.LC_CARDTEMP_BACKUP.GDZCGLY
  is '�̶��ʲ�����Ա';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZXRQ
  is 'ע������';
comment on column EAM2.LC_CARDTEMP_BACKUP.FDZHM
  is '����֤����';
comment on column EAM2.LC_CARDTEMP_BACKUP.YWDYTD
  is '���޶�Ӧ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.DYTDZH
  is '��Ӧ����֤��';
comment on column EAM2.LC_CARDTEMP_BACKUP.DYTDKP
  is '��Ӧ����ԭ��Ƭ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.JZMJ
  is '�������';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZDMJ
  is 'ռ�����';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZXMJ
  is 'װ�����';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZYZK
  is '����״��';
comment on column EAM2.LC_CARDTEMP_BACKUP.RKDH
  is '��ⵥ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.PARENTID
  is '����ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.CHILDID
  is 'С��code����';
comment on column EAM2.LC_CARDTEMP_BACKUP.STATE
  is '״̬��ʶλ(01 ����ʹ��״̬ 02 ����״̬ 03 ע��״̬)';
comment on column EAM2.LC_CARDTEMP_BACKUP.CARDINFOID
  is '��ֺϲ���Ŀ�ƬID';
comment on column EAM2.LC_CARDTEMP_BACKUP.BOXID
  is '��ֺϲ�ǰ�Ŀ�Ƭ';
comment on column EAM2.LC_CARDTEMP_BACKUP.LRRQ
  is 'δ֪����';
comment on column EAM2.LC_CARDTEMP_BACKUP.ATTACHMENTURL
  is '����ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDCARDID
  is '�ɿ�Ƭ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.CHANGEREASON
  is '��������ԭ��';
comment on column EAM2.LC_CARDTEMP_BACKUP.BCJT
  is '���μ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.FIRSTBRANCH
  is 'һ������';
comment on column EAM2.LC_CARDTEMP_BACKUP.CHANGEWAY
  is '��Ƭ�䶯��ʽ';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYNX
  is 'ʹ������';
comment on column EAM2.LC_CARDTEMP_BACKUP.ERPASSETCODE
  is 'erp�ʲ���ʶ';
comment on column EAM2.LC_CARDTEMP_BACKUP.ERPPK
  is 'erp��������';
comment on column EAM2.LC_CARDTEMP_BACKUP.BEFORECHANGEVALUE
  is '�޸�ǰֵ���γ�һ���ַ�����ϴ洢';
comment on column EAM2.LC_CARDTEMP_BACKUP.ASSETSTATE
  is '��Ӫ����״̬--�ʲ�״̬';
comment on column EAM2.LC_CARDTEMP_BACKUP.LINESTATE
  is '�û�erp�����Ժ�������ʾ��״̬';
comment on column EAM2.LC_CARDTEMP_BACKUP.COULDBATCHMODIFY
  is '���岻��';
comment on column EAM2.LC_CARDTEMP_BACKUP.MEMO_1
  is '�������';
comment on column EAM2.LC_CARDTEMP_BACKUP.DEALMETHOD
  is '�䶯��ʽ';
comment on column EAM2.LC_CARDTEMP_BACKUP.EAMTIMESTAMP
  is 'EAMϵͳʱ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.CARD_STATE
  is '��Ƭ״̬';
comment on column EAM2.LC_CARDTEMP_BACKUP.USED_PERSON
  is '����ʹ�øÿ�Ƭ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.USED_WORKFLOW_KEY
  is '����ʹ�øÿ�Ƭ������';
comment on column EAM2.LC_CARDTEMP_BACKUP.RZKM
  is '���˿�Ŀ����';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXYX
  is '̯������';
comment on column EAM2.LC_CARDTEMP_BACKUP.YTXL
  is '��̯����';
comment on column EAM2.LC_CARDTEMP_BACKUP.KPLX
  is '��Ƭ���ͣ��ӿ�Ƭ������ɵõ��Ĵ���';
comment on column EAM2.LC_CARDTEMP_BACKUP.SFZY
  is '�Ƿ������ÿ�Ƭ';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYRBM
  is 'ʹ���˱���';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYRRC
  is 'ʹ��������';
comment on column EAM2.LC_CARDTEMP_BACKUP.LCTEMPID
  is '��Ƭ��ʱ��ID';
alter table EAM2.LC_CARDTEMP_BACKUP
  add constraint PK_LCCARDINFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table LC_CARDTEMP_LIU
prompt ==============================
prompt
create table EAM2.LC_CARDTEMP_LIU
(
  ID                NUMBER not null,
  KPXZID            NUMBER,
  WFCONFIG_CODE     VARCHAR2(100),
  BWID              NUMBER,
  CARDCODE          VARCHAR2(46),
  ZCID              VARCHAR2(32),
  ZCNAME            VARCHAR2(450),
  SAVEADSRESS       VARCHAR2(4000),
  TYPECODE          VARCHAR2(450),
  GGXH              VARCHAR2(900),
  ADDTYPE           VARCHAR2(460),
  ZJTYPE            VARCHAR2(460),
  IFJC              VARCHAR2(460),
  GLBM              VARCHAR2(450),
  USEPARTMENT       VARCHAR2(450),
  ZJCDBM            VARCHAR2(450),
  USESTATUS         VARCHAR2(460),
  ZCSTATUS          VARCHAR2(460),
  MAINYT            VARCHAR2(4000),
  KSDATE            DATE,
  QYDATE            VARCHAR2(500),
  YBYZ              NUMBER(20,2),
  YZJE              NUMBER(20,2),
  YZJL              NUMBER(20,2),
  LJZJ              NUMBER(20,2),
  JCZ               NUMBER(20,6),
  JCZL              NUMBER(20,4),
  JVALUE            NUMBER(20,2),
  SYYX              NUMBER,
  YJTYF             NUMBER,
  JZZB              NUMBER(20,2),
  JEVALUE           NUMBER(20,2),
  OLDCODE           VARCHAR2(460),
  PGQYZ             VARCHAR2(760),
  PGQLJZJ           VARCHAR2(760),
  BZSM              VARCHAR2(4000),
  YXTLRY            VARCHAR2(460),
  FDJHM             VARCHAR2(460),
  CLPXH             VARCHAR2(450),
  TXFF              VARCHAR2(450),
  TXCDBM            VARCHAR2(450),
  TXNX              NUMBER,
  YTXYF             NUMBER,
  YTXE              NUMBER(20,2),
  MONTXE            NUMBER(20,2),
  WTXE              NUMBER(20,2),
  QSZM              VARCHAR2(4000),
  TDZHM             VARCHAR2(450),
  QZSYZ             VARCHAR2(460),
  YSQDJZ            VARCHAR2(760),
  OLDYEARYZ         VARCHAR2(760),
  OLDYEARJZ         VARCHAR2(760),
  OLDJZ             VARCHAR2(760),
  ZYZT              VARCHAR2(460),
  CUPXH             VARCHAR2(760),
  WZYP              VARCHAR2(760),
  NZYP              VARCHAR2(760),
  XSQ               VARCHAR2(760),
  QPXH              VARCHAR2(760),
  NSAVE             VARCHAR2(760),
  SBXLH             VARCHAR2(760),
  GYS               VARCHAR2(760),
  HTHM              VARCHAR2(760),
  BXQ               VARCHAR2(760),
  SMBXQ             VARCHAR2(760),
  SXBXQ             VARCHAR2(760),
  USERNAME          VARCHAR2(450),
  ZHCFZR            VARCHAR2(460),
  GDZCGLY           VARCHAR2(460),
  ZXRQ              DATE,
  FDZHM             VARCHAR2(300),
  YWDYTD            VARCHAR2(460),
  DYTDZH            VARCHAR2(760),
  DYTDKP            VARCHAR2(460),
  JZMJ              VARCHAR2(760),
  ZDMJ              VARCHAR2(760),
  ZXMJ              VARCHAR2(760),
  ZYZK              VARCHAR2(460),
  RKDH              VARCHAR2(460),
  PARENTID          NUMBER,
  CHILDID           VARCHAR2(460),
  STATE             VARCHAR2(460),
  CARDINFOID        VARCHAR2(32),
  BOXID             VARCHAR2(32),
  LRRQ              DATE,
  ATTACHMENTURL     VARCHAR2(450),
  OLDCARDID         VARCHAR2(760),
  CHANGEREASON      VARCHAR2(460),
  BCJT              NUMBER(20,2),
  FIRSTBRANCH       VARCHAR2(16),
  CHANGEWAY         VARCHAR2(32),
  SYNX              NUMBER,
  ERPASSETCODE      VARCHAR2(1500),
  ERPPK             VARCHAR2(1500),
  BEFORECHANGEVALUE VARCHAR2(3000),
  ASSETSTATE        VARCHAR2(150),
  LINESTATE         VARCHAR2(10),
  COULDBATCHMODIFY  VARCHAR2(10),
  MEMO_1            VARCHAR2(150),
  DEALMETHOD        VARCHAR2(150),
  EAMTIMESTAMP      DATE,
  CARD_STATE        VARCHAR2(10),
  USED_PERSON       VARCHAR2(300),
  USED_WORKFLOW_KEY VARCHAR2(500),
  RZKM              VARCHAR2(100),
  TXYX              NUMBER,
  YTXL              NUMBER(10,5),
  KPLX              VARCHAR2(20),
  SFZY              VARCHAR2(10),
  SYRBM             VARCHAR2(100),
  SYRRC             VARCHAR2(100),
  LCTEMPID          NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PLAN_TABLE
prompt =========================
prompt
create table EAM2.PLAN_TABLE
(
  STATEMENT_ID      VARCHAR2(30),
  PLAN_ID           NUMBER,
  TIMESTAMP         DATE,
  REMARKS           VARCHAR2(4000),
  OPERATION         VARCHAR2(30),
  OPTIONS           VARCHAR2(255),
  OBJECT_NODE       VARCHAR2(128),
  OBJECT_OWNER      VARCHAR2(30),
  OBJECT_NAME       VARCHAR2(30),
  OBJECT_ALIAS      VARCHAR2(65),
  OBJECT_INSTANCE   INTEGER,
  OBJECT_TYPE       VARCHAR2(30),
  OPTIMIZER         VARCHAR2(255),
  SEARCH_COLUMNS    NUMBER,
  ID                INTEGER,
  PARENT_ID         INTEGER,
  DEPTH             INTEGER,
  POSITION          INTEGER,
  COST              INTEGER,
  CARDINALITY       INTEGER,
  BYTES             INTEGER,
  OTHER_TAG         VARCHAR2(255),
  PARTITION_START   VARCHAR2(255),
  PARTITION_STOP    VARCHAR2(255),
  PARTITION_ID      INTEGER,
  OTHER             LONG,
  DISTRIBUTION      VARCHAR2(30),
  CPU_COST          INTEGER,
  IO_COST           INTEGER,
  TEMP_SPACE        INTEGER,
  ACCESS_PREDICATES VARCHAR2(4000),
  FILTER_PREDICATES VARCHAR2(4000),
  PROJECTION        VARCHAR2(4000),
  TIME              INTEGER,
  QBLOCK_NAME       VARCHAR2(30)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PT_T_MENU
prompt ========================
prompt
create table EAM2.PT_T_MENU
(
  MENUID   NUMBER not null,
  MENUNAME VARCHAR2(50),
  UPPERID  INTEGER,
  URL      VARCHAR2(200),
  TYPE     VARCHAR2(10),
  TARGET   VARCHAR2(20),
  SORTID   INTEGER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_ABANDON
prompt ==========================
prompt
create table EAM2.P_T_ABANDON
(
  ID             NUMBER not null,
  USER_ID        NUMBER,
  SEND_USER_ID   VARCHAR2(20),
  HEAD_TYPE      VARCHAR2(40),
  HEAD_ID        VARCHAR2(36),
  TITLE          VARCHAR2(1000),
  DRAFT_DATE     TIMESTAMP(6),
  ACCEPT_DATE    TIMESTAMP(6),
  ABANDON_DATE   TIMESTAMP(6),
  URL            VARCHAR2(1000),
  PROC_INST_ID   VARCHAR2(255),
  PROC_INST_NAME VARCHAR2(255),
  SUBSYSTEM      VARCHAR2(40),
  TASK_ID        VARCHAR2(19),
  TASK_NAME      VARCHAR2(255),
  CREATE_TYPE    VARCHAR2(2),
  IS_READ        VARCHAR2(2),
  SHEET_ID       VARCHAR2(100),
  DRAFT_DEPT_ID  NUMBER(22),
  DRAFT_USERID   VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_ABANDON
  is '��������';
comment on column EAM2.P_T_ABANDON.ID
  is 'ID';
comment on column EAM2.P_T_ABANDON.USER_ID
  is '(���)�û�ID';
comment on column EAM2.P_T_ABANDON.SEND_USER_ID
  is '���췢��������';
comment on column EAM2.P_T_ABANDON.HEAD_TYPE
  is '������';
comment on column EAM2.P_T_ABANDON.HEAD_ID
  is '��ID';
comment on column EAM2.P_T_ABANDON.TITLE
  is '����';
comment on column EAM2.P_T_ABANDON.DRAFT_DATE
  is '�������';
comment on column EAM2.P_T_ABANDON.ACCEPT_DATE
  is '�յ�����';
comment on column EAM2.P_T_ABANDON.ABANDON_DATE
  is '��������';
comment on column EAM2.P_T_ABANDON.URL
  is '����URL';
comment on column EAM2.P_T_ABANDON.PROC_INST_ID
  is '����ʵ��ID';
comment on column EAM2.P_T_ABANDON.PROC_INST_NAME
  is '��������';
comment on column EAM2.P_T_ABANDON.SUBSYSTEM
  is '������ϵͳ';
comment on column EAM2.P_T_ABANDON.TASK_ID
  is '����id';
comment on column EAM2.P_T_ABANDON.TASK_NAME
  is '��������';
comment on column EAM2.P_T_ABANDON.CREATE_TYPE
  is '1 ������ת
2 �ջ�
3 ���ڵ�ѭ��
4 ����
';
comment on column EAM2.P_T_ABANDON.IS_READ
  is '0:δ����1���Ѷ�';
comment on column EAM2.P_T_ABANDON.SHEET_ID
  is '�����';
comment on column EAM2.P_T_ABANDON.DRAFT_DEPT_ID
  is '��岿�ű��';
comment on column EAM2.P_T_ABANDON.DRAFT_USERID
  is '�����Id';
alter table EAM2.P_T_ABANDON
  add constraint PK_P_T_ABANDON primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_ATTACHMENT
prompt =============================
prompt
create table EAM2.P_T_ATTACHMENT
(
  ID         VARCHAR2(32) not null,
  BDID       VARCHAR2(32),
  FJLX       VARCHAR2(200),
  FJBT       VARCHAR2(200),
  YWJM       VARCHAR2(200),
  WJLX       VARCHAR2(200),
  WJDX       LONG,
  SCRID      VARCHAR2(200),
  SCRBH      VARCHAR2(200),
  SCSJ       VARCHAR2(200),
  SCBM       VARCHAR2(200),
  DEL        NUMBER,
  SWID       VARCHAR2(32),
  TEMPLATEID VARCHAR2(64),
  SORTID     VARCHAR2(10) default 100,
  ZZFJ       VARCHAR2(10) default 0,
  STATE      VARCHAR2(10),
  SESSIONID  VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_ATTACHMENT.ID
  is '���';
comment on column EAM2.P_T_ATTACHMENT.BDID
  is '�����';
comment on column EAM2.P_T_ATTACHMENT.FJLX
  is '�������ͣ�**������';
comment on column EAM2.P_T_ATTACHMENT.FJBT
  is '��������';
comment on column EAM2.P_T_ATTACHMENT.YWJM
  is 'Դ�ļ���';
comment on column EAM2.P_T_ATTACHMENT.WJLX
  is '�ļ����ͣ���׺��';
comment on column EAM2.P_T_ATTACHMENT.WJDX
  is '�ļ���С';
comment on column EAM2.P_T_ATTACHMENT.SCRID
  is '�ϴ���ID';
comment on column EAM2.P_T_ATTACHMENT.SCRBH
  is '�ϴ��˱��';
comment on column EAM2.P_T_ATTACHMENT.SCSJ
  is '�ϴ�ʱ��';
comment on column EAM2.P_T_ATTACHMENT.SCBM
  is '�ϴ�����';
comment on column EAM2.P_T_ATTACHMENT.DEL
  is 'ɾ��״̬';
comment on column EAM2.P_T_ATTACHMENT.SWID
  is 'ʵ��ID';
comment on column EAM2.P_T_ATTACHMENT.TEMPLATEID
  is 'ģ��key,��spring�����ļ��ж���';
comment on column EAM2.P_T_ATTACHMENT.SORTID
  is '����ֵ';
comment on column EAM2.P_T_ATTACHMENT.ZZFJ
  is '0����1����';
comment on column EAM2.P_T_ATTACHMENT.STATE
  is '0����1����';
comment on column EAM2.P_T_ATTACHMENT.SESSIONID
  is '�ļ���С';
alter table EAM2.P_T_ATTACHMENT
  add constraint PK_ATTACHEMENT primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_ATTACHMENT_BLOB
prompt ==================================
prompt
create table EAM2.P_T_ATTACHMENT_BLOB
(
  ID      VARCHAR2(32) not null,
  CONTENT BLOB
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_ATTACHMENT_BLOB.ID
  is 'ID,��Ӧ������Ϣ���ID��';
comment on column EAM2.P_T_ATTACHMENT_BLOB.CONTENT
  is '��������ϸ���ݣ���BLOB�洢';
alter table EAM2.P_T_ATTACHMENT_BLOB
  add constraint PK_ATTACHMENT_BLOB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_BIZ_DATA
prompt ===========================
prompt
create table EAM2.P_T_BIZ_DATA
(
  TID             NUMBER(22) not null,
  BIZ_ID          NUMBER(22) not null,
  APPROVAL_NUMBER VARCHAR2(40),
  TITLE           VARCHAR2(200),
  DRAFT_DEPT_ID   NUMBER(22) not null,
  DRAFT_USER_ID   NUMBER(22) not null,
  DRAFT_DATE      TIMESTAMP(6),
  SUMMARY         VARCHAR2(2000),
  URL             VARCHAR2(200),
  STATUS_CD       VARCHAR2(20),
  PROC_INST_ID    VARCHAR2(255),
  SYS_UPDATE_USER NUMBER(22) not null,
  SYS_UPDATE_TIME TIMESTAMP(6) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.P_T_BIZ_DATA.STATUS_CD
  is '1:DRAFT
2:SUBMITTED';
alter table EAM2.P_T_BIZ_DATA
  add constraint XPK_P_T_BIZ_DATA primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table P_T_COMMON_OPINION
prompt =================================
prompt
create table EAM2.P_T_COMMON_OPINION
(
  ID            VARCHAR2(36) not null,
  BDID          VARCHAR2(36),
  TASKID        NUMBER,
  BDBH          VARCHAR2(64),
  TJR           NUMBER,
  TJRQ          TIMESTAMP(6),
  YJYLX         NUMBER,
  YJLX          NUMBER,
  YJNR          VARCHAR2(4000),
  YJBM          NUMBER,
  ZZYJ          NUMBER,
  COUNTERSIGNID NUMBER(22),
  PARTICIPANTID NUMBER(22),
  TASK_NAME     VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_COMMON_OPINION.ID
  is '��¼���';
comment on column EAM2.P_T_COMMON_OPINION.BDID
  is '�����';
comment on column EAM2.P_T_COMMON_OPINION.TASKID
  is '������';
comment on column EAM2.P_T_COMMON_OPINION.BDBH
  is '�����';
comment on column EAM2.P_T_COMMON_OPINION.TJR
  is '�ύ��';
comment on column EAM2.P_T_COMMON_OPINION.TJRQ
  is '�����ύ';
comment on column EAM2.P_T_COMMON_OPINION.YJYLX
  is '���������';
comment on column EAM2.P_T_COMMON_OPINION.YJLX
  is '�������';
comment on column EAM2.P_T_COMMON_OPINION.YJNR
  is '�������';
comment on column EAM2.P_T_COMMON_OPINION.YJBM
  is '�������';
comment on column EAM2.P_T_COMMON_OPINION.ZZYJ
  is '�������';
comment on column EAM2.P_T_COMMON_OPINION.COUNTERSIGNID
  is '��ǩ����¼���';
comment on column EAM2.P_T_COMMON_OPINION.PARTICIPANTID
  is '�ύ��ǩ��¼���';
comment on column EAM2.P_T_COMMON_OPINION.TASK_NAME
  is '��������';
alter table EAM2.P_T_COMMON_OPINION
  add constraint PK_YJ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_COMPONENT_RES
prompt ================================
prompt
create table EAM2.P_T_COMPONENT_RES
(
  TID       NUMBER(22) not null,
  COMP_NAME VARCHAR2(40)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.P_T_COMPONENT_RES
  add constraint XPK_P_T_COMPNENT_RES primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table P_T_DEPT
prompt =======================
prompt
create table EAM2.P_T_DEPT
(
  TID             NUMBER(22) not null,
  PAR_ID          NUMBER(22),
  DEPT_CODE       VARCHAR2(40),
  DEPT_NAME       VARCHAR2(200),
  DEPT_DESC       VARCHAR2(2000),
  DEPT_TYPE_CD    VARCHAR2(20),
  SORT_ORDER      NUMBER(10),
  DEL_FLAG_CD     VARCHAR2(20),
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6),
  RSVD_DATE1      DATE,
  RSVD_DATE2      DATE,
  RSVD_NUM1       NUMBER(10),
  RSVD_NUM2       NUMBER(10),
  RSVD_STR1       VARCHAR2(200),
  RSVD_STR2       VARCHAR2(200),
  RSVD_STR3       VARCHAR2(200),
  RSVD_STR4       VARCHAR2(200),
  RSVD_STR5       VARCHAR2(2000),
  RSVD_STR6       VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_DEPT.TID
  is '����ID';
comment on column EAM2.P_T_DEPT.PAR_ID
  is '���ڵ���';
comment on column EAM2.P_T_DEPT.DEPT_CODE
  is '����/�������';
comment on column EAM2.P_T_DEPT.DEPT_NAME
  is '����/��������';
comment on column EAM2.P_T_DEPT.DEPT_DESC
  is '����/��������';
comment on column EAM2.P_T_DEPT.DEPT_TYPE_CD
  is '����/�������';
comment on column EAM2.P_T_DEPT.SORT_ORDER
  is '˳���';
comment on column EAM2.P_T_DEPT.DEL_FLAG_CD
  is '�Ƿ�ɾ��';
comment on column EAM2.P_T_DEPT.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_DEPT.SYS_UPDATE_TIME
  is '����ʱ��';
comment on column EAM2.P_T_DEPT.RSVD_DATE1
  is '�����ֶ�����1';
comment on column EAM2.P_T_DEPT.RSVD_DATE2
  is '�����ֶ�����2';
comment on column EAM2.P_T_DEPT.RSVD_NUM1
  is '����ID';
comment on column EAM2.P_T_DEPT.RSVD_NUM2
  is '�����ֶ�����2';
comment on column EAM2.P_T_DEPT.RSVD_STR1
  is '��������';
comment on column EAM2.P_T_DEPT.RSVD_STR2
  is '�����ֶ��ַ�2';
comment on column EAM2.P_T_DEPT.RSVD_STR3
  is '�����ֶ��ַ�3';
comment on column EAM2.P_T_DEPT.RSVD_STR4
  is '�����ֶ��ַ�4';
comment on column EAM2.P_T_DEPT.RSVD_STR5
  is '�����ֶ��ַ�5';
comment on column EAM2.P_T_DEPT.RSVD_STR6
  is '�����ֶ��ַ�6';
alter table EAM2.P_T_DEPT
  add constraint PK_DEPT primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_DID
prompt ======================
prompt
create table EAM2.P_T_DID
(
  ID             NUMBER not null,
  USER_ID        NUMBER,
  HEAD_TYPE      VARCHAR2(40),
  HEAD_ID        VARCHAR2(36),
  TITLE          VARCHAR2(1000),
  DRAFT_USERID   VARCHAR2(20),
  DRAFT_DATE     TIMESTAMP(6),
  CREATE_DATE    TIMESTAMP(6),
  URL            VARCHAR2(1000),
  PROC_INST_ID   VARCHAR2(255),
  PROC_INST_NAME VARCHAR2(255),
  TASKNAME       VARCHAR2(255),
  SUBSYSTEM      VARCHAR2(40),
  SHEET_ID       VARCHAR2(100),
  TASKID         NUMBER(22),
  STATU          VARCHAR2(1),
  SEND_USERID    VARCHAR2(20),
  NEXTTASKID     NUMBER(22),
  NEXTTASKNAME   VARCHAR2(255),
  DRAFT_DEPT_ID  NUMBER(22),
  DEPT_ID        NUMBER(22),
  PARAM          VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_DID
  is '�Ѱ�';
comment on column EAM2.P_T_DID.ID
  is 'ID';
comment on column EAM2.P_T_DID.USER_ID
  is '�Ѱ������û�ID';
comment on column EAM2.P_T_DID.HEAD_TYPE
  is '������';
comment on column EAM2.P_T_DID.HEAD_ID
  is '��ID';
comment on column EAM2.P_T_DID.TITLE
  is '����';
comment on column EAM2.P_T_DID.DRAFT_USERID
  is '�����Id';
comment on column EAM2.P_T_DID.DRAFT_DATE
  is '�������';
comment on column EAM2.P_T_DID.CREATE_DATE
  is '��������';
comment on column EAM2.P_T_DID.URL
  is '����URL';
comment on column EAM2.P_T_DID.PROC_INST_ID
  is '����ʵ��ID';
comment on column EAM2.P_T_DID.PROC_INST_NAME
  is '��������';
comment on column EAM2.P_T_DID.TASKNAME
  is '��������';
comment on column EAM2.P_T_DID.SUBSYSTEM
  is '������ϵͳ';
comment on column EAM2.P_T_DID.SHEET_ID
  is '�����';
comment on column EAM2.P_T_DID.TASKID
  is '������';
comment on column EAM2.P_T_DID.STATU
  is '����״̬����0:��ɾ����1:��Ч,';
comment on column EAM2.P_T_DID.SEND_USERID
  is '���췢����Id';
comment on column EAM2.P_T_DID.NEXTTASKID
  is '��һ������';
comment on column EAM2.P_T_DID.NEXTTASKNAME
  is '��һ��������';
comment on column EAM2.P_T_DID.DRAFT_DEPT_ID
  is '��岿�ű��';
comment on column EAM2.P_T_DID.DEPT_ID
  is '�������˲��ű��';
comment on column EAM2.P_T_DID.PARAM
  is 'url����';
alter table EAM2.P_T_DID
  add constraint PK_P_T_DID primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_DRAFT
prompt ========================
prompt
create table EAM2.P_T_DRAFT
(
  ID                   NUMBER not null,
  USER_ID              NUMBER,
  HEAD_TYPE            VARCHAR2(40),
  HEAD_ID              VARCHAR2(36),
  TITLE                VARCHAR2(1000),
  URL                  VARCHAR2(1000),
  SUBSYSTEM            VARCHAR2(40),
  CREATE_DATE          TIMESTAMP(6),
  DRAFT_DATE           TIMESTAMP(6),
  STATE                VARCHAR2(2),
  PROCESSDEFINITIONKEY VARCHAR2(255),
  DEPT_ID              NUMBER(22)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_DRAFT
  is '�ݸ�';
comment on column EAM2.P_T_DRAFT.ID
  is 'ID';
comment on column EAM2.P_T_DRAFT.USER_ID
  is '�û�ID';
comment on column EAM2.P_T_DRAFT.HEAD_TYPE
  is '������';
comment on column EAM2.P_T_DRAFT.HEAD_ID
  is '��ID';
comment on column EAM2.P_T_DRAFT.TITLE
  is '����';
comment on column EAM2.P_T_DRAFT.URL
  is '����URL';
comment on column EAM2.P_T_DRAFT.SUBSYSTEM
  is '������ϵͳ';
comment on column EAM2.P_T_DRAFT.CREATE_DATE
  is '�ݸ崴��ʱ��';
comment on column EAM2.P_T_DRAFT.DRAFT_DATE
  is '���ʱ��';
comment on column EAM2.P_T_DRAFT.STATE
  is '0:��ʾɾ����1:��ʾ��Ч';
comment on column EAM2.P_T_DRAFT.PROCESSDEFINITIONKEY
  is '���̶���KEY';
comment on column EAM2.P_T_DRAFT.DEPT_ID
  is '��岿�ű��';
alter table EAM2.P_T_DRAFT
  add constraint PK_P_T_DRAFT primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_END
prompt ======================
prompt
create table EAM2.P_T_END
(
  ID             NUMBER not null,
  USER_ID        NUMBER,
  HEAD_TYPE      VARCHAR2(40),
  HEAD_ID        VARCHAR2(36),
  TITLE          VARCHAR2(1000),
  DRAFT_DATE     TIMESTAMP(6),
  CREATE_DATE    TIMESTAMP(6),
  URL            VARCHAR2(1000),
  PROC_INST_ID   VARCHAR2(255),
  PROC_INST_NAME VARCHAR2(255),
  SUBSYSTEM      VARCHAR2(40),
  SHEET_ID       VARCHAR2(100),
  DRAFT_DEPT_ID  NUMBER(22),
  PARAM          VARCHAR2(2000),
  DRAFT_USERID   VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_END
  is '���';
comment on column EAM2.P_T_END.ID
  is 'ID';
comment on column EAM2.P_T_END.USER_ID
  is '��������û�ID';
comment on column EAM2.P_T_END.HEAD_TYPE
  is '������';
comment on column EAM2.P_T_END.HEAD_ID
  is '��ID';
comment on column EAM2.P_T_END.TITLE
  is '����';
comment on column EAM2.P_T_END.DRAFT_DATE
  is '�������';
comment on column EAM2.P_T_END.CREATE_DATE
  is '��������';
comment on column EAM2.P_T_END.URL
  is '����URL';
comment on column EAM2.P_T_END.PROC_INST_ID
  is '����ʵ��ID';
comment on column EAM2.P_T_END.PROC_INST_NAME
  is '��������';
comment on column EAM2.P_T_END.SUBSYSTEM
  is '������ϵͳ';
comment on column EAM2.P_T_END.SHEET_ID
  is '�����';
comment on column EAM2.P_T_END.DRAFT_DEPT_ID
  is '��岿�ű��';
comment on column EAM2.P_T_END.PARAM
  is 'url����';
comment on column EAM2.P_T_END.DRAFT_USERID
  is '�����Id';
alter table EAM2.P_T_END
  add constraint PK_P_T_END primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_ERROR_LOG
prompt ============================
prompt
create table EAM2.P_T_ERROR_LOG
(
  ID             NUMBER not null,
  LOG_DATE       VARCHAR2(10),
  METHOD_NAME    VARCHAR2(100),
  PROC_INST_NAME VARCHAR2(100),
  PROC_INST_ID   VARCHAR2(100),
  PROC_NODE_NAME VARCHAR2(100),
  LOG_MESSAGE    VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_ERROR_LOG
  is '������־';
comment on column EAM2.P_T_ERROR_LOG.ID
  is 'ID';
comment on column EAM2.P_T_ERROR_LOG.LOG_DATE
  is '������ʱ��';
comment on column EAM2.P_T_ERROR_LOG.METHOD_NAME
  is '�ⲿ����API����';
comment on column EAM2.P_T_ERROR_LOG.PROC_INST_NAME
  is '��������';
comment on column EAM2.P_T_ERROR_LOG.PROC_INST_ID
  is '����ID';
comment on column EAM2.P_T_ERROR_LOG.PROC_NODE_NAME
  is '�������ڵ�';
comment on column EAM2.P_T_ERROR_LOG.LOG_MESSAGE
  is '��������';
alter table EAM2.P_T_ERROR_LOG
  add constraint PK_P_T_ERROR_LOG primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_EXCEPTION_LOG
prompt ================================
prompt
create table EAM2.P_T_EXCEPTION_LOG
(
  TID             NUMBER(22) not null,
  EXCEPTION_CLASS VARCHAR2(200),
  EXCEPTION_MSG   VARCHAR2(2000),
  MODULE_NAME     VARCHAR2(40),
  ACTION_NAME     VARCHAR2(40),
  METHOD_NAME     VARCHAR2(40),
  CLASS_NAME      VARCHAR2(200),
  LINE_NUM        NUMBER(10),
  PARAMETERS      VARCHAR2(2000),
  MACHINE_NAME    VARCHAR2(200),
  MACHINE_IP      VARCHAR2(40),
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_EXCEPTION_LOG.TID
  is '����ID';
comment on column EAM2.P_T_EXCEPTION_LOG.EXCEPTION_CLASS
  is '�쳣��';
comment on column EAM2.P_T_EXCEPTION_LOG.EXCEPTION_MSG
  is '�쳣��Ϣ';
comment on column EAM2.P_T_EXCEPTION_LOG.MODULE_NAME
  is 'MODULE����';
comment on column EAM2.P_T_EXCEPTION_LOG.ACTION_NAME
  is 'ACTION����';
comment on column EAM2.P_T_EXCEPTION_LOG.METHOD_NAME
  is 'METHOD����';
comment on column EAM2.P_T_EXCEPTION_LOG.CLASS_NAME
  is 'CLASS����';
comment on column EAM2.P_T_EXCEPTION_LOG.LINE_NUM
  is '�к�';
comment on column EAM2.P_T_EXCEPTION_LOG.PARAMETERS
  is '����';
comment on column EAM2.P_T_EXCEPTION_LOG.MACHINE_NAME
  is '�豸����';
comment on column EAM2.P_T_EXCEPTION_LOG.MACHINE_IP
  is '�豸IP��ַ';
comment on column EAM2.P_T_EXCEPTION_LOG.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_EXCEPTION_LOG.SYS_UPDATE_TIME
  is '����ʱ��';
alter table EAM2.P_T_EXCEPTION_LOG
  add constraint PK_EXCEPTION_LOG primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_FILE
prompt =======================
prompt
create table EAM2.P_T_FILE
(
  TID             NUMBER(22) not null,
  FILE_NAME       VARCHAR2(40),
  FILE_EXTENSION  VARCHAR2(20),
  FILE_CONTENT    BLOB,
  FILE_SIZE       NUMBER(22),
  BIZ_ID          NUMBER(22),
  BIZ_INDEX       NUMBER(22),
  BIZ_TABLE       CHAR(18),
  SYS_UPDATE_TIME TIMESTAMP(6),
  SYS_UPDATE_USER VARCHAR2(40)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.P_T_FILE.TID
  is '����';
comment on column EAM2.P_T_FILE.FILE_NAME
  is '�ļ����� ';
comment on column EAM2.P_T_FILE.FILE_EXTENSION
  is '�ļ���չ����';
comment on column EAM2.P_T_FILE.FILE_CONTENT
  is '�ļ�����';
comment on column EAM2.P_T_FILE.FILE_SIZE
  is '�ļ���';
comment on column EAM2.P_T_FILE.BIZ_ID
  is 'ҵ�񵥺�';
comment on column EAM2.P_T_FILE.BIZ_INDEX
  is 'ҵ��������';
comment on column EAM2.P_T_FILE.BIZ_TABLE
  is 'ҵ���';
alter table EAM2.P_T_FILE
  add constraint PKP_T_FILE primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table P_T_FUNCTION_GROUP
prompt =================================
prompt
create table EAM2.P_T_FUNCTION_GROUP
(
  TID                NUMBER(22) not null,
  PAR_ID             NUMBER(22),
  FUNCTION_ID        NUMBER(22) not null,
  FUNC_GROUP_TYPE_CD VARCHAR2(40),
  FUNC_GROUP_NAME    VARCHAR2(100),
  SORT_ORDER         NUMBER(10),
  IS_LEAF            NUMBER(2),
  SYS_UPDATE_USER    NUMBER(22),
  SYS_UPDATE_TIME    TIMESTAMP(6),
  TARGET             VARCHAR2(20),
  PARAMETER          VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_FUNCTION_GROUP.TID
  is '����ID';
comment on column EAM2.P_T_FUNCTION_GROUP.PAR_ID
  is '���ڵ���';
comment on column EAM2.P_T_FUNCTION_GROUP.FUNCTION_ID
  is '������Դ���';
comment on column EAM2.P_T_FUNCTION_GROUP.FUNC_GROUP_TYPE_CD
  is '���������';
comment on column EAM2.P_T_FUNCTION_GROUP.FUNC_GROUP_NAME
  is '����������';
comment on column EAM2.P_T_FUNCTION_GROUP.SORT_ORDER
  is '˳���';
comment on column EAM2.P_T_FUNCTION_GROUP.IS_LEAF
  is '�Ƿ�ΪҶ�ӽڵ�';
comment on column EAM2.P_T_FUNCTION_GROUP.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_FUNCTION_GROUP.SYS_UPDATE_TIME
  is '����ʱ��';
comment on column EAM2.P_T_FUNCTION_GROUP.TARGET
  is 'Ŀ����';
comment on column EAM2.P_T_FUNCTION_GROUP.PARAMETER
  is '���Ӳ���';
alter table EAM2.P_T_FUNCTION_GROUP
  add constraint PK_FUNCTION_GROUP primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_FUNCTION_RES
prompt ===============================
prompt
create table EAM2.P_T_FUNCTION_RES
(
  TID             NUMBER(22) not null,
  FUNCTION_NAME   VARCHAR2(200),
  MODULE_NAME     VARCHAR2(200),
  ACTION_NAME     VARCHAR2(200),
  METHOD_NAME     VARCHAR2(200),
  CLASS_NAME      VARCHAR2(200),
  IS_LOGIN_NEEDED NUMBER(2),
  IS_TOKEN_NEEDED NUMBER(2),
  IS_CHECK_MID    NUMBER(2),
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_FUNCTION_RES.TID
  is '����ID';
comment on column EAM2.P_T_FUNCTION_RES.FUNCTION_NAME
  is 'FUNCTION����';
comment on column EAM2.P_T_FUNCTION_RES.MODULE_NAME
  is 'MODULE����';
comment on column EAM2.P_T_FUNCTION_RES.ACTION_NAME
  is 'ACTION����';
comment on column EAM2.P_T_FUNCTION_RES.METHOD_NAME
  is 'METHOD����';
comment on column EAM2.P_T_FUNCTION_RES.CLASS_NAME
  is 'CLASS����';
comment on column EAM2.P_T_FUNCTION_RES.IS_LOGIN_NEEDED
  is '�Ƿ���Ҫ��¼';
comment on column EAM2.P_T_FUNCTION_RES.IS_TOKEN_NEEDED
  is '�Ƿ���Ҫ����';
comment on column EAM2.P_T_FUNCTION_RES.IS_CHECK_MID
  is '�Ƿ���MID';
comment on column EAM2.P_T_FUNCTION_RES.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_FUNCTION_RES.SYS_UPDATE_TIME
  is '����ʱ��';
alter table EAM2.P_T_FUNCTION_RES
  add constraint PK_FUNCTION_RES primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_HIST_BIZ_DATA
prompt ================================
prompt
create table EAM2.P_T_HIST_BIZ_DATA
(
  TID             NUMBER(22) not null,
  BIZ_ID          NUMBER(22) not null,
  APPROVAL_NUMBER VARCHAR2(40),
  TITLE           VARCHAR2(200),
  DRAFT_DEPT_ID   NUMBER(22) not null,
  DRAFT_USER_ID   NUMBER(22) not null,
  DRAFT_DATE      TIMESTAMP(6),
  SUMMARY         VARCHAR2(2000),
  URL             VARCHAR2(200),
  PROC_INST_ID    VARCHAR2(255) not null,
  SYS_UPDATE_USER NUMBER(22) not null,
  SYS_UPDATE_TIME TIMESTAMP(6) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.P_T_HIST_BIZ_DATA
  add constraint XPK_P_T_HIST_BIZ_DATA primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table P_T_LOGON_INFO
prompt =============================
prompt
create table EAM2.P_T_LOGON_INFO
(
  TID            NUMBER(22) not null,
  USER_ID        NUMBER(22),
  LOGIN_TYPE_CD  VARCHAR2(20),
  LOGIN_TIME     TIMESTAMP(6),
  LOGOUT_TYPE_CD VARCHAR2(20),
  LOGOUT_TIME    TIMESTAMP(6),
  MACHINE_NAME   VARCHAR2(40),
  MACHINE_IP     VARCHAR2(40)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.P_T_LOGON_INFO.TID
  is '����ID';
comment on column EAM2.P_T_LOGON_INFO.USER_ID
  is '�û����';
comment on column EAM2.P_T_LOGON_INFO.LOGIN_TYPE_CD
  is '��¼���';
comment on column EAM2.P_T_LOGON_INFO.LOGIN_TIME
  is '��¼ʱ��';
comment on column EAM2.P_T_LOGON_INFO.LOGOUT_TYPE_CD
  is '�˳����';
comment on column EAM2.P_T_LOGON_INFO.LOGOUT_TIME
  is '�˳�ʱ��';
comment on column EAM2.P_T_LOGON_INFO.MACHINE_NAME
  is '�豸����';
comment on column EAM2.P_T_LOGON_INFO.MACHINE_IP
  is '�豸IP��ַ';
alter table EAM2.P_T_LOGON_INFO
  add constraint PK1_P_T_LOGON_INFO primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table P_T_MESSAGE
prompt ==========================
prompt
create table EAM2.P_T_MESSAGE
(
  ID           NUMBER not null,
  CREATE_DATE  TIMESTAMP(6),
  SEND_USER_ID NUMBER,
  USER_ID      NUMBER,
  MESSAGE      VARCHAR2(2000),
  URL          VARCHAR2(200),
  IS_READ      VARCHAR2(2),
  TYPE         VARCHAR2(2),
  PARAM        VARCHAR2(2000),
  DEPT_ID      NUMBER(22),
  PROC_INST_ID VARCHAR2(255)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_MESSAGE
  is '��Ϣ����';
comment on column EAM2.P_T_MESSAGE.ID
  is 'ID';
comment on column EAM2.P_T_MESSAGE.CREATE_DATE
  is 'CREATE_DATE';
comment on column EAM2.P_T_MESSAGE.SEND_USER_ID
  is 'SEND_USER_ID';
comment on column EAM2.P_T_MESSAGE.USER_ID
  is 'USER_ID';
comment on column EAM2.P_T_MESSAGE.MESSAGE
  is 'MESSAGE';
comment on column EAM2.P_T_MESSAGE.URL
  is 'URL';
comment on column EAM2.P_T_MESSAGE.IS_READ
  is '0:δ��,1:�Ѷ�';
comment on column EAM2.P_T_MESSAGE.TYPE
  is '1:��Ϣ,2:����';
comment on column EAM2.P_T_MESSAGE.PARAM
  is 'url����';
comment on column EAM2.P_T_MESSAGE.DEPT_ID
  is '��Ϣ��������������';
comment on column EAM2.P_T_MESSAGE.PROC_INST_ID
  is '����ʵ��ID';
alter table EAM2.P_T_MESSAGE
  add constraint PK_P_T_MESSAGE primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_REFERENCE
prompt ============================
prompt
create table EAM2.P_T_REFERENCE
(
  TID             NUMBER(22) not null,
  REF_CODE        VARCHAR2(20) not null,
  PAR_REF_CODE    VARCHAR2(20),
  REF_NAME        VARCHAR2(40),
  SORT_ORDER      NUMBER(10),
  STATUS_CD       VARCHAR2(20),
  SYS_UPDATE_USER NUMBER(22) not null,
  SYS_UPDATE_TIME TIMESTAMP(6) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_REFERENCE.TID
  is '����ID';
comment on column EAM2.P_T_REFERENCE.REF_CODE
  is '�ֵ����';
comment on column EAM2.P_T_REFERENCE.PAR_REF_CODE
  is '���ڵ���';
comment on column EAM2.P_T_REFERENCE.REF_NAME
  is '�ֵ�����';
comment on column EAM2.P_T_REFERENCE.SORT_ORDER
  is '˳���';
comment on column EAM2.P_T_REFERENCE.STATUS_CD
  is '�ֵ�״̬';
comment on column EAM2.P_T_REFERENCE.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_REFERENCE.SYS_UPDATE_TIME
  is '����ʱ��';
alter table EAM2.P_T_REFERENCE
  add constraint PK1_P_T_REFERENCE primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_ROLE
prompt =======================
prompt
create table EAM2.P_T_ROLE
(
  TID             NUMBER(22) not null,
  ROLE_NAME       VARCHAR2(40),
  ROLE_DESC       VARCHAR2(500),
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_ROLE.TID
  is '����ID';
comment on column EAM2.P_T_ROLE.ROLE_NAME
  is '��ɫ����';
comment on column EAM2.P_T_ROLE.ROLE_DESC
  is '��ɫ����';
comment on column EAM2.P_T_ROLE.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_ROLE.SYS_UPDATE_TIME
  is '����ʱ��';
alter table EAM2.P_T_ROLE
  add constraint PK_ROLE primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_ROLE_L_FUNC_GROUP
prompt ====================================
prompt
create table EAM2.P_T_ROLE_L_FUNC_GROUP
(
  TID             NUMBER(22) not null,
  ROLE_ID         NUMBER(22) not null,
  LINK_TYPE_CD    VARCHAR2(20),
  FUNC_GROUP_ID   NUMBER(22) not null,
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.TID
  is '����ID';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.ROLE_ID
  is '��ɫ���';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.FUNC_GROUP_ID
  is '��������';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.SYS_UPDATE_TIME
  is '����ʱ��';
alter table EAM2.P_T_ROLE_L_FUNC_GROUP
  add constraint PK_ROLE_L_ROLEFUN primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index EAM2.XAK1_P_T_ROLE_L_FUNC_GROUP on EAM2.P_T_ROLE_L_FUNC_GROUP (ROLE_ID, FUNC_GROUP_ID)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_TODO
prompt =======================
prompt
create table EAM2.P_T_TODO
(
  ID                     NUMBER not null,
  USER_ID                NUMBER,
  SEND_USERID            VARCHAR2(20),
  HEAD_TYPE              VARCHAR2(40),
  HEAD_ID                VARCHAR2(36),
  TITLE                  VARCHAR2(1000),
  DRAFT_USERID           VARCHAR2(20),
  DRAFT_DATE             TIMESTAMP(6),
  CREATE_DATE            TIMESTAMP(6),
  URL                    VARCHAR2(1000),
  PROC_INST_ID           VARCHAR2(255),
  PROC_INST_NAME         VARCHAR2(255),
  SUBSYSTEM              VARCHAR2(40),
  STATU                  VARCHAR2(1),
  TASKID                 NUMBER(22),
  TASKNAME               VARCHAR2(255),
  SHEET_ID               VARCHAR2(100),
  IS_READ                VARCHAR2(2),
  UPERTASKID             NUMBER(22),
  UPERTASKNAME           VARCHAR2(255),
  DRAFT_DEPT_ID          NUMBER(22),
  DEPT_ID                NUMBER(22),
  PARAM                  VARCHAR2(2000),
  HAS_UNREAD_COUNTERSIGN VARCHAR2(2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.P_T_TODO
  is '����';
comment on column EAM2.P_T_TODO.ID
  is 'ID';
comment on column EAM2.P_T_TODO.USER_ID
  is '���������û�ID';
comment on column EAM2.P_T_TODO.SEND_USERID
  is '���췢����Id';
comment on column EAM2.P_T_TODO.HEAD_TYPE
  is '������';
comment on column EAM2.P_T_TODO.HEAD_ID
  is '��ID';
comment on column EAM2.P_T_TODO.TITLE
  is '����';
comment on column EAM2.P_T_TODO.DRAFT_USERID
  is '�����Id';
comment on column EAM2.P_T_TODO.DRAFT_DATE
  is '�������';
comment on column EAM2.P_T_TODO.CREATE_DATE
  is '��������';
comment on column EAM2.P_T_TODO.URL
  is '����URL';
comment on column EAM2.P_T_TODO.PROC_INST_ID
  is '����ʵ��ID';
comment on column EAM2.P_T_TODO.PROC_INST_NAME
  is '��������';
comment on column EAM2.P_T_TODO.SUBSYSTEM
  is '������ϵͳ';
comment on column EAM2.P_T_TODO.STATU
  is '����״̬����0:��ɾ����1:��Ч,';
comment on column EAM2.P_T_TODO.TASKID
  is '������';
comment on column EAM2.P_T_TODO.TASKNAME
  is '��������';
comment on column EAM2.P_T_TODO.SHEET_ID
  is '�����';
comment on column EAM2.P_T_TODO.IS_READ
  is '0��δ����1���Ѷ�';
comment on column EAM2.P_T_TODO.UPERTASKID
  is '��һ������';
comment on column EAM2.P_T_TODO.UPERTASKNAME
  is '��һ��������';
comment on column EAM2.P_T_TODO.DRAFT_DEPT_ID
  is '��岿�ű��';
comment on column EAM2.P_T_TODO.DEPT_ID
  is '�������˲��ű��';
comment on column EAM2.P_T_TODO.PARAM
  is 'url����';
comment on column EAM2.P_T_TODO.HAS_UNREAD_COUNTERSIGN
  is '0��û�У�1���У��Ƿ���δ���Ļ�ǩ�����';
alter table EAM2.P_T_TODO
  add constraint PK_P_T_TODO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_PTTODO_MULTI01 on EAM2.P_T_TODO (PROC_INST_ID, STATU)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.IDX_PTTODO_SGL01 on EAM2.P_T_TODO (PROC_INST_ID)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.PK_P_T_TODO1 on EAM2.P_T_TODO (USER_ID, STATU)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_USER
prompt =======================
prompt
create table EAM2.P_T_USER
(
  TID             NUMBER(22) not null,
  LOGIN_ID        VARCHAR2(40),
  USERNAME        VARCHAR2(40),
  PASSWORD        VARCHAR2(40),
  GENDER_CD       VARCHAR2(20),
  BIRTH_DATE      DATE,
  ID_NUMBER       VARCHAR2(40),
  EMAIL           VARCHAR2(40),
  CELLPHONE       VARCHAR2(40),
  HOME_PHONE      VARCHAR2(40),
  BUSINESS_PHONE  VARCHAR2(40),
  ADDRESS         VARCHAR2(200),
  POSTCODE        VARCHAR2(40),
  DESCRIPTION     VARCHAR2(500),
  STATUS_CD       VARCHAR2(20),
  DEL_FLAG_CD     VARCHAR2(20),
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6),
  RSVD_DATE1      DATE,
  RSVD_DATE2      DATE,
  RSVD_NUM1       NUMBER(10),
  RSVD_NUM2       NUMBER(10),
  RSVD_STR1       VARCHAR2(200),
  RSVD_STR2       VARCHAR2(200),
  RSVD_STR3       VARCHAR2(200),
  RSVD_STR4       VARCHAR2(200),
  RSVD_STR5       VARCHAR2(200),
  RSVD_STR6       VARCHAR2(200),
  RSVD_STR7       VARCHAR2(200),
  RSVD_STR8       VARCHAR2(200),
  RSVD_STR9       VARCHAR2(2000),
  RSVD_STR10      VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_USER.TID
  is '����ID';
comment on column EAM2.P_T_USER.LOGIN_ID
  is '��¼�ʺ�';
comment on column EAM2.P_T_USER.USERNAME
  is '�û�����';
comment on column EAM2.P_T_USER.PASSWORD
  is '��¼����';
comment on column EAM2.P_T_USER.GENDER_CD
  is '�Ա�';
comment on column EAM2.P_T_USER.BIRTH_DATE
  is '��������';
comment on column EAM2.P_T_USER.ID_NUMBER
  is '֤������';
comment on column EAM2.P_T_USER.EMAIL
  is '�����ʼ�';
comment on column EAM2.P_T_USER.CELLPHONE
  is '�ƶ��绰';
comment on column EAM2.P_T_USER.HOME_PHONE
  is '��ͥ�绰';
comment on column EAM2.P_T_USER.BUSINESS_PHONE
  is '�칫�绰';
comment on column EAM2.P_T_USER.ADDRESS
  is '��ַ';
comment on column EAM2.P_T_USER.POSTCODE
  is '�ʱ�';
comment on column EAM2.P_T_USER.DESCRIPTION
  is '������Ϣ';
comment on column EAM2.P_T_USER.STATUS_CD
  is '״̬';
comment on column EAM2.P_T_USER.DEL_FLAG_CD
  is '�Ƿ�ɾ��';
comment on column EAM2.P_T_USER.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_USER.SYS_UPDATE_TIME
  is '����ʱ��';
comment on column EAM2.P_T_USER.RSVD_DATE1
  is '�����ֶ�����1';
comment on column EAM2.P_T_USER.RSVD_DATE2
  is '�����ֶ�����2';
comment on column EAM2.P_T_USER.RSVD_NUM1
  is '�����ֶ�����1';
comment on column EAM2.P_T_USER.RSVD_NUM2
  is '�����ֶ�����2';
comment on column EAM2.P_T_USER.RSVD_STR1
  is '�����ֶ��ַ�1';
comment on column EAM2.P_T_USER.RSVD_STR2
  is '�����ֶ��ַ�2';
comment on column EAM2.P_T_USER.RSVD_STR3
  is '�����ֶ��ַ�3';
comment on column EAM2.P_T_USER.RSVD_STR4
  is '�����ֶ��ַ�4';
comment on column EAM2.P_T_USER.RSVD_STR5
  is '�����ֶ��ַ�5';
comment on column EAM2.P_T_USER.RSVD_STR6
  is '�����ֶ��ַ�6';
comment on column EAM2.P_T_USER.RSVD_STR7
  is '�����ֶ��ַ�7';
comment on column EAM2.P_T_USER.RSVD_STR8
  is '�����ֶ��ַ�8';
comment on column EAM2.P_T_USER.RSVD_STR9
  is '�����ֶ��ַ�9';
comment on column EAM2.P_T_USER.RSVD_STR10
  is '�����ֶ��ַ�10';
alter table EAM2.P_T_USER
  add constraint PK_USER primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_USER_L_DEPT
prompt ==============================
prompt
create table EAM2.P_T_USER_L_DEPT
(
  TID             NUMBER(22) not null,
  USER_ID         NUMBER(22) not null,
  DEPT_ID         NUMBER(22) not null,
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6),
  USER_NAME       VARCHAR2(200),
  DEPT_NAME       VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_USER_L_DEPT.TID
  is '����ID';
comment on column EAM2.P_T_USER_L_DEPT.USER_ID
  is '�û����';
comment on column EAM2.P_T_USER_L_DEPT.DEPT_ID
  is '���ű��';
comment on column EAM2.P_T_USER_L_DEPT.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_USER_L_DEPT.SYS_UPDATE_TIME
  is '����ʱ��';
comment on column EAM2.P_T_USER_L_DEPT.USER_NAME
  is '�û�����';
comment on column EAM2.P_T_USER_L_DEPT.DEPT_NAME
  is '��������';
alter table EAM2.P_T_USER_L_DEPT
  add constraint PK_DEP_L_USER primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index EAM2.XAK1_P_T_USER_L_DEPT on EAM2.P_T_USER_L_DEPT (USER_ID, DEPT_ID)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table P_T_USER_L_ROLE
prompt ==============================
prompt
create table EAM2.P_T_USER_L_ROLE
(
  TID             NUMBER(22) not null,
  USER_ID         NUMBER(22) not null,
  ROLE_ID         NUMBER(22) not null,
  SYS_UPDATE_USER NUMBER(22),
  SYS_UPDATE_TIME TIMESTAMP(6),
  USER_NAME       VARCHAR2(200),
  ROLE_NAME       VARCHAR2(200)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.P_T_USER_L_ROLE.TID
  is '����ID';
comment on column EAM2.P_T_USER_L_ROLE.USER_ID
  is '�û����';
comment on column EAM2.P_T_USER_L_ROLE.ROLE_ID
  is '��ɫ���';
comment on column EAM2.P_T_USER_L_ROLE.SYS_UPDATE_USER
  is '�����û����';
comment on column EAM2.P_T_USER_L_ROLE.SYS_UPDATE_TIME
  is '����ʱ��';
comment on column EAM2.P_T_USER_L_ROLE.USER_NAME
  is '�û�����';
comment on column EAM2.P_T_USER_L_ROLE.ROLE_NAME
  is '��ɫ����';
alter table EAM2.P_T_USER_L_ROLE
  add constraint PK_USER_L_ROLE primary key (TID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index EAM2.XAK1_P_T_USER_L_ROLE on EAM2.P_T_USER_L_ROLE (USER_ID, ROLE_ID)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_CZ_SCZSK
prompt ==========================
prompt
create table EAM2.QY_CZ_SCZSK
(
  ID    VARCHAR2(32) not null,
  PID   VARCHAR2(32),
  CODE  VARCHAR2(300),
  VALUE VARCHAR2(300),
  SCBZ  VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_CZ_SCZSK
  is '���֪ʶ��';
comment on column EAM2.QY_CZ_SCZSK.ID
  is 'uuid����';
comment on column EAM2.QY_CZ_SCZSK.PID
  is 'PID';
comment on column EAM2.QY_CZ_SCZSK.CODE
  is 'CODE';
comment on column EAM2.QY_CZ_SCZSK.SCBZ
  is 'ɾ����־';
alter table EAM2.QY_CZ_SCZSK
  add constraint PK_QY_CZ_SCZSK primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_DEBT_INFO
prompt ===========================
prompt
create table EAM2.QY_DEBT_INFO
(
  ID       VARCHAR2(32) not null,
  ZQRMC    VARCHAR2(300),
  ZQRID    VARCHAR2(32),
  ZWRMC    VARCHAR2(300),
  ZWRID    VARCHAR2(32),
  GLSTLX   VARCHAR2(10),
  SFSS     VARCHAR2(10),
  BEIZHU   VARCHAR2(4000),
  SHENGFEN VARCHAR2(32),
  DBFS     VARCHAR2(32),
  ZQJE     NUMBER(20,4),
  SSSX     VARCHAR2(400),
  ZWRQKJS  VARCHAR2(2000),
  FZJS     VARCHAR2(2000),
  ZQQX     NUMBER,
  DYZYCC   VARCHAR2(400)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.QY_DEBT_INFO.ZQRMC
  is 'ծȨ�����ư����й���Ͷ���ڲ�ʵ��';
comment on column EAM2.QY_DEBT_INFO.ZQRID
  is 'ծȨ��ID�����ծȨ�����й���Ͷ��id��¼�й���Ͷ��ţ�������ڲ�ʵ�壬��¼�ڲ�ʵ��id';
comment on column EAM2.QY_DEBT_INFO.ZWRMC
  is 'ծ��������';
comment on column EAM2.QY_DEBT_INFO.ZWRID
  is 'ծ����ID';
comment on column EAM2.QY_DEBT_INFO.GLSTLX
  is '�ڲ�ʵ�塢�ⲿʵ��';
comment on column EAM2.QY_DEBT_INFO.SFSS
  is '�Ƿ�����';
comment on column EAM2.QY_DEBT_INFO.BEIZHU
  is '��ע';
comment on column EAM2.QY_DEBT_INFO.SHENGFEN
  is 'ʡ��';
comment on column EAM2.QY_DEBT_INFO.DBFS
  is '������ʽ';
comment on column EAM2.QY_DEBT_INFO.ZQJE
  is 'ծȯ���';
comment on column EAM2.QY_DEBT_INFO.SSSX
  is '����ʱЧ';
comment on column EAM2.QY_DEBT_INFO.ZWRQKJS
  is 'ծ�����������';
comment on column EAM2.QY_DEBT_INFO.FZJS
  is '��ծ����';
comment on column EAM2.QY_DEBT_INFO.ZQQX
  is 'ծȯ����(��)';
comment on column EAM2.QY_DEBT_INFO.DYZYCC
  is '��Ѻ�Ʋ�����Ѻ�Ʋ�����֤�˵�˵��';

prompt
prompt Creating table QY_DZYHP_TZ
prompt ==========================
prompt
create table EAM2.QY_DZYHP_TZ
(
  ID     VARCHAR2(32) not null,
  XL     VARCHAR2(300),
  ZCMC   VARCHAR2(300),
  GG     VARCHAR2(50),
  SYR    VARCHAR2(50),
  SYBM   VARCHAR2(100),
  ZCBH   VARCHAR2(100),
  CGRQ   DATE,
  GYS    VARCHAR2(200),
  CZYZ   NUMBER(20,2),
  BGDD   VARCHAR2(100),
  ZTWZ   VARCHAR2(200),
  BZ     VARCHAR2(1000),
  YJFLBM VARCHAR2(50),
  YJFLMC VARCHAR2(100),
  EJFLBM VARCHAR2(50),
  EJFLMC VARCHAR2(100),
  SJFLBM VARCHAR2(50),
  SJFLMC VARCHAR2(100),
  ZC_ID  VARCHAR2(32) not null,
  RKSL   NUMBER(20,2),
  CKSL   NUMBER(20,2),
  KCSL   NUMBER(20,2),
  LYBMBM VARCHAR2(20),
  LYRBH  VARCHAR2(20),
  SYZK   VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_DZYHP_TZ
  is '2010��ֵ�׺�Ʒ̨��';
comment on column EAM2.QY_DZYHP_TZ.ID
  is '���';
comment on column EAM2.QY_DZYHP_TZ.XL
  is 'С��';
comment on column EAM2.QY_DZYHP_TZ.ZCMC
  is '����';
comment on column EAM2.QY_DZYHP_TZ.GG
  is '����ͺ�';
comment on column EAM2.QY_DZYHP_TZ.SYR
  is '������';
comment on column EAM2.QY_DZYHP_TZ.SYBM
  is 'ʹ�ò���';
comment on column EAM2.QY_DZYHP_TZ.ZCBH
  is '�ʲ�����';
comment on column EAM2.QY_DZYHP_TZ.CGRQ
  is '�ɹ�����';
comment on column EAM2.QY_DZYHP_TZ.GYS
  is '��Ӧ��';
comment on column EAM2.QY_DZYHP_TZ.CZYZ
  is '�Ʋ�ԭֵ';
comment on column EAM2.QY_DZYHP_TZ.BGDD
  is '���ܵص�';
comment on column EAM2.QY_DZYHP_TZ.ZTWZ
  is '���ճ��λ��';
comment on column EAM2.QY_DZYHP_TZ.BZ
  is '��ע';
comment on column EAM2.QY_DZYHP_TZ.YJFLBM
  is 'һ���������';
comment on column EAM2.QY_DZYHP_TZ.YJFLMC
  is 'һ����������';
comment on column EAM2.QY_DZYHP_TZ.EJFLBM
  is '�����������';
comment on column EAM2.QY_DZYHP_TZ.EJFLMC
  is '������������';
comment on column EAM2.QY_DZYHP_TZ.SJFLBM
  is '�����������';
comment on column EAM2.QY_DZYHP_TZ.SJFLMC
  is '������������';
comment on column EAM2.QY_DZYHP_TZ.ZC_ID
  is '�ʲ�ID���ʲ����Ӧ';
comment on column EAM2.QY_DZYHP_TZ.RKSL
  is '�������';
comment on column EAM2.QY_DZYHP_TZ.CKSL
  is '��������';
comment on column EAM2.QY_DZYHP_TZ.KCSL
  is '�������';
comment on column EAM2.QY_DZYHP_TZ.LYBMBM
  is '���ò��ű���';
comment on column EAM2.QY_DZYHP_TZ.LYRBH
  is '���ý����˱��';
comment on column EAM2.QY_DZYHP_TZ.SYZK
  is 'ʹ��״��';
alter table EAM2.QY_DZYHP_TZ
  add constraint PK_QY_DZYHP_TZ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_ERP_CARDINFO
prompt ==============================
prompt
create table EAM2.QY_ERP_CARDINFO
(
  ZCID               VARCHAR2(32) not null,
  CARD_CODE          VARCHAR2(46),
  CARD_ZYMC          VARCHAR2(460),
  CARD_LBMC          VARCHAR2(460),
  CARD_BZ            VARCHAR2(460),
  ZJTYPE             VARCHAR2(460),
  USEPARTMENT        VARCHAR2(450),
  GLBM               VARCHAR2(450),
  ADDTYPE            VARCHAR2(460),
  USESTATUS          VARCHAR2(460),
  ZJCDBM             VARCHAR2(450),
  YJTYF              NUMBER,
  KSDATE             DATE,
  YBYZ               NUMBER(20,2),
  CARD_BBYZ          NUMBER(20,2),
  CARD_HBDW          VARCHAR2(450),
  LJZJ               NUMBER(20,2),
  JCZL               NUMBER(20,4),
  USERNAME           VARCHAR2(450),
  SYYX               NUMBER,
  CARD_DWZJ          NUMBER(20,2),
  YZJL               NUMBER(20,2),
  YZJE               NUMBER(20,2),
  GGXH               VARCHAR2(900),
  SAVEADSRESS        VARCHAR2(4000),
  CARD_GZLDW         VARCHAR2(450),
  CARD_LJGZL         VARCHAR2(450),
  CARD_GZZL          VARCHAR2(450),
  JZZB               NUMBER(20,2),
  TYPECODE           VARCHAR2(450),
  JVALUE             NUMBER(20,2),
  JCZ                NUMBER(20,6),
  JEVALUE            NUMBER(20,2),
  CARD_ZCTH          VARCHAR2(450),
  CARD_YGZL          VARCHAR2(450),
  GYS                VARCHAR2(760),
  CARD_GZZX          VARCHAR2(450),
  CARD_SL            VARCHAR2(450),
  CARD_XMGLDA        VARCHAR2(450),
  CLPXH              VARCHAR2(450),
  CARD_JDW           VARCHAR2(450),
  CARD_ZJLY          VARCHAR2(450),
  CARD_TDJB          VARCHAR2(450),
  CARD_JLDW          VARCHAR2(450),
  ZDMJ               VARCHAR2(760),
  ZXMJ               VARCHAR2(760),
  CARD_JS            VARCHAR2(450),
  CARD_JZCBS         VARCHAR2(450),
  CARD_DJGL          VARCHAR2(450),
  CARD_DJSL          VARCHAR2(450),
  CARD_CCRQ          VARCHAR2(450),
  CARD_SCCS          VARCHAR2(450),
  SMBXQ              VARCHAR2(760),
  SXBXQ              VARCHAR2(760),
  CUPXH              VARCHAR2(760),
  NSAVE              VARCHAR2(760),
  CARD_ASS           VARCHAR2(450),
  QPXH               VARCHAR2(760),
  CARD_GL            VARCHAR2(450),
  CARD_MACDZ         VARCHAR2(450),
  CARD_IPDZ          VARCHAR2(450),
  CARD_XXDH          VARCHAR2(450),
  CARD_SYRDH         VARCHAR2(450),
  SBXLH              VARCHAR2(760),
  RKDH               VARCHAR2(460),
  NZYP               VARCHAR2(760),
  WZYP               VARCHAR2(760),
  CARD_HBYCSJ        VARCHAR2(450),
  CARD_DCRL          VARCHAR2(450),
  CARD_BB            VARCHAR2(450),
  BXQ                VARCHAR2(760),
  CARD_JZMJ          VARCHAR2(450),
  CARD_ZDMJ          VARCHAR2(450),
  CARD_FCZHM         VARCHAR2(450),
  CARD_ZXFCKPBH      VARCHAR2(450),
  ZXMJ01             VARCHAR2(760),
  QSZM               VARCHAR2(4000),
  YWDYTD             VARCHAR2(460),
  DYTDKP             VARCHAR2(460),
  DYTDZH             VARCHAR2(760),
  CARD_BZQK          VARCHAR2(450),
  CARD_QSZH          VARCHAR2(450),
  CARD_QSZSYR        VARCHAR2(450),
  CARD_DYTDQSWJ      VARCHAR2(450),
  CARD_DYTDTDWJ      VARCHAR2(450),
  CARD_DYTDKPBH      VARCHAR2(450),
  CARD_YT            VARCHAR2(450),
  CARD_ZCS           VARCHAR2(450),
  CARD_ZLDJC         VARCHAR2(450),
  CARD_YG            VARCHAR2(450),
  QYDATE             VARCHAR2(500),
  OLDCODE            VARCHAR2(460),
  MAINYT             VARCHAR2(4000),
  QZSYZ              VARCHAR2(460),
  YXTLRY             VARCHAR2(460),
  PGQYZ              VARCHAR2(760),
  PGQLJZJ            VARCHAR2(760),
  CARD_CLMCJGGXH     VARCHAR2(450),
  CARD_GZRQ          VARCHAR2(450),
  CARD_CLPH          VARCHAR2(450),
  CARD_YWFP          VARCHAR2(450),
  CARD_CLXCZSYR      VARCHAR2(450),
  CARD_PZHM          VARCHAR2(450),
  FDJHM              VARCHAR2(460),
  CARD_KFCD          VARCHAR2(450),
  CARD_SYSYNX        VARCHAR2(450),
  SYNX               NUMBER,
  CARD_YDXZ          VARCHAR2(450),
  CARD_SJYT          VARCHAR2(450),
  CARD_GHYT          VARCHAR2(450),
  CARD_DYFWYKPBH     VARCHAR2(450),
  CARD_YWDYDSW       VARCHAR2(450),
  TDZHM              VARCHAR2(450),
  CARD_DYFCFCZBH     VARCHAR2(450),
  CARD_DYFCYKPBH     VARCHAR2(450),
  CARD_YWDYFC        VARCHAR2(450),
  ZXRQ               DATE,
  XSQ                VARCHAR2(760),
  HTHM               VARCHAR2(760),
  IFJC               VARCHAR2(460),
  OLDYEARYZ          VARCHAR2(760),
  CARD_2004JZ        VARCHAR2(450),
  OLDYEARJZ          VARCHAR2(760),
  YSQDJZ             VARCHAR2(760),
  ZCSTATUS           VARCHAR2(460),
  ZYZT               VARCHAR2(460),
  CARD_JBH           VARCHAR2(450),
  CARD_04JZZB        VARCHAR2(450),
  CARD_06YTXYX       VARCHAR2(450),
  CARD_YJSYYX        VARCHAR2(450),
  BZSM               VARCHAR2(4000),
  CARD_QSWJWYXWJ     VARCHAR2(450),
  CARD_QSTDWJ        VARCHAR2(450),
  CARD_QSWJQSYWZY    VARCHAR2(450),
  CARD_QSWJSFDY      VARCHAR2(450),
  CARD_DYTDZSYQR     VARCHAR2(450),
  CARD_DYTDQSWJWYXWJ VARCHAR2(450),
  CARD_DYTDQSWJWTDWJ VARCHAR2(450),
  CARD_JCRQ          VARCHAR2(450),
  CARD_JG            VARCHAR2(450),
  CARD_BZCG          VARCHAR2(450),
  CARD_CBDJ          VARCHAR2(450),
  CARD_ZCDYWJXH      VARCHAR2(450),
  CARD_ZCZLWJXH      VARCHAR2(450),
  CARD_ZCCZWJXH      VARCHAR2(450),
  CARD_QTYGSMWJXH    VARCHAR2(450),
  CARD_PGYZ          VARCHAR2(450),
  CARD_ZZL           VARCHAR2(450),
  CARD_CXL           VARCHAR2(450),
  CARD_PGJZ          VARCHAR2(450),
  CARD_ZWZCYSQDJG    VARCHAR2(450),
  CARD_ZCCZZXYJ      VARCHAR2(450),
  CARD_ZJCZJZ        VARCHAR2(450),
  CARD_JKCZJZ        VARCHAR2(450),
  CARD_04NCZMYZ      VARCHAR2(450),
  CARD_04NCZMJZZB    VARCHAR2(450),
  CARD_04NCZMJZ      VARCHAR2(450),
  CARD_ZP            VARCHAR2(450),
  CARD_CZSJ          VARCHAR2(450),
  CARD_CZDYZMYZ      VARCHAR2(450),
  CARD_CZDYZMJZ      VARCHAR2(450),
  CARD_CZHTBH        VARCHAR2(450),
  CARD_CZSR          VARCHAR2(450),
  CARD_RZCZSR        VARCHAR2(450),
  CARD_RZCZFY        VARCHAR2(450),
  CARD_RZCZSY        VARCHAR2(450),
  CARD_2005YXSLC     VARCHAR2(450),
  CARD_JFCZFLJF      VARCHAR2(450),
  CARD_SFDY          VARCHAR2(450),
  CARD_HCPGBZ        VARCHAR2(450),
  CARD_DYTDKPBH01    VARCHAR2(450),
  CARD_QDRQ          VARCHAR2(450),
  CARD_04NZZMTDZ     VARCHAR2(450),
  CARD_GCZT          VARCHAR2(450),
  CARD_JGCS          VARCHAR2(450),
  CARD_KGRQ          VARCHAR2(450),
  CARD_YJWGRQ        VARCHAR2(450),
  CARD_XXJD          VARCHAR2(450),
  CARD_FKBL          VARCHAR2(450),
  CARD_GSS           VARCHAR2(450),
  CARD_TDCRHT        VARCHAR2(450),
  CARD_JZYDXKZ       VARCHAR2(450),
  CARD_JZGHXKZ       VARCHAR2(450),
  CARD_JZKGXKZ       VARCHAR2(450),
  CARD_JSFS          VARCHAR2(450),
  CARD_SFYJF         VARCHAR2(450),
  CARD_GCQKE         VARCHAR2(450),
  CARD_HCYSFSE       VARCHAR2(450),
  CARD_ZCXMBS        VARCHAR2(450),
  CARD_FCBZSJ        VARCHAR2(450),
  CARD_TDBZSJ        VARCHAR2(450),
  CARD_QQBZ          VARCHAR2(450),
  CARD_BNQQYY        VARCHAR2(450)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_ERP_CARDINFO
  is 'һ��ERP���� -> ��Ƭ��';
comment on column EAM2.QY_ERP_CARDINFO.ZCID
  is '��Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CODE
  is '�ʲ�����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZYMC
  is '�ʲ�����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_LBMC
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BZ
  is '����';
comment on column EAM2.QY_ERP_CARDINFO.ZJTYPE
  is '�۾ɷ���';
comment on column EAM2.QY_ERP_CARDINFO.USEPARTMENT
  is 'ʹ�ò���';
comment on column EAM2.QY_ERP_CARDINFO.GLBM
  is '������';
comment on column EAM2.QY_ERP_CARDINFO.ADDTYPE
  is '���ӷ�ʽ';
comment on column EAM2.QY_ERP_CARDINFO.USESTATUS
  is 'ʹ��״��';
comment on column EAM2.QY_ERP_CARDINFO.ZJCDBM
  is '�۾ɳе�����';
comment on column EAM2.QY_ERP_CARDINFO.YJTYF
  is '�Ѽ����·�';
comment on column EAM2.QY_ERP_CARDINFO.KSDATE
  is '��ʼʹ������';
comment on column EAM2.QY_ERP_CARDINFO.YBYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BBYZ
  is '����ԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HBDW
  is '���ҵ�λ';
comment on column EAM2.QY_ERP_CARDINFO.LJZJ
  is '�ۼ��۾�';
comment on column EAM2.QY_ERP_CARDINFO.JCZL
  is '����ֵ�ʣ�';
comment on column EAM2.QY_ERP_CARDINFO.USERNAME
  is 'ʹ����';
comment on column EAM2.QY_ERP_CARDINFO.SYYX
  is 'ʹ������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DWZJ
  is '��λ�۾�';
comment on column EAM2.QY_ERP_CARDINFO.YZJL
  is '���۾���';
comment on column EAM2.QY_ERP_CARDINFO.YZJE
  is '���۾ɶ�';
comment on column EAM2.QY_ERP_CARDINFO.GGXH
  is '����ͺ�';
comment on column EAM2.QY_ERP_CARDINFO.SAVEADSRESS
  is '��ŵص�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZLDW
  is '��������λ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_LJGZL
  is '�ۼƹ�����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZZL
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.JZZB
  is '��ֵ׼��';
comment on column EAM2.QY_ERP_CARDINFO.TYPECODE
  is '������';
comment on column EAM2.QY_ERP_CARDINFO.JVALUE
  is '��ֵ';
comment on column EAM2.QY_ERP_CARDINFO.JCZ
  is '����ֵ';
comment on column EAM2.QY_ERP_CARDINFO.JEVALUE
  is '����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCTH
  is '�ʲ��׺�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YGZL
  is '�¹�����';
comment on column EAM2.QY_ERP_CARDINFO.GYS
  is '��Ӧ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZZX
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SL
  is '����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_XMGLDA
  is '��Ŀ������';
comment on column EAM2.QY_ERP_CARDINFO.CLPXH
  is '�������պ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JDW
  is '����λ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZJLY
  is '�ʽ���Դ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_TDJB
  is '���ؼ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JLDW
  is '������λ';
comment on column EAM2.QY_ERP_CARDINFO.ZDMJ
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.ZXMJ
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JS
  is '��[��]��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZCBS
  is '�����а���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DJGL
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DJSL
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CCRQ
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SCCS
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.SMBXQ
  is '���ű�����';
comment on column EAM2.QY_ERP_CARDINFO.SXBXQ
  is '���ޱ�����';
comment on column EAM2.QY_ERP_CARDINFO.CUPXH
  is 'CPU�ͺ� ';
comment on column EAM2.QY_ERP_CARDINFO.NSAVE
  is '�ڴ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ASS
  is '��ʱ��';
comment on column EAM2.QY_ERP_CARDINFO.QPXH
  is 'Ӳ���ͺ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GL
  is '����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_MACDZ
  is 'MAC��ַ ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_IPDZ
  is 'IP��ַ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_XXDH
  is '��Ϣ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SYRDH
  is 'ʹ���˵绰';
comment on column EAM2.QY_ERP_CARDINFO.SBXLH
  is '�豸���к�';
comment on column EAM2.QY_ERP_CARDINFO.RKDH
  is '��ⵥ��';
comment on column EAM2.QY_ERP_CARDINFO.NZYP
  is '����Ӳ��';
comment on column EAM2.QY_ERP_CARDINFO.WZYP
  is '����Ӳ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HBYCSJ
  is '���ӳ�ʱ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DCRL
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BB
  is '�汾';
comment on column EAM2.QY_ERP_CARDINFO.BXQ
  is '������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZMJ
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZDMJ
  is 'ռ�����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_FCZHM
  is '����֤����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZXFCKPBH
  is 'װ�޷�����Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.ZXMJ01
  is 'װ�����';
comment on column EAM2.QY_ERP_CARDINFO.QSZM
  is 'Ȩ��֤��';
comment on column EAM2.QY_ERP_CARDINFO.YWDYTD
  is '���޶�Ӧ����';
comment on column EAM2.QY_ERP_CARDINFO.DYTDKP
  is '��Ӧ����ԭ��Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.DYTDZH
  is '��Ӧ����֤��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BZQK
  is '��֤���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSZH
  is 'Ȩ��֤��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSZSYR
  is 'Ȩ��֤����Ȩ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDQSWJ
  is '��Ӧ����Ȩ���ļ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDTDWJ
  is '��Ӧ��������֤��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDKPBH
  is '��Ӧ���ؿ�Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YT
  is '��;';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCS
  is '�ܲ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZLDJC
  is '�����ڵڼ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YG
  is '�ܸ�';
comment on column EAM2.QY_ERP_CARDINFO.QYDATE
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.OLDCODE
  is '�ɿ�Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.MAINYT
  is '��Ҫ��;';
comment on column EAM2.QY_ERP_CARDINFO.QZSYZ
  is 'Ȩ֤������';
comment on column EAM2.QY_ERP_CARDINFO.YXTLRY
  is 'ԭϵͳ¼��Ա';
comment on column EAM2.QY_ERP_CARDINFO.PGQYZ
  is '����ǰԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.PGQLJZJ
  is '����ǰ�ۼ��۾�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CLMCJGGXH
  is '�������Ƽ�����ͺ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZRQ
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CLPH
  is '�����ƺ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YWFP
  is '���޷�Ʊ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CLXCZSYR
  is '������ʻ֤������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_PZHM
  is '���պ���';
comment on column EAM2.QY_ERP_CARDINFO.FDJHM
  is '����������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_KFCD
  is '�����̶�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SYSYNX
  is 'ʣ��ʹ������';
comment on column EAM2.QY_ERP_CARDINFO.SYNX
  is '׼������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YDXZ
  is '�õ�����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SJYT
  is 'ʵ����;';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GHYT
  is '�滮��;';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYFWYKPBH
  is '��Ӧ����ԭ��Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YWDYDSW
  is '���޶�Ӧ������';
comment on column EAM2.QY_ERP_CARDINFO.TDZHM
  is '����֤����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYFCFCZBH
  is '��Ӧ��������֤���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYFCYKPBH
  is '��Ӧ����ԭ��Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YWDYFC
  is '���޶�Ӧ����';
comment on column EAM2.QY_ERP_CARDINFO.ZXRQ
  is 'ע������';
comment on column EAM2.QY_ERP_CARDINFO.XSQ
  is 'ϵͳ��ʾ��';
comment on column EAM2.QY_ERP_CARDINFO.HTHM
  is '��ͬ����';
comment on column EAM2.QY_ERP_CARDINFO.IFJC
  is '�Ƿ�м�';
comment on column EAM2.QY_ERP_CARDINFO.OLDYEARYZ
  is '2004��1��1��ԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_2004JZ
  is '2004��1��1�վ�ֵ';
comment on column EAM2.QY_ERP_CARDINFO.OLDYEARJZ
  is '2004��1��1���ۼ��۾�';
comment on column EAM2.QY_ERP_CARDINFO.YSQDJZ
  is 'ԭʼȡ�ü�ֵ';
comment on column EAM2.QY_ERP_CARDINFO.ZCSTATUS
  is '�ʲ�״̬';
comment on column EAM2.QY_ERP_CARDINFO.ZYZT
  is '����״̬';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JBH
  is '������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04JZZB
  is '04��1��1�ռ�ֵ׼��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_06YTXYX
  is '06��1��1����̯������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YJSYYX
  is 'Ԥ��ʹ������';
comment on column EAM2.QY_ERP_CARDINFO.BZSM
  is '��ע';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSWJWYXWJ
  is 'Ȩ���ļ�����Ч�ļ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSTDWJ
  is 'Ȩ������ļ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSWJQSYWZY
  is 'Ȩ���ļ�Ȩ����������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSWJSFDY
  is 'Ȩ���ļ��Ƿ��Ѻ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDZSYQR
  is '��Ӧ����֤ʹ��Ȩ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDQSWJWYXWJ
  is '��Ӧ����Ȩ���ļ�����Ч�ļ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDQSWJWTDWJ
  is '��Ӧ����Ȩ���ļ�����ļ�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JCRQ
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JG
  is '�ṹ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BZCG
  is '��׼���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CBDJ
  is '�ɱ�����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCDYWJXH
  is '�ʲ���Ѻ�ļ����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCZLWJXH
  is '�ʲ������ļ����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCCZWJXH
  is '�ʲ������ļ����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QTYGSMWJXH
  is '�����й�˵���ļ����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_PGYZ
  is '����ԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZZL
  is '��ֵ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CXL
  is '������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_PGJZ
  is '������ֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZWZCYSQDJG
  is '�����ʲ�ԭʼȡ�ü۸�';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCCZZXYJ
  is '�ʲ�������ѯ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZJCZJZ
  is '������ü�ֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JKCZJZ
  is '���촦�ü�ֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NCZMYZ
  is '04���������ԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NCZMJZZB
  is '04����������ֵ׼��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NCZMJZ
  is '04��������澻ֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZP
  is '��Ƭ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZSJ
  is '����ʱ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZDYZMYZ
  is '���õ�������ԭֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZDYZMJZ
  is '���õ������澻ֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZHTBH
  is '���ú�ͬ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZSR
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_RZCZSR
  is '���˴�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_RZCZFY
  is '���˴��÷���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_RZCZSY
  is '���˴�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_2005YXSLC
  is '2005��9��30������ʻ��� ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JFCZFLJF
  is '�Ƿ���ڷ��ɾ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SFDY
  is '�Ƿ��Ѻ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HCPGBZ
  is '�˲�������ע';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDKPBH01
  is '��Ӧ���ؾɿ�Ƭ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QDRQ
  is 'ȡ������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NZZMTDZ
  is '04�������������ֵ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GCZT
  is '����״̬';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JGCS
  is '�ṹ����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_KGRQ
  is '��������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YJWGRQ
  is 'Ԥ���깤����';
comment on column EAM2.QY_ERP_CARDINFO.CARD_XXJD
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_FKBL
  is '�������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GSS
  is '������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_TDCRHT
  is '���س��ú�ͬ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZYDXKZ
  is '�����õ����֤';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZGHXKZ
  is '�����滮���֤';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZKGXKZ
  is '�����������֤';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JSFS
  is '���㷽ʽ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SFYJF
  is '�Ƿ��о���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GCQKE
  is '����Ƿ���';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HCYSFSE
  is '�˲�ԭʼ������';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCXMBS
  is '�ʲ���Ŀ��ʶ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_FCBZSJ
  is '������֤ʱ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_TDBZSJ
  is '���ذ�֤ʱ��';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QQBZ
  is 'ȷȨ��ע';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BNQQYY
  is '����ȷȨԭ��';
alter table EAM2.QY_ERP_CARDINFO
  add constraint PK_QY_ERP_CARDINFO primary key (ZCID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index EAM2.CARD_CODE on EAM2.QY_ERP_CARDINFO (CARD_CODE)
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_GDZCSW_TZ
prompt ===========================
prompt
create table EAM2.QY_GDZCSW_TZ
(
  ID     VARCHAR2(32) not null,
  KPBH   VARCHAR2(40),
  ZCBH   VARCHAR2(20),
  ZCMC   VARCHAR2(300),
  GG     VARCHAR2(50),
  LBMC   VARCHAR2(300),
  SYBM   VARCHAR2(100),
  SYZK   VARCHAR2(20),
  CZYZ   NUMBER(20,2),
  SYR    VARCHAR2(100),
  KSSYRQ DATE,
  FDJBH  VARCHAR2(20),
  BGDD   VARCHAR2(100),
  YLRR   VARCHAR2(20),
  ZTWZ   VARCHAR2(200),
  YJFLBM VARCHAR2(50),
  YJFLMC VARCHAR2(100),
  EJFLBM VARCHAR2(50),
  EJFLMC VARCHAR2(100),
  SJFLBM VARCHAR2(50),
  SJFLMC VARCHAR2(100),
  ZC_ID  VARCHAR2(32) not null,
  RKSL   NUMBER(20,2),
  CKSL   NUMBER(20,2),
  KCSL   NUMBER(20,2),
  LYBMBM VARCHAR2(20),
  LYRBH  VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_GDZCSW_TZ
  is '2010�̶��ʲ�ʵ��̨��';
comment on column EAM2.QY_GDZCSW_TZ.ID
  is '���';
comment on column EAM2.QY_GDZCSW_TZ.KPBH
  is '��Ƭ���';
comment on column EAM2.QY_GDZCSW_TZ.ZCBH
  is '�ʲ�����';
comment on column EAM2.QY_GDZCSW_TZ.ZCMC
  is '�ʲ�����';
comment on column EAM2.QY_GDZCSW_TZ.GG
  is '����ͺ�';
comment on column EAM2.QY_GDZCSW_TZ.LBMC
  is '�������';
comment on column EAM2.QY_GDZCSW_TZ.SYBM
  is 'ʹ�ò���';
comment on column EAM2.QY_GDZCSW_TZ.SYZK
  is 'ʹ��״��';
comment on column EAM2.QY_GDZCSW_TZ.CZYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.QY_GDZCSW_TZ.SYR
  is 'ʹ����';
comment on column EAM2.QY_GDZCSW_TZ.KSSYRQ
  is '��ʼʹ������';
comment on column EAM2.QY_GDZCSW_TZ.FDJBH
  is '����������';
comment on column EAM2.QY_GDZCSW_TZ.BGDD
  is '��ŵص�';
comment on column EAM2.QY_GDZCSW_TZ.YLRR
  is 'ԭϵͳ¼��Ա';
comment on column EAM2.QY_GDZCSW_TZ.ZTWZ
  is '���ճ��λ��';
comment on column EAM2.QY_GDZCSW_TZ.YJFLBM
  is 'һ���������';
comment on column EAM2.QY_GDZCSW_TZ.YJFLMC
  is 'һ����������';
comment on column EAM2.QY_GDZCSW_TZ.EJFLBM
  is '�����������';
comment on column EAM2.QY_GDZCSW_TZ.EJFLMC
  is '������������';
comment on column EAM2.QY_GDZCSW_TZ.SJFLBM
  is '�����������';
comment on column EAM2.QY_GDZCSW_TZ.SJFLMC
  is '������������';
comment on column EAM2.QY_GDZCSW_TZ.ZC_ID
  is '�ʲ�ID���ʲ����Ӧ';
comment on column EAM2.QY_GDZCSW_TZ.RKSL
  is '�������';
comment on column EAM2.QY_GDZCSW_TZ.CKSL
  is '��������';
comment on column EAM2.QY_GDZCSW_TZ.KCSL
  is '�������';
comment on column EAM2.QY_GDZCSW_TZ.LYBMBM
  is '���ò��ű���';
comment on column EAM2.QY_GDZCSW_TZ.LYRBH
  is '���ý����˱��';
alter table EAM2.QY_GDZCSW_TZ
  add constraint PK_QY_GDZCSW_TZ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_JSJLDZHC
prompt ==========================
prompt
create table EAM2.QY_JSJLDZHC
(
  ID     VARCHAR2(32) not null,
  YJFLBM VARCHAR2(50),
  SYRQ   DATE,
  ZCMC   VARCHAR2(300),
  GG     VARCHAR2(300),
  DJ     NUMBER(20,2),
  SL     VARCHAR2(20),
  JG     NUMBER(20,2),
  SYR    VARCHAR2(100),
  BZ     VARCHAR2(1000),
  SYBM   VARCHAR2(100),
  SYZK   VARCHAR2(100),
  YJFLMC VARCHAR2(100),
  EJFLBM VARCHAR2(50),
  EJFLMC VARCHAR2(100),
  SJFLBM VARCHAR2(50),
  SJFLMC VARCHAR2(100),
  ZC_ID  VARCHAR2(32) not null,
  RKSL   NUMBER(20,2),
  CKSL   NUMBER(20,2),
  KCSL   NUMBER(20,2),
  LYBMBM VARCHAR2(20),
  LYRBH  VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_JSJLDZHC
  is '��������ֵ�Ĳ�';
comment on column EAM2.QY_JSJLDZHC.ID
  is '���';
comment on column EAM2.QY_JSJLDZHC.YJFLBM
  is 'һ���������';
comment on column EAM2.QY_JSJLDZHC.SYRQ
  is '��������';
comment on column EAM2.QY_JSJLDZHC.ZCMC
  is '����/��Ʒ����';
comment on column EAM2.QY_JSJLDZHC.GG
  is '�ͺ�/Ʒ�ƹ���ͺ�';
comment on column EAM2.QY_JSJLDZHC.DJ
  is '����';
comment on column EAM2.QY_JSJLDZHC.SL
  is '����';
comment on column EAM2.QY_JSJLDZHC.JG
  is '�ܼ�/�۸�';
comment on column EAM2.QY_JSJLDZHC.SYR
  is 'ʹ����';
comment on column EAM2.QY_JSJLDZHC.BZ
  is '��ע';
comment on column EAM2.QY_JSJLDZHC.SYBM
  is '���ò���';
comment on column EAM2.QY_JSJLDZHC.SYZK
  is '״̬';
comment on column EAM2.QY_JSJLDZHC.YJFLMC
  is 'һ����������';
comment on column EAM2.QY_JSJLDZHC.EJFLBM
  is '�����������';
comment on column EAM2.QY_JSJLDZHC.EJFLMC
  is '������������';
comment on column EAM2.QY_JSJLDZHC.SJFLBM
  is '�����������';
comment on column EAM2.QY_JSJLDZHC.SJFLMC
  is '������������';
comment on column EAM2.QY_JSJLDZHC.ZC_ID
  is '�ʲ�ID���ʲ����Ӧ';
comment on column EAM2.QY_JSJLDZHC.RKSL
  is '�������';
comment on column EAM2.QY_JSJLDZHC.CKSL
  is '��������';
comment on column EAM2.QY_JSJLDZHC.KCSL
  is '�������';
comment on column EAM2.QY_JSJLDZHC.LYBMBM
  is '���ò��ű���';
comment on column EAM2.QY_JSJLDZHC.LYRBH
  is '���ý����˱��';
alter table EAM2.QY_JSJLDZHC
  add constraint PK_QY_JSJLDZHC primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_JSJLGDZC
prompt ==========================
prompt
create table EAM2.QY_JSJLGDZC
(
  ID     VARCHAR2(32) not null,
  EJFLBM VARCHAR2(50),
  ZCMC   VARCHAR2(300),
  GG     VARCHAR2(50),
  XLH    VARCHAR2(20),
  SL     NUMBER(20,2),
  BXQ    VARCHAR2(100),
  CZYZ   NUMBER(20,2),
  SYZK   VARCHAR2(20),
  BGDD   VARCHAR2(100),
  SYBM   VARCHAR2(100),
  SYR    VARCHAR2(100),
  CPUXH  VARCHAR2(300),
  MEMORY VARCHAR2(20),
  DISK   VARCHAR2(20),
  NZDISK VARCHAR2(20),
  XTXSQ  VARCHAR2(20),
  BZ     VARCHAR2(1000),
  EJFLMC VARCHAR2(100),
  YJFLBM VARCHAR2(50),
  YJFLMC VARCHAR2(100),
  SJFLBM VARCHAR2(50),
  SJFLMC VARCHAR2(100),
  ZC_ID  VARCHAR2(32) not null,
  RKSL   NUMBER(20,2),
  CKSL   NUMBER(20,2),
  KCSL   NUMBER(20,2),
  LYBMBM VARCHAR2(20),
  LYRBH  VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_JSJLGDZC
  is '�������̶��ʲ�';
comment on column EAM2.QY_JSJLGDZC.ID
  is '���';
comment on column EAM2.QY_JSJLGDZC.EJFLBM
  is '�����������';
comment on column EAM2.QY_JSJLGDZC.ZCMC
  is '��Ʒ����';
comment on column EAM2.QY_JSJLGDZC.GG
  is '����ͺ�';
comment on column EAM2.QY_JSJLGDZC.XLH
  is '�豸���к�';
comment on column EAM2.QY_JSJLGDZC.SL
  is '����';
comment on column EAM2.QY_JSJLGDZC.BXQ
  is '������';
comment on column EAM2.QY_JSJLGDZC.CZYZ
  is 'ԭ��ԭֵ';
comment on column EAM2.QY_JSJLGDZC.SYZK
  is 'ʹ��״��';
comment on column EAM2.QY_JSJLGDZC.BGDD
  is '��ŵص�';
comment on column EAM2.QY_JSJLGDZC.SYBM
  is 'ʹ�ò���';
comment on column EAM2.QY_JSJLGDZC.SYR
  is 'ʹ����';
comment on column EAM2.QY_JSJLGDZC.CPUXH
  is 'CPU�ͺ�';
comment on column EAM2.QY_JSJLGDZC.MEMORY
  is '�ڴ�';
comment on column EAM2.QY_JSJLGDZC.DISK
  is 'Ӳ���ͺ�';
comment on column EAM2.QY_JSJLGDZC.NZDISK
  is '����Ӳ��';
comment on column EAM2.QY_JSJLGDZC.XTXSQ
  is 'ϵͳ��ʾ��';
comment on column EAM2.QY_JSJLGDZC.BZ
  is '��ע';
comment on column EAM2.QY_JSJLGDZC.EJFLMC
  is '������������';
comment on column EAM2.QY_JSJLGDZC.YJFLBM
  is 'һ���������';
comment on column EAM2.QY_JSJLGDZC.YJFLMC
  is 'һ����������';
comment on column EAM2.QY_JSJLGDZC.SJFLBM
  is '�����������';
comment on column EAM2.QY_JSJLGDZC.SJFLMC
  is '������������';
comment on column EAM2.QY_JSJLGDZC.ZC_ID
  is '�ʲ�ID���ʲ����Ӧ';
comment on column EAM2.QY_JSJLGDZC.RKSL
  is '�������';
comment on column EAM2.QY_JSJLGDZC.CKSL
  is '��������';
comment on column EAM2.QY_JSJLGDZC.KCSL
  is '�������';
comment on column EAM2.QY_JSJLGDZC.LYBMBM
  is '���ò��ű���';
comment on column EAM2.QY_JSJLGDZC.LYRBH
  is '���ý����˱��';
alter table EAM2.QY_JSJLGDZC
  add constraint PK_QY_JSJLGDZC primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_JYTZZQTZ_MX
prompt =============================
prompt
create table EAM2.QY_JYTZZQTZ_MX
(
  ID               NUMBER not null,
  ZQZL             VARCHAR2(100),
  ZQMC             VARCHAR2(200),
  DQR              DATE,
  YJH_ZQMZHSKM     VARCHAR2(100),
  YJH_JE1          NUMBER(20,2),
  YJH_YSLXHSKM     VARCHAR2(100),
  YJH_JE2          NUMBER(20,2),
  JYTZNCS_ZQMZ     NUMBER(20,2),
  JYTZNCS_JZZB     NUMBER(20,2),
  JYTZNCS_ZQTZJE   NUMBER(20,2),
  JYTZNCS_YSLX     NUMBER(20,2),
  JYTZNCS_YSLXHZZB NUMBER(20,2),
  JYTZNCS_YSLXJE   NUMBER(20,2),
  JYTZNMS_ZQMZ     NUMBER(20,2),
  JYTZNMS_JZZB     NUMBER(20,2),
  JYTZNMS_ZQTZJE   NUMBER(20,2),
  JYTZNMS_YSLX     NUMBER(20,2),
  JYTZNMS_YSLXHZZB NUMBER(20,2),
  JYTZNMS_YSLXJE   NUMBER(20,2),
  JYTZNMS_ZQTZSY   NUMBER(20,2),
  BZ               VARCHAR2(1000),
  JHFHID           VARCHAR2(32),
  XMMC_BH          VARCHAR2(32),
  JHFHMC           VARCHAR2(100),
  ZQZLID           VARCHAR2(32),
  ZQZLBM           VARCHAR2(100),
  XM_ID            VARCHAR2(32),
  XMMC             VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_JYTZZQTZ_MX
  is '����Ͷ��ծȯͶ����ϸ��';
comment on column EAM2.QY_JYTZZQTZ_MX.ID
  is '���';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQZL
  is 'ծȯ����';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQMC
  is 'ծȯ����';
comment on column EAM2.QY_JYTZZQTZ_MX.DQR
  is '������';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_ZQMZHSKM
  is 'ԭ�������������ծȯ��ֵ�����Ŀ';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_JE1
  is 'ԭ���������������1��';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_YSLXHSKM
  is 'ԭ�������������Ӧ����Ϣ�����Ŀ';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_JE2
  is 'ԭ���������������2��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_ZQMZ
  is '����Ͷ�������ծȯ��ֵ��3��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_JZZB
  is '����Ͷ�������ծȯͶ�ʼ�ֵ׼����4��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_ZQTZJE
  is '����Ͷ�������ծȯͶ�ʾ��5��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_YSLX
  is '����Ͷ�������Ӧ����Ϣ��6��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_YSLXHZZB
  is '����Ͷ�������Ӧ����Ϣ����׼����7��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_YSLXJE
  is '����Ͷ�������Ӧ����Ϣ���8��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_ZQMZ
  is '����Ͷ����ĩ��ծȯ��ֵ��9��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_JZZB
  is '����Ͷ����ĩ��ծȯͶ�ʼ�ֵ׼����10��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_ZQTZJE
  is '����Ͷ����ĩ��ծȯͶ�ʾ��11��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_YSLX
  is '����Ͷ����ĩ��Ӧ����Ϣ��12��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_YSLXHZZB
  is '����Ͷ����ĩ��Ӧ����Ϣ����׼����13��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_YSLXJE
  is '����Ͷ����ĩ��Ӧ����Ϣ���14��';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_ZQTZSY
  is '����Ͷ����ĩ��ծȯͶ�����棨15��';
comment on column EAM2.QY_JYTZZQTZ_MX.BZ
  is '��ע';
comment on column EAM2.QY_JYTZZQTZ_MX.JHFHID
  is '��INDIVIDTREE��ѡȡ,����Ϊdepartment';
comment on column EAM2.QY_JYTZZQTZ_MX.XMMC_BH
  is '���б��';
comment on column EAM2.QY_JYTZZQTZ_MX.JHFHMC
  is '���з�������';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQZLID
  is 'ծȯ����ID,����CODE��';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQZLBM
  is 'ծȯ�������,����CODE��';
comment on column EAM2.QY_JYTZZQTZ_MX.XM_ID
  is '��ĿID';
comment on column EAM2.QY_JYTZZQTZ_MX.XMMC
  is '��Ŀ����';
alter table EAM2.QY_JYTZZQTZ_MX
  add constraint PK_QY_JYTZZQTZ_MX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_JYWTRMB_HZ
prompt ============================
prompt
create table EAM2.QY_JYWTRMB_HZ
(
  ID          NUMBER not null,
  ZQRMC       VARCHAR2(50),
  ZWRMC       VARCHAR2(300),
  JKHTBH_DABH VARCHAR2(32),
  HTQX_QSRQ   DATE,
  HTQX_ZZRQ   DATE,
  HTJE_BZ     VARCHAR2(50),
  HTJE_YBJE   NUMBER(20,2),
  JZR_GRZQYE  NUMBER(20,2),
  JZR_HJ      NUMBER(20,2),
  JZR_BJ      NUMBER(20,2),
  JZR_LX      NUMBER(20,2),
  DBQK_DBLX   VARCHAR2(100),
  DBQK_DBHTBH VARCHAR2(32),
  DBQK_DBHTJE NUMBER(20,2),
  DBQK_DYW    VARCHAR2(300),
  SJFL_SFSS   VARCHAR2(10),
  SJFL_SSFY   NUMBER(20,2),
  SJFL_FLWS   VARCHAR2(10),
  SJFL_ZHT    VARCHAR2(10),
  SJFL_DBHT   VARCHAR2(10),
  SJFL_ZXQK   VARCHAR2(10),
  BZ          VARCHAR2(1000),
  BZID        VARCHAR2(32),
  BZBM        VARCHAR2(100),
  DBLXID      VARCHAR2(32),
  DBLXBM      VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_JYWTRMB_HZ
  is '�ʲ�������������ܱ�';
comment on column EAM2.QY_JYWTRMB_HZ.ID
  is '���';
comment on column EAM2.QY_JYWTRMB_HZ.ZQRMC
  is 'ծȨ������';
comment on column EAM2.QY_JYWTRMB_HZ.ZWRMC
  is 'ծ��������';
comment on column EAM2.QY_JYWTRMB_HZ.JKHTBH_DABH
  is '����ͬ���/�������';
comment on column EAM2.QY_JYWTRMB_HZ.HTQX_QSRQ
  is '��ͬ����_��ʼ����';
comment on column EAM2.QY_JYWTRMB_HZ.HTQX_ZZRQ
  is '��ͬ����_��ֹ����';
comment on column EAM2.QY_JYWTRMB_HZ.HTJE_BZ
  is '��ͬ���_����';
comment on column EAM2.QY_JYWTRMB_HZ.HTJE_YBJE
  is '��ͬ���_ԭ�ҽ��';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_GRZQYE
  is '��ֹ��ծȨ���_����ծȨ���';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_HJ
  is '��ֹ��ծȨ���_�ϼ�';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_BJ
  is '��ֹ��ծȨ���_����';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_LX
  is '��ֹ��ծȨ���_��Ϣ';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DBLX
  is '�������_��������';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DBHTBH
  is '�������_������ͬ���';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DBHTJE
  is '�������_������ͬ���';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DYW
  is '�������_����Ѻ�����/��֤������';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_SFSS
  is '�漰���ɳ������_�Ƿ�����';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_SSFY
  is '�漰���ɳ������_���Ϸ���';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_FLWS
  is '�漰���ɳ������_�Ƿ�����Ч��������';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_ZHT
  is '�漰���ɳ������_���Ͻ������ͬ';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_DBHT
  is '�漰���ɳ������_���Ͻ��������ͬ';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_ZXQK
  is '�漰���ɳ������_ִ�����';
comment on column EAM2.QY_JYWTRMB_HZ.BZ
  is '��ע';
comment on column EAM2.QY_JYWTRMB_HZ.BZID
  is '��ͬ������ID,��ӦCODE��';
comment on column EAM2.QY_JYWTRMB_HZ.BZBM
  is '���ֱ��룬ȡ��CODE��';
comment on column EAM2.QY_JYWTRMB_HZ.DBLXID
  is '��������ID,ȡ��CODE��';
comment on column EAM2.QY_JYWTRMB_HZ.DBLXBM
  is '�������ͱ���';
alter table EAM2.QY_JYWTRMB_HZ
  add constraint PK_QY_JYWTRMB_HZ primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_LPB
prompt =====================
prompt
create table EAM2.QY_LPB
(
  ID     NUMBER not null,
  XM     VARCHAR2(100),
  DLM    VARCHAR2(100),
  LPH    VARCHAR2(100),
  QX     VARCHAR2(100),
  ZT     VARCHAR2(100),
  LPSX   DATE,
  ZC_ID  VARCHAR2(30) not null,
  YJFLBM VARCHAR2(50),
  YJFLMC VARCHAR2(100),
  EJFLBM VARCHAR2(50),
  EJFLMC VARCHAR2(100),
  SJFLBM VARCHAR2(50),
  SJFLMC VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_LPB
  is '����Ͷ��ծȯͶ����ϸ��';
comment on column EAM2.QY_LPB.ID
  is '���';
comment on column EAM2.QY_LPB.XM
  is '����';
comment on column EAM2.QY_LPB.DLM
  is '��¼��';
comment on column EAM2.QY_LPB.LPH
  is '���ƺ�';
comment on column EAM2.QY_LPB.QX
  is 'Ȩ��';
comment on column EAM2.QY_LPB.ZT
  is '״̬';
comment on column EAM2.QY_LPB.LPSX
  is '����ʱ��';
comment on column EAM2.QY_LPB.ZC_ID
  is '�ʲ�ID���ʲ����Ӧ';
comment on column EAM2.QY_LPB.YJFLBM
  is 'һ���������';
comment on column EAM2.QY_LPB.YJFLMC
  is 'һ����������';
comment on column EAM2.QY_LPB.EJFLBM
  is '�����������';
comment on column EAM2.QY_LPB.EJFLMC
  is '������������';
comment on column EAM2.QY_LPB.SJFLBM
  is '�����������';
comment on column EAM2.QY_LPB.SJFLMC
  is '������������';
alter table EAM2.QY_LPB
  add constraint PK_QY_LPB primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_SS_BASEINFO
prompt =============================
prompt
create table EAM2.QY_SS_BASEINFO
(
  ID       VARCHAR2(32) not null,
  SFID     VARCHAR2(32),
  SFMC     VARCHAR2(400),
  SAZCLBID VARCHAR2(32),
  SAZCLBBM VARCHAR2(100),
  SAZCLBMC VARCHAR2(400),
  SAZCID   VARCHAR2(32),
  SAZCMC   VARCHAR2(100),
  SSLXID   VARCHAR2(32),
  SSLXMC   VARCHAR2(400),
  YG       VARCHAR2(200),
  BG       VARCHAR2(200),
  DSR      VARCHAR2(200),
  AY       VARCHAR2(4000),
  BDE      NUMBER(20,2),
  AQJS     VARCHAR2(2000),
  SSZTID   VARCHAR2(100),
  SSZTMC   VARCHAR2(400),
  BZ       VARCHAR2(2000),
  DLR      VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.QY_SS_BASEINFO.ID
  is '����ID,UUID';
comment on column EAM2.QY_SS_BASEINFO.SFID
  is 'ʡ��ID,����CODE��';
comment on column EAM2.QY_SS_BASEINFO.SFMC
  is 'ʡ��';
comment on column EAM2.QY_SS_BASEINFO.SAZCLBID
  is '�永�ʲ����ID,����CODE�� ʵ�壺2';
comment on column EAM2.QY_SS_BASEINFO.SAZCLBBM
  is 'CODE�� ʵ��';
comment on column EAM2.QY_SS_BASEINFO.SAZCLBMC
  is '�永�ʲ��������,����CODE�� ʵ����';
comment on column EAM2.QY_SS_BASEINFO.SAZCID
  is '�永�ʲ�ID';
comment on column EAM2.QY_SS_BASEINFO.SAZCMC
  is '�永�ʲ�����';
comment on column EAM2.QY_SS_BASEINFO.SSLXID
  is '���ߣ�1 ���ߣ�0';
comment on column EAM2.QY_SS_BASEINFO.SSLXMC
  is '���� ����';
comment on column EAM2.QY_SS_BASEINFO.YG
  is 'ԭ��';
comment on column EAM2.QY_SS_BASEINFO.BG
  is '����';
comment on column EAM2.QY_SS_BASEINFO.DSR
  is '������';
comment on column EAM2.QY_SS_BASEINFO.AY
  is '����';
comment on column EAM2.QY_SS_BASEINFO.BDE
  is '��Ķ�';
comment on column EAM2.QY_SS_BASEINFO.AQJS
  is '�����������';
comment on column EAM2.QY_SS_BASEINFO.SSZTID
  is 'ֱ������:3';
comment on column EAM2.QY_SS_BASEINFO.SSZTMC
  is '���Ͻ׶� 1��һ�� 2������ 3��ִ�� 4������';
comment on column EAM2.QY_SS_BASEINFO.BZ
  is '��ע';
comment on column EAM2.QY_SS_BASEINFO.DLR
  is '������ʦ����';

prompt
prompt Creating table QY_STOCK_SDZMZ_XX
prompt ================================
prompt
create table EAM2.QY_STOCK_SDZMZ_XX
(
  ID      VARCHAR2(32) not null,
  XM_ID   VARCHAR2(32),
  SHIDIAN DATE,
  ZMZ     NUMBER(20,2),
  JZZB    NUMBER(20,2),
  BEIZHU  VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.QY_STOCK_SDZMZ_XX.ID
  is 'ID';
comment on column EAM2.QY_STOCK_SDZMZ_XX.XM_ID
  is '��ĿID';
comment on column EAM2.QY_STOCK_SDZMZ_XX.SHIDIAN
  is 'ʱ��';
comment on column EAM2.QY_STOCK_SDZMZ_XX.ZMZ
  is '����ֵ';
comment on column EAM2.QY_STOCK_SDZMZ_XX.JZZB
  is '��ֵ׼��';
comment on column EAM2.QY_STOCK_SDZMZ_XX.BEIZHU
  is '��ע';
alter table EAM2.QY_STOCK_SDZMZ_XX
  add constraint PK_QY_STOCK_SDZMZ_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_ST_FSXX
prompt =========================
prompt
create table EAM2.QY_ST_FSXX
(
  ID        VARCHAR2(32) not null,
  LEIXING   VARCHAR2(10),
  STID      VARCHAR2(32),
  ACFDD     VARCHAR2(1000),
  ABGJG     VARCHAR2(300),
  EGDMC     VARCHAR2(300),
  FXINGMING VARCHAR2(300),
  FC_RYLX   VARCHAR2(32),
  FYDDH     VARCHAR2(300),
  FGDDH     VARCHAR2(300),
  JTDQDFS   VARCHAR2(1000),
  JSJZYR    VARCHAR2(300),
  JTDSYQZ   VARCHAR2(10),
  JXLBMYY   VARCHAR2(1000),
  JTDSFDY   VARCHAR2(10),
  JTDDYQKJS VARCHAR2(1000),
  JTDSYQR   VARCHAR2(300),
  JTDMS     VARCHAR2(1000),
  KFWSYQR   VARCHAR2(300),
  KFWSJZYR  VARCHAR2(300),
  KSFDY     VARCHAR2(10),
  KDYQK     VARCHAR2(1000),
  KFWMS     VARCHAR2(1000),
  LJTGJCFWZ VARCHAR2(1000),
  LQS       VARCHAR2(1000),
  LSJZYR    VARCHAR2(300),
  LSFDY     VARCHAR2(10),
  LDYJS     VARCHAR2(300),
  LJTGJMS   VARCHAR2(1000),
  MSBCFWZ   VARCHAR2(1000),
  MSBQS     VARCHAR2(1000),
  MSBSJZYR  VARCHAR2(300),
  MSBSFDY   VARCHAR2(10),
  MSBDYJS   VARCHAR2(300),
  MSBMS     VARCHAR2(1000),
  NTZE      NUMBER(20,4),
  NTZFS     VARCHAR2(300),
  NTZQKMS   VARCHAR2(1000),
  PQTZCSFDY VARCHAR2(10),
  PZCMS     VARCHAR2(1000),
  QZCZB     VARCHAR2(300),
  QC_CZFS   VARCHAR2(32),
  QC_CZQK   VARCHAR2(32),
  QCZBSSE   NUMBER(20,4),
  QC_CTCZ   VARCHAR2(32),
  QCTSE     NUMBER(20,4),
  QDLFRZG   VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.QY_ST_FSXX.ID
  is 'ʵ�帽����ID,UUID';
comment on column EAM2.QY_ST_FSXX.LEIXING
  is 'ʵ����Ա����Ȩ�����¼ǡ����񱨱�ʵ�����ʲ����ļ������´�����';
comment on column EAM2.QY_ST_FSXX.STID
  is 'ʵ�������ϢID';
comment on column EAM2.QY_ST_FSXX.ACFDD
  is '��ŵص�';
comment on column EAM2.QY_ST_FSXX.ABGJG
  is '���ܻ���';
comment on column EAM2.QY_ST_FSXX.EGDMC
  is '�ɶ�����';
comment on column EAM2.QY_ST_FSXX.FXINGMING
  is '����';
comment on column EAM2.QY_ST_FSXX.FC_RYLX
  is '��Ա���������ֵ��';
comment on column EAM2.QY_ST_FSXX.FYDDH
  is '�ƶ��绰';
comment on column EAM2.QY_ST_FSXX.FGDDH
  is '�̶��绰';
comment on column EAM2.QY_ST_FSXX.JTDQDFS
  is '����ȡ�÷�ʽ';
comment on column EAM2.QY_ST_FSXX.JSJZYR
  is 'ʵ��ռ����';
comment on column EAM2.QY_ST_FSXX.JTDSYQZ
  is '����ʹ��Ȩ֤1����2����3�����䲻��';
comment on column EAM2.QY_ST_FSXX.JXLBMYY
  is '������ʹ��Ȩ֤��û�м����䲻����ԭ��';
comment on column EAM2.QY_ST_FSXX.JTDSFDY
  is '�����Ƿ��Ѻ0����1����
';
comment on column EAM2.QY_ST_FSXX.JTDDYQKJS
  is '���ص�Ѻ�������';
comment on column EAM2.QY_ST_FSXX.JTDSYQR
  is '����ʹ��Ȩ��';
comment on column EAM2.QY_ST_FSXX.JTDMS
  is '��������';
comment on column EAM2.QY_ST_FSXX.KFWSYQR
  is '��������Ȩ��';
comment on column EAM2.QY_ST_FSXX.KFWSJZYR
  is '����ʵ��ռ����';
comment on column EAM2.QY_ST_FSXX.KSFDY
  is '�����Ƿ��Ѻ';
comment on column EAM2.QY_ST_FSXX.KDYQK
  is '���ݵ�Ѻ�������';
comment on column EAM2.QY_ST_FSXX.KFWMS
  is '��������';
comment on column EAM2.QY_ST_FSXX.LJTGJCFWZ
  is '��ͨ���ߴ�źδ�';
comment on column EAM2.QY_ST_FSXX.LQS
  is '��ͨ����Ȩ��';
comment on column EAM2.QY_ST_FSXX.LSJZYR
  is '��ͨ����ʵ��ռ����';
comment on column EAM2.QY_ST_FSXX.LSFDY
  is '��ͨ�����Ƿ��Ѻ';
comment on column EAM2.QY_ST_FSXX.LDYJS
  is '��ͨ���ߵ�Ѻ�������';
comment on column EAM2.QY_ST_FSXX.LJTGJMS
  is '��ͨ���乤������';
comment on column EAM2.QY_ST_FSXX.MSBCFWZ
  is '�����豸���λ��';
comment on column EAM2.QY_ST_FSXX.MSBQS
  is '�����豸Ȩ��';
comment on column EAM2.QY_ST_FSXX.MSBSJZYR
  is '�����豸ʵ��ռ����';
comment on column EAM2.QY_ST_FSXX.MSBSFDY
  is '�����豸�Ƿ��Ѻ';
comment on column EAM2.QY_ST_FSXX.MSBDYJS
  is '�����豸��Ѻ�������';
comment on column EAM2.QY_ST_FSXX.MSBMS
  is '�����豸����';
comment on column EAM2.QY_ST_FSXX.NTZE
  is 'Ͷ�ʶ�(Ԫ)';
comment on column EAM2.QY_ST_FSXX.NTZFS
  is 'Ͷ�ʷ�ʽ';
comment on column EAM2.QY_ST_FSXX.NTZQKMS
  is 'Ͷ���������';
comment on column EAM2.QY_ST_FSXX.PQTZCSFDY
  is '�����ʲ��Ƿ��Ѻ';
comment on column EAM2.QY_ST_FSXX.PZCMS
  is '�����ʲ�����';
comment on column EAM2.QY_ST_FSXX.QZCZB
  is 'ע���ʱ�';
comment on column EAM2.QY_ST_FSXX.QC_CZFS
  is '���ʷ�ʽ';
comment on column EAM2.QY_ST_FSXX.QC_CZQK
  is '�������';
comment on column EAM2.QY_ST_FSXX.QCZBSSE
  is '���ʲ�ʵ������';
comment on column EAM2.QY_ST_FSXX.QC_CTCZ
  is '���ӳ���';
comment on column EAM2.QY_ST_FSXX.QCTSE
  is '��������';
comment on column EAM2.QY_ST_FSXX.QDLFRZG
  is '���������ʸ�';
alter table EAM2.QY_ST_FSXX
  add constraint PK_ST_FSXX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QY_ST_JBXX
prompt =========================
prompt
create table EAM2.QY_ST_JBXX
(
  ID         VARCHAR2(32) not null,
  STLX       VARCHAR2(10),
  STZWMC     VARCHAR2(300),
  JYFL       VARCHAR2(10),
  C_SHENGFEN VARCHAR2(32),
  ZMTZ       VARCHAR2(300),
  CLSJ       DATE,
  BEIZHU     VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.QY_ST_JBXX.ID
  is 'ʵ��ID,UUID';
comment on column EAM2.QY_ST_JBXX.STLX
  is 'ʵ������';
comment on column EAM2.QY_ST_JBXX.STZWMC
  is 'ʵ����������';
comment on column EAM2.QY_ST_JBXX.JYFL
  is '��Ӫ����';
comment on column EAM2.QY_ST_JBXX.C_SHENGFEN
  is 'ʡ��';
comment on column EAM2.QY_ST_JBXX.ZMTZ
  is '����Ͷ��(Ԫ)/ע���ʱ�';
comment on column EAM2.QY_ST_JBXX.CLSJ
  is '����ʱ��';
comment on column EAM2.QY_ST_JBXX.BEIZHU
  is '��ע';

prompt
prompt Creating table QY_ST_SKJN_XX
prompt ============================
prompt
create table EAM2.QY_ST_SKJN_XX
(
  ST_ID     VARCHAR2(32),
  SFASJN    VARCHAR2(10),
  TQSKSE    NUMBER(20,4),
  TQSJ      VARCHAR2(300),
  SWJGSFKJM VARCHAR2(10),
  ID        VARCHAR2(32) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.QY_ST_SKJN_XX.ST_ID
  is 'ʵ��ID';
comment on column EAM2.QY_ST_SKJN_XX.SFASJN
  is '�Ƿ�ʱ����0����1����';
comment on column EAM2.QY_ST_SKJN_XX.TQSKSE
  is '��Ƿ˰������';
comment on column EAM2.QY_ST_SKJN_XX.TQSJ
  is '��Ƿʱ��';
comment on column EAM2.QY_ST_SKJN_XX.SWJGSFKJM
  is '˰������Ƿ���Լ���0����1����';
comment on column EAM2.QY_ST_SKJN_XX.ID
  is 'ID';

prompt
prompt Creating table QY_WD_LN_MORE_INFOR
prompt ==================================
prompt
create table EAM2.QY_WD_LN_MORE_INFOR
(
  LN_ACCT_NO       VARCHAR2(30),
  C_CUST_ID        VARCHAR2(30),
  SA_SYS_ACCT_NO   VARCHAR2(30),
  D_ACCT_NO        VARCHAR2(30),
  SAV_CUST_ACCT_NO VARCHAR2(300),
  C_ACCT_NO        VARCHAR2(300) not null,
  XULIE            VARCHAR2(300) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_WD_LN_MORE_INFOR
  is 'ί�д�����Ϣ';
comment on column EAM2.QY_WD_LN_MORE_INFOR.LN_ACCT_NO
  is '����ϵͳ�˻�';
comment on column EAM2.QY_WD_LN_MORE_INFOR.C_CUST_ID
  is '����ͻ����';
comment on column EAM2.QY_WD_LN_MORE_INFOR.SA_SYS_ACCT_NO
  is '����ϵͳ�˻�';
comment on column EAM2.QY_WD_LN_MORE_INFOR.D_ACCT_NO
  is 'ί�з��ͻ����';
comment on column EAM2.QY_WD_LN_MORE_INFOR.SAV_CUST_ACCT_NO
  is 'ί���˻����˺�';
comment on column EAM2.QY_WD_LN_MORE_INFOR.C_ACCT_NO
  is '������˺ţ�����ƽ̨��';
comment on column EAM2.QY_WD_LN_MORE_INFOR.XULIE
  is '����';

prompt
prompt Creating table QY_ZQTZ_QD
prompt =========================
prompt
create table EAM2.QY_ZQTZ_QD
(
  ID            NUMBER not null,
  FH            VARCHAR2(100),
  XMMC          VARCHAR2(100),
  ZMZ_2009      NUMBER(20,2),
  ZMZ_YZ_2006   NUMBER(20,2),
  ZMZ_JZZB_2006 NUMBER(20,2),
  QRJG          VARCHAR2(100),
  BZ            VARCHAR2(4000),
  XMMC_BH       NVARCHAR2(32),
  XM_ID         VARCHAR2(32),
  ZMZ_JZZB_2009 NUMBER(20,2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.QY_ZQTZ_QD
  is 'ծȯͶ���嵥����2009-6';
comment on column EAM2.QY_ZQTZ_QD.ID
  is '���';
comment on column EAM2.QY_ZQTZ_QD.FH
  is '����';
comment on column EAM2.QY_ZQTZ_QD.XMMC
  is '��Ŀ����';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_2009
  is '2009��6��30������ֵ';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_YZ_2006
  is '2006��12��31������ֵ_ԭֵ';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_JZZB_2006
  is '2006��12��31������ֵ_��ֵ׼��';
comment on column EAM2.QY_ZQTZ_QD.QRJG
  is '��Ŀ����ȷ�Ͻ��';
comment on column EAM2.QY_ZQTZ_QD.BZ
  is '��ע';
comment on column EAM2.QY_ZQTZ_QD.XMMC_BH
  is '���б��';
comment on column EAM2.QY_ZQTZ_QD.XM_ID
  is '��ĿID';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_JZZB_2009
  is '2009��6��30������ֵ_��ֵ׼��';
alter table EAM2.QY_ZQTZ_QD
  add constraint PK_QY_ZQTZ_QD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECORDHISTORY
prompt ============================
prompt
create table EAM2.RECORDHISTORY
(
  ID             VARCHAR2(32) not null,
  NAME           VARCHAR2(100),
  BEFORE         VARCHAR2(4000),
  AFTER          VARCHAR2(4000),
  WF_CODE        VARCHAR2(50),
  PK_ID          VARCHAR2(32),
  ZC_ID          VARCHAR2(32),
  ZC_TYPE        VARCHAR2(100),
  ELEMENTID      VARCHAR2(30),
  CHANGETYPE     VARCHAR2(30),
  CHANGESTATE    VARCHAR2(30),
  CHANGEINFOID   VARCHAR2(2000),
  CHANGEDATE     DATE,
  CHANGEPERSON   VARCHAR2(300),
  BIAOMING       VARCHAR2(300),
  CHANGEPERSONID VARCHAR2(32),
  ZHUANGTAI      VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.RECORDHISTORY
  is '�䶯��ʷ����־';
comment on column EAM2.RECORDHISTORY.ID
  is '����';
comment on column EAM2.RECORDHISTORY.NAME
  is '�䶯����';
comment on column EAM2.RECORDHISTORY.BEFORE
  is '�䶯ǰֵ';
comment on column EAM2.RECORDHISTORY.AFTER
  is '�䶯��ֵ';
comment on column EAM2.RECORDHISTORY.WF_CODE
  is '����ID';
comment on column EAM2.RECORDHISTORY.PK_ID
  is '����ID';
comment on column EAM2.RECORDHISTORY.ZC_ID
  is '�䶯��¼ID';
comment on column EAM2.RECORDHISTORY.ZC_TYPE
  is '�����ֶΣ����ڴ洢��ͬ���󣨿�Ƭ���ʲ�����ͬ������������';
comment on column EAM2.RECORDHISTORY.CHANGETYPE
  is '�䶯�����ͣ���Ƭ���ʲ�����ͬ��';
comment on column EAM2.RECORDHISTORY.CHANGESTATE
  is '�䶯��Ϣ��״̬��01����ʱ��ı䶯��Ϣ��02����Ϣ��ı䶯��Ϣ��';
comment on column EAM2.RECORDHISTORY.CHANGEINFOID
  is '�䶯����Ϣ���Ӧ��id';
comment on column EAM2.RECORDHISTORY.CHANGEDATE
  is '�䶯����';
comment on column EAM2.RECORDHISTORY.CHANGEPERSON
  is '�䶯������';
comment on column EAM2.RECORDHISTORY.BIAOMING
  is '�䶯����';
comment on column EAM2.RECORDHISTORY.CHANGEPERSONID
  is '�䶯�˱��';
comment on column EAM2.RECORDHISTORY.ZHUANGTAI
  is '״̬ 0��δ���� 1�������� 2������ͬ�� 3��������ͬ��';
alter table EAM2.RECORDHISTORY
  add constraint PK_RECORDHISTORY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SS_BASEINFO
prompt ==========================
prompt
create table EAM2.SS_BASEINFO
(
  ID       VARCHAR2(32) not null,
  AJBH     VARCHAR2(32),
  SFID     VARCHAR2(32),
  SFBM     VARCHAR2(100),
  SFMC     VARCHAR2(400),
  SAZCLBID VARCHAR2(32),
  SAZCLBBM VARCHAR2(100),
  SAZCLBMC VARCHAR2(400),
  SAZCID   VARCHAR2(32),
  SAZCMC   VARCHAR2(100),
  LARQ     DATE,
  QSSJ     DATE,
  SSLXID   VARCHAR2(32),
  SSLXBM   VARCHAR2(100),
  SSLXMC   VARCHAR2(400),
  YG       VARCHAR2(200),
  BG       VARCHAR2(200),
  DSR      VARCHAR2(200),
  AY       VARCHAR2(4000),
  BDE      NUMBER(20,2),
  ZXHK     NUMBER(20,2),
  SSQQ     VARCHAR2(4000),
  BHGLH    VARCHAR2(100),
  JAZTID   VARCHAR2(100),
  JAZTBM   VARCHAR2(100),
  JAZTMC   VARCHAR2(400),
  JTSFWDSR VARCHAR2(10),
  JBR      VARCHAR2(200),
  AQJS     VARCHAR2(2000),
  LRRID    VARCHAR2(32),
  LRR      VARCHAR2(100),
  LRSJ     DATE,
  SSZTID   VARCHAR2(100),
  SSZTBM   VARCHAR2(100),
  SSZTMC   VARCHAR2(400),
  BZ       VARCHAR2(2000),
  DLR      VARCHAR2(100),
  AJLBID   VARCHAR2(100),
  AJLBBM   VARCHAR2(100),
  AJLBMC   VARCHAR2(100),
  SARQ     DATE,
  DJSBM    VARCHAR2(100),
  DJSMC    VARCHAR2(300),
  ZCZSB_ID VARCHAR2(32)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.SS_BASEINFO
  is '���ϻ�����Ϣ';
comment on column EAM2.SS_BASEINFO.ID
  is '����ID,UUID';
comment on column EAM2.SS_BASEINFO.AJBH
  is '�������';
comment on column EAM2.SS_BASEINFO.SFID
  is 'ʡ��ID,����CODE��';
comment on column EAM2.SS_BASEINFO.SFBM
  is 'ʡ�ݱ���,����CODE��';
comment on column EAM2.SS_BASEINFO.SFMC
  is 'ʡ������,����CODE��';
comment on column EAM2.SS_BASEINFO.SAZCLBID
  is '�永�ʲ����ID,����CODE��';
comment on column EAM2.SS_BASEINFO.SAZCLBBM
  is '�永�ʲ�������,����CODE��';
comment on column EAM2.SS_BASEINFO.SAZCLBMC
  is '�永�ʲ��������,����CODE��';
comment on column EAM2.SS_BASEINFO.SAZCID
  is '�永�ʲ�ID';
comment on column EAM2.SS_BASEINFO.SAZCMC
  is '�永�ʲ�����';
comment on column EAM2.SS_BASEINFO.LARQ
  is '��������';
comment on column EAM2.SS_BASEINFO.QSSJ
  is '����ʱ��';
comment on column EAM2.SS_BASEINFO.SSLXID
  is '��������ID����CODE��';
comment on column EAM2.SS_BASEINFO.SSLXBM
  is '�������ͱ���,����CODE��';
comment on column EAM2.SS_BASEINFO.SSLXMC
  is '������������,����CODE��';
comment on column EAM2.SS_BASEINFO.YG
  is 'ԭ��';
comment on column EAM2.SS_BASEINFO.BG
  is '����';
comment on column EAM2.SS_BASEINFO.DSR
  is '������';
comment on column EAM2.SS_BASEINFO.AY
  is '����';
comment on column EAM2.SS_BASEINFO.BDE
  is '��Ķ�';
comment on column EAM2.SS_BASEINFO.ZXHK
  is 'ִ�лؿ�';
comment on column EAM2.SS_BASEINFO.SSQQ
  is '��������';
comment on column EAM2.SS_BASEINFO.BHGLH
  is '����(���й�����)';
comment on column EAM2.SS_BASEINFO.JAZTID
  is '�᰸״̬ID,����CODE��';
comment on column EAM2.SS_BASEINFO.JAZTBM
  is '�᰸״̬����,����CODE��';
comment on column EAM2.SS_BASEINFO.JAZTMC
  is '�᰸״̬����,����CODE��';
comment on column EAM2.SS_BASEINFO.JTSFWDSR
  is '�й���Ͷ�Ƿ�Ϊ������1��0��';
comment on column EAM2.SS_BASEINFO.JBR
  is '��Ͷ(���ż�������)';
comment on column EAM2.SS_BASEINFO.AQJS
  is '�������';
comment on column EAM2.SS_BASEINFO.LRRID
  is '¼����ID,ƽ̨�ṩID';
comment on column EAM2.SS_BASEINFO.LRR
  is '¼����';
comment on column EAM2.SS_BASEINFO.LRSJ
  is '¼��ʱ��';
comment on column EAM2.SS_BASEINFO.SSZTID
  is '����״̬ID,����CODE��';
comment on column EAM2.SS_BASEINFO.SSZTBM
  is '����״̬����,����CODE��';
comment on column EAM2.SS_BASEINFO.SSZTMC
  is '����״̬����,����CODE��';
comment on column EAM2.SS_BASEINFO.BZ
  is '��ע';
comment on column EAM2.SS_BASEINFO.DLR
  is '������';
comment on column EAM2.SS_BASEINFO.AJLBID
  is '�������id';
comment on column EAM2.SS_BASEINFO.AJLBBM
  is '����������';
comment on column EAM2.SS_BASEINFO.AJLBMC
  is '�����������';
comment on column EAM2.SS_BASEINFO.SARQ
  is '�հ�����';
comment on column EAM2.SS_BASEINFO.DJSBM
  is '�ؼ��б���';
comment on column EAM2.SS_BASEINFO.DJSMC
  is '�ؼ�������';
comment on column EAM2.SS_BASEINFO.ZCZSB_ID
  is '�ʲ���ʽ��ID';
alter table EAM2.SS_BASEINFO
  add constraint PK_SS_BASEINFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SS_PROC
prompt ======================
prompt
create table EAM2.SS_PROC
(
  ID        VARCHAR2(32) not null,
  SSJBXX_ID VARCHAR2(32),
  SSJDID    VARCHAR2(32),
  SSJDBM    VARCHAR2(100),
  SSJDMC    VARCHAR2(400),
  SSJDMS    VARCHAR2(4000),
  SSSJ      DATE,
  ZCT       VARCHAR2(100),
  CPSXSJ    DATE,
  SXPJJG    VARCHAR2(2000),
  DLR       VARCHAR2(100),
  ACYS      VARCHAR2(2000),
  LRRID     VARCHAR2(32),
  LRR       VARCHAR2(100),
  LRRQ      DATE,
  BZ        VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.SS_PROC
  is '���Ϲ�����Ϣ';
comment on column EAM2.SS_PROC.ID
  is '���Ϲ���ID';
comment on column EAM2.SS_PROC.SSJBXX_ID
  is '����ID,�������ϻ�����Ϣ��';
comment on column EAM2.SS_PROC.SSJDID
  is '���Ͻ׶�ID,����CODE��';
comment on column EAM2.SS_PROC.SSJDBM
  is '���Ͻ׶α���,����CODE��';
comment on column EAM2.SS_PROC.SSJDMC
  is '���Ͻ׶�����,����CODE��';
comment on column EAM2.SS_PROC.SSJDMS
  is '���Ͻ׶�����';
comment on column EAM2.SS_PROC.SSSJ
  is '����ʱ��';
comment on column EAM2.SS_PROC.ZCT
  is '��Ͻ/��Ժ/�ٲ�ͥ';
comment on column EAM2.SS_PROC.CPSXSJ
  is '������Чʱ��';
comment on column EAM2.SS_PROC.SXPJJG
  is '��Ч�о����';
comment on column EAM2.SS_PROC.DLR
  is '������';
comment on column EAM2.SS_PROC.ACYS
  is '����Ҫ��';
comment on column EAM2.SS_PROC.LRRID
  is '¼����ID';
comment on column EAM2.SS_PROC.LRR
  is '¼����';
comment on column EAM2.SS_PROC.LRRQ
  is '¼������';
comment on column EAM2.SS_PROC.BZ
  is '��ע';
alter table EAM2.SS_PROC
  add constraint PK_SS_PROC primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_BOOKVALUE
prompt ==============================
prompt
create table EAM2.STOCK_BOOKVALUE
(
  ID        VARCHAR2(32) not null,
  STOCKID   VARCHAR2(32),
  ZQMC      VARCHAR2(200),
  NF        VARCHAR2(4),
  ZQMZ      NUMBER(20,2),
  TZJCZB    NUMBER(20,2),
  ZQTZJE    NUMBER(20,2),
  YSLX      NUMBER(20,2),
  YSLXHZZB  NUMBER(20,2),
  YSLXJE    NUMBER(20,2),
  ZQMZ2     NUMBER(20,2),
  TZJCZB2   NUMBER(20,2),
  ZQTZJE2   NUMBER(20,2),
  YSLX2     NUMBER(20,2),
  YSLXHZZB2 NUMBER(20,2),
  YSLXJE2   NUMBER(20,2),
  BZ        VARCHAR2(2000),
  TZSYNC    NUMBER(20,4),
  TZSYNM    NUMBER(20,4)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.STOCK_BOOKVALUE
  is '����Ͷ����ӵ�е�ծȯ�������ֵ,Ŀǰ��ư������洢��';
comment on column EAM2.STOCK_BOOKVALUE.ID
  is 'ծȯ��ֵID,UUID';
comment on column EAM2.STOCK_BOOKVALUE.STOCKID
  is 'ծȯID';
comment on column EAM2.STOCK_BOOKVALUE.ZQMC
  is 'ծȯ����,����STOCK_INFO��';
comment on column EAM2.STOCK_BOOKVALUE.NF
  is '���,��ʽΪYYYY';
comment on column EAM2.STOCK_BOOKVALUE.ZQMZ
  is 'ծȯ��ֵ_���';
comment on column EAM2.STOCK_BOOKVALUE.TZJCZB
  is 'Ͷ�ʼ���׼��_���';
comment on column EAM2.STOCK_BOOKVALUE.ZQTZJE
  is 'ծȯͶ�ʾ���_���';
comment on column EAM2.STOCK_BOOKVALUE.YSLX
  is 'Ӧ����Ϣ_���';
comment on column EAM2.STOCK_BOOKVALUE.YSLXHZZB
  is 'Ӧ����Ϣ����׼��_���';
comment on column EAM2.STOCK_BOOKVALUE.YSLXJE
  is 'Ӧ����Ϣ����_���';
comment on column EAM2.STOCK_BOOKVALUE.ZQMZ2
  is 'ծȯ��ֵ_��ĩ';
comment on column EAM2.STOCK_BOOKVALUE.TZJCZB2
  is 'Ͷ�ʼ���׼��_��ĩ';
comment on column EAM2.STOCK_BOOKVALUE.ZQTZJE2
  is 'ծȯͶ�ʾ���_��ĩ';
comment on column EAM2.STOCK_BOOKVALUE.YSLX2
  is 'Ӧ����Ϣ_��ĩ';
comment on column EAM2.STOCK_BOOKVALUE.YSLXHZZB2
  is 'Ӧ����Ϣ����׼��_��ĩ';
comment on column EAM2.STOCK_BOOKVALUE.YSLXJE2
  is 'Ӧ����Ϣ����_��ĩ';
comment on column EAM2.STOCK_BOOKVALUE.BZ
  is '��ע';
comment on column EAM2.STOCK_BOOKVALUE.TZSYNC
  is 'ծȯͶ������(���)';
comment on column EAM2.STOCK_BOOKVALUE.TZSYNM
  is 'ծȯͶ������(��ĩ)';
alter table EAM2.STOCK_BOOKVALUE
  add constraint PK_STOCK_BOOKVALUE primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_INFO
prompt =========================
prompt
create table EAM2.STOCK_INFO
(
  ID       VARCHAR2(32) not null,
  JHFHID   VARCHAR2(32),
  JHFHBM   VARCHAR2(32),
  JHFHMC   VARCHAR2(100),
  ZQZLID   VARCHAR2(32),
  ZQZLBM   VARCHAR2(100),
  ZQZLMC   VARCHAR2(400),
  ZQMC     VARCHAR2(200),
  DQR      DATE,
  ZQMZHSKM VARCHAR2(100),
  JE1      NUMBER(20,2),
  YSLXHSKM VARCHAR2(100),
  JE2      NUMBER(20,2),
  BZ       VARCHAR2(4000),
  XM_ID    VARCHAR2(32),
  XMMC     VARCHAR2(300),
  C_ZCQS   VARCHAR2(32),
  WTRMC    VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.STOCK_INFO.ID
  is 'ծȯID,UUID';
comment on column EAM2.STOCK_INFO.JHFHID
  is '��INDIVIDTREE��ѡȡ,����Ϊdepartment';
comment on column EAM2.STOCK_INFO.JHFHBM
  is '���з��б���,INDIVIDTREE';
comment on column EAM2.STOCK_INFO.JHFHMC
  is '���з�������,INDIVIDTREE';
comment on column EAM2.STOCK_INFO.ZQZLID
  is 'ծȯ����ID,����CODE��';
comment on column EAM2.STOCK_INFO.ZQZLBM
  is 'ծȯ�������,����CODE��';
comment on column EAM2.STOCK_INFO.ZQZLMC
  is 'ծȯ��������,����CODE��';
comment on column EAM2.STOCK_INFO.ZQMC
  is 'ծȯ����';
comment on column EAM2.STOCK_INFO.DQR
  is '������';
comment on column EAM2.STOCK_INFO.ZQMZHSKM
  is 'ծȯ��ֵ�����Ŀ';
comment on column EAM2.STOCK_INFO.JE1
  is '���1';
comment on column EAM2.STOCK_INFO.YSLXHSKM
  is 'Ӧ����Ϣ�����Ŀ';
comment on column EAM2.STOCK_INFO.JE2
  is '���2';
comment on column EAM2.STOCK_INFO.BZ
  is '��ע';
comment on column EAM2.STOCK_INFO.XM_ID
  is '��ĿID';
comment on column EAM2.STOCK_INFO.XMMC
  is '��Ŀ����';
alter table EAM2.STOCK_INFO
  add constraint PK_STOCK_INFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_LIST
prompt =========================
prompt
create table EAM2.STOCK_LIST
(
  ID                 VARCHAR2(32) not null,
  FHBM               VARCHAR2(100),
  FHMC               VARCHAR2(100),
  XMMC               VARCHAR2(100),
  Y2009M6D30ZMZ      NUMBER(20,2),
  Y2006M12D31ZMZYZ   NUMBER(20,2),
  Y2006M12D31ZMZJZZB NUMBER(20,2),
  XMMCQR             VARCHAR2(100),
  BZ                 VARCHAR2(4000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.STOCK_LIST.ID
  is 'ծȨͶ���嵥ID,UUID';
comment on column EAM2.STOCK_LIST.FHBM
  is '���з��б�ţ�ȡ��INDIVIDUALTREE';
comment on column EAM2.STOCK_LIST.FHMC
  is '��������,ȡ��INDIVIDUALTREE';
comment on column EAM2.STOCK_LIST.XMMC
  is '��Ŀ����';
comment on column EAM2.STOCK_LIST.Y2009M6D30ZMZ
  is '2009��6��30������ֵ';
comment on column EAM2.STOCK_LIST.Y2006M12D31ZMZYZ
  is '2006��12��31������ֵԭֵ';
comment on column EAM2.STOCK_LIST.Y2006M12D31ZMZJZZB
  is '2006��12��31������ֵ��ֵ׼��';
comment on column EAM2.STOCK_LIST.XMMCQR
  is '��Ŀ����ȷ��';
comment on column EAM2.STOCK_LIST.BZ
  is '��ע';
alter table EAM2.STOCK_LIST
  add constraint PK_STOCK_LIST primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_SBODY
prompt ==========================
prompt
create table EAM2.STOCK_SBODY
(
  ID       VARCHAR2(32) not null,
  SHEAD_ID VARCHAR2(32),
  STOCK_ID VARCHAR2(32) not null,
  JHFHMC   VARCHAR2(100),
  ZQZLMC   VARCHAR2(400),
  ZQMC     VARCHAR2(200),
  DQR      DATE,
  ZQZXMZNC NUMBER(20,2),
  ZQZXMZNM NUMBER(20,2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.STOCK_SBODY.ID
  is 'ID,uuid';
comment on column EAM2.STOCK_SBODY.SHEAD_ID
  is '��ID';
comment on column EAM2.STOCK_SBODY.STOCK_ID
  is 'ծȯID,UUID';
comment on column EAM2.STOCK_SBODY.JHFHMC
  is '���з�������,INDIVIDTREE';
comment on column EAM2.STOCK_SBODY.ZQZLMC
  is 'ծȯ��������,����CODE��';
comment on column EAM2.STOCK_SBODY.ZQMC
  is 'ծȯ����';
comment on column EAM2.STOCK_SBODY.DQR
  is '������';
comment on column EAM2.STOCK_SBODY.ZQZXMZNC
  is 'ծȯ������ֵ���';
comment on column EAM2.STOCK_SBODY.ZQZXMZNM
  is 'ծȯ������ֵ��ĩ';
alter table EAM2.STOCK_SBODY
  add constraint PK_STOCK_SBODY primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_SDZMZ_XX
prompt =============================
prompt
create table EAM2.STOCK_SDZMZ_XX
(
  ID      VARCHAR2(32) not null,
  XM_ID   VARCHAR2(32),
  SHIDIAN DATE,
  ZMZ     NUMBER(20,2),
  JZZB    NUMBER(20,2),
  BEIZHU  VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.STOCK_SDZMZ_XX.ID
  is 'ID';
comment on column EAM2.STOCK_SDZMZ_XX.XM_ID
  is '��ĿID';
comment on column EAM2.STOCK_SDZMZ_XX.SHIDIAN
  is 'ʱ��';
comment on column EAM2.STOCK_SDZMZ_XX.ZMZ
  is '����ֵ';
comment on column EAM2.STOCK_SDZMZ_XX.JZZB
  is '��ֵ׼��';
comment on column EAM2.STOCK_SDZMZ_XX.BEIZHU
  is '��ע';
alter table EAM2.STOCK_SDZMZ_XX
  add constraint PK_STOCK_SDZMZ_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_SHEAD
prompt ==========================
prompt
create table EAM2.STOCK_SHEAD
(
  SHEAD_ID   VARCHAR2(32) not null,
  SHEET_TYPE VARCHAR2(100),
  TITLE      VARCHAR2(100),
  SHEET_ID   VARCHAR2(300),
  NGRQ       DATE,
  NGRBH      VARCHAR2(100),
  NGRMC      VARCHAR2(100),
  NGBMBH     VARCHAR2(100),
  NGBMMC     VARCHAR2(100),
  LDXH       VARCHAR2(100),
  JHCD       VARCHAR2(10),
  BDZT       VARCHAR2(10),
  BZ         VARCHAR2(1000),
  HQBM       VARCHAR2(300),
  HQBMID     VARCHAR2(300),
  CHENGSONG  VARCHAR2(300),
  LC_ID      VARCHAR2(32),
  LCMC       VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.STOCK_SHEAD
  is 'ծȯ���ݱ�ͷ';
comment on column EAM2.STOCK_SHEAD.SHEAD_ID
  is 'ϵͳ�ڲ���� ';
comment on column EAM2.STOCK_SHEAD.SHEET_TYPE
  is '�����ͣ���������ֵ䶨�����';
comment on column EAM2.STOCK_SHEAD.TITLE
  is '�����⣬�ֹ�¼��';
comment on column EAM2.STOCK_SHEAD.SHEET_ID
  is '����ţ����ݱ�Ź����Զ�����';
comment on column EAM2.STOCK_SHEAD.NGRQ
  is '������ڣ���ʽΪYYYYMMDD';
comment on column EAM2.STOCK_SHEAD.NGRBH
  is '����˱��';
comment on column EAM2.STOCK_SHEAD.NGRMC
  is '���������';
comment on column EAM2.STOCK_SHEAD.NGBMBH
  is '��岿�ű��';
comment on column EAM2.STOCK_SHEAD.NGBMMC
  is '��岿������';
comment on column EAM2.STOCK_SHEAD.LDXH
  is '��ϵ�绰���˹�����';
comment on column EAM2.STOCK_SHEAD.JHCD
  is '�����̶� һ�㣻�����ؼ�';
comment on column EAM2.STOCK_SHEAD.BDZT
  is '��״̬0 ���1������2�������';
comment on column EAM2.STOCK_SHEAD.BZ
  is '��ע,ծȯ���������';
comment on column EAM2.STOCK_SHEAD.HQBM
  is '��ǩ����';
comment on column EAM2.STOCK_SHEAD.CHENGSONG
  is '����';
comment on column EAM2.STOCK_SHEAD.LC_ID
  is '����ID';
comment on column EAM2.STOCK_SHEAD.LCMC
  is '��������';
alter table EAM2.STOCK_SHEAD
  add constraint PK_STOCK_SHEAD primary key (SHEAD_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STOCK_WORKLOG
prompt ============================
prompt
create table EAM2.STOCK_WORKLOG
(
  LOGID   VARCHAR2(32) not null,
  STOCKID VARCHAR2(32),
  CBRID   VARCHAR2(32),
  CBRMC   VARCHAR2(100),
  CBRQ    DATE,
  CBFSBM  VARCHAR2(32),
  CBFSMC  VARCHAR2(100),
  ZWFZR   VARCHAR2(32),
  ZWFZRDH VARCHAR2(32),
  BLJG    VARCHAR2(1000),
  BZ      VARCHAR2(1000),
  SFBC    VARCHAR2(10)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
comment on column EAM2.STOCK_WORKLOG.LOGID
  is '������־ID';
comment on column EAM2.STOCK_WORKLOG.STOCKID
  is 'ծȯID';
comment on column EAM2.STOCK_WORKLOG.CBRID
  is '�߰���ID';
comment on column EAM2.STOCK_WORKLOG.CBRMC
  is '�߰�������';
comment on column EAM2.STOCK_WORKLOG.CBRQ
  is '�߰�����';
comment on column EAM2.STOCK_WORKLOG.CBFSBM
  is '�߰췽ʽ����';
comment on column EAM2.STOCK_WORKLOG.CBFSMC
  is '�߰췽ʽ����';
comment on column EAM2.STOCK_WORKLOG.ZWFZR
  is 'ծ������';
comment on column EAM2.STOCK_WORKLOG.ZWFZRDH
  is 'ծ�����˵绰';
comment on column EAM2.STOCK_WORKLOG.BLJG
  is '������';
comment on column EAM2.STOCK_WORKLOG.BZ
  is '��ע';
comment on column EAM2.STOCK_WORKLOG.SFBC
  is '�Ƿ񱣴�';
alter table EAM2.STOCK_WORKLOG
  add constraint PK_STOCK_WORKLOG primary key (LOGID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table STUDENT
prompt ======================
prompt
create table EAM2.STUDENT
(
  ID      NUMBER not null,
  NAME    VARCHAR2(50),
  AGE     NUMBER(6),
  ADDRESS VARCHAR2(50)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ST_FSXX
prompt ======================
prompt
create table EAM2.ST_FSXX
(
  ID         VARCHAR2(32) not null,
  LEIXING    VARCHAR2(10),
  STID       VARCHAR2(32),
  AWJGZBH    VARCHAR2(300),
  ACFDD      VARCHAR2(1000),
  ABGJG      VARCHAR2(300),
  AZYLXR     VARCHAR2(300),
  ALXFS      VARCHAR2(300),
  ACFNR      VARCHAR2(300),
  DBBBH      VARCHAR2(300),
  DC_BBFL    VARCHAR2(32),
  DC_BBLX    VARCHAR2(32),
  DHYLX      VARCHAR2(1000),
  DBBRQ      VARCHAR2(300),
  DBBSCRQ    VARCHAR2(300),
  EGDBH      VARCHAR2(300),
  EGDXZ      VARCHAR2(300),
  EGDMC      VARCHAR2(300),
  ECGSL      VARCHAR2(300),
  ECGBL      VARCHAR2(300),
  EBGRQ      DATE,
  EBBSFKG    VARCHAR2(10),
  FSFFR      INTEGER,
  FRYBH      VARCHAR2(32),
  FBYSJ      VARCHAR2(200),
  FGYSM      VARCHAR2(200),
  FZYZGQK    VARCHAR2(2000),
  FXINGMING  VARCHAR2(300),
  FXINGBIE   VARCHAR2(10),
  FNIANLING  NUMBER(4),
  FSFZH      VARCHAR2(32),
  FC_HYZK    VARCHAR2(10),
  FMINZU     VARCHAR2(300),
  FJIGUAN    VARCHAR2(300),
  FCSNY      DATE,
  FC_ZHIWU   VARCHAR2(32),
  FBYXX      VARCHAR2(300),
  FZHUANYE   VARCHAR2(300),
  FC_XUELI   VARCHAR2(32),
  FSHOUJI    VARCHAR2(30),
  FJTZZ      VARCHAR2(400),
  FYZBM      VARCHAR2(300),
  FDIANHUA   VARCHAR2(300),
  FDZYX      VARCHAR2(300),
  FRZSJ      DATE,
  FLZSJ      DATE,
  FSHOURU    NUMBER(20,4),
  FGZFFDW    VARCHAR2(300),
  FC_RYLX    VARCHAR2(32),
  FDACFDW    VARCHAR2(300),
  FYDDH      VARCHAR2(300),
  FGDDH      VARCHAR2(300),
  FC_RYLB    VARCHAR2(32),
  FAZFS      VARCHAR2(1000),
  FAZFY      VARCHAR2(300),
  FAZZT      VARCHAR2(10),
  FSFYAZXY   VARCHAR2(10),
  FSFYST     VARCHAR2(10),
  GDSJBH     VARCHAR2(32),
  GDSFSRQ    DATE,
  GC_SJLX    VARCHAR2(32),
  GDSNR      VARCHAR2(2000),
  GDSJBZ     VARCHAR2(1000),
  HXJBH      VARCHAR2(300),
  HZHANGHU   VARCHAR2(300),
  HZHMC      VARCHAR2(300),
  HJINE      NUMBER(20,4),
  JTDBH      VARCHAR2(300),
  JTDMC      VARCHAR2(300),
  JTDQDFS    VARCHAR2(1000),
  JSJZYR     VARCHAR2(300),
  JTDSYQZ    VARCHAR2(10),
  JXLBMYY    VARCHAR2(1000),
  JTDSFDY    VARCHAR2(10),
  JTDDYQKJS  VARCHAR2(1000),
  JTDMJ      NUMBER(20,4),
  JTDSYQR    VARCHAR2(300),
  JTDPGZ     NUMBER(20,4),
  JBXE       NUMBER(20,4),
  JTDMS      VARCHAR2(1000),
  JTDZT      VARCHAR2(10),
  JC_CZFS    VARCHAR2(32),
  KFWBH      VARCHAR2(300),
  KFWMC      VARCHAR2(300),
  KFWDZ      VARCHAR2(300),
  KFWSYQR    VARCHAR2(300),
  KFWQDFS    VARCHAR2(1000),
  KFWSJZYR   VARCHAR2(300),
  KYWFWSYQZ  VARCHAR2(10),
  KXLBMYY    VARCHAR2(1000),
  KSFDY      VARCHAR2(10),
  KDYQK      VARCHAR2(1000),
  KFWMJ      NUMBER(20,4),
  KSYQR      VARCHAR2(300),
  KFWPGZ     NUMBER(20,4),
  KFWBXE     NUMBER(20,4),
  KFWMS      VARCHAR2(1000),
  KFWZT      VARCHAR2(10),
  KC_CZFS    VARCHAR2(32),
  LJTGJBH    VARCHAR2(300),
  LCPH       VARCHAR2(300),
  LJTGJCFWZ  VARCHAR2(1000),
  LQS        VARCHAR2(1000),
  LSJZYR     VARCHAR2(300),
  LSFDY      VARCHAR2(10),
  LDYJS      VARCHAR2(300),
  LPGZ       NUMBER(20,4),
  LBXE       NUMBER(20,4),
  LJTGJMS    VARCHAR2(1000),
  LJTGJZT    VARCHAR2(10),
  LC_CZFS    VARCHAR2(32),
  MSBBH      VARCHAR2(300),
  MSBMC      VARCHAR2(300),
  MSBCFWZ    VARCHAR2(1000),
  MSBQS      VARCHAR2(1000),
  MSBSJZYR   VARCHAR2(300),
  MSBSFDY    VARCHAR2(10),
  MSBDYJS    VARCHAR2(300),
  MSBPGZ     NUMBER(20,4),
  MSBBXE     NUMBER(20,4),
  MSBMS      VARCHAR2(1000),
  MSBZT      VARCHAR2(10),
  MC_CZFS    VARCHAR2(32),
  NDWTZBH    VARCHAR2(300),
  NBTQYMC    VARCHAR2(300),
  NTZE       NUMBER(20,4),
  NTZFS      VARCHAR2(300),
  NTZQKMS    VARCHAR2(1000),
  PQTZCBH    VARCHAR2(300),
  PQTZCMC    VARCHAR2(300),
  PQTZCCFWZ  VARCHAR2(1000),
  PQTZCQS    VARCHAR2(1000),
  PQTZCSJZYR VARCHAR2(300),
  PQTZCSFDY  VARCHAR2(10),
  PDYJS      VARCHAR2(300),
  PPGZ       NUMBER(20,4),
  PBXE       NUMBER(20,4),
  PZCMS      VARCHAR2(1000),
  PZCZT      VARCHAR2(10),
  PC_CZFS    VARCHAR2(32),
  QGDMC      VARCHAR2(300),
  QKGBL      VARCHAR2(300),
  QZCZB      VARCHAR2(300),
  QC_CZFS    VARCHAR2(32),
  QC_CZQK    VARCHAR2(32),
  QCZBSSE    NUMBER(20,4),
  QC_CTCZ    VARCHAR2(32),
  QCTSE      NUMBER(20,4),
  QDLFRZG    VARCHAR2(10),
  STNZCFL    VARCHAR2(10),
  SFBC       VARCHAR2(10),
  CWDID      VARCHAR2(32),
  CDKZH      VARCHAR2(300),
  RYLRSJ     DATE,
  RYAZSJ     DATE,
  BEIZHU     VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ST_FSXX.ID
  is 'ʵ�帽����ID,UUID';
comment on column EAM2.ST_FSXX.LEIXING
  is 'ʵ����Ա����Ȩ�����¼ǡ����񱨱�ʵ�����ʲ����ļ������´�����';
comment on column EAM2.ST_FSXX.STID
  is 'ʵ�������ϢID';
comment on column EAM2.ST_FSXX.AWJGZBH
  is '�ļ����±��';
comment on column EAM2.ST_FSXX.ACFDD
  is '��ŵص�';
comment on column EAM2.ST_FSXX.ABGJG
  is '���ܻ���';
comment on column EAM2.ST_FSXX.AZYLXR
  is '��Ҫ��ϵ��';
comment on column EAM2.ST_FSXX.ALXFS
  is '��ϵ��ʽ';
comment on column EAM2.ST_FSXX.ACFNR
  is '�������';
comment on column EAM2.ST_FSXX.DBBBH
  is '������';
comment on column EAM2.ST_FSXX.DC_BBFL
  is '������������ֵ��';
comment on column EAM2.ST_FSXX.DC_BBLX
  is '��������';
comment on column EAM2.ST_FSXX.DHYLX
  is '��ҵ����';
comment on column EAM2.ST_FSXX.DBBRQ
  is '��������';
comment on column EAM2.ST_FSXX.DBBSCRQ
  is '�����ϴ�����';
comment on column EAM2.ST_FSXX.EGDBH
  is '�ɶ����';
comment on column EAM2.ST_FSXX.EGDXZ
  is '�ɶ�����';
comment on column EAM2.ST_FSXX.EGDMC
  is '�ɶ�����';
comment on column EAM2.ST_FSXX.ECGSL
  is '�ֹ�����';
comment on column EAM2.ST_FSXX.ECGBL
  is '�ֹɱ���';
comment on column EAM2.ST_FSXX.EBGRQ
  is '��������';
comment on column EAM2.ST_FSXX.EBBSFKG
  is '�����Ƿ�ع�0����1����2��δ֪';
comment on column EAM2.ST_FSXX.FSFFR
  is '�Ƿ��˴���1��0��';
comment on column EAM2.ST_FSXX.FRYBH
  is '��Ա���';
comment on column EAM2.ST_FSXX.FBYSJ
  is '��ҵʱ��';
comment on column EAM2.ST_FSXX.FGYSM
  is '��Ӷ˵��';
comment on column EAM2.ST_FSXX.FZYZGQK
  is 'ִҵ�ʸ����';
comment on column EAM2.ST_FSXX.FXINGMING
  is '����';
comment on column EAM2.ST_FSXX.FXINGBIE
  is '�Ա�1����2��Ů';
comment on column EAM2.ST_FSXX.FNIANLING
  is '����';
comment on column EAM2.ST_FSXX.FSFZH
  is '���֤��';
comment on column EAM2.ST_FSXX.FC_HYZK
  is '����״��1���ѻ�2��δ��';
comment on column EAM2.ST_FSXX.FMINZU
  is '����';
comment on column EAM2.ST_FSXX.FJIGUAN
  is '����';
comment on column EAM2.ST_FSXX.FCSNY
  is '��������';
comment on column EAM2.ST_FSXX.FC_ZHIWU
  is 'ְ��';
comment on column EAM2.ST_FSXX.FBYXX
  is '��ҵѧУ';
comment on column EAM2.ST_FSXX.FZHUANYE
  is 'רҵ';
comment on column EAM2.ST_FSXX.FC_XUELI
  is 'ѧ��';
comment on column EAM2.ST_FSXX.FSHOUJI
  is '�ֻ�';
comment on column EAM2.ST_FSXX.FJTZZ
  is '��ͥסַ';
comment on column EAM2.ST_FSXX.FYZBM
  is '��������';
comment on column EAM2.ST_FSXX.FDIANHUA
  is '��λ�绰';
comment on column EAM2.ST_FSXX.FDZYX
  is '��������';
comment on column EAM2.ST_FSXX.FRZSJ
  is '��ְʱ��';
comment on column EAM2.ST_FSXX.FLZSJ
  is '��ְʱ��';
comment on column EAM2.ST_FSXX.FSHOURU
  is '����';
comment on column EAM2.ST_FSXX.FGZFFDW
  is '���ʷ��ŵ�λ';
comment on column EAM2.ST_FSXX.FC_RYLX
  is '��Ա���������ֵ��';
comment on column EAM2.ST_FSXX.FDACFDW
  is '������ŵ�λ';
comment on column EAM2.ST_FSXX.FYDDH
  is '�ƶ��绰';
comment on column EAM2.ST_FSXX.FGDDH
  is '�̶��绰';
comment on column EAM2.ST_FSXX.FC_RYLB
  is '��Ա���ʵ�������ֵ��';
comment on column EAM2.ST_FSXX.FAZFS
  is '���÷�ʽ';
comment on column EAM2.ST_FSXX.FAZFY
  is '���÷���';
comment on column EAM2.ST_FSXX.FAZZT
  is '����״̬ 0��δ����1������������2������ִ���� 3:�Ѱ���
';
comment on column EAM2.ST_FSXX.FSFYAZXY
  is '�Ƿ��а���Э��0����1����';
comment on column EAM2.ST_FSXX.FSFYST
  is '�Ƿ�������0����1����';
comment on column EAM2.ST_FSXX.GDSJBH
  is '���¼Ǳ��';
comment on column EAM2.ST_FSXX.GDSFSRQ
  is '���·�������';
comment on column EAM2.ST_FSXX.GC_SJLX
  is '�¼����������ֵ��';
comment on column EAM2.ST_FSXX.GDSNR
  is '��������';
comment on column EAM2.ST_FSXX.GDSJBZ
  is '���¼���ע';
comment on column EAM2.ST_FSXX.HXJBH
  is '�ֽ���';
comment on column EAM2.ST_FSXX.HZHANGHU
  is '�˻�';
comment on column EAM2.ST_FSXX.HZHMC
  is '�˻�����';
comment on column EAM2.ST_FSXX.HJINE
  is '���';
comment on column EAM2.ST_FSXX.JTDBH
  is '���ر��';
comment on column EAM2.ST_FSXX.JTDMC
  is '��������';
comment on column EAM2.ST_FSXX.JTDQDFS
  is '����ȡ�÷�ʽ';
comment on column EAM2.ST_FSXX.JSJZYR
  is 'ʵ��ռ����';
comment on column EAM2.ST_FSXX.JTDSYQZ
  is '����ʹ��Ȩ֤1����2����3�����䲻��';
comment on column EAM2.ST_FSXX.JXLBMYY
  is '������ʹ��Ȩ֤��û�м����䲻����ԭ��';
comment on column EAM2.ST_FSXX.JTDSFDY
  is '�����Ƿ��Ѻ0����1����
';
comment on column EAM2.ST_FSXX.JTDDYQKJS
  is '���ص�Ѻ�������';
comment on column EAM2.ST_FSXX.JTDMJ
  is '�������';
comment on column EAM2.ST_FSXX.JTDSYQR
  is '����ʹ��Ȩ��';
comment on column EAM2.ST_FSXX.JTDPGZ
  is '��������ֵ��Ԫ��';
comment on column EAM2.ST_FSXX.JBXE
  is '���ֶԪ��';
comment on column EAM2.ST_FSXX.JTDMS
  is '��������';
comment on column EAM2.ST_FSXX.JTDZT
  is '����״̬0��δ����1��������2���Ѵ���';
comment on column EAM2.ST_FSXX.JC_CZFS
  is '���ش��÷�ʽ�����ֵ��';
comment on column EAM2.ST_FSXX.KFWBH
  is '���ݱ��';
comment on column EAM2.ST_FSXX.KFWMC
  is '��������';
comment on column EAM2.ST_FSXX.KFWDZ
  is '���ݵ�ַ';
comment on column EAM2.ST_FSXX.KFWSYQR
  is '��������Ȩ��';
comment on column EAM2.ST_FSXX.KFWQDFS
  is '����ȡ�÷�ʽ';
comment on column EAM2.ST_FSXX.KFWSJZYR
  is '����ʵ��ռ����';
comment on column EAM2.ST_FSXX.KYWFWSYQZ
  is '���޷���ʹ��Ȩ֤';
comment on column EAM2.ST_FSXX.KXLBMYY
  is '����ʹ��Ȩ֤��û�м����䲻����ԭ��';
comment on column EAM2.ST_FSXX.KSFDY
  is '�����Ƿ��Ѻ';
comment on column EAM2.ST_FSXX.KDYQK
  is '���ݵ�Ѻ�������';
comment on column EAM2.ST_FSXX.KFWMJ
  is '���������ƽ���ף�';
comment on column EAM2.ST_FSXX.KSYQR
  is '����ʹ��Ȩ��';
comment on column EAM2.ST_FSXX.KFWPGZ
  is '��������ֵ��Ԫ��';
comment on column EAM2.ST_FSXX.KFWBXE
  is '���ݱ��ֶԪ��';
comment on column EAM2.ST_FSXX.KFWMS
  is '��������';
comment on column EAM2.ST_FSXX.KFWZT
  is '����״̬
�ʲ�״̬';
comment on column EAM2.ST_FSXX.KC_CZFS
  is '���ݴ��÷�ʽ
���ݴ��÷�ʽ';
comment on column EAM2.ST_FSXX.LJTGJBH
  is '��ͨ���߱��';
comment on column EAM2.ST_FSXX.LCPH
  is '��ͨ�������ƣ����ƺţ�';
comment on column EAM2.ST_FSXX.LJTGJCFWZ
  is '��ͨ���ߴ�źδ�';
comment on column EAM2.ST_FSXX.LQS
  is '��ͨ����Ȩ��';
comment on column EAM2.ST_FSXX.LSJZYR
  is '��ͨ����ʵ��ռ����';
comment on column EAM2.ST_FSXX.LSFDY
  is '��ͨ�����Ƿ��Ѻ';
comment on column EAM2.ST_FSXX.LDYJS
  is '��ͨ���ߵ�Ѻ�������';
comment on column EAM2.ST_FSXX.LPGZ
  is '��ͨ��������ֵ��Ԫ��';
comment on column EAM2.ST_FSXX.LBXE
  is '��ͨ���߱��ֶԪ��';
comment on column EAM2.ST_FSXX.LJTGJMS
  is '��ͨ���乤������';
comment on column EAM2.ST_FSXX.LJTGJZT
  is '��ͨ�����ʲ�״̬';
comment on column EAM2.ST_FSXX.LC_CZFS
  is '��ͨ���ߴ��÷�ʽ';
comment on column EAM2.ST_FSXX.MSBBH
  is '�����豸���';
comment on column EAM2.ST_FSXX.MSBMC
  is '�����豸����';
comment on column EAM2.ST_FSXX.MSBCFWZ
  is '�����豸���λ��';
comment on column EAM2.ST_FSXX.MSBQS
  is '�����豸Ȩ��';
comment on column EAM2.ST_FSXX.MSBSJZYR
  is '�����豸ʵ��ռ����';
comment on column EAM2.ST_FSXX.MSBSFDY
  is '�����豸�Ƿ��Ѻ';
comment on column EAM2.ST_FSXX.MSBDYJS
  is '�����豸��Ѻ�������';
comment on column EAM2.ST_FSXX.MSBPGZ
  is '�����豸����ֵ��Ԫ��';
comment on column EAM2.ST_FSXX.MSBBXE
  is '�����豸���ֶԪ��';
comment on column EAM2.ST_FSXX.MSBMS
  is '�����豸����';
comment on column EAM2.ST_FSXX.MSBZT
  is '�����豸״̬';
comment on column EAM2.ST_FSXX.MC_CZFS
  is '�����豸���÷�ʽ';
comment on column EAM2.ST_FSXX.NDWTZBH
  is '����Ͷ�ʱ��';
comment on column EAM2.ST_FSXX.NBTQYMC
  is '��Ͷ����ҵ����';
comment on column EAM2.ST_FSXX.NTZE
  is 'Ͷ�ʶ�(Ԫ)';
comment on column EAM2.ST_FSXX.NTZFS
  is 'Ͷ�ʷ�ʽ';
comment on column EAM2.ST_FSXX.NTZQKMS
  is 'Ͷ���������';
comment on column EAM2.ST_FSXX.PQTZCBH
  is '�����ʲ����';
comment on column EAM2.ST_FSXX.PQTZCMC
  is '�����ʲ�����';
comment on column EAM2.ST_FSXX.PQTZCCFWZ
  is '�����ʲ����λ��';
comment on column EAM2.ST_FSXX.PQTZCQS
  is '�����ʲ�Ȩ��';
comment on column EAM2.ST_FSXX.PQTZCSJZYR
  is '�����ʲ�ʵ��ռ����';
comment on column EAM2.ST_FSXX.PQTZCSFDY
  is '�����ʲ��Ƿ��Ѻ';
comment on column EAM2.ST_FSXX.PDYJS
  is '�����ʲ���Ѻ�������';
comment on column EAM2.ST_FSXX.PPGZ
  is '�����ʲ�����ֵ��Ԫ��';
comment on column EAM2.ST_FSXX.PBXE
  is '�����ʲ����ֶԪ��';
comment on column EAM2.ST_FSXX.PZCMS
  is '�����ʲ�����';
comment on column EAM2.ST_FSXX.PZCZT
  is '�����ʲ�״̬';
comment on column EAM2.ST_FSXX.PC_CZFS
  is '�����ʲ����÷�ʽ';
comment on column EAM2.ST_FSXX.QGDMC
  is '����ѯ�ɶ�����';
comment on column EAM2.ST_FSXX.QKGBL
  is '�عɱ���';
comment on column EAM2.ST_FSXX.QZCZB
  is 'ע���ʱ�';
comment on column EAM2.ST_FSXX.QC_CZFS
  is '���ʷ�ʽ';
comment on column EAM2.ST_FSXX.QC_CZQK
  is '�������';
comment on column EAM2.ST_FSXX.QCZBSSE
  is '���ʲ�ʵ������';
comment on column EAM2.ST_FSXX.QC_CTCZ
  is '���ӳ���';
comment on column EAM2.ST_FSXX.QCTSE
  is '��������';
comment on column EAM2.ST_FSXX.QDLFRZG
  is '���������ʸ�';
comment on column EAM2.ST_FSXX.STNZCFL
  is 'ʵ�����ʲ�������룬�������ֵ�';
comment on column EAM2.ST_FSXX.SFBC
  is '�Ƿ񱣴�';
comment on column EAM2.ST_FSXX.CWDID
  is 'ί�д���ID';
comment on column EAM2.ST_FSXX.CDKZH
  is '�����˺�';
comment on column EAM2.ST_FSXX.RYLRSJ
  is '��Ա��Ϣ¼��ʱ��';
comment on column EAM2.ST_FSXX.RYAZSJ
  is '��Ա����ʱ��';
comment on column EAM2.ST_FSXX.BEIZHU
  is '��ע';

prompt
prompt Creating table ST_GLBT
prompt ======================
prompt
create table EAM2.ST_GLBT
(
  ID        VARCHAR2(32) not null,
  CLD_ID    VARCHAR2(32),
  ST_ID     VARCHAR2(32),
  GZGW      VARCHAR2(300),
  C_XUELI   VARCHAR2(32),
  ZZYQ      VARCHAR2(1000),
  C_XINGBIE VARCHAR2(32),
  GONGLING  VARCHAR2(1000),
  RENSHU    NUMBER,
  QTXX      VARCHAR2(1000),
  C_SQSXLX  VARCHAR2(32),
  SQJE      NUMBER(20,4),
  SQSM      VARCHAR2(1000),
  SDJE      NUMBER(20,4),
  SQXMMC    VARCHAR2(300),
  FRBH      VARCHAR2(300),
  SFFRDB    INTEGER,
  XINGMING  VARCHAR2(300),
  NIANLING  NUMBER(4),
  SFZH      VARCHAR2(32),
  C_HYZK    VARCHAR2(10),
  MINZU     VARCHAR2(300),
  JIGUAN    VARCHAR2(300),
  CSNY      DATE,
  C_ZHIWU   VARCHAR2(32),
  BYXX      VARCHAR2(300),
  BYSJ      VARCHAR2(300),
  ZHUANYE   VARCHAR2(300),
  SHOUJI    VARCHAR2(30),
  JTZZ      VARCHAR2(400),
  YZBM      VARCHAR2(30),
  DIANHUA   VARCHAR2(30),
  DZYX      VARCHAR2(30),
  XINZI     VARCHAR2(300),
  GYQX      VARCHAR2(300),
  SHOURU    NUMBER(20,4),
  GZFFDW    VARCHAR2(300),
  RYLX      VARCHAR2(30),
  DACFDW    VARCHAR2(300),
  GYSM      VARCHAR2(1000),
  TZFS      VARCHAR2(32),
  TZJE      NUMBER(20,2),
  CZFS      VARCHAR2(32),
  CZJE      NUMBER(20,2),
  FYZL      VARCHAR2(32),
  FYMC      VARCHAR2(300),
  BXFY      NUMBER(20,4),
  SJFY      NUMBER(20,4),
  SPZT      VARCHAR2(10),
  FZYZGQK   VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ST_GLBT.ID
  is 'ID';
comment on column EAM2.ST_GLBT.CLD_ID
  is '����ID';
comment on column EAM2.ST_GLBT.ST_ID
  is 'ʵ��ID';
comment on column EAM2.ST_GLBT.GZGW
  is '������λ';
comment on column EAM2.ST_GLBT.C_XUELI
  is 'ѧ��';
comment on column EAM2.ST_GLBT.ZZYQ
  is '����Ҫ��';
comment on column EAM2.ST_GLBT.C_XINGBIE
  is '�Ա�';
comment on column EAM2.ST_GLBT.GONGLING
  is '����';
comment on column EAM2.ST_GLBT.RENSHU
  is '����';
comment on column EAM2.ST_GLBT.QTXX
  is '������Ϣ';
comment on column EAM2.ST_GLBT.C_SQSXLX
  is '������������';
comment on column EAM2.ST_GLBT.SQJE
  is '������';
comment on column EAM2.ST_GLBT.SQSM
  is '����˵��';
comment on column EAM2.ST_GLBT.SDJE
  is '�󶨽��';
comment on column EAM2.ST_GLBT.SQXMMC
  is '������Ŀ����';
comment on column EAM2.ST_GLBT.FRBH
  is '���˱��';
comment on column EAM2.ST_GLBT.SFFRDB
  is '�Ƿ��˴���1��0��';
comment on column EAM2.ST_GLBT.XINGMING
  is '���˴�������';
comment on column EAM2.ST_GLBT.NIANLING
  is '����';
comment on column EAM2.ST_GLBT.SFZH
  is '���֤��';
comment on column EAM2.ST_GLBT.C_HYZK
  is '����״��1���ѻ�2��δ��';
comment on column EAM2.ST_GLBT.MINZU
  is '����';
comment on column EAM2.ST_GLBT.JIGUAN
  is '����';
comment on column EAM2.ST_GLBT.CSNY
  is '��������';
comment on column EAM2.ST_GLBT.C_ZHIWU
  is 'ְ��';
comment on column EAM2.ST_GLBT.BYXX
  is '��ҵѧУ';
comment on column EAM2.ST_GLBT.BYSJ
  is '��ҵʱ��';
comment on column EAM2.ST_GLBT.ZHUANYE
  is 'רҵ';
comment on column EAM2.ST_GLBT.SHOUJI
  is '�ֻ�';
comment on column EAM2.ST_GLBT.JTZZ
  is '��ͥסַ';
comment on column EAM2.ST_GLBT.YZBM
  is '��������';
comment on column EAM2.ST_GLBT.DIANHUA
  is '��λ�绰';
comment on column EAM2.ST_GLBT.DZYX
  is '��������';
comment on column EAM2.ST_GLBT.XINZI
  is 'н��';
comment on column EAM2.ST_GLBT.GYQX
  is '��Ӷ����';
comment on column EAM2.ST_GLBT.SHOURU
  is '����';
comment on column EAM2.ST_GLBT.GZFFDW
  is '���ʷ��ŵ�λ';
comment on column EAM2.ST_GLBT.RYLX
  is '��Ա����';
comment on column EAM2.ST_GLBT.DACFDW
  is '������ŵ�λ';
comment on column EAM2.ST_GLBT.GYSM
  is '��Ӷ˵��';
comment on column EAM2.ST_GLBT.TZFS
  is 'Ͷ�ʷ�ʽ';
comment on column EAM2.ST_GLBT.TZJE
  is 'Ͷ�ʽ��';
comment on column EAM2.ST_GLBT.CZFS
  is '���ʷ�ʽ';
comment on column EAM2.ST_GLBT.CZJE
  is '���ʽ��';
comment on column EAM2.ST_GLBT.FYZL
  is '��������';
comment on column EAM2.ST_GLBT.FYMC
  is '��������';
comment on column EAM2.ST_GLBT.BXFY
  is '��������';
comment on column EAM2.ST_GLBT.SJFY
  is 'ʵ�ʷ���';
comment on column EAM2.ST_GLBT.SPZT
  is '����״̬0δ�ύ1������2����ͨ��3������ͨ��';
comment on column EAM2.ST_GLBT.FZYZGQK
  is 'ִҵ�ʸ����';
alter table EAM2.ST_GLBT
  add constraint PK_ST_GLBT primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ST_HEAD
prompt ======================
prompt
create table EAM2.ST_HEAD
(
  ID        VARCHAR2(32) not null,
  LC_ID     VARCHAR2(32),
  BIAOTI    VARCHAR2(300),
  CHENGSONG VARCHAR2(300),
  BIANHAO   VARCHAR2(300),
  JHCD      VARCHAR2(10),
  NGR       VARCHAR2(32),
  NGRXM     VARCHAR2(300),
  LXDH      VARCHAR2(300),
  NGRQ      DATE,
  NGBM      VARCHAR2(32),
  NGBMMC    VARCHAR2(300),
  YWLX      VARCHAR2(10),
  HQBM      VARCHAR2(300),
  BZ        VARCHAR2(1000),
  LCMC      VARCHAR2(50),
  JHXZRS    NUMBER,
  SPZT      VARCHAR2(10),
  SFSJFY    VARCHAR2(10),
  ST_ID     VARCHAR2(32),
  ZCBH      VARCHAR2(300),
  STZWMC    VARCHAR2(300),
  DIQU      VARCHAR2(300),
  GQGC      VARCHAR2(2000),
  ZZQK      VARCHAR2(2000),
  BGDZ      VARCHAR2(300),
  STRS      INTEGER,
  ZMTZ      VARCHAR2(300),
  C_WTGLJG  VARCHAR2(32),
  C_GLBM    VARCHAR2(32),
  CZYGSNSQK VARCHAR2(300),
  ZYYW      VARCHAR2(1000),
  ZZC       NUMBER(20,4),
  FUZHAI    NUMBER(20,4),
  GUBEN     VARCHAR2(300),
  JZC       NUMBER(20,4),
  STSR      NUMBER(20,4),
  JLR       NUMBER(20,4),
  ZIXUNTYPE VARCHAR2(10),
  SQJEHJ    NUMBER(20,4),
  SDJEHJ    NUMBER(20,4),
  HQBMID    VARCHAR2(300),
  SYHQBMID  VARCHAR2(300),
  SYHQBM    VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.ST_HEAD
  is 'ʵ��

ʵ�����ʣ����ʣ����봦��

ʵ���ù��ƻ�����

ʵ�巨�˴���������

�ش���������

ȷȨ��������

ʵ������ͷ
';
comment on column EAM2.ST_HEAD.ID
  is 'ʵ���ͷID,UUID';
comment on column EAM2.ST_HEAD.LC_ID
  is '����ID';
comment on column EAM2.ST_HEAD.BIAOTI
  is '����';
comment on column EAM2.ST_HEAD.CHENGSONG
  is '����';
comment on column EAM2.ST_HEAD.BIANHAO
  is '�����';
comment on column EAM2.ST_HEAD.JHCD
  is '�����̶�';
comment on column EAM2.ST_HEAD.NGR
  is '����˱��';
comment on column EAM2.ST_HEAD.NGRXM
  is '���������';
comment on column EAM2.ST_HEAD.LXDH
  is '��ϵ�绰';
comment on column EAM2.ST_HEAD.NGRQ
  is '�������';
comment on column EAM2.ST_HEAD.NGBM
  is '��岿�ű��';
comment on column EAM2.ST_HEAD.NGBMMC
  is '��岿������';
comment on column EAM2.ST_HEAD.YWLX
  is 'ҵ������0������1������';
comment on column EAM2.ST_HEAD.HQBM
  is '��ǩ����';
comment on column EAM2.ST_HEAD.BZ
  is '��ע';
comment on column EAM2.ST_HEAD.LCMC
  is '��������0�����ʼ��� 1���ù��ƻ� 2�����˴����� 3���ش������������ 4��ȷȨ���� 5��������������';
comment on column EAM2.ST_HEAD.JHXZRS
  is '�ƻ���������';
comment on column EAM2.ST_HEAD.SPZT
  is '����״̬0��δ�ύ1��������2��������';
comment on column EAM2.ST_HEAD.SFSJFY
  is '�Ƿ��漰���� 0����  1����';
comment on column EAM2.ST_HEAD.ST_ID
  is 'ʵ��ID';
comment on column EAM2.ST_HEAD.ZCBH
  is '�ʲ����';
comment on column EAM2.ST_HEAD.STZWMC
  is 'ʵ����������';
comment on column EAM2.ST_HEAD.DIQU
  is '����';
comment on column EAM2.ST_HEAD.GQGC
  is '��Ȩ����';
comment on column EAM2.ST_HEAD.ZZQK
  is '�������';
comment on column EAM2.ST_HEAD.BGDZ
  is '�칫��ַ';
comment on column EAM2.ST_HEAD.STRS
  is 'ʵ����������';
comment on column EAM2.ST_HEAD.ZMTZ
  is '����Ͷ��(Ԫ)';
comment on column EAM2.ST_HEAD.C_WTGLJG
  is 'ί�й������';
comment on column EAM2.ST_HEAD.C_GLBM
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_HEAD.CZYGSNSQK
  is '�����빤���������';
comment on column EAM2.ST_HEAD.ZYYW
  is '��Ӫҵ��';
comment on column EAM2.ST_HEAD.ZZC
  is '���ʲ�';
comment on column EAM2.ST_HEAD.FUZHAI
  is '��ծ';
comment on column EAM2.ST_HEAD.GUBEN
  is '�ɱ�';
comment on column EAM2.ST_HEAD.JZC
  is '���ʲ�';
comment on column EAM2.ST_HEAD.STSR
  is 'ʵ������';
comment on column EAM2.ST_HEAD.JLR
  is '������';
comment on column EAM2.ST_HEAD.SQJEHJ
  is '������ϼ�';
comment on column EAM2.ST_HEAD.SDJEHJ
  is '�󶨽��ϼ�';
comment on column EAM2.ST_HEAD.HQBMID
  is '��ǩ����ID';
comment on column EAM2.ST_HEAD.SYHQBMID
  is '����ʵҵ��ǩ����ID';
comment on column EAM2.ST_HEAD.SYHQBM
  is '����ʵҵ��ǩ����';
alter table EAM2.ST_HEAD
  add constraint PK_ST_HEAD primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ST_JBXX
prompt ======================
prompt
create table EAM2.ST_JBXX
(
  ID         VARCHAR2(32) not null,
  STLX       VARCHAR2(10),
  ZCBH       VARCHAR2(300),
  STXZ       VARCHAR2(10),
  STZWMC     VARCHAR2(300),
  STYWMC     VARCHAR2(300),
  JYFL       VARCHAR2(10),
  C_HANGYE   VARCHAR2(100),
  C_STZT     VARCHAR2(32),
  C_SHENGFEN VARCHAR2(32),
  C_DIJISHI  VARCHAR2(32),
  C_GLBM     VARCHAR2(32),
  C_WTGLJG   VARCHAR2(32),
  FRDB       VARCHAR2(300),
  ZCDZ       VARCHAR2(300),
  MYCYR      VARCHAR2(300),
  ZJL        VARCHAR2(300),
  YEZXH      VARCHAR2(300),
  YEZZYXQ    VARCHAR2(300),
  SWDJBH     VARCHAR2(300),
  GPDM       VARCHAR2(300),
  YJHTZRQ    DATE,
  YTZGS      VARCHAR2(300),
  ZMTZ       VARCHAR2(300),
  SJTZ       VARCHAR2(300),
  LXR        VARCHAR2(300),
  CHUANZHEN  VARCHAR2(300),
  LXDH       VARCHAR2(300),
  ZYDZ       VARCHAR2(300),
  BGDZ       VARCHAR2(300),
  YZBM       VARCHAR2(300),
  DZYX       VARCHAR2(300),
  JJXZ       VARCHAR2(30),
  ZYYW       VARCHAR2(1000),
  JYYW       VARCHAR2(1000),
  CZYGSNSQK  VARCHAR2(300),
  STJJ       VARCHAR2(2000),
  CLSJ       DATE,
  STXZ2      VARCHAR2(30),
  SYRYS      NUMBER(8),
  YWLSYLWT   VARCHAR2(10),
  LSYLWTMS   VARCHAR2(1000),
  YUANZHI    NUMBER(20,4),
  JINGZHI    NUMBER(20,4),
  JZZB       NUMBER(20,4),
  DJTSFYFZ   VARCHAR2(10),
  FZJE       NUMBER(20,4),
  ZMNSFYYJFZ VARCHAR2(10),
  YJFZJE     NUMBER(20,4),
  ZMZCZE     NUMBER(20,4),
  ZMZCFZ     NUMBER(20,4),
  KHYH       VARCHAR2(2000),
  ZZQK       VARCHAR2(2000),
  BEIZHU     VARCHAR2(2000),
  XXZT       VARCHAR2(10),
  SJKZDW     VARCHAR2(300),
  MQJYZT     VARCHAR2(300),
  SFBC       VARCHAR2(10),
  ZCZJ       VARCHAR2(300),
  C_CZFS     VARCHAR2(32),
  C_ZCQS     VARCHAR2(32),
  WTRMC      VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ST_JBXX.ID
  is 'ʵ��ID,UUID';
comment on column EAM2.ST_JBXX.STLX
  is 'ʵ�����ͣ�0����ѯ��ʵ��   1������ѯ������ʵ��       2���ⲿʵ��   3������ѯ������Ӫ��ʵ��';
comment on column EAM2.ST_JBXX.ZCBH
  is '�ʲ����';
comment on column EAM2.ST_JBXX.STXZ
  is 'ʵ������0��������ʵ��1������ʵ��';
comment on column EAM2.ST_JBXX.STZWMC
  is 'ʵ����������';
comment on column EAM2.ST_JBXX.STYWMC
  is 'ʵ��Ӣ������';
comment on column EAM2.ST_JBXX.JYFL
  is '��Ӫ����0��������Ӫ��1��������';
comment on column EAM2.ST_JBXX.C_HANGYE
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.C_STZT
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.C_SHENGFEN
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.C_DIJISHI
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.C_GLBM
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.C_WTGLJG
  is 'ί�й������';
comment on column EAM2.ST_JBXX.FRDB
  is '���˴���';
comment on column EAM2.ST_JBXX.ZCDZ
  is 'ע���ַ';
comment on column EAM2.ST_JBXX.MYCYR
  is '���������';
comment on column EAM2.ST_JBXX.ZJL
  is '�ܾ���';
comment on column EAM2.ST_JBXX.YEZXH
  is 'Ӫҵִ�պ�';
comment on column EAM2.ST_JBXX.YEZZYXQ
  is 'Ӫҵִ����Ч��';
comment on column EAM2.ST_JBXX.SWDJBH
  is '˰��ǼǱ��';
comment on column EAM2.ST_JBXX.GPDM
  is '��Ʊ����';
comment on column EAM2.ST_JBXX.YJHTZRQ
  is 'ԭ����Ͷ������';
comment on column EAM2.ST_JBXX.YTZGS
  is 'ԭͶ�ʹ�˾';
comment on column EAM2.ST_JBXX.ZMTZ
  is '����Ͷ��(Ԫ)';
comment on column EAM2.ST_JBXX.SJTZ
  is 'ʵ��Ͷ��(Ԫ)';
comment on column EAM2.ST_JBXX.LXR
  is '��ϵ��';
comment on column EAM2.ST_JBXX.CHUANZHEN
  is '����';
comment on column EAM2.ST_JBXX.LXDH
  is '��ϵ�绰';
comment on column EAM2.ST_JBXX.ZYDZ
  is '��ҳ��ַ';
comment on column EAM2.ST_JBXX.BGDZ
  is '�칫��ַ';
comment on column EAM2.ST_JBXX.YZBM
  is '��������';
comment on column EAM2.ST_JBXX.DZYX
  is '��������';
comment on column EAM2.ST_JBXX.JJXZ
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.ZYYW
  is '��Ӫҵ��';
comment on column EAM2.ST_JBXX.JYYW
  is '��Ӫҵ��';
comment on column EAM2.ST_JBXX.CZYGSNSQK
  is '�����빤���������';
comment on column EAM2.ST_JBXX.STJJ
  is 'ʵ����';
comment on column EAM2.ST_JBXX.CLSJ
  is '����ʱ��';
comment on column EAM2.ST_JBXX.STXZ2
  is 'ʵ�������ֵ��';
comment on column EAM2.ST_JBXX.SYRYS
  is '������Ա��';
comment on column EAM2.ST_JBXX.YWLSYLWT
  is '������ʷ�������� 1����2����';
comment on column EAM2.ST_JBXX.LSYLWTMS
  is '��ʷ������������';
comment on column EAM2.ST_JBXX.YUANZHI
  is 'ԭֵ';
comment on column EAM2.ST_JBXX.JINGZHI
  is '��ֵ';
comment on column EAM2.ST_JBXX.JZZB
  is '��ֵ׼��';
comment on column EAM2.ST_JBXX.DJTSFYFZ
  is '�Խ�Ͷ�Ƿ��и�ծ1����2����';
comment on column EAM2.ST_JBXX.FZJE
  is '��ծ���';
comment on column EAM2.ST_JBXX.ZMNSFYYJFZ
  is '�������Ƿ���Ԥ�Ƹ�ծ1����2����';
comment on column EAM2.ST_JBXX.YJFZJE
  is 'Ԥ�Ƹ�ծ���';
comment on column EAM2.ST_JBXX.ZMZCZE
  is '�����ʲ��ܶ�';
comment on column EAM2.ST_JBXX.ZMZCFZ
  is '�����ʲ���ծ';
comment on column EAM2.ST_JBXX.KHYH
  is '��������';
comment on column EAM2.ST_JBXX.ZZQK
  is '�������';
comment on column EAM2.ST_JBXX.BEIZHU
  is '��ע';
comment on column EAM2.ST_JBXX.XXZT
  is '��Ϣ״̬0����ʱ����1���������';
comment on column EAM2.ST_JBXX.SJKZDW
  is 'ʵ�ʿ��Ƶ�λ';
comment on column EAM2.ST_JBXX.MQJYZT
  is 'Ŀǰ��Ӫ״̬';
comment on column EAM2.ST_JBXX.SFBC
  is '�Ƿ񱣴� 0��δ���� 1������';
comment on column EAM2.ST_JBXX.ZCZJ
  is 'ע���ʽ� �ⲿʵ��ʹ��';
comment on column EAM2.ST_JBXX.C_ZCQS
  is '�ʲ�Ȩ��';
comment on column EAM2.ST_JBXX.WTRMC
  is 'ί��������';
alter table EAM2.ST_JBXX
  add constraint PK_ST_JBXX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ST_SKJN_XX
prompt =========================
prompt
create table EAM2.ST_SKJN_XX
(
  ID        VARCHAR2(32) not null,
  ST_ID     VARCHAR2(32),
  SKMC      VARCHAR2(300),
  SFASJN    VARCHAR2(10),
  TQSKSE    NUMBER(20,4),
  TQSJ      VARCHAR2(300),
  SWJGSFKJM VARCHAR2(10),
  SFBC      VARCHAR2(10),
  BEIZHU    VARCHAR2(2000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ST_SKJN_XX.ID
  is 'ID';
comment on column EAM2.ST_SKJN_XX.ST_ID
  is 'ʵ��ID';
comment on column EAM2.ST_SKJN_XX.SKMC
  is '˰������';
comment on column EAM2.ST_SKJN_XX.SFASJN
  is '�Ƿ�ʱ����0����1����';
comment on column EAM2.ST_SKJN_XX.TQSKSE
  is '��Ƿ˰������';
comment on column EAM2.ST_SKJN_XX.TQSJ
  is '��Ƿʱ��';
comment on column EAM2.ST_SKJN_XX.SWJGSFKJM
  is '˰������Ƿ���Լ���0����1����';
comment on column EAM2.ST_SKJN_XX.SFBC
  is '���Ƿ񱣴�  0 ������ 1 ���棩
';
comment on column EAM2.ST_SKJN_XX.BEIZHU
  is '��ע';
alter table EAM2.ST_SKJN_XX
  add constraint PK_ST_SKJN_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TB_PROJECT
prompt =========================
prompt
create table EAM2.TB_PROJECT
(
  PROJECTID              NUMBER not null,
  PROJECTNAME            VARCHAR2(500),
  LOCATION               VARCHAR2(500),
  OWNER                  NUMBER,
  PROJECTTYPE            NUMBER,
  FORMERVALUE            NUMBER(20,6),
  NETVALUE               NUMBER(20,6),
  EVALUATEORG            VARCHAR2(500),
  EVALUATEVALUE          NUMBER(20,6),
  DISPOSALMODE           NUMBER,
  RETURNMONEY            NUMBER(20,6),
  DISPOSALMONEY          NUMBER(20,6),
  ACCOUNTSUBJECT         VARCHAR2(500),
  LOSSVALUE              NUMBER(20,6),
  LOSSRATE               VARCHAR2(500),
  XZFLZC_ID              NUMBER,
  WFCONFIG_CODE          VARCHAR2(500),
  PK_ASSTERSID           VARCHAR2(500),
  CARDCODE               VARCHAR2(500),
  WORKRESULT             NUMBER,
  RISKRESULT             NUMBER,
  PROVINCE               NUMBER,
  ASSET_MANG_DEPT        NUMBER,
  WORKRESON              VARCHAR2(4000),
  TYPENAME               VARCHAR2(500),
  USE_DEPT               NUMBER,
  HOLDER                 VARCHAR2(500),
  CUT_MELON              VARCHAR2(500),
  BELONG_FILE            VARCHAR2(500),
  TYPECODE               VARCHAR2(500),
  CONTRACT_TYPE          NUMBER,
  FIRST_PARTNER          VARCHAR2(4000),
  ISMARKET               VARCHAR2(4000),
  ENTITY_NAME            VARCHAR2(4000),
  BANK_NAME              VARCHAR2(4000),
  ENTITY_LOCATION        VARCHAR2(4000),
  MEMO                   VARCHAR2(4000),
  C1                     VARCHAR2(4000),
  C2                     VARCHAR2(4000),
  STOCK_PROP             NUMBER(20,6),
  CURRENCY_BASE_VALUE    NUMBER(20,6),
  NET_FIX                NUMBER(20,6),
  EVAL_NET_VALUE         NUMBER(20,6),
  CONS_AREA              NUMBER(20,6),
  LESSEE_BASE_VALUE      NUMBER(20,6),
  AREA                   NUMBER(20,6),
  MONTH_HIRE             NUMBER(20,6),
  YIELD                  NUMBER(20,6),
  ACCOUNT                VARCHAR2(500),
  ACCOUNT_BASE_VALUE     NUMBER(20,6),
  ACCOUNT_VALUE          NUMBER(20,6),
  INVEST_PROP            NUMBER(20,6),
  INVEST_RETURN_PROP     NUMBER(20,6),
  SHOULDPAY              NUMBER(20,6),
  FACTPAY                NUMBER(20,6),
  RETAINED_PROFITS       NUMBER(20,6),
  ASSET_INCOME_PROP      NUMBER(20,6),
  OLD_ACCOUNT_BASE_VALUE NUMBER(20,6),
  OLD_ACCOUNT_DEVALUE    NUMBER(20,6),
  OLD_NET_VALUE          NUMBER(20,6),
  EVAL_VALUE             NUMBER(20,6),
  STATE                  VARCHAR2(2),
  ISRISKCOGNIZANCE       VARCHAR2(2),
  ISMANAGECOGNIZANCE     VARCHAR2(2),
  DISPOSAL_NUMBER        NUMBER,
  DISPASSETMANAGEDEPT    VARCHAR2(500),
  DISPUSEDEPT            VARCHAR2(500),
  DISPROVINCE            VARCHAR2(500),
  PARTI_LOCATION         VARCHAR2(500),
  BAK_1                  VARCHAR2(4000),
  BAK_2                  VARCHAR2(4000),
  BAK_3                  VARCHAR2(4000),
  BAK_4                  NUMBER,
  BAK_5                  NUMBER,
  BAK_6                  NUMBER(20,6),
  BAK_7                  NUMBER(20,6),
  BAK_8                  VARCHAR2(4000),
  BAK_9                  VARCHAR2(4000),
  BAK_10                 VARCHAR2(4000),
  BAK_11                 NUMBER,
  BAK_12                 NUMBER,
  BAK_13                 NUMBER(20,6),
  BAK_14                 NUMBER(20,6)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.TB_PROJECT
  add constraint PK_PROJECT primary key (PROJECTID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table TEMP1
prompt ====================
prompt
create table EAM2.TEMP1
(
  C1 NUMBER,
  C2 NUMBER(20,2),
  C3 NUMBER(20,4),
  C4 VARCHAR2(200),
  C5 VARCHAR2(20)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table TMP_CARDTEMP
prompt ===========================
prompt
create table EAM2.TMP_CARDTEMP
(
  KPXZID   NUMBER,
  CARDCODE VARCHAR2(46),
  SL       NUMBER
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WD_LN_DPT_INFO
prompt =============================
prompt
create table EAM2.WD_LN_DPT_INFO
(
  ID     VARCHAR2(32) not null,
  DKJGBM CHAR(9),
  DKJGMC VARCHAR2(42),
  RYMC   VARCHAR2(40),
  LXFS   VARCHAR2(10),
  LXNR   VARCHAR2(1000),
  LRRQ   DATE,
  LRR    VARCHAR2(100),
  BZ     VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
  );
alter table EAM2.WD_LN_DPT_INFO
  add constraint PK_WD_LN_DPT_INFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
  );

prompt
prompt Creating table WD_LN_MORE_INFOR
prompt ===============================
prompt
create table EAM2.WD_LN_MORE_INFOR
(
  RISK_DATE            DATE,
  LN_ACCT_NO           VARCHAR2(30) not null,
  C_CUST_ID            VARCHAR2(30),
  C_ACCT_NO            VARCHAR2(30),
  MAG_DPT              VARCHAR2(128),
  C_CUST_NAME          VARCHAR2(300),
  ASSET_TYPE           VARCHAR2(100),
  D_ACCT_NO            VARCHAR2(40),
  SA_SYS_ACCT_NO       VARCHAR2(30),
  SAV_CUST_ACCT_NO     VARCHAR2(30),
  FUND_ACCOUNTS_TASTER VARCHAR2(100),
  RISK_REASON          VARCHAR2(1000),
  FUND_TYPE            VARCHAR2(10),
  LOST_RATE            VARCHAR2(10),
  LOST_JE              NUMBER(12,2),
  VERIFIED_DATE        DATE,
  VER_RISK_LEVE        VARCHAR2(100),
  VER_LOST_RATE        NUMBER(6,4),
  VER_LOST_JE          NUMBER(12,2),
  VER_PERSON           VARCHAR2(100),
  VER_LEVEL            VARCHAR2(40),
  MEMO_INFO            VARCHAR2(1000),
  XULIE                VARCHAR2(300) not null
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.WD_LN_MORE_INFOR
  is 'ί�д�����Ϣ';
comment on column EAM2.WD_LN_MORE_INFOR.RISK_DATE
  is '��������';
comment on column EAM2.WD_LN_MORE_INFOR.LN_ACCT_NO
  is '����ϵͳ�˻�';
comment on column EAM2.WD_LN_MORE_INFOR.C_CUST_ID
  is '����ͻ����';
comment on column EAM2.WD_LN_MORE_INFOR.C_ACCT_NO
  is '����ͻ��˻�';
comment on column EAM2.WD_LN_MORE_INFOR.MAG_DPT
  is '�ʲ�������';
comment on column EAM2.WD_LN_MORE_INFOR.C_CUST_NAME
  is '�������';
comment on column EAM2.WD_LN_MORE_INFOR.ASSET_TYPE
  is '�ʲ�����';
comment on column EAM2.WD_LN_MORE_INFOR.D_ACCT_NO
  is 'ί�з��ͻ����';
comment on column EAM2.WD_LN_MORE_INFOR.SA_SYS_ACCT_NO
  is '����ϵͳ�˻�';
comment on column EAM2.WD_LN_MORE_INFOR.SAV_CUST_ACCT_NO
  is '����ͻ��˻�';
comment on column EAM2.WD_LN_MORE_INFOR.FUND_ACCOUNTS_TASTER
  is '�����˻�������';
comment on column EAM2.WD_LN_MORE_INFOR.RISK_REASON
  is '����ԭ��';
comment on column EAM2.WD_LN_MORE_INFOR.FUND_TYPE
  is '������� ��:δ֪
1:�޻���2:�л���
3:������
';
comment on column EAM2.WD_LN_MORE_INFOR.LOST_RATE
  is 'Ԥ����ʧ��%';
comment on column EAM2.WD_LN_MORE_INFOR.LOST_JE
  is 'Ԥ����ʧ���';
comment on column EAM2.WD_LN_MORE_INFOR.VERIFIED_DATE
  is '�������';
comment on column EAM2.WD_LN_MORE_INFOR.VER_RISK_LEVE
  is '��˷��յȼ�';
comment on column EAM2.WD_LN_MORE_INFOR.VER_LOST_RATE
  is '���Ԥ����ʧ��%';
comment on column EAM2.WD_LN_MORE_INFOR.VER_LOST_JE
  is '���Ԥ����ʧ���';
comment on column EAM2.WD_LN_MORE_INFOR.VER_PERSON
  is '�����';
comment on column EAM2.WD_LN_MORE_INFOR.VER_LEVEL
  is '��˼���';
comment on column EAM2.WD_LN_MORE_INFOR.MEMO_INFO
  is '��ע';
comment on column EAM2.WD_LN_MORE_INFOR.XULIE
  is '����';
alter table EAM2.WD_LN_MORE_INFOR
  add constraint PK_WD_LN_MORE_INFOR primary key (LN_ACCT_NO, XULIE)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WTDK_END_INFO
prompt ============================
prompt
create table EAM2.WTDK_END_INFO
(
  ID           VARCHAR2(32) not null,
  HEAD_ID      VARCHAR2(32),
  FUND_ACCOUNT VARCHAR2(100),
  KHBH         VARCHAR2(100),
  KHMC         VARCHAR2(400),
  KYYE         NUMBER(20,2),
  ZHYE         NUMBER(20,2),
  DKZHYE       NUMBER(20,2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.WTDK_END_INFO.ID
  is 'ID,uuid';
comment on column EAM2.WTDK_END_INFO.HEAD_ID
  is '��ͷID';
comment on column EAM2.WTDK_END_INFO.FUND_ACCOUNT
  is '�����˻�';
comment on column EAM2.WTDK_END_INFO.KHBH
  is '�ͻ����';
comment on column EAM2.WTDK_END_INFO.KHMC
  is '�ͻ�����';
comment on column EAM2.WTDK_END_INFO.KYYE
  is '�������';
comment on column EAM2.WTDK_END_INFO.ZHYE
  is '�˻����';
comment on column EAM2.WTDK_END_INFO.DKZHYE
  is '�����˻����';
alter table EAM2.WTDK_END_INFO
  add constraint PK_WTDK_END_INFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WTDK_FUNC_BACK_INFO
prompt ==================================
prompt
create table EAM2.WTDK_FUNC_BACK_INFO
(
  ID       VARCHAR2(36) not null,
  SHEAD_ID VARCHAR2(36),
  HKDW     VARCHAR2(50),
  DKZH     VARCHAR2(50),
  HSKM     VARCHAR2(50),
  NCYE     NUMBER(16,2),
  BJHKRQ   DATE,
  BCHKJE   NUMBER(16,2),
  BNLJHKJE NUMBER(16,2),
  HKHBJYE  NUMBER(16,2),
  DYWTDW   VARCHAR2(50),
  NHFJE    NUMBER(16,2),
  SPJG     VARCHAR2(50),
  BZ       VARCHAR2(1000),
  SPJE     NUMBER(16,2),
  XTJJZH   VARCHAR2(300),
  JJKHMC   VARCHAR2(300),
  JJZHYE   NUMBER(20,2)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.WTDK_FUNC_BACK_INFO.XTJJZH
  is 'ϵͳ�����˺�';
comment on column EAM2.WTDK_FUNC_BACK_INFO.JJKHMC
  is '����ͻ�����';
comment on column EAM2.WTDK_FUNC_BACK_INFO.JJZHYE
  is '�����˻����';
alter table EAM2.WTDK_FUNC_BACK_INFO
  add constraint PK_WTDK_FUNC_BACK_INFO primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WTDK_GL_HEAD
prompt ===========================
prompt
create table EAM2.WTDK_GL_HEAD
(
  SHEAD_ID   VARCHAR2(36) not null,
  SHEET_ID   VARCHAR2(300),
  TITLE      VARCHAR2(300),
  SHEET_TYPE VARCHAR2(300),
  JHCD       VARCHAR2(10),
  NGRQ       DATE,
  CS         VARCHAR2(300),
  NGRBH      VARCHAR2(32),
  NGRMC      VARCHAR2(300),
  NGBMBH     VARCHAR2(32),
  NGBMMC     VARCHAR2(300),
  LXDH       VARCHAR2(100),
  BLSM       VARCHAR2(2000),
  FJBT       VARCHAR2(100),
  YWLX       VARCHAR2(300),
  BDZT       VARCHAR2(10),
  HQBM       VARCHAR2(300),
  HQBMID     VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.WTDK_GL_HEAD.SHEET_TYPE
  is '�������������ݣ�  1�������˻�����  2����ֹί�д����ϵ
';
comment on column EAM2.WTDK_GL_HEAD.HQBM
  is '��ǩ��������';
comment on column EAM2.WTDK_GL_HEAD.HQBMID
  is '��ǩ����ID';
alter table EAM2.WTDK_GL_HEAD
  add constraint PK_WTDK_GL_HEAD primary key (SHEAD_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZCYM_CODE
prompt ========================
prompt
create table EAM2.ZCYM_CODE
(
  ID           VARCHAR2(32) not null,
  CODE_TYPE    VARCHAR2(100),
  CODE_NAME    VARCHAR2(400),
  CODE_KEY     VARCHAR2(20),
  CODE_VALUE   VARCHAR2(1000),
  ORDER_NUMBER NUMBER(8),
  USABLE       CHAR(1),
  CODE_TAG     VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZC_PG_XX
prompt =======================
prompt
create table EAM2.ZC_PG_XX
(
  ID            VARCHAR2(32) not null,
  ZCID          VARCHAR2(32),
  JYGCZCBH      VARCHAR2(32),
  ZCMC          VARCHAR2(300),
  SFMC          VARCHAR2(300),
  ZCLB          VARCHAR2(10),
  ZCLBBM        VARCHAR2(10),
  ZKPBH         VARCHAR2(300),
  ZCZMJZ        NUMBER(20,4),
  DKZH          VARCHAR2(300),
  WDID          VARCHAR2(32),
  CZCMC         VARCHAR2(300),
  CSJZYR        VARCHAR2(300),
  CZCBH         VARCHAR2(300),
  CCFWZ         VARCHAR2(300),
  CZCLX         VARCHAR2(10),
  STID          VARCHAR2(32),
  STMC          VARCHAR2(300),
  STZCMC        VARCHAR2(300),
  STFSXXID      VARCHAR2(32),
  STZCBH        VARCHAR2(300),
  STTZCLX       VARCHAR2(10),
  STZCLB        VARCHAR2(300),
  STSJZYR       VARCHAR2(300),
  STCFWZ        VARCHAR2(300),
  PGJG          VARCHAR2(300),
  PINGGUZHI     NUMBER(20,4),
  C_JZLX        VARCHAR2(32),
  C_CZFS        VARCHAR2(32),
  PGFF          VARCHAR2(32),
  PGJZR         DATE,
  BEIZHU        VARCHAR2(1000),
  PGMD          VARCHAR2(1000),
  JZRZMJZ       NUMBER(20,4),
  PGZCLB        VARCHAR2(10),
  ZJZ           NUMBER(20,4),
  ZJFD          NUMBER(20,4),
  JINGZHI       NUMBER(20,4),
  ZCYBYZ        NUMBER(20,4),
  BXE           NUMBER(20,4),
  XZLB_________ VARCHAR2(100),
  GQSTID        VARCHAR2(32),
  GQSTMC        VARCHAR2(300),
  GQSTSF        VARCHAR2(32),
  GQSTZL        VARCHAR2(100),
  GQSTGLBM      VARCHAR2(32),
  GQSTWTGLJG    VARCHAR2(32),
  GQJZRJZCZ     NUMBER(20,4),
  ZQID          VARCHAR2(32),
  ZQZL          VARCHAR2(10),
  ZWRMC         VARCHAR2(300),
  GRZYE         NUMBER(20,2),
  PGJZRZMZQZ    NUMBER(20,2),
  SFBC          VARCHAR2(10),
  ZYZCID        VARCHAR2(32),
  ZYZCBH        VARCHAR2(300),
  ZYZCMC        VARCHAR2(300),
  ZYKPBH        VARCHAR2(300),
  ZYKPMC        VARCHAR2(300),
  ZYCCYZ        NUMBER(20,4),
  ZYBGDD        VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ZC_PG_XX.ID
  is 'uuid����';
comment on column EAM2.ZC_PG_XX.ZCID
  is '��Ӫ�̲�ID';
comment on column EAM2.ZC_PG_XX.JYGCZCBH
  is '��Ӫ�̲��ʲ����';
comment on column EAM2.ZC_PG_XX.ZCMC
  is '��Ӫ�̲��ʲ�����';
comment on column EAM2.ZC_PG_XX.SFMC
  is '�ʲ�����ʡ������';
comment on column EAM2.ZC_PG_XX.ZCLB
  is '�ʲ����';
comment on column EAM2.ZC_PG_XX.ZCLBBM
  is '�ʲ�������';
comment on column EAM2.ZC_PG_XX.ZKPBH
  is '����Ƭ���';
comment on column EAM2.ZC_PG_XX.ZCZMJZ
  is '�ʲ������ֵ��';
comment on column EAM2.ZC_PG_XX.DKZH
  is '�����˺�';
comment on column EAM2.ZC_PG_XX.WDID
  is 'ί�д���ID';
comment on column EAM2.ZC_PG_XX.CZCMC
  is '��ծ��������';
comment on column EAM2.ZC_PG_XX.CSJZYR
  is '��ծ���ʲ�ʵ��ռ����';
comment on column EAM2.ZC_PG_XX.CZCBH
  is '��ծ���ʲ����';
comment on column EAM2.ZC_PG_XX.CCFWZ
  is '��ծ���ڴ��λ��';
comment on column EAM2.ZC_PG_XX.CZCLX
  is '��ծ���ʲ�����';
comment on column EAM2.ZC_PG_XX.STID
  is 'ʵ��ID';
comment on column EAM2.ZC_PG_XX.STMC
  is 'ʵ������';
comment on column EAM2.ZC_PG_XX.STZCMC
  is 'ʵ�����ʲ�����';
comment on column EAM2.ZC_PG_XX.STFSXXID
  is 'ʵ�帽����ϢID';
comment on column EAM2.ZC_PG_XX.STZCBH
  is 'ʵ�����ʲ����';
comment on column EAM2.ZC_PG_XX.STTZCLX
  is 'ʵ�����ʲ�����';
comment on column EAM2.ZC_PG_XX.STZCLB
  is '�ʲ����';
comment on column EAM2.ZC_PG_XX.STSJZYR
  is '�ʲ�ʵ��ռ����';
comment on column EAM2.ZC_PG_XX.STCFWZ
  is 'ʵ�����ʲ����λ��';
comment on column EAM2.ZC_PG_XX.PGJG
  is '��������';
comment on column EAM2.ZC_PG_XX.PINGGUZHI
  is '����ֵ��Ԫ��';
comment on column EAM2.ZC_PG_XX.C_JZLX
  is '��ֵ����';
comment on column EAM2.ZC_PG_XX.C_CZFS
  is '���÷�ʽ';
comment on column EAM2.ZC_PG_XX.PGFF
  is '��������';
comment on column EAM2.ZC_PG_XX.PGJZR
  is '������׼��';
comment on column EAM2.ZC_PG_XX.BEIZHU
  is '��ע';
comment on column EAM2.ZC_PG_XX.PGMD
  is '����Ŀ��';
comment on column EAM2.ZC_PG_XX.JZRZMJZ
  is '��׼�������ֵ��Ԫ��';
comment on column EAM2.ZC_PG_XX.PGZCLB
  is '�����ʲ���� 0����Ӫ�Թ̲� 1��ʵ�����ʲ� 2 ί����ծ��';
comment on column EAM2.ZC_PG_XX.ZJZ
  is '����ֵ����ֵ';
comment on column EAM2.ZC_PG_XX.ZJFD
  is '�������Ȼ���ֵ';
comment on column EAM2.ZC_PG_XX.JINGZHI
  is '��ֵ��Ԫ��';
comment on column EAM2.ZC_PG_XX.ZCYBYZ
  is '�ʲ�ԭ��ԭֵ';
comment on column EAM2.ZC_PG_XX.BXE
  is '���ֶ�';
comment on column EAM2.ZC_PG_XX.XZLB_________
  is '�������ʲ����__________';
comment on column EAM2.ZC_PG_XX.GQSTID
  is '��Ȩʵ��ID';
comment on column EAM2.ZC_PG_XX.GQSTMC
  is '��Ȩʵ������';
comment on column EAM2.ZC_PG_XX.GQSTSF
  is '��Ȩʵ��ʡ��';
comment on column EAM2.ZC_PG_XX.GQSTZL
  is '��Ȩʵ������';
comment on column EAM2.ZC_PG_XX.GQSTGLBM
  is '��Ȩʵ�������';
comment on column EAM2.ZC_PG_XX.GQSTWTGLJG
  is '��Ȩʵ��ί�й������';
comment on column EAM2.ZC_PG_XX.GQJZRJZCZ
  is '��׼�����澻�ʲ�ֵ';
comment on column EAM2.ZC_PG_XX.ZQID
  is 'ծȨID';
comment on column EAM2.ZC_PG_XX.ZQZL
  is 'ծȨ���� 0��ȫ��  1���Ŵ�ת�� 2�� ����ת��  3������
';
comment on column EAM2.ZC_PG_XX.ZWRMC
  is 'ծ��������';
comment on column EAM2.ZC_PG_XX.GRZYE
  is '����ծ���';
comment on column EAM2.ZC_PG_XX.PGJZRZMZQZ
  is '������׼������ծȨֵ';
comment on column EAM2.ZC_PG_XX.SFBC
  is '�Ƿ񱣴� 0���� 1����';
comment on column EAM2.ZC_PG_XX.ZYZCID
  is '�����ʲ�ID';
comment on column EAM2.ZC_PG_XX.ZYZCBH
  is '�����ʲ����';
comment on column EAM2.ZC_PG_XX.ZYZCMC
  is '�����ʲ�����';
comment on column EAM2.ZC_PG_XX.ZYKPBH
  is '�����ʲ���Ƭ���';
comment on column EAM2.ZC_PG_XX.ZYKPMC
  is '�����ʲ���Ƭ����';
comment on column EAM2.ZC_PG_XX.ZYCCYZ
  is '�����ʲ��Ʋ�ԭֵ';
comment on column EAM2.ZC_PG_XX.ZYBGDD
  is '�����ʲ����ܵص�';
alter table EAM2.ZC_PG_XX
  add constraint PK_ZC_PG_XX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_BODY
prompt ======================
prompt
create table EAM2.ZY_BODY
(
  SBODY_ID    VARCHAR2(32) not null,
  SHEAD_ID    VARCHAR2(32),
  YJFLBM      VARCHAR2(50),
  EJFLBM      VARCHAR2(50),
  SJFLBM      VARCHAR2(50),
  YJFLMC      VARCHAR2(100),
  EJFLMC      VARCHAR2(100),
  SJFLMC      VARCHAR2(100),
  ZC_ID       VARCHAR2(32),
  ZCBH        VARCHAR2(20),
  ZCMC        VARCHAR2(300),
  GG          VARCHAR2(50),
  SL          NUMBER(20,2),
  JLDW        VARCHAR2(20),
  DJ          NUMBER(20,2),
  JE          NUMBER(20,2),
  GYS         VARCHAR2(300),
  CBRQ        DATE,
  BXJG        VARCHAR2(50),
  JYTS        NUMBER,
  WRKSL       NUMBER,
  BZ1         VARCHAR2(1000),
  BXFWS       VARCHAR2(100),
  XXBRQ       DATE,
  BZ2         VARCHAR2(1000),
  FYBH        VARCHAR2(20),
  SQFY        NUMBER(20,2),
  SPJE        NUMBER(20,2),
  YBXJE       NUMBER(20,2),
  BZ3         VARCHAR2(1000),
  CGRQ        DATE,
  CGDBODYID   VARCHAR2(32),
  GRSQDBODYID VARCHAR2(32),
  SQRID       VARCHAR2(32),
  SQRMC       VARCHAR2(300),
  PDPC        VARCHAR2(300),
  ZCZT        VARCHAR2(10),
  JYLYRQ      DATE,
  JYDQRQ      DATE,
  WXFY        NUMBER(20,2),
  LPH         VARCHAR2(300),
  LPSX        DATE,
  LPQX        VARCHAR2(300),
  LPDLM       VARCHAR2(300),
  SYZT        VARCHAR2(10),
  XLH         VARCHAR2(20),
  FDJBH       VARCHAR2(20),
  CPUXH       VARCHAR2(300),
  MEMORY      VARCHAR2(20),
  DISK        VARCHAR2(20),
  NZDISK      VARCHAR2(20),
  XTXSQ       VARCHAR2(20),
  SSZG        VARCHAR2(20),
  SQBMID      VARCHAR2(32),
  SQBMMC      VARCHAR2(300),
  TXMBH       VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_KCTZ
prompt ======================
prompt
create table EAM2.ZY_KCTZ
(
  KCTZ_ID VARCHAR2(32) not null,
  ZC_ID   VARCHAR2(32),
  RQ      DATE,
  RKSL    NUMBER(20,2),
  CKSL    NUMBER(20,2),
  KCSL    NUMBER(20,2),
  LYBMBM  VARCHAR2(20),
  LYBMMC  VARCHAR2(100),
  JYBMBM  VARCHAR2(20),
  JYBMMC  VARCHAR2(100),
  LYRBH   VARCHAR2(20),
  LYRMC   VARCHAR2(100),
  LYRQ    DATE,
  JYDQRQ  DATE,
  BDYY    VARCHAR2(20),
  DJLX    VARCHAR2(20),
  DJH     VARCHAR2(300),
  SFZXJL  INTEGER,
  GHSJ    DATE,
  GHBH    VARCHAR2(36),
  TZZT    VARCHAR2(36),
  BZ      VARCHAR2(1000),
  SFXJ    VARCHAR2(2),
  WXFY    NUMBER(20,2),
  JYTS    NUMBER,
  GHRBMBM VARCHAR2(100),
  GHRBMMC VARCHAR2(100),
  GHRXM   VARCHAR2(100),
  GHRBM   VARCHAR2(100)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ZY_KCTZ.KCTZ_ID
  is '���̨��ID';
comment on column EAM2.ZY_KCTZ.ZC_ID
  is '�ʲ�ID';
comment on column EAM2.ZY_KCTZ.RQ
  is '����';
comment on column EAM2.ZY_KCTZ.RKSL
  is '�������';
comment on column EAM2.ZY_KCTZ.CKSL
  is '��������';
comment on column EAM2.ZY_KCTZ.KCSL
  is '�������';
comment on column EAM2.ZY_KCTZ.LYBMBM
  is '���ò��ű���';
comment on column EAM2.ZY_KCTZ.LYBMMC
  is '���ò�������';
comment on column EAM2.ZY_KCTZ.JYBMBM
  is '���ò��ű���';
comment on column EAM2.ZY_KCTZ.JYBMMC
  is '���ò�������';
comment on column EAM2.ZY_KCTZ.LYRBH
  is '���ý����˱��';
comment on column EAM2.ZY_KCTZ.LYRMC
  is '���ý���������';
comment on column EAM2.ZY_KCTZ.LYRQ
  is '���������';
comment on column EAM2.ZY_KCTZ.JYDQRQ
  is '���õ������ڣ����õ���д';
comment on column EAM2.ZY_KCTZ.BDYY
  is '�䶯ԭ��';
comment on column EAM2.ZY_KCTZ.DJLX
  is '��Ӧ�������ͣ����õ������õ������赥����Ʒ����������ӯ�̿��������ϵ���
��������������';
comment on column EAM2.ZY_KCTZ.DJH
  is '��Ӧ���ݺ�';
comment on column EAM2.ZY_KCTZ.SFZXJL
  is '�Ƿ������¼�¼��ͬһ�ʲ�ֻ��һ�����¼�¼1��0��';
comment on column EAM2.ZY_KCTZ.GHSJ
  is '���ý�����Ʒ�Ĺ黹����';
comment on column EAM2.ZY_KCTZ.GHBH
  is '�黹���뵥���';
comment on column EAM2.ZY_KCTZ.TZZT
  is '̨��״̬';
comment on column EAM2.ZY_KCTZ.BZ
  is '��ע';
comment on column EAM2.ZY_KCTZ.SFXJ
  is '�Ƿ����裬ֻ�Խ��õ���Ч1��0��';
comment on column EAM2.ZY_KCTZ.WXFY
  is 'ά�޷���';
comment on column EAM2.ZY_KCTZ.JYTS
  is '��������';
comment on column EAM2.ZY_KCTZ.GHRBMBM
  is '�黹�˲��ű���';
comment on column EAM2.ZY_KCTZ.GHRBMMC
  is '�黹�˲�������';
comment on column EAM2.ZY_KCTZ.GHRXM
  is '�黹������';
comment on column EAM2.ZY_KCTZ.GHRBM
  is '�黹�˱��';
alter table EAM2.ZY_KCTZ
  add constraint PK_ZY_KCTZ primary key (KCTZ_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_PDXX
prompt ======================
prompt
create table EAM2.ZY_PDXX
(
  ID       VARCHAR2(32) not null,
  SBODY_ID VARCHAR2(32),
  SHEAD_ID VARCHAR2(32),
  PDRQ     DATE,
  PDPC     VARCHAR2(20),
  YJFLBM   VARCHAR2(50),
  EJFLBM   VARCHAR2(50),
  SJFLBM   VARCHAR2(50),
  YJFLMC   VARCHAR2(100),
  EJFLMC   VARCHAR2(100),
  SJFLMC   VARCHAR2(100),
  ZC_ID    VARCHAR2(32),
  ZCBH     VARCHAR2(20),
  ZCMC     VARCHAR2(300),
  GG       VARCHAR2(50),
  SL       NUMBER(20,2),
  JLDW     VARCHAR2(20),
  CFDD     VARCHAR2(100),
  SYBMBH   VARCHAR2(20),
  SYBMBMC  VARCHAR2(100),
  SYRBH    VARCHAR2(20),
  SYRMC    VARCHAR2(40),
  PDJG     VARCHAR2(20),
  PDSL     NUMBER(20,2),
  BZ       VARCHAR2(1000)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EAM2.ZY_PDXX
  is '�����ʲ����̵��̿��';
comment on column EAM2.ZY_PDXX.SBODY_ID
  is '��¼����,�Զ�����';
comment on column EAM2.ZY_PDXX.SHEAD_ID
  is 'ϵͳ�ڲ����,��Ӧ��ͷ';
comment on column EAM2.ZY_PDXX.PDRQ
  is '�̵�����';
comment on column EAM2.ZY_PDXX.PDPC
  is '�̵�����';
comment on column EAM2.ZY_PDXX.YJFLBM
  is '�ӷ������ѡȡ';
comment on column EAM2.ZY_PDXX.EJFLBM
  is '�ӷ������ѡȡ';
comment on column EAM2.ZY_PDXX.SJFLBM
  is '�ַ������ѡȡ';
comment on column EAM2.ZY_PDXX.YJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_PDXX.EJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_PDXX.SJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_PDXX.ZC_ID
  is '������׺�Ʒ,���ʲ�����ѡ���׺�Ʒ���,����Ϊ0';
comment on column EAM2.ZY_PDXX.ZCBH
  is '�ʲ����';
comment on column EAM2.ZY_PDXX.ZCMC
  is '�ʲ�����';
comment on column EAM2.ZY_PDXX.GG
  is '���ʲ������Զ���ȡ,�����ֹ�����';
comment on column EAM2.ZY_PDXX.SL
  is '�����������׺�Ʒ����������������Ϊ1';
comment on column EAM2.ZY_PDXX.JLDW
  is '������λ';
comment on column EAM2.ZY_PDXX.CFDD
  is '��ŵص�';
comment on column EAM2.ZY_PDXX.SYBMBH
  is 'ʹ�ò��ű��';
comment on column EAM2.ZY_PDXX.SYBMBMC
  is 'ʹ�ò�������';
comment on column EAM2.ZY_PDXX.SYRBH
  is 'ʹ���˱��';
comment on column EAM2.ZY_PDXX.SYRMC
  is 'ʹ��������';
comment on column EAM2.ZY_PDXX.PDJG
  is '0�����̵���1����ʵ���2����ӯ3���̿�
';
comment on column EAM2.ZY_PDXX.PDSL
  is '�̵�����';
comment on column EAM2.ZY_PDXX.BZ
  is '��ע';
alter table EAM2.ZY_PDXX
  add constraint PK_ZY_PDXX primary key (ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_SBODY
prompt =======================
prompt
create table EAM2.ZY_SBODY
(
  SBODY_ID    VARCHAR2(32) not null,
  SHEAD_ID    VARCHAR2(32),
  YJFLBM      VARCHAR2(50),
  EJFLBM      VARCHAR2(50),
  SJFLBM      VARCHAR2(50),
  YJFLMC      VARCHAR2(100),
  EJFLMC      VARCHAR2(100),
  SJFLMC      VARCHAR2(100),
  ZC_ID       VARCHAR2(32),
  ZCBH        VARCHAR2(20),
  ZCMC        VARCHAR2(300),
  GG          VARCHAR2(50),
  SL          NUMBER(20,2),
  JLDW        VARCHAR2(20),
  DJ          NUMBER(20,2),
  JE          NUMBER(20,2),
  GYS         VARCHAR2(300),
  CBRQ        DATE,
  BXJG        VARCHAR2(50),
  JYTS        NUMBER,
  WRKSL       NUMBER,
  BZ1         VARCHAR2(1000),
  BXFWS       VARCHAR2(100),
  XXBRQ       DATE,
  BZ2         VARCHAR2(1000),
  FYBH        VARCHAR2(20),
  SQFY        NUMBER(20,2),
  SPJE        NUMBER(20,2),
  YBXJE       NUMBER(20,2),
  BZ3         VARCHAR2(1000),
  CGRQ        DATE,
  CGDBODYID   VARCHAR2(32),
  GRSQDBODYID VARCHAR2(32),
  SQRID       VARCHAR2(32),
  SQRMC       VARCHAR2(300),
  PDPC        VARCHAR2(300),
  ZCZT        VARCHAR2(10),
  JYLYRQ      DATE,
  JYDQRQ      DATE,
  WXFY        NUMBER(20,2),
  LPH         VARCHAR2(300),
  LPSX        DATE,
  LPQX        VARCHAR2(300),
  LPDLM       VARCHAR2(300),
  SYZT        VARCHAR2(10),
  XLH         VARCHAR2(20),
  FDJBH       VARCHAR2(20),
  CPUXH       VARCHAR2(300),
  MEMORY      VARCHAR2(20),
  DISK        VARCHAR2(20),
  NZDISK      VARCHAR2(20),
  XTXSQ       VARCHAR2(20),
  SSZG        VARCHAR2(20),
  SQBMID      VARCHAR2(32),
  SQBMMC      VARCHAR2(300),
  TXMBH       VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ZY_SBODY.SBODY_ID
  is '��¼����,�Զ�����';
comment on column EAM2.ZY_SBODY.SHEAD_ID
  is 'ϵͳ�ڲ����,��Ӧ��ͷ';
comment on column EAM2.ZY_SBODY.YJFLBM
  is '�ӷ������ѡȡ';
comment on column EAM2.ZY_SBODY.EJFLBM
  is '�ӷ������ѡȡ';
comment on column EAM2.ZY_SBODY.SJFLBM
  is '�ַ������ѡȡ';
comment on column EAM2.ZY_SBODY.YJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_SBODY.EJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_SBODY.SJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_SBODY.ZC_ID
  is '������׺�Ʒ,���ʲ�����ѡ���׺�Ʒ���,����Ϊ0';
comment on column EAM2.ZY_SBODY.ZCBH
  is '�ʲ����';
comment on column EAM2.ZY_SBODY.ZCMC
  is '�ʲ�����';
comment on column EAM2.ZY_SBODY.GG
  is '�׺�Ʒ���ʲ������Զ���ȡ,�����ֹ�����';
comment on column EAM2.ZY_SBODY.SL
  is '����';
comment on column EAM2.ZY_SBODY.JLDW
  is '������λ';
comment on column EAM2.ZY_SBODY.DJ
  is '����';
comment on column EAM2.ZY_SBODY.JE
  is '���,�����������Ե���';
comment on column EAM2.ZY_SBODY.GYS
  is '��Ӧ��,�ɹ�����,�ɹ�����';
comment on column EAM2.ZY_SBODY.CBRQ
  is '��������,�ɹ�����,�ɹ�����,';
comment on column EAM2.ZY_SBODY.BXJG
  is '���޻���,�ɹ�����,�ɹ�����';
comment on column EAM2.ZY_SBODY.JYTS
  is '���õ���д';
comment on column EAM2.ZY_SBODY.WRKSL
  is 'δ�������';
comment on column EAM2.ZY_SBODY.BZ1
  is '��ע1';
comment on column EAM2.ZY_SBODY.BXFWS
  is '���޷�����';
comment on column EAM2.ZY_SBODY.XXBRQ
  is '����������';
comment on column EAM2.ZY_SBODY.BZ2
  is '��ע2';
comment on column EAM2.ZY_SBODY.FYBH
  is '���ñ��';
comment on column EAM2.ZY_SBODY.SQFY
  is '�������';
comment on column EAM2.ZY_SBODY.SPJE
  is '�������';
comment on column EAM2.ZY_SBODY.YBXJE
  is '�ѱ������';
comment on column EAM2.ZY_SBODY.BZ3
  is '��ע3';
comment on column EAM2.ZY_SBODY.CGRQ
  is '�ɹ�����';
comment on column EAM2.ZY_SBODY.CGDBODYID
  is '��Ӧ�ɹ���BODYID,��ⵥʹ��';
comment on column EAM2.ZY_SBODY.GRSQDBODYID
  is '��Ӧ�������뵥BODYID,�������ý��õ�ʹ��';
comment on column EAM2.ZY_SBODY.SQRID
  is '��Ӧ�������뵥����ID,�������ý��õ�ʹ��';
comment on column EAM2.ZY_SBODY.SQRMC
  is '��Ӧ�������뵥��������,�������ý��õ�ʹ��';
comment on column EAM2.ZY_SBODY.PDPC
  is '�̵�����';
comment on column EAM2.ZY_SBODY.ZCZT
  is '1���ڿ�
2���������
3��ά��
4������';
comment on column EAM2.ZY_SBODY.JYLYRQ
  is '������������';
comment on column EAM2.ZY_SBODY.JYDQRQ
  is '���õ�������';
comment on column EAM2.ZY_SBODY.WXFY
  is 'ά�޷���';
comment on column EAM2.ZY_SBODY.LPH
  is '���ƺ�';
comment on column EAM2.ZY_SBODY.LPSX
  is '����ʱ��';
comment on column EAM2.ZY_SBODY.LPQX
  is '����Ȩ��';
comment on column EAM2.ZY_SBODY.LPDLM
  is '���Ƶ�¼��';
comment on column EAM2.ZY_SBODY.SYZT
  is 'ʹ��״̬  0�����ǰ  1�������
';
comment on column EAM2.ZY_SBODY.XLH
  is '���к�';
comment on column EAM2.ZY_SBODY.FDJBH
  is '���������';
comment on column EAM2.ZY_SBODY.CPUXH
  is 'CPU�ͺ�';
comment on column EAM2.ZY_SBODY.MEMORY
  is '�ڴ�';
comment on column EAM2.ZY_SBODY.DISK
  is 'Ӳ��';
comment on column EAM2.ZY_SBODY.NZDISK
  is '����Ӳ��';
comment on column EAM2.ZY_SBODY.XTXSQ
  is 'ϵͳ��ʾ��';
comment on column EAM2.ZY_SBODY.SSZG
  is '�����˹�';
comment on column EAM2.ZY_SBODY.SQBMID
  is '���ý��ò���ID
';
comment on column EAM2.ZY_SBODY.SQBMMC
  is '���ý��ò�������
';
comment on column EAM2.ZY_SBODY.TXMBH
  is '��������';
alter table EAM2.ZY_SBODY
  add constraint PK_ZY_SBODY primary key (SBODY_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_SHEAD
prompt =======================
prompt
create table EAM2.ZY_SHEAD
(
  SHEAD_ID   VARCHAR2(32) not null,
  SHEET_TYPE VARCHAR2(50),
  TITLE      VARCHAR2(100),
  SHEET_ID   VARCHAR2(100),
  NGRQ       VARCHAR2(20),
  NGRBH      VARCHAR2(100),
  NGRMC      VARCHAR2(300),
  NGBMBH     VARCHAR2(100),
  NGBMMC     VARCHAR2(300),
  LDXH       VARCHAR2(300),
  JHCD       VARCHAR2(10),
  YTXQ       VARCHAR2(1000),
  CGYJ       VARCHAR2(1000),
  NGBMYJ     VARCHAR2(200),
  SPBMYJ     VARCHAR2(200),
  HQYJ       VARCHAR2(200),
  YWYYZYJ    VARCHAR2(200),
  LDPSYJ     VARCHAR2(200),
  BDZT       VARCHAR2(10),
  YSRQ       VARCHAR2(10),
  BFRQ       VARCHAR2(10),
  HQBM       VARCHAR2(100),
  HQBMID     VARCHAR2(300),
  PDPC       VARCHAR2(300)
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ZY_SHEAD.SHEAD_ID
  is 'ϵͳ�ڲ���� ';
comment on column EAM2.ZY_SHEAD.SHEET_TYPE
  is '�����ͣ���������ֵ䶨�����';
comment on column EAM2.ZY_SHEAD.TITLE
  is '�����⣬�ֹ�¼��';
comment on column EAM2.ZY_SHEAD.SHEET_ID
  is '����ţ����ݱ�Ź����Զ�����';
comment on column EAM2.ZY_SHEAD.NGRQ
  is '������ڣ���ʽΪYYYYMMDD';
comment on column EAM2.ZY_SHEAD.NGRBH
  is '����˱��';
comment on column EAM2.ZY_SHEAD.NGRMC
  is '���������';
comment on column EAM2.ZY_SHEAD.NGBMBH
  is '��岿�ű��';
comment on column EAM2.ZY_SHEAD.NGBMMC
  is '��岿������';
comment on column EAM2.ZY_SHEAD.LDXH
  is '��ϵ�绰���˹�����';
comment on column EAM2.ZY_SHEAD.JHCD
  is '�����̶�1һ�㣻2����3�ؼ�';
comment on column EAM2.ZY_SHEAD.YTXQ
  is '��;�����󣬲ɹ���ר���ֶ�';
comment on column EAM2.ZY_SHEAD.CGYJ
  is '�ɹ����ݣ�����������ѡȡ���ݺŻ����ֹ�¼��';
comment on column EAM2.ZY_SHEAD.NGBMYJ
  is '��岿�����,���ֶη�������Ϊ�洢ca_shead���idʹ��';
comment on column EAM2.ZY_SHEAD.SPBMYJ
  is '�����������,���ֶη���';
comment on column EAM2.ZY_SHEAD.HQYJ
  is '��ǩ���,���ֶη���';
comment on column EAM2.ZY_SHEAD.YWYYZYJ
  is 'ҵ����Ӫ�����,���ֶη���';
comment on column EAM2.ZY_SHEAD.LDPSYJ
  is '��ʾ������ֶη���';
comment on column EAM2.ZY_SHEAD.BDZT
  is '��״̬0 ���1������2�������3�����Ѱ��';
comment on column EAM2.ZY_SHEAD.YSRQ
  is '�������ڣ���ʽyyyy-mm-dd';
comment on column EAM2.ZY_SHEAD.BFRQ
  is '��������YYYY-MM-DD';
comment on column EAM2.ZY_SHEAD.HQBM
  is '��ǩ����';
comment on column EAM2.ZY_SHEAD.HQBMID
  is '��ǩ����ID';
comment on column EAM2.ZY_SHEAD.PDPC
  is '�̵�����';
alter table EAM2.ZY_SHEAD
  add constraint PK_ZY_SHEAD primary key (SHEAD_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_ZC
prompt ====================
prompt
create table EAM2.ZY_ZC
(
  ZC_ID  VARCHAR2(32) not null,
  YJFLBM VARCHAR2(50),
  EJFLBM VARCHAR2(50),
  SJFLBM VARCHAR2(50),
  YJFLMC VARCHAR2(100),
  EJFLMC VARCHAR2(100),
  SJFLMC VARCHAR2(100),
  ZCBH   VARCHAR2(20),
  ZCMC   VARCHAR2(300),
  KPBH   VARCHAR2(40),
  TXMBH  VARCHAR2(300),
  XLH    VARCHAR2(20),
  SL     NUMBER(20,2),
  JLDW   VARCHAR2(20),
  GG     VARCHAR2(50),
  ZCZT   VARCHAR2(100),
  WZBH   VARCHAR2(20),
  YJKCSL VARCHAR2(20),
  ZTWZ   VARCHAR2(300),
  CZYZ   NUMBER(20,2),
  BGDD   VARCHAR2(100),
  SYZK   VARCHAR2(20),
  KSSYRQ DATE,
  FDJBH  VARCHAR2(20),
  YLRR   VARCHAR2(20),
  DZYHDJ NUMBER(20,2),
  DZYHJG NUMBER(20,2),
  CBRQ   DATE,
  CPUXH  VARCHAR2(300),
  MEMORY VARCHAR2(20),
  DISK   VARCHAR2(20),
  NZDISK VARCHAR2(20),
  XTXSQ  VARCHAR2(20),
  ZJXGSJ DATE,
  SSZG   VARCHAR2(20),
  BZ     VARCHAR2(1000),
  ZJPDRQ DATE,
  RKRQ   DATE,
  ZJPKRQ DATE,
  BXFWS  VARCHAR2(300),
  GYS    VARCHAR2(300),
  LPH    VARCHAR2(300),
  LPSX   DATE,
  LPQX   VARCHAR2(300),
  LPDLM  VARCHAR2(300),
  SFSCKP VARCHAR2(10),
  CGRQ   DATE
)
tablespace EAMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EAM2.ZY_ZC.ZC_ID
  is 'ZC_ID';
comment on column EAM2.ZY_ZC.YJFLBM
  is '�ӷ������ѡȡ';
comment on column EAM2.ZY_ZC.EJFLBM
  is '�ӷ������ѡȡ';
comment on column EAM2.ZY_ZC.SJFLBM
  is '�ַ������ѡȡ';
comment on column EAM2.ZY_ZC.YJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_ZC.EJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_ZC.SJFLMC
  is '�����ֶ�,���������仯,�����޸�';
comment on column EAM2.ZY_ZC.ZCBH
  is '�ʲ����:��Ƭ��/�����/�Ա��';
comment on column EAM2.ZY_ZC.ZCMC
  is '�ʲ�����';
comment on column EAM2.ZY_ZC.KPBH
  is '�̶��ʲ���Ƭ���,����ERPϵͳ';
comment on column EAM2.ZY_ZC.TXMBH
  is '�̶��ʲ��͵�ֵƷ��,�׺�Ʒû��';
comment on column EAM2.ZY_ZC.XLH
  is '���к�';
comment on column EAM2.ZY_ZC.SL
  is '����׼����������,�����ֶΣ���̨��Ϊ׼';
comment on column EAM2.ZY_ZC.JLDW
  is '�ʲ��ľ��������λ';
comment on column EAM2.ZY_ZC.GG
  is '�ʲ��ľ���������U�̵�1G,2G';
comment on column EAM2.ZY_ZC.ZCZT
  is '1���ڿ�
2���������
3��ά��
4������';
comment on column EAM2.ZY_ZC.WZBH
  is '����ҵ��Ҫ����б��';
comment on column EAM2.ZY_ZC.YJKCSL
  is 'Ԥ���������';
comment on column EAM2.ZY_ZC.ZTWZ
  is '���ճ��λ��';
comment on column EAM2.ZY_ZC.CZYZ
  is '�Ʋ�ԭֵ';
comment on column EAM2.ZY_ZC.BGDD
  is '���ܵص�';
comment on column EAM2.ZY_ZC.SYZK
  is '�̶��ʲ�ʹ��״��';
comment on column EAM2.ZY_ZC.KSSYRQ
  is '��ʼʹ������';
comment on column EAM2.ZY_ZC.FDJBH
  is '���������';
comment on column EAM2.ZY_ZC.YLRR
  is 'ԭϵͳ¼����Ա';
comment on column EAM2.ZY_ZC.DZYHDJ
  is '��ֵ�׺ĵ���';
comment on column EAM2.ZY_ZC.DZYHJG
  is '��ֵ�׺ļ۸�';
comment on column EAM2.ZY_ZC.CBRQ
  is '��������';
comment on column EAM2.ZY_ZC.CPUXH
  is 'CPU�ͺ�';
comment on column EAM2.ZY_ZC.MEMORY
  is '�ڴ�';
comment on column EAM2.ZY_ZC.DISK
  is 'Ӳ��';
comment on column EAM2.ZY_ZC.NZDISK
  is '����Ӳ��';
comment on column EAM2.ZY_ZC.XTXSQ
  is 'ϵͳ��ʾ��';
comment on column EAM2.ZY_ZC.ZJXGSJ
  is '��¼������¼������޸�����ʱ��,����';
comment on column EAM2.ZY_ZC.SSZG
  is '�����˹�';
comment on column EAM2.ZY_ZC.BZ
  is '��ע';
comment on column EAM2.ZY_ZC.ZJPDRQ
  is '����̵�����';
comment on column EAM2.ZY_ZC.RKRQ
  is '�������';
comment on column EAM2.ZY_ZC.ZJPKRQ
  is '����̿�����';
comment on column EAM2.ZY_ZC.BXFWS
  is '���޷�����';
comment on column EAM2.ZY_ZC.GYS
  is '��Ӧ��';
comment on column EAM2.ZY_ZC.LPH
  is '���ƺ�';
comment on column EAM2.ZY_ZC.LPSX
  is '����ʱ��';
comment on column EAM2.ZY_ZC.LPQX
  is '����Ȩ��';
comment on column EAM2.ZY_ZC.LPDLM
  is '���Ƶ�¼��';
comment on column EAM2.ZY_ZC.SFSCKP
  is '�Ƿ������ɿ�Ƭ';
comment on column EAM2.ZY_ZC.CGRQ
  is '�ɹ�����';
alter table EAM2.ZY_ZC
  add constraint PK_ZY_ZC primary key (ZC_ID)
  using index 
  tablespace EAMP
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ZY_ZC20140414
prompt ============================
prompt
create table EAM2.ZY_ZC20140414
(
  ZC_ID  VARCHAR2(32) not null,
  YJFLBM VARCHAR2(50),
  EJFLBM VARCHAR2(50),
  SJFLBM VARCHAR2(50),
  YJFLMC VARCHAR2(100),
  EJFLMC VARCHAR2(100),
  SJFLMC VARCHAR2(100),
  ZCBH   VARCHAR2(20),
  ZCMC   VARCHAR2(300),
  KPBH   VARCHAR2(40),
  TXMBH  VARCHAR2(300),
  XLH    VARCHAR2(20),
  SL     NUMBER(20,2),
  JLDW   VARCHAR2(20),
  GG     VARCHAR2(50),
  ZCZT   VARCHAR2(100),
  WZBH   VARCHAR2(20),
  YJKCSL VARCHAR2(20),
  ZTWZ   VARCHAR2(300),
  CZYZ   NUMBER(20,2),
  BGDD   VARCHAR2(100),
  SYZK   VARCHAR2(20),
  KSSYRQ DATE,
  FDJBH  VARCHAR2(20),
  YLRR   VARCHAR2(20),
  DZYHDJ NUMBER(20,2),
  DZYHJG NUMBER(20,2),
  CBRQ   DATE,
  CPUXH  VARCHAR2(300),
  MEMORY VARCHAR2(20),
  DISK   VARCHAR2(20),
  NZDISK VARCHAR2(20),
  XTXSQ  VARCHAR2(20),
  ZJXGSJ DATE,
  SSZG   VARCHAR2(20),
  BZ     VARCHAR2(1000),
  ZJPDRQ DATE,
  RKRQ   DATE,
  ZJPKRQ DATE,
  BXFWS  VARCHAR2(300),
  GYS    VARCHAR2(300),
  LPH    VARCHAR2(300),
  LPSX   DATE,
  LPQX   VARCHAR2(300),
  LPDLM  VARCHAR2(300),
  SFSCKP VARCHAR2(10),
  CGRQ   DATE
)
tablespace EAM2
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQUENCE_ID
prompt =============================
prompt
create sequence EAM2.SEQUENCE_ID
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ASSET_CODE
prompt ================================
prompt
create sequence EAM2.SEQ_ASSET_CODE
minvalue 1
maxvalue 999999999999999999
start with 88116
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CARDINFO
prompt ==============================
prompt
create sequence EAM2.SEQ_CARDINFO
minvalue 1
maxvalue 999999999999999999999999999
start with 20063548
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CA_SHEAD
prompt ==============================
prompt
create sequence EAM2.SEQ_CA_SHEAD
minvalue 1
maxvalue 999999999999999999999999999
start with 7310001328
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CODE
prompt ==========================
prompt
create sequence EAM2.SEQ_CODE
minvalue 1
maxvalue 999999999999999999999999999
start with 3
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CODE_GENERATOR_DETAIL
prompt ===========================================
prompt
create sequence EAM2.SEQ_CODE_GENERATOR_DETAIL
minvalue 1
maxvalue 999999999
start with 205
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CODE_GENERATOR_LOG
prompt ========================================
prompt
create sequence EAM2.SEQ_CODE_GENERATOR_LOG
minvalue 1
maxvalue 999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CODE_GENERATOR_MODEL
prompt ==========================================
prompt
create sequence EAM2.SEQ_CODE_GENERATOR_MODEL
minvalue 1
maxvalue 999999999
start with 103
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEBT_INFO
prompt ===============================
prompt
create sequence EAM2.SEQ_DEBT_INFO
minvalue 1
maxvalue 9999999999999999999999
start with 5531
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DIC_APP_ASSETTYPE1
prompt ========================================
prompt
create sequence EAM2.SEQ_DIC_APP_ASSETTYPE1
minvalue 0
maxvalue 99999999
start with 83
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DIC_APP_ASSETTYPE2
prompt ========================================
prompt
create sequence EAM2.SEQ_DIC_APP_ASSETTYPE2
minvalue 0
maxvalue 99999999
start with 2231
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DIC_APP_ASSETTYPE3
prompt ========================================
prompt
create sequence EAM2.SEQ_DIC_APP_ASSETTYPE3
minvalue 0
maxvalue 99999999
start with 3470
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DIC_STORCK_ID
prompt ===================================
prompt
create sequence EAM2.SEQ_DIC_STORCK_ID
minvalue 1
maxvalue 999999999999999999
start with 1541
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_BXMX
prompt ==============================
prompt
create sequence EAM2.SEQ_ERP_BXMX
minvalue 1
maxvalue 999999999999999999999999999
start with 10343752
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDADDSEND
prompt =====================================
prompt
create sequence EAM2.SEQ_ERP_CARDADDSEND
minvalue 1
maxvalue 999999999999999999999999999
start with 10001085
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDBDSEND
prompt ====================================
prompt
create sequence EAM2.SEQ_ERP_CARDBDSEND
minvalue 1
maxvalue 999999999999999999999999999
start with 183
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDCFSEND
prompt ====================================
prompt
create sequence EAM2.SEQ_ERP_CARDCFSEND
minvalue 1
maxvalue 999999999999999999999999999
start with 283
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDHBSEND
prompt ====================================
prompt
create sequence EAM2.SEQ_ERP_CARDHBSEND
minvalue 1
maxvalue 999999999999999999999999999
start with 243
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDJZ
prompt ================================
prompt
create sequence EAM2.SEQ_ERP_CARDJZ
minvalue 1
maxvalue 999999999999999999999999999
start with 83
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDREDUCESEND
prompt ========================================
prompt
create sequence EAM2.SEQ_ERP_CARDREDUCESEND
minvalue 1
maxvalue 999999999999999999999999999
start with 3537
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_CARDSPDADDSEND
prompt ========================================
prompt
create sequence EAM2.SEQ_ERP_CARDSPDADDSEND
minvalue 1
maxvalue 999999999999999999999999999
start with 10001404
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_DATEINFO
prompt ==================================
prompt
create sequence EAM2.SEQ_ERP_DATEINFO
minvalue 1
maxvalue 999999999999999999999999999
start with 2383
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_FYSPD
prompt ===============================
prompt
create sequence EAM2.SEQ_ERP_FYSPD
minvalue 1
maxvalue 999999999999999999999999999
start with 10001385
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERP_USERMAP
prompt =================================
prompt
create sequence EAM2.SEQ_ERP_USERMAP
minvalue 1
maxvalue 999999999999999999999999999
start with 10001057
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EXPENSE
prompt =============================
prompt
create sequence EAM2.SEQ_EXPENSE
minvalue 1
maxvalue 999999999999999999999999
start with 22742738
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_E_T_CLD
prompt =============================
prompt
create sequence EAM2.SEQ_E_T_CLD
minvalue 1
maxvalue 99999999
start with 840
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_E_T_COUNTERSIGN
prompt =====================================
prompt
create sequence EAM2.SEQ_E_T_COUNTERSIGN
minvalue 1
maxvalue 999999999999999999
start with 2241
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_E_T_COUNTERSIGN_PPT
prompt =========================================
prompt
create sequence EAM2.SEQ_E_T_COUNTERSIGN_PPT
minvalue 1
maxvalue 999999999999999999
start with 4412
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_KP_CARDTEMP
prompt =================================
prompt
create sequence EAM2.SEQ_KP_CARDTEMP
minvalue 1
maxvalue 999999999999999999999999999
start with 20063208
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_KP_CARD_TEMP
prompt ==================================
prompt
create sequence EAM2.SEQ_KP_CARD_TEMP
minvalue 1
maxvalue 999999999999999999999999999
start with 20063208
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_KP_CZXX
prompt =============================
prompt
create sequence EAM2.SEQ_KP_CZXX
minvalue 1
maxvalue 999999999999999999999999999
start with 3
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_KP_CZXX_TEMP
prompt ==================================
prompt
create sequence EAM2.SEQ_KP_CZXX_TEMP
minvalue 1
maxvalue 999999999999999999999999999
start with 3
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_KP_SHEAD
prompt ==============================
prompt
create sequence EAM2.SEQ_KP_SHEAD
minvalue 1
maxvalue 999999999999999999999999999
start with 203
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_KP_ZC_GJLS_XX
prompt ===================================
prompt
create sequence EAM2.SEQ_KP_ZC_GJLS_XX
minvalue 1
maxvalue 999999999999999999999999999
start with 3
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_LC_CARDTEMP
prompt =================================
prompt
create sequence EAM2.SEQ_LC_CARDTEMP
minvalue 1
maxvalue 999999999999999999999999999
start with 11066271
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_LN
prompt ========================
prompt
create sequence EAM2.SEQ_LN
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_ABANDON
prompt =================================
prompt
create sequence EAM2.SEQ_P_T_ABANDON
minvalue 1
maxvalue 999999999999999999999999999
start with 628
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_BIZ_DATA
prompt ==================================
prompt
create sequence EAM2.SEQ_P_T_BIZ_DATA
minvalue 1
maxvalue 999999999999999999
start with 518
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_DEPT
prompt ==============================
prompt
create sequence EAM2.SEQ_P_T_DEPT
minvalue 1
maxvalue 999999999999999999
start with 11739
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_DID
prompt =============================
prompt
create sequence EAM2.SEQ_P_T_DID
minvalue 1
maxvalue 999999999999999999999999999
start with 323218
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_DRAFT
prompt ===============================
prompt
create sequence EAM2.SEQ_P_T_DRAFT
minvalue 1
maxvalue 999999999999999999999999999
start with 8682
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_END
prompt =============================
prompt
create sequence EAM2.SEQ_P_T_END
minvalue 1
maxvalue 999999999999999999999999999
start with 41943
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_ERROR_LOG
prompt ===================================
prompt
create sequence EAM2.SEQ_P_T_ERROR_LOG
minvalue 1
maxvalue 999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_EXCEPTION_LOG
prompt =======================================
prompt
create sequence EAM2.SEQ_P_T_EXCEPTION_LOG
minvalue 1
maxvalue 9999999999
start with 1854
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_FILE
prompt ==============================
prompt
create sequence EAM2.SEQ_P_T_FILE
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_FUNCTION_GROUP
prompt ========================================
prompt
create sequence EAM2.SEQ_P_T_FUNCTION_GROUP
minvalue 1
maxvalue 999999999999999999
start with 272
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_FUNCTION_RES
prompt ======================================
prompt
create sequence EAM2.SEQ_P_T_FUNCTION_RES
minvalue 1
maxvalue 999999999999999999
start with 2995
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_LOGON_INFO
prompt ====================================
prompt
create sequence EAM2.SEQ_P_T_LOGON_INFO
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_MESSAGE
prompt =================================
prompt
create sequence EAM2.SEQ_P_T_MESSAGE
minvalue 1
maxvalue 999999999999999999999999999
start with 19348
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_REFERENCE
prompt ===================================
prompt
create sequence EAM2.SEQ_P_T_REFERENCE
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_ROLE
prompt ==============================
prompt
create sequence EAM2.SEQ_P_T_ROLE
minvalue 1
maxvalue 999999999999999999
start with 5340
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_ROLE_L_FUNC_GROUP
prompt ===========================================
prompt
create sequence EAM2.SEQ_P_T_ROLE_L_FUNC_GROUP
minvalue 1
maxvalue 999999999999999999
start with 20890
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_TODO
prompt ==============================
prompt
create sequence EAM2.SEQ_P_T_TODO
minvalue 1
maxvalue 999999999999999999999999999
start with 42119
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_USER
prompt ==============================
prompt
create sequence EAM2.SEQ_P_T_USER
minvalue 1
maxvalue 999999999999999999
start with 166610
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_USER_L_DEPT
prompt =====================================
prompt
create sequence EAM2.SEQ_P_T_USER_L_DEPT
minvalue 1
maxvalue 999999999999999999
start with 17920
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_T_USER_L_ROLE
prompt =====================================
prompt
create sequence EAM2.SEQ_P_T_USER_L_ROLE
minvalue 1
maxvalue 999999999999999999
start with 68040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ZY_KCTZ
prompt =============================
prompt
create sequence EAM2.SEQ_ZY_KCTZ
minvalue 1
maxvalue 999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ZY_SBODY
prompt ==============================
prompt
create sequence EAM2.SEQ_ZY_SBODY
minvalue 1
maxvalue 999999999999999999
start with 2508
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ZY_SHEAD
prompt ==============================
prompt
create sequence EAM2.SEQ_ZY_SHEAD
minvalue 1
maxvalue 999999999999999999
start with 3224
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ZY_ZC
prompt ===========================
prompt
create sequence EAM2.SEQ_ZY_ZC
minvalue 1
maxvalue 999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SQL_ERP_HISTORY
prompt =================================
prompt
create sequence EAM2.SQL_ERP_HISTORY
minvalue 1
maxvalue 999999999999999999999999999
start with 10400650
increment by 1
cache 20;

prompt
prompt Creating synonym CONTRACT_ONE
prompt =============================
prompt
create or replace synonym EAM2.CONTRACT_ONE
  for JIC.CONTRACT@JIC_EAMONE;

prompt
prompt Creating synonym CRT_BANK_LEVEL
prompt ===============================
prompt
create or replace synonym EAM2.CRT_BANK_LEVEL
  for DCC.CRT_BANK_LEVEL@JIC_EDW_122;

prompt
prompt Creating synonym CRT_CONSIGN_FUND
prompt =================================
prompt
create or replace synonym EAM2.CRT_CONSIGN_FUND
  for DCC.CRT_CONSIGN_FUND@JIC_EDW_122;

prompt
prompt Creating synonym CRT_CONSIGN_LOAN
prompt =================================
prompt
create or replace synonym EAM2.CRT_CONSIGN_LOAN
  for DCC.CRT_CONSIGN_LOAN@JIC_EDW_122;

prompt
prompt Creating synonym CRT_CURRENCY_TYPE
prompt ==================================
prompt
create or replace synonym EAM2.CRT_CURRENCY_TYPE
  for DCC.CRT_CURRENCY_TYPE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_CUSTOMER_INFO
prompt ==================================
prompt
create or replace synonym EAM2.CRT_CUSTOMER_INFO
  for DCC.CRT_CUSTOMER_INFO@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_ACCT_CUST
prompt ==================================
prompt
create or replace synonym EAM2.CRT_DCC_ACCT_CUST
  for DCC.CRT_DCC_ACCT_CUST@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CICIFCI1
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CICIFCI1
  for DCC.CRT_DCC_CICIFCI1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CICIFCI1_ALL
prompt =====================================
prompt
create or replace synonym EAM2.CRT_DCC_CICIFCI1_ALL
  for DCC.CRT_DCC_CICIFCI1_ALL@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMBCTBCT
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMBCTBCT
  for DCC.CRT_DCC_CMBCTBCT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMCRTCRT
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMCRTCRT
  for DCC.CRT_DCC_CMCRTCRT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMCURCUR
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMCURCUR
  for DCC.CRT_DCC_CMCURCUR@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMECCECC
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMECCECC
  for DCC.CRT_DCC_CMECCECC@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCBST
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCBST
  for DCC.CRT_DCC_CMMSCBST@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCBTP
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCBTP
  for DCC.CRT_DCC_CMMSCBTP@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCBUS
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCBUS
  for DCC.CRT_DCC_CMMSCBUS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCCCS
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCCCS
  for DCC.CRT_DCC_CMMSCCCS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCCNC
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCCNC
  for DCC.CRT_DCC_CMMSCCNC@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCCNT
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCCNT
  for DCC.CRT_DCC_CMMSCCNT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCCRC
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCCRC
  for DCC.CRT_DCC_CMMSCCRC@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCCTY
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCCTY
  for DCC.CRT_DCC_CMMSCCTY@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCCUD
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCCUD
  for DCC.CRT_DCC_CMMSCCUD@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDCD
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDCD
  for DCC.CRT_DCC_CMMSCDCD@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDDC
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDDC
  for DCC.CRT_DCC_CMMSCDDC@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDEP
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDEP
  for DCC.CRT_DCC_CMMSCDEP@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDIF
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDIF
  for DCC.CRT_DCC_CMMSCDIF@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDLR
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDLR
  for DCC.CRT_DCC_CMMSCDLR@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDRG
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDRG
  for DCC.CRT_DCC_CMMSCDRG@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCDRS
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCDRS
  for DCC.CRT_DCC_CMMSCDRS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCFPD
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCFPD
  for DCC.CRT_DCC_CMMSCFPD@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCFR1
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCFR1
  for DCC.CRT_DCC_CMMSCFR1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCFR2
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCFR2
  for DCC.CRT_DCC_CMMSCFR2@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCGLA
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCGLA
  for DCC.CRT_DCC_CMMSCGLA@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCLNM
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCLNM
  for DCC.CRT_DCC_CMMSCLNM@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCLNP
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCLNP
  for DCC.CRT_DCC_CMMSCLNP@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCLNT
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCLNT
  for DCC.CRT_DCC_CMMSCLNT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCNRC
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCNRC
  for DCC.CRT_DCC_CMMSCNRC@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCNTT
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCNTT
  for DCC.CRT_DCC_CMMSCNTT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCQLC
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCQLC
  for DCC.CRT_DCC_CMMSCQLC@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCRFS
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCRFS
  for DCC.CRT_DCC_CMMSCRFS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCSAK
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCSAK
  for DCC.CRT_DCC_CMMSCSAK@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMMSCSAP
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMMSCSAP
  for DCC.CRT_DCC_CMMSCSAP@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_CMTXPTXP
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_CMTXPTXP
  for DCC.CRT_DCC_CMTXPTXP@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FBKTXXJ
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FBKTXXJ
  for DCC.CRT_DCC_FBKTXXJ@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FCICIF0
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FCICIF0
  for DCC.CRT_DCC_FCICIF0@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FGLACAJ
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FGLACAJ
  for DCC.CRT_DCC_FGLACAJ@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FGLGLGJ
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FGLGLGJ
  for DCC.CRT_DCC_FGLGLGJ@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FGLGLGJ1
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_FGLGLGJ1
  for DCC.CRT_DCC_FGLGLGJ1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FGLTXNR
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FGLTXNR
  for DCC.CRT_DCC_FGLTXNR@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FLNGLA1
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FLNGLA1
  for DCC.CRT_DCC_FLNGLA1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FLNJDUE
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FLNJDUE
  for DCC.CRT_DCC_FLNJDUE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FLNJJR1
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FLNJJR1
  for DCC.CRT_DCC_FLNJJR1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FLNJJR2
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FLNJJR2
  for DCC.CRT_DCC_FLNJJR2@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_FLNJUPY
prompt ================================
prompt
create or replace synonym EAM2.CRT_DCC_FLNJUPY
  for DCC.CRT_DCC_FLNJUPY@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_GLACAACA
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_GLACAACA
  for DCC.CRT_DCC_GLACAACA@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_GLACATXN
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_GLACATXN
  for DCC.CRT_DCC_GLACATXN@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_GLGLGGLG
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_GLGLGGLG
  for DCC.CRT_DCC_GLGLGGLG@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_HL
prompt ===========================
prompt
create or replace synonym EAM2.CRT_DCC_HL
  for DCC.CRT_DCC_HL@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_LNLNSJR1
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_LNLNSJR1
  for DCC.CRT_DCC_LNLNSJR1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_LNLNSJR2
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_LNLNSJR2
  for DCC.CRT_DCC_LNLNSJR2@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_LNLNSLNS
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_LNLNSLNS
  for DCC.CRT_DCC_LNLNSLNS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_LNLNSLNS_H
prompt ===================================
prompt
create or replace synonym EAM2.CRT_DCC_LNLNSLNS_H
  for DCC.CRT_DCC_LNLNSLNS_H@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_LNLNSUPY
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_LNLNSUPY
  for DCC.CRT_DCC_LNLNSUPY@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_LN_LOAN_TYPE
prompt =====================================
prompt
create or replace synonym EAM2.CRT_DCC_LN_LOAN_TYPE
  for DCC.CRT_DCC_LN_LOAN_TYPE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_SAACNACN
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_SAACNACN
  for DCC.CRT_DCC_SAACNACN@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_SAACNACN_HIS
prompt =====================================
prompt
create or replace synonym EAM2.CRT_DCC_SAACNACN_HIS
  for DCC.CRT_DCC_SAACNACN_HIS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_SAACNAMT
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_SAACNAMT
  for DCC.CRT_DCC_SAACNAMT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_SAACNAMT_HIS
prompt =====================================
prompt
create or replace synonym EAM2.CRT_DCC_SAACNAMT_HIS
  for DCC.CRT_DCC_SAACNAMT_HIS@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_SAACNTXN
prompt =================================
prompt
create or replace synonym EAM2.CRT_DCC_SAACNTXN
  for DCC.CRT_DCC_SAACNTXN@JIC_EDW_122;

prompt
prompt Creating synonym CRT_DCC_SA_SAVE_TYPE
prompt =====================================
prompt
create or replace synonym EAM2.CRT_DCC_SA_SAVE_TYPE
  for DCC.CRT_DCC_SA_SAVE_TYPE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_EXCHANGE_RATE
prompt ==================================
prompt
create or replace synonym EAM2.CRT_EXCHANGE_RATE
  for DCC.CRT_EXCHANGE_RATE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_IN_ACCOUNT
prompt ===============================
prompt
create or replace synonym EAM2.CRT_IN_ACCOUNT
  for DCC.CRT_IN_ACCOUNT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_LOAN_ACCOUNT
prompt =================================
prompt
create or replace synonym EAM2.CRT_LOAN_ACCOUNT
  for DCC.CRT_LOAN_ACCOUNT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_LOAN_TYPE
prompt ==============================
prompt
create or replace synonym EAM2.CRT_LOAN_TYPE
  for DCC.CRT_LOAN_TYPE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_MAJOR_REPORT
prompt =================================
prompt
create or replace synonym EAM2.CRT_MAJOR_REPORT
  for DCC.CRT_MAJOR_REPORT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_MAJOR_REPORT_CUR
prompt =====================================
prompt
create or replace synonym EAM2.CRT_MAJOR_REPORT_CUR
  for DCC.CRT_MAJOR_REPORT_CUR@JIC_EDW_122;

prompt
prompt Creating synonym CRT_MAJOR_REPORT_CUR1
prompt ======================================
prompt
create or replace synonym EAM2.CRT_MAJOR_REPORT_CUR1
  for DCC.CRT_MAJOR_REPORT_CUR1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_ORGAN
prompt ==========================
prompt
create or replace synonym EAM2.CRT_ORGAN
  for DCC.CRT_ORGAN@JIC_EDW_122;

prompt
prompt Creating synonym CRT_ORG_EMPLOEE
prompt ================================
prompt
create or replace synonym EAM2.CRT_ORG_EMPLOEE
  for DCC.CRT_ORG_EMPLOEE@JIC_EDW_122;

prompt
prompt Creating synonym CRT_PRE_AMT_MAX
prompt ================================
prompt
create or replace synonym EAM2.CRT_PRE_AMT_MAX
  for DCC.CRT_PRE_AMT_MAX@JIC_EDW_122;

prompt
prompt Creating synonym CRT_RISK_INFO
prompt ==============================
prompt
create or replace synonym EAM2.CRT_RISK_INFO
  for DCC.CRT_RISK_INFO@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_PRE_AMT
prompt ================================
prompt
create or replace synonym EAM2.CRT_SIX_PRE_AMT
  for DCC.CRT_SIX_PRE_AMT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_PRE_AMT_MAX
prompt ====================================
prompt
create or replace synonym EAM2.CRT_SIX_PRE_AMT_MAX
  for DCC.CRT_SIX_PRE_AMT_MAX@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_PRE_AMT_MAX1
prompt =====================================
prompt
create or replace synonym EAM2.CRT_SIX_PRE_AMT_MAX1
  for DCC.CRT_SIX_PRE_AMT_MAX1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_PRE_AMT_MAX2
prompt =====================================
prompt
create or replace synonym EAM2.CRT_SIX_PRE_AMT_MAX2
  for DCC.CRT_SIX_PRE_AMT_MAX2@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_REPORT
prompt ===============================
prompt
create or replace synonym EAM2.CRT_SIX_REPORT
  for DCC.CRT_SIX_REPORT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_REPORT_CUR
prompt ===================================
prompt
create or replace synonym EAM2.CRT_SIX_REPORT_CUR
  for DCC.CRT_SIX_REPORT_CUR@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_REPORT_CUR1
prompt ====================================
prompt
create or replace synonym EAM2.CRT_SIX_REPORT_CUR1
  for DCC.CRT_SIX_REPORT_CUR1@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_REPORT_CUR_NEW
prompt =======================================
prompt
create or replace synonym EAM2.CRT_SIX_REPORT_CUR_NEW
  for DCC.CRT_SIX_REPORT_CUR_NEW@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SIX_REPORT_CUR_WT
prompt ======================================
prompt
create or replace synonym EAM2.CRT_SIX_REPORT_CUR_WT
  for DCC.CRT_SIX_REPORT_CUR_WT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SUBJECT
prompt ============================
prompt
create or replace synonym EAM2.CRT_SUBJECT
  for DCC.CRT_SUBJECT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_SUM_AMT
prompt ============================
prompt
create or replace synonym EAM2.CRT_SUM_AMT
  for DCC.CRT_SUM_AMT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_TOTAL_ACCOUNT
prompt ==================================
prompt
create or replace synonym EAM2.CRT_TOTAL_ACCOUNT
  for DCC.CRT_TOTAL_ACCOUNT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_TRADE_REPORT
prompt =================================
prompt
create or replace synonym EAM2.CRT_TRADE_REPORT
  for DCC.CRT_TRADE_REPORT@JIC_EDW_122;

prompt
prompt Creating synonym CRT_TRADE_REPORT_CUR
prompt =====================================
prompt
create or replace synonym EAM2.CRT_TRADE_REPORT_CUR
  for DCC.CRT_TRADE_REPORT_CUR@JIC_EDW_122;

prompt
prompt Creating synonym ETL_LOG
prompt ========================
prompt
create or replace synonym EAM2.ETL_LOG
  for DCC.ETL_LOG@JIC_EDW_122;

prompt
prompt Creating synonym SEC_RESOURCE_DIR
prompt =================================
prompt
create or replace synonym EAM2.SEC_RESOURCE_DIR
  for DCC.SEC_RESOURCE_DIR@JIC_EDW_122;

prompt
prompt Creating function ACCOUNT_NUMBER
prompt ================================
prompt
create or replace function eam2.account_number(opertionkey in varchar2) return
 varchar2  is Result varchar2(200);
 --��ERP�еķ�������ת����EAMϵͳ������
begin
  if (opertionkey = '�����֧��') then
     Result := '����Ԥ���';
     elsif (opertionkey = '������') then
    Result := 'ҵ������';
     elsif (opertionkey = '���·�') then
    Result := 'ҵ������';
     elsif (opertionkey = 'Ӫ����--���÷�' or opertionkey = 'Ӫ����--��ֵ�׺�Ʒ' or  opertionkey ='Ӫ����--�����'
      or opertionkey ='Ӫ����--�鱨���Ϸ�' or opertionkey ='Ӫ����--������' or opertionkey ='Ӫ����--ӡˢ��'
      or opertionkey ='Ӫ����--�ʵ��' or opertionkey ='Ӫ����--�д���' or opertionkey ='Ӫ����-���÷�'
      or opertionkey ='Ӫ����-��ֵ�׺�Ʒ' or opertionkey ='Ӫ����-���ӷ�' or opertionkey ='Ӫ����-�����'
      or opertionkey ='Ӫ����-����ҵ���' or opertionkey ='Ӫ����-�鱨���Ϸ�' or opertionkey ='Ӫ����-�ʵ��'
      or opertionkey ='Ӫ����-�д���') then
    Result := 'ҵ������';
     elsif (opertionkey = '�Ʋ����շ�' or opertionkey = '����Ʋ����շ�') then
    Result := 'ҵ������';
     elsif (opertionkey = '������������ǿ����' or opertionkey = '�ʵ��') then
    Result := 'ҵ������';
     elsif (opertionkey = 'ӡˢ��') then
    Result := 'ҵ������';
     elsif (opertionkey = '���÷�') then
    Result := 'ҵ������';
     elsif (opertionkey = '�����') then
    Result := 'ҵ������';
     elsif (opertionkey = '�鱨���Ϸ�') then
    Result := 'ҵ������';
     elsif (opertionkey = '��������·��' or opertionkey = '������������ǿ����' or opertionkey = '����������'
     or opertionkey = '������·��' or opertionkey = 'ҵ���ó���') then
    Result := 'ҵ������';
     elsif (opertionkey = '���������' or opertionkey = '�����') then
    Result := 'ҵ������';
     elsif (opertionkey = '������') then
    Result := 'ҵ������';
     elsif (opertionkey = '��ѯ��') then
    Result := 'ҵ������';
     elsif (opertionkey = '��ְ�����') then
    Result := 'ҵ������';
     elsif (opertionkey = '������ʦ��' or opertionkey = '��ʦ��') then
    Result := 'ҵ������';
    elsif (opertionkey = '�������Ϸ�' or opertionkey = '���Ϸ�') then
    Result := 'ҵ������';
     elsif (opertionkey = '��֤��') then
    Result := 'ҵ������';
     elsif (opertionkey = '��Ʒ�') then
    Result := 'ҵ������';
     elsif (opertionkey = '������') then
    Result := 'ҵ������';
     elsif (opertionkey = '����') then
    Result := 'ҵ������';
     elsif (opertionkey = 'ˮ���') then
    Result := 'ҵ������';
     elsif (opertionkey = '������ҵ�����' or opertionkey = '��ҵ��') then
    Result := 'ҵ������';
     elsif (opertionkey = '�̻���') then
    Result := 'ҵ������';
     elsif (opertionkey = '���ӷ�') then
    Result := 'ҵ������';
     elsif (opertionkey = '������ʹ��˰') then
    Result := 'ҵ������';
     elsif (opertionkey = '����������ʹ��˰' or opertionkey = '��������ʹ��˰') then
    Result := 'ҵ������';
     elsif (opertionkey = '������˰' or opertionkey = '�����ɷ���˰') then
    Result := 'ҵ������';
     elsif (opertionkey = '����ӡ��˰') then
    Result := 'ҵ������';
     elsif (opertionkey = '����ͨ�ŷ�') then
    Result := 'ҵ������';
     elsif (opertionkey = '�����') then
    Result := 'ҵ������';
    elsif (opertionkey = '��ȫ������') then
    Result := 'ҵ������';
     elsif (opertionkey = '��������˰��') then
    Result := 'ҵ������';
     elsif (opertionkey = '���»��') then
    Result := 'ҵ������';
     elsif (opertionkey = '������豸��ת��') then
    Result := 'ҵ������';
     elsif (opertionkey = '���������豸��ת��') then
    Result := 'ҵ������';
     elsif (opertionkey = '�����������' or opertionkey = '���޷�') then
    Result := 'ҵ������';
     elsif (opertionkey = '���Ź���ͨ����') then
    Result := 'ҵ������';
     elsif (opertionkey = '��������ҵ��֧��' or opertionkey = '����ҵ���') then
    Result := 'ҵ������';
     elsif (opertionkey = '���������' or opertionkey = '����������������') then
    Result := 'ҵ������';
     elsif (opertionkey = '������') then
    Result := 'ҵ������';
     elsif (opertionkey = '�������̶��ʲ�ԭֵ��������������') then
    Result := '�ʱ���֧��';
     elsif (opertionkey = '��������˰' or opertionkey = '�����ز���֤�ѣ�˰�ѣ�'
     or opertionkey = '������˰' or opertionkey = '�̶��ʲ���֤֧��') then
    Result := '�ʱ���֧��';
   else
     Result := '';
  end if;
  return(Result);
end account_number;
/

prompt
prompt Creating function ACCOUNT_TYPE
prompt ==============================
prompt
create or replace function eam2.account_type(opertionkey in varchar2) return
 varchar2  is Result varchar2(200);
 --��ERP�еķ�������ת����EAMϵͳ������
begin
  if (opertionkey = '�����֧��') then
     Result := '�����֧��';
     elsif (opertionkey = '������') then
    Result := '������';
     elsif (opertionkey = '���·�') then
    Result := '���·�';
     elsif (opertionkey = 'Ӫ����--���÷�' or opertionkey = 'Ӫ����--��ֵ�׺�Ʒ' or  opertionkey ='Ӫ����--�����'
      or opertionkey ='Ӫ����--�鱨���Ϸ�' or opertionkey ='Ӫ����--������' or opertionkey ='Ӫ����--ӡˢ��'
      or opertionkey ='Ӫ����--�ʵ��' or opertionkey ='Ӫ����--�д���' or opertionkey ='Ӫ����-���÷�'
      or opertionkey ='Ӫ����-��ֵ�׺�Ʒ' or opertionkey ='Ӫ����-���ӷ�' or opertionkey ='Ӫ����-�����'
      or opertionkey ='Ӫ����-����ҵ���' or opertionkey ='Ӫ����-�鱨���Ϸ�' or opertionkey ='Ӫ����-�ʵ��'
      or opertionkey ='Ӫ����-�д���') then
    Result := 'Ӫ����';
     elsif (opertionkey = '������������ǿ����' or opertionkey = '�Ʋ����շ�' or opertionkey = '����Ʋ����շ�') then
    Result := '�Ʋ����շ�';
     elsif (opertionkey = '�ʵ��') then
    Result := '�ʵ��';
     elsif (opertionkey = 'ӡˢ��') then
    Result := 'ӡˢ��';
     elsif (opertionkey = '���÷�') then
    Result := '���÷�';
     elsif (opertionkey = '�����') then
    Result := '�����';
     elsif (opertionkey = '�鱨���Ϸ�') then
    Result := '�鱨���Ϸ�';
     elsif (opertionkey = '��������·��' or opertionkey = '����������'
     or opertionkey = '������·��' or opertionkey = 'ҵ���ó���') then
    Result := 'ҵ���ó���';
     elsif (opertionkey = '���������' or opertionkey = '�����') then
    Result := '�����';
     elsif (opertionkey = '������') then
    Result := '������';
     elsif (opertionkey = '��ѯ��') then
    Result := '��ѯ��';
     elsif (opertionkey = '��ְ�����') then
    Result := '��ְ�����';
     elsif (opertionkey = '������ʦ��' or opertionkey = '��ʦ��') then
    Result := '��ʦ��';
    elsif (opertionkey = '�������Ϸ�' or opertionkey = '���Ϸ�') then
    Result := '���Ϸ�';
     elsif (opertionkey = '��֤��') then
    Result := '��֤��';
     elsif (opertionkey = '��Ʒ�') then
    Result := '��Ʒ�';
     elsif (opertionkey = '������') then
    Result := '������';
     elsif (opertionkey = '����') then
    Result := '����';
     elsif (opertionkey = 'ˮ���') then
    Result := 'ˮ���';
     elsif (opertionkey = '������ҵ�����' or opertionkey = '��ҵ��') then
    Result := '��ҵ��';
     elsif (opertionkey = '�̻���') then
    Result := '�̻���';
     elsif (opertionkey = '���ӷ�') then
    Result := '���ӷ�';
     elsif (opertionkey = '������ʹ��˰') then
    Result := '����ʹ��˰';
     elsif (opertionkey = '����������ʹ��˰' or opertionkey = '��������ʹ��˰') then
    Result := '����ʹ��˰';
     elsif (opertionkey = '������˰' or opertionkey = '�����ɷ���˰') then
    Result := '����˰';
     elsif (opertionkey = '����ӡ��˰') then
    Result := 'ӡ��˰';
     elsif (opertionkey = '����ͨ�ŷ�') then
    Result := '����ͨ�ŷ�';
     elsif (opertionkey = '�����') then
    Result := '�����';
    elsif (opertionkey = '��ȫ������') then
    Result := '��ȫ������';
     elsif (opertionkey = '��������˰��') then
    Result := '����˰��';
     elsif (opertionkey = '���»��') then
    Result := '���»��';
     elsif (opertionkey = '������豸��ת��') then
    Result := '������豸��ת��';
     elsif (opertionkey = '���������豸��ת��') then
    Result := '���������豸��ת��';
     elsif (opertionkey = '�����������' or opertionkey = '���޷�') then
    Result := '���޷�';
     elsif (opertionkey = '���Ź���ͨ����') then
    Result := '��ͨ����';
     elsif (opertionkey = '��������ҵ��֧��' or opertionkey = '����ҵ���') then
    Result := '����ҵ���';
     elsif (opertionkey = '���������' or opertionkey = '����������������') then
    Result := '���������';
     elsif (opertionkey = '������') then
    Result := '������֧��';
     elsif (opertionkey = '�������̶��ʲ�ԭֵ��������������') then
    Result := 'װ�޸���';
     elsif (opertionkey = '��������˰' or opertionkey = '�����ز���֤�ѣ�˰�ѣ�'
     or opertionkey = '������˰' or opertionkey = '�̶��ʲ���֤֧��') then
    Result := 'ȷȨ����';
   else
     Result := '';
  end if;
  return(Result);
end account_type;
/

prompt
prompt Creating function EXPENSE_USERNAME
prompt ==================================
prompt
create or replace function eam2.expense_username(inputcode in varchar2) return
 varchar2  is Result varchar2(200);
begin
  select t.user_password into Result from erp.erp_sm_user t where t.cuserid = trim(inputcode);
     return(Result);
end expense_username;
/

prompt
prompt Creating function SEQ_EXPENSE_ID
prompt ================================
prompt
create or replace function eam2.seq_expense_id return number is
  Result number;
begin
  select seq_expense.nextval into Result from dual;
  return(Result);
end seq_expense_id;
/

prompt
prompt Creating procedure INSERT_ACCOUNT_EXPENSE
prompt =========================================
prompt
create or replace procedure eam2.insert_account_expense is
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

prompt
prompt Creating procedure EAMTOCZBTEST
prompt ===============================
prompt
create or replace procedure eam2.eamtoczbtest is
begin
  INSERT_ACCOUNT_EXPENSE;
end eamtoczbtest;
/

prompt
prompt Creating trigger CARD_ASSET_ASSHISTORY
prompt ======================================
prompt
create or replace trigger "EAM2".card_asset_asshistory
  before insert on card_asset_history
  for each row
declare
  -- local variables here
begin
  select sys_guid() into:new.id from DUAL;
end card_asset_asshistory;
/

prompt
prompt Creating trigger QY_DEBT_ASSINFO
prompt ================================
prompt
create or replace trigger "EAM2".QY_DEBT_ASSINFO
  before insert on qy_debt_info
  for each row
declare
  -- local variables here
begin
  select SEQ_debt_info.Nextval into:new.id from DUAL;
end QY_DEBT_ASSINFO;
/

prompt
prompt Creating trigger QY_SS_ASSASEINFO
prompt =================================
prompt
create or replace trigger "EAM2".QY_SS_ASSASEINFO
  before insert on qy_ss_baseinfo
  for each row
declare
  -- local variables here
begin
  select sys_guid() into:new.id from DUAL;
end QY_SS_ASSASEINFO;
/

prompt
prompt Creating trigger QY_ST_ASSFSXX
prompt ==============================
prompt
create or replace trigger "EAM2".qy_st_assfsxx
  before insert on qy_st_fsxx
  for each row
declare
  -- local variables here
begin
   SELECT sys_guid() INTO :NEW.id FROM DUAL;
end qy_st_assfsxx;
/

prompt
prompt Creating trigger QY_ST_SKJN_ASSXX
prompt =================================
prompt
create or replace trigger "EAM2".QY_ST_SKJN_ASSXX
  before insert on qy_st_skjn_xx
  for each row
declare
  -- local variables here
begin
  select sys_guid() into:new.id from DUAL;
end QY_ST_SKJN_ASSXX;
/

prompt
prompt Creating trigger TIB_DIC_APP_ASSETTYPE1
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER "EAM2"."TIB_DIC_APP_ASSETTYPE1" BEFORE INSERT
ON DIC_APP_ASSETTYPE1 FOR EACH ROW
BEGIN
    SELECT SEQ_DIC_APP_ASSETTYPE1.NEXTVAL INTO :NEW.assettype1_id FROM DUAL;
END;
/

prompt
prompt Creating trigger TIB_DIC_APP_ASSETTYPE2
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER "EAM2"."TIB_DIC_APP_ASSETTYPE2" BEFORE INSERT
ON DIC_APP_ASSETTYPE2 FOR EACH ROW
BEGIN
    SELECT SEQ_DIC_APP_ASSETTYPE2.NEXTVAL INTO :NEW.assettype2_id FROM DUAL;
END;
/

prompt
prompt Creating trigger TIB_DIC_APP_ASSETTYPE3
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER "EAM2"."TIB_DIC_APP_ASSETTYPE3" BEFORE INSERT
ON DIC_APP_ASSETTYPE3 FOR EACH ROW
BEGIN
    SELECT SEQ_DIC_APP_ASSETTYPE3.NEXTVAL INTO :NEW.assettype3_id FROM DUAL;
END;
/

prompt
prompt Creating trigger TIB_DIC_STOCK_SDZMZ_XX
prompt =======================================
prompt
create or replace trigger "EAM2".TIB_DIC_STOCK_SDZMZ_XX
  before insert on stock_sdzmz_xx
  for each row
begin
   SELECT SEQ_DIC_STORCK_ID.NEXTVAL INTO :NEW.ID FROM DUAL;
end TIB_DIC_STOCK_SDZMZ_XX;
/


spool off
