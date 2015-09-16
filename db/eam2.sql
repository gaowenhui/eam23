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
  is '单据类型';
comment on column EAM2.ACCOUNT_EXPENSE.DJRQ
  is '单据日期';
comment on column EAM2.ACCOUNT_EXPENSE.COSTNAME
  is '收支项目';
comment on column EAM2.ACCOUNT_EXPENSE.DEPTNAME
  is '部门';
comment on column EAM2.ACCOUNT_EXPENSE.YBJE
  is '原币金额';
comment on column EAM2.ACCOUNT_EXPENSE.FBJE
  is '辅币金额';
comment on column EAM2.ACCOUNT_EXPENSE.BBJE
  is '本币金额';
comment on column EAM2.ACCOUNT_EXPENSE.ZY
  is '摘要';
comment on column EAM2.ACCOUNT_EXPENSE.JFYBJE
  is '借方原币金额';
comment on column EAM2.ACCOUNT_EXPENSE.JFFBJE
  is '借方辅币金额';
comment on column EAM2.ACCOUNT_EXPENSE.JFBBJE
  is '借方本币金额';
comment on column EAM2.ACCOUNT_EXPENSE.YBYE
  is '原币余额';
comment on column EAM2.ACCOUNT_EXPENSE.FBYE
  is '辅币余额';
comment on column EAM2.ACCOUNT_EXPENSE.BBYE
  is '本币余额';
comment on column EAM2.ACCOUNT_EXPENSE.CARDCODE
  is '卡片编号';
comment on column EAM2.ACCOUNT_EXPENSE.JBR
  is '经办人';
comment on column EAM2.ACCOUNT_EXPENSE.LRR
  is '录入人';
comment on column EAM2.ACCOUNT_EXPENSE.SHR
  is '审核人';
comment on column EAM2.ACCOUNT_EXPENSE.ACCOUNTTYPE
  is '费用项目';
comment on column EAM2.ACCOUNT_EXPENSE.ACCOUNTNUMBER
  is '费用种类';
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
  is '机器设备核查评估信息（2010）AE_Machine_Equipment';
comment on column EAM2.AE_MACHINE_EQUIPMENT.LRSJ
  is '录入时间';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZC_ID
  is '资产ID';
comment on column EAM2.AE_MACHINE_EQUIPMENT.KPBH
  is '卡片编号';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SHULIANG
  is '数量';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CFDD
  is '存放地点';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFZC
  is '正常(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFXZ
  is '闲置(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFTT
  is '淘汰(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFDBF
  is '待报废(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.JHZY
  is '建行租用(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.QTDSFZY
  is '其他第三方租用(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.WCZY
  is '无偿占用(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.XSSYZ
  is '现时使用者';
comment on column EAM2.AE_MACHINE_EQUIPMENT.XSSYZDZ
  is '现时使用者地址';
comment on column EAM2.AE_MACHINE_EQUIPMENT.WCZYQKSM
  is '纠纷、抵押、诉讼、无偿占用情况说明';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFPY
  is '盘盈(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.PYYY
  is '盘盈原因';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFPK
  is '盘亏(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.PKYY
  is '盘亏原因';
comment on column EAM2.AE_MACHINE_EQUIPMENT.TYBS
  is '退役不实(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.TYBSYY
  is '退役不实原因';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFYCZ
  is '已处置(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZYRFDDZ
  is '租用人法定地址';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFYZLHT
  is '是否有租赁合同(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZLHTXH
  is '租赁合同序号';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZLHTQSRQ
  is '租赁合同起始日期';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZLQ
  is '租赁期(月)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.YZJJG
  is '月租金价格(元/月)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZSJ
  is '处置时间(年/月)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.YUANZHI
  is '原值(当月账面价值）';
comment on column EAM2.AE_MACHINE_EQUIPMENT.JINGE
  is '净额(当月账面价值）';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZHT
  is '处置合同(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.HTBH
  is '合同编号';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZSR
  is '处置收入';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZFY
  is '处置费用';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZSY
  is '处置损益';
comment on column EAM2.AE_MACHINE_EQUIPMENT.CZHSFJSRZ
  is '处置后是否及时入账(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.WRZYY
  is '已处置未入账的原因';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFJF
  is '是否纠纷(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFDY
  is '是否抵押(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.SFSS
  is '是否诉讼(是/否)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.GZRQ
  is '购置日期';
comment on column EAM2.AE_MACHINE_EQUIPMENT.QYRQ
  is '启用日期';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMYZ
  is '原值（账面价值）';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMJZ
  is '净值（账面价值）';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMJZZB
  is '减值准备（账面价值)';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZMJE
  is '净额（账面价值）';
comment on column EAM2.AE_MACHINE_EQUIPMENT.ZCGLJY
  is '资产管理建议';
comment on column EAM2.AE_MACHINE_EQUIPMENT.BEIZHU
  is '备注';
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
  is '房地产核查评估信息（2010）AE_Real_Estate(Audit estimate)';
comment on column EAM2.AE_REAL_ESTATE.ID
  is 'ID';
comment on column EAM2.AE_REAL_ESTATE.LRSJ
  is '录入时间';
comment on column EAM2.AE_REAL_ESTATE.ZC_ID
  is '资产ID';
comment on column EAM2.AE_REAL_ESTATE.KPBH
  is '卡片编号';
comment on column EAM2.AE_REAL_ESTATE.DYLB
  is '地域类别';
comment on column EAM2.AE_REAL_ESTATE.FDHYYBZ
  is '房地合一已办证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FWYBZ
  is '房屋已办证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TDYBZ
  is '土地已办证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.CQZNFBB
  is '没有产权证能否补办(是/否)';
comment on column EAM2.AE_REAL_ESTATE.PDLY
  is '判断理由';
comment on column EAM2.AE_REAL_ESTATE.FCZSYQR
  is '房产证所有权人';
comment on column EAM2.AE_REAL_ESTATE.FCZH
  is '房产证号';
comment on column EAM2.AE_REAL_ESTATE.FCZTDWJ
  is '房产证替代文件';
comment on column EAM2.AE_REAL_ESTATE.FWQSYXWJ
  is '房屋权属文件无有效文件(有/无)';
comment on column EAM2.AE_REAL_ESTATE.FWQSJF
  is '房屋权属文件是否纠纷(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FWQSDY
  is '房屋权属文件是否抵押(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FWQSSS
  is '房屋权属文件是否诉讼(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TDZSYQR
  is '土地证使用权人';
comment on column EAM2.AE_REAL_ESTATE.TDZH
  is '土地证号';
comment on column EAM2.AE_REAL_ESTATE.TDQSTDWJ
  is '土地权属文件替代文件
替代文件';
comment on column EAM2.AE_REAL_ESTATE.TDQSYXWJ
  is '土地权属文件无有效文件(有/无)';
comment on column EAM2.AE_REAL_ESTATE.TDQSSFJF
  is '土地权属文件是否纠纷(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TDQSSFDY
  is '土地权属文件是否抵押(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TDQSSFSS
  is '土地权属文件是否诉讼(是/否)';
comment on column EAM2.AE_REAL_ESTATE.WTD
  is '无土地(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SYZKZC
  is '资产使用状况正常(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SYZKXZ
  is '资产使用状况闲置(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SYZKKD
  is '资产使用状况空地(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SYZKJHZY
  is '资产使用状况建行租用(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SYZKDSFZY
  is '资产使用状况其他第三方租用(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SYZKWCZY
  is '资产使用状况无偿占用(是/否)';
comment on column EAM2.AE_REAL_ESTATE.XSYZ
  is '现时使用者';
comment on column EAM2.AE_REAL_ESTATE.XSYDZ
  is '现时使用者地址';
comment on column EAM2.AE_REAL_ESTATE.ZJGCYSY
  is '在建工程状况已使用(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZJGCZC
  is '在建工程状况正常(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZJGCTJ
  is '在建工程状况停建(是/否)';
comment on column EAM2.AE_REAL_ESTATE.CQDTXCRQ
  is '长期待摊费用形成日期';
comment on column EAM2.AE_REAL_ESTATE.CQDTYSFSE
  is '长期待摊费用原始发生额';
comment on column EAM2.AE_REAL_ESTATE.CQDTYJTXYF
  is '长期待摊费用预计摊销月数';
comment on column EAM2.AE_REAL_ESTATE.CQDTSCSYYS
  is '长期待摊费用尚存受益月数';
comment on column EAM2.AE_REAL_ESTATE.QKSM
  is '纠纷、抵押、诉讼、无偿占用情况说明';
comment on column EAM2.AE_REAL_ESTATE.ZFFLTJ
  is '主辅分离统计(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FDFLTJ
  is '房地分离统计(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZYRFDDZ
  is '租用人法定地址';
comment on column EAM2.AE_REAL_ESTATE.ZYMJ
  is '租用面积(平方米)';
comment on column EAM2.AE_REAL_ESTATE.SFYZLHT
  is '是否有租赁合同(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZLHTXH
  is '租赁合同序号';
comment on column EAM2.AE_REAL_ESTATE.BFZL
  is '部分租赁(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZLHTQSRQ
  is '租赁合同起始日期';
comment on column EAM2.AE_REAL_ESTATE.ZLQ
  is '租赁期(月)';
comment on column EAM2.AE_REAL_ESTATE.YZJJG
  is '月租金价格(元/月/平方米)';
comment on column EAM2.AE_REAL_ESTATE.ZJJGHWYF
  is '租金价格是否含物业费(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TLFWZJJG
  is '当地同类房屋、土地的租金价格(元/月/平方米)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL1ZJ
  is '租金案例1租金(元/月/平方米)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL1NAME
  is '租金案例1案例名称';
comment on column EAM2.AE_REAL_ESTATE.ZJAL2ZJ
  is '租金案例2租金(元/月/平方米)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL2NAME
  is '租金案例2案例名称';
comment on column EAM2.AE_REAL_ESTATE.ZJAL3ZJ
  is '租金案例3租金(元/月/平方米)';
comment on column EAM2.AE_REAL_ESTATE.ZJAL3NAME
  is '租金案例3案例名称';
comment on column EAM2.AE_REAL_ESTATE.NPJZJ
  is '年平均租金(元/年)';
comment on column EAM2.AE_REAL_ESTATE.ZJSYL
  is '租金收益率(年租金/资产账面原值)';
comment on column EAM2.AE_REAL_ESTATE.ZJSFAQZF
  is '租金是否按期支付(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SFPY
  is '盘盈(是/否)';
comment on column EAM2.AE_REAL_ESTATE.PYYY
  is '盘盈原因';
comment on column EAM2.AE_REAL_ESTATE.SFPK
  is '盘亏(是/否)';
comment on column EAM2.AE_REAL_ESTATE.PKYY
  is '盘亏原因';
comment on column EAM2.AE_REAL_ESTATE.TYBS
  is '退役不实(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TYBSYY
  is '退役不实原因';
comment on column EAM2.AE_REAL_ESTATE.YCZ
  is '已处置(是/否)';
comment on column EAM2.AE_REAL_ESTATE.JSGT
  is '仅剩公摊(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZXF
  is '装修费(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FCQSYQFCTD
  is '非长期使用权的房产或土地(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FDDZCXZZCQT
  is '非固定资产性质资产其他(是/否)';
comment on column EAM2.AE_REAL_ESTATE.BGYY
  is '办公营业(是/否)';
comment on column EAM2.AE_REAL_ESTATE.SUSHE
  is '宿舍(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FWYTQT
  is '房屋用途其他(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TDGHYT
  is '土地规划用途';
comment on column EAM2.AE_REAL_ESTATE.TDSJYT
  is '土地实际用途';
comment on column EAM2.AE_REAL_ESTATE.CZSJ
  is '处置时间(年/月)';
comment on column EAM2.AE_REAL_ESTATE.CZDYZMYZ
  is '资产处置当月账面价值原值';
comment on column EAM2.AE_REAL_ESTATE.CZDYZMJZ
  is '资产处置当月账面价值净额';
comment on column EAM2.AE_REAL_ESTATE.CZHT
  is '处置合同(是/否)';
comment on column EAM2.AE_REAL_ESTATE.HTBH
  is '合同编号';
comment on column EAM2.AE_REAL_ESTATE.CZSR
  is '处置收入';
comment on column EAM2.AE_REAL_ESTATE.CZFY
  is '处置费用';
comment on column EAM2.AE_REAL_ESTATE.CZSY
  is '处置损益';
comment on column EAM2.AE_REAL_ESTATE.CSHSFRZ
  is '处置后是否及时入账(是/否)';
comment on column EAM2.AE_REAL_ESTATE.YCZWRZYY
  is '已处置未入账的原因';
comment on column EAM2.AE_REAL_ESTATE.FCS
  is '房产税(元/年)';
comment on column EAM2.AE_REAL_ESTATE.CZTDSYS
  is '城镇土地使用税(元/年)';
comment on column EAM2.AE_REAL_ESTATE.QTFYMC
  is '其他费用名称';
comment on column EAM2.AE_REAL_ESTATE.QTFYJE
  is '其他费用金额(元/年)';
comment on column EAM2.AE_REAL_ESTATE.JZRSF
  is '居住人身份';
comment on column EAM2.AE_REAL_ESTATE.SFJZJ
  is '是否交租金(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZJSQF
  is '租金收取方';
comment on column EAM2.AE_REAL_ESTATE.SFYFCZ
  is '是否有房产证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.FCZSYR
  is '房产证所有人';
comment on column EAM2.AE_REAL_ESTATE.NFGH
  is '能否过户(是/否)';
comment on column EAM2.AE_REAL_ESTATE.BNGHYY
  is '不能过户原因';
comment on column EAM2.AE_REAL_ESTATE.GHTDCRJ
  is '过户应缴纳土地出让金';
comment on column EAM2.AE_REAL_ESTATE.GHGGWXJJ
  is '过户应缴纳欠缴公共维修基金金额';
comment on column EAM2.AE_REAL_ESTATE.GHWYGLF
  is '过户应缴纳物业管理费';
comment on column EAM2.AE_REAL_ESTATE.GHQTQJFMC
  is '过户应缴纳其他欠缴费用名称';
comment on column EAM2.AE_REAL_ESTATE.GHQTQJFJE
  is '过户应缴纳其他欠缴费用金额';
comment on column EAM2.AE_REAL_ESTATE.GHYJNFYHJ
  is '过户应缴纳费用合计';
comment on column EAM2.AE_REAL_ESTATE.GMYX
  is '购买意向(是/否)';
comment on column EAM2.AE_REAL_ESTATE.GMFS
  is '购买方式';
comment on column EAM2.AE_REAL_ESTATE.YXGMJYSCBL
  is '意向购买价与市价比例%';
comment on column EAM2.AE_REAL_ESTATE.DDZFZC
  is '当地住房政策';
comment on column EAM2.AE_REAL_ESTATE.SSCZJY
  is '宿舍处置建议';
comment on column EAM2.AE_REAL_ESTATE.ZXDCKD
  is '专项调查的空地(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZTZZC
  is '再投资资产(是/否)';
comment on column EAM2.AE_REAL_ESTATE.JCRQ
  is '建成日期(年/月)';
comment on column EAM2.AE_REAL_ESTATE.FWJIEGOU
  is '结构';
comment on column EAM2.AE_REAL_ESTATE.FWYG
  is '檐高(米)';
comment on column EAM2.AE_REAL_ESTATE.FWBZCG
  is '标准层高(米)';
comment on column EAM2.AE_REAL_ESTATE.FWZCS
  is '总层数';
comment on column EAM2.AE_REAL_ESTATE.FWZLDJC
  is '坐落在第几层';
comment on column EAM2.AE_REAL_ESTATE.FWFJH
  is '房间号';
comment on column EAM2.AE_REAL_ESTATE.JZMJ
  is '建筑面积(M2)';
comment on column EAM2.AE_REAL_ESTATE.HSHJZMJ
  is '核实后面积(平方米)';
comment on column EAM2.AE_REAL_ESTATE.FWCBDJ
  is '成本单价(元/M2)';
comment on column EAM2.AE_REAL_ESTATE.JIEGOU
  is '结构
结构';
comment on column EAM2.AE_REAL_ESTATE.GGCC
  is '规格尺寸';
comment on column EAM2.AE_REAL_ESTATE.JLDW
  is '计量单位';
comment on column EAM2.AE_REAL_ESTATE.SHULINAG
  is '数量';
comment on column EAM2.AE_REAL_ESTATE.CBDJ
  is '成本单价';
comment on column EAM2.AE_REAL_ESTATE.JCSJ
  is '建成时间(年/月)';
comment on column EAM2.AE_REAL_ESTATE.YDXZSFCR
  is '用地性质出让(是/否)';
comment on column EAM2.AE_REAL_ESTATE.YDXZSFHB
  is '用地性质划拨(是/否)';
comment on column EAM2.AE_REAL_ESTATE.YDXZQT
  is '用地性质其他(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TDQDRQ
  is '土地取得日期(年/月)';
comment on column EAM2.AE_REAL_ESTATE.TDZYNX
  is '土地准用年限';
comment on column EAM2.AE_REAL_ESTATE.TDSYSYNX
  is '土地剩余使用年限';
comment on column EAM2.AE_REAL_ESTATE.TDKFCD
  is '土地开发程度';
comment on column EAM2.AE_REAL_ESTATE.TDMJ
  is '土地面积(平方米)';
comment on column EAM2.AE_REAL_ESTATE.TDHSHMJ
  is '土地核实后面积(平方米)';
comment on column EAM2.AE_REAL_ESTATE.TJGCSJYT
  is '土建工程设计用途';
comment on column EAM2.AE_REAL_ESTATE.TJGCJG
  is '土建工程结构';
comment on column EAM2.AE_REAL_ESTATE.TJGCCS
  is '土建工程层数';
comment on column EAM2.AE_REAL_ESTATE.TJGCJZMJ
  is '土建工程建筑面积(平方米)';
comment on column EAM2.AE_REAL_ESTATE.TJGCKGRQ
  is '土建工程开工日期(年/月)';
comment on column EAM2.AE_REAL_ESTATE.TJGCYJWGRQ
  is '土建工程预计完工日期(年/月)';
comment on column EAM2.AE_REAL_ESTATE.TJGCXXJD
  is '土建工程形象进度(%)';
comment on column EAM2.AE_REAL_ESTATE.TJGCFKBL
  is '土建工程付款比例(%)';
comment on column EAM2.AE_REAL_ESTATE.GJGCGSS
  is '土建工程概算数(元)';
comment on column EAM2.AE_REAL_ESTATE.TJGCTDCRHT
  is '土建工程土地出让合同(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TJGCYDXK
  is '土建工程建筑用地许可证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TJGCGHXK
  is '土建工程建筑规划许可证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TJGCKGXK
  is '土建工程建筑开工许可证(是/否)';
comment on column EAM2.AE_REAL_ESTATE.TJGCJSFS
  is '土建工程结算方式';
comment on column EAM2.AE_REAL_ESTATE.ZMJZYZ
  is '账面价值原值';
comment on column EAM2.AE_REAL_ESTATE.ZMJZJZ
  is '账面价值净值';
comment on column EAM2.AE_REAL_ESTATE.ZMJZJZZB
  is '账面价值减值准备';
comment on column EAM2.AE_REAL_ESTATE.ZMJZJE
  is '账面价值净额';
comment on column EAM2.AE_REAL_ESTATE.CFHZMJZYZ
  is '拆分后账面价值原值';
comment on column EAM2.AE_REAL_ESTATE.CFHZMJZJZ
  is '拆分后账面价值净值';
comment on column EAM2.AE_REAL_ESTATE.CFHZMJZJZZB
  is '拆分后账面价值减值准备';
comment on column EAM2.AE_REAL_ESTATE.ZFHZMJZJE
  is '拆分后账面价值净额';
comment on column EAM2.AE_REAL_ESTATE.PGFF
  is '评估方法';
comment on column EAM2.AE_REAL_ESTATE.SCFWQCQJZYZ
  is '市场法完全产权价值原值';
comment on column EAM2.AE_REAL_ESTATE.SCFWQCQJZCXL
  is '市场法完全产权价值成新率%';
comment on column EAM2.AE_REAL_ESTATE.SCFWQCQJZJZ
  is '市场法完全产权价值净值';
comment on column EAM2.AE_REAL_ESTATE.XCZKHBD
  is '权属瑕疵折扣%(需要扣除的比例)划拨地';
comment on column EAM2.AE_REAL_ESTATE.XCZKWTDZ
  is '权属瑕疵折扣%(需要扣除的比例)无土地证';
comment on column EAM2.AE_REAL_ESTATE.XCZKWFCZ
  is '权属瑕疵折扣%(需要扣除的比例)无房产证';
comment on column EAM2.AE_REAL_ESTATE.XCZKCZJF
  is '权属瑕疵折扣%(需要扣除的比例)存在纠纷';
comment on column EAM2.AE_REAL_ESTATE.XCZKQT
  is '权属瑕疵折扣%(需要扣除的比例)其他';
comment on column EAM2.AE_REAL_ESTATE.DXZRZK
  is '评估价值定向转让折扣%';
comment on column EAM2.AE_REAL_ESTATE.QJSFJE
  is '评估价值欠缴税费金额(不含土地出让金)';
comment on column EAM2.AE_REAL_ESTATE.PGJZYZ
  is '评估价值原值';
comment on column EAM2.AE_REAL_ESTATE.PGJZCXL
  is '评估价值成新率%';
comment on column EAM2.AE_REAL_ESTATE.PGJZJZ
  is '评估价值净值';
comment on column EAM2.AE_REAL_ESTATE.JZZB
  is '减值准备';
comment on column EAM2.AE_REAL_ESTATE.ZZL
  is '增值率%';
comment on column EAM2.AE_REAL_ESTATE.PGDJ
  is '评估单价(元/平方米)';
comment on column EAM2.AE_REAL_ESTATE.SFXPG
  is '是否需要评估(是/否)';
comment on column EAM2.AE_REAL_ESTATE.ZCGLJY
  is '资产管理建议';
comment on column EAM2.AE_REAL_ESTATE.ZJCZYY
  is '择机处置的原因';
comment on column EAM2.AE_REAL_ESTATE.YCZZAYY
  is '有处置障碍的原因';
comment on column EAM2.AE_REAL_ESTATE.BEIZHU
  is '备注';
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
  is '车辆核查评估信息（2010）AE_Vehicle';
comment on column EAM2.AE_VEHICLE.LRSJ
  is '录入时间';
comment on column EAM2.AE_VEHICLE.ZC_ID
  is '资产ID';
comment on column EAM2.AE_VEHICLE.KPBH
  is '卡片编号';
comment on column EAM2.AE_VEHICLE.SHULIANG
  is '数量';
comment on column EAM2.AE_VEHICLE.SFZC
  is '正常(是/否)';
comment on column EAM2.AE_VEHICLE.SFXZ
  is '闲置(是/否)';
comment on column EAM2.AE_VEHICLE.SFTT
  is '淘汰(是/否)';
comment on column EAM2.AE_VEHICLE.SFDBF
  is '待报废(是/否)';
comment on column EAM2.AE_VEHICLE.JHZY
  is '建行租用(是/否)';
comment on column EAM2.AE_VEHICLE.QTDSFZY
  is '其他第三方租用(是/否)';
comment on column EAM2.AE_VEHICLE.WCZY
  is '无偿占用(是/否)';
comment on column EAM2.AE_VEHICLE.XSSYZ
  is '现时使用者

现时使用者';
comment on column EAM2.AE_VEHICLE.XSSYZDZ
  is '现时使用者地址';
comment on column EAM2.AE_VEHICLE.WCZYQKSM
  is '纠纷、抵押、诉讼、无偿占用情况说明';
comment on column EAM2.AE_VEHICLE.SFPY
  is '盘盈(是/否)';
comment on column EAM2.AE_VEHICLE.PYYY
  is '盘盈原因';
comment on column EAM2.AE_VEHICLE.SFPK
  is '盘亏(是/否)';
comment on column EAM2.AE_VEHICLE.PKYY
  is '盘亏原因';
comment on column EAM2.AE_VEHICLE.SFTYBS
  is '退役不实(是/否)';
comment on column EAM2.AE_VEHICLE.TYBSYY
  is '退役不实原因';
comment on column EAM2.AE_VEHICLE.SFYCZ
  is '已处置(是/否)';
comment on column EAM2.AE_VEHICLE.ZYRFDDZ
  is '租用人法定地址';
comment on column EAM2.AE_VEHICLE.SFYZLHT
  is '是否有租赁合同(是/否)';
comment on column EAM2.AE_VEHICLE.ZLHTXH
  is '租赁合同序号';
comment on column EAM2.AE_VEHICLE.ZLHTQSRQ
  is '租赁合同起始日期';
comment on column EAM2.AE_VEHICLE.ZLQ
  is '租赁期(月)';
comment on column EAM2.AE_VEHICLE.YZJJG
  is '月租金价格(元/月)';
comment on column EAM2.AE_VEHICLE.CZSJ
  is '处置时间';
comment on column EAM2.AE_VEHICLE.YUANZHI
  is '原值（资产处置当月账面价值）';
comment on column EAM2.AE_VEHICLE.JINGE
  is '净额（资产处置当月账面价值）';
comment on column EAM2.AE_VEHICLE.CZHT
  is '处置合同(是/否)';
comment on column EAM2.AE_VEHICLE.HTBH
  is '合同编号';
comment on column EAM2.AE_VEHICLE.CZSR
  is '处置收入';
comment on column EAM2.AE_VEHICLE.CZFY
  is '处置费用';
comment on column EAM2.AE_VEHICLE.CZSY
  is '处置损益';
comment on column EAM2.AE_VEHICLE.CZHSFJSRZ
  is '处置后是否及时入账(是/否)';
comment on column EAM2.AE_VEHICLE.WRZYY
  is '已处置未入账的原因';
comment on column EAM2.AE_VEHICLE.SFJF
  is '是否纠纷(是/否)';
comment on column EAM2.AE_VEHICLE.SFDY
  is '是否抵押(是/否)';
comment on column EAM2.AE_VEHICLE.SFSS
  is '是否诉讼(是/否)';
comment on column EAM2.AE_VEHICLE.QIJIAN
  is '期间';
comment on column EAM2.AE_VEHICLE.JINE
  is '金额';
comment on column EAM2.AE_VEHICLE.GZRQ
  is '购置日期';
comment on column EAM2.AE_VEHICLE.QYRQ
  is '启用日期';
comment on column EAM2.AE_VEHICLE.YXSLC
  is '已行驶里程(公里)';
comment on column EAM2.AE_VEHICLE.ZMYZ
  is '原值（账面价值）';
comment on column EAM2.AE_VEHICLE.ZMJZ
  is '净值（账面价值）';
comment on column EAM2.AE_VEHICLE.JZZB
  is '减值准备（账面价值）';
comment on column EAM2.AE_VEHICLE.ZMJE
  is '净额（账面价值）';
comment on column EAM2.AE_VEHICLE.ZCGLJY
  is '资产管理建议';
comment on column EAM2.AE_VEHICLE.BEIZHU
  is '备注';
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
  is '修改人ID';
comment on column EAM2.ASSET_CHANGE_LOG.PERSON_NAME
  is '修改人姓名';
comment on column EAM2.ASSET_CHANGE_LOG.UPDATEDATE
  is '修改时间';
comment on column EAM2.ASSET_CHANGE_LOG.UPDATETYPE
  is '修改类型 新增、修改';
comment on column EAM2.ASSET_CHANGE_LOG.UPOBJ_ID
  is '修改对象ID';
comment on column EAM2.ASSET_CHANGE_LOG.UPOBJCODE
  is '修改对象编号';
comment on column EAM2.ASSET_CHANGE_LOG.UPSHEET
  is '修改页签';
comment on column EAM2.ASSET_CHANGE_LOG.UPPROPER
  is '修改属性';
comment on column EAM2.ASSET_CHANGE_LOG.UPBEFOVALUE
  is '修改前值';
comment on column EAM2.ASSET_CHANGE_LOG.UPAFTERVALUE
  is '修改后值';
comment on column EAM2.ASSET_CHANGE_LOG.SUBSYS
  is '所属子系统';
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
  is '业务回款信息表';
comment on column EAM2.BIZ_BACK_CASH_INFO.BLBM
  is '回款确认的业务部门';
comment on column EAM2.BIZ_BACK_CASH_INFO.DZJE
  is '到账金额';
comment on column EAM2.BIZ_BACK_CASH_INFO.BLBMBH
  is '办理部门编号';
comment on column EAM2.BIZ_BACK_CASH_INFO.FBLSJ
  is '发办理时间';
comment on column EAM2.BIZ_BACK_CASH_INFO.LCMC
  is '流程名称';
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
  is '对应表头ID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.BZ0
  is '备注0_____________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_XMID
  is 'CZ_XM_XX 表ID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_XMBH
  is '处置项目编号';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_XMMC
  is '处置项目名称';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_SFWB
  is '是否处置完毕';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_CZSR
  is '（其中）处置收入';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_YKCZFY
  is '已扣除处置费用';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_FYCPJE
  is '处置费用超审批金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_CPQR
  is '超审批部分费用是否确认';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_SFJS
  is '处置税费是否已缴纳';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.CZ_BZ
  is '备注1_____________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_ID
  is '债券ID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_MC
  is '债券名称';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HSZJXZ
  is '债券本金回收款金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_DYYZ
  is '对应的原值金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HXSR
  is '是否有后续收入';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HXFY
  is '是否有后续费用';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_HSWB
  is '是否回收完毕';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZA_LXHSJE
  is '债券利息收入金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_LXQJ
  is '利息所属期间';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.ZQ_BZ
  is '备注2______________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QT_HSXZ
  is '其他业务_回收性质';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QT_BZ
  is '其他业务备注';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_ID
  is '实体ID';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_STBH
  is '实体编号';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_STMC
  is '实体名称';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_SF
  is '实体省份';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_HKXZ
  is '回款性质';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_HSXJJE
  is '回收现金金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_QLZT
  is '实体清理状态  CODE表';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.GQ_BZ
  is '备注4______________';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QS_PC
  is '清算批次';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.YSYFZJE
  is '应收/应付总金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.TZZJE
  is '调整总金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.THYSYFZJE
  is '调整后应收/应付总金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.SSZJE
  is '实收总金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.SSTZZJE
  is '实收调整总金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.THSSZJE
  is '调整后实收总金额';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.QRDLX
  is '确认单类型';
comment on column EAM2.BIZ_BACK_CONFIRM_BODY.SFYBC
  is '是否保存';
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
  is '各部门确认单的表头';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.CASHID
  is '对应回款信息表ID';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRBMBH
  is '确认部门编号';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRBMMC
  is '确认部门名称';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRRBH
  is '确认人编号';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRRMC
  is '确认人名称';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.BMFZRBH
  is '部门负责人编号';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.BMFZRMC
  is '部门负责人名称';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.ISBMHK
  is '是否本部门回款，1是0否 如果是的话需要填写下面的信息';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRDBH
  is '确认单编号';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRDLX
  is ' 确认单类型  CODE表';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.QRRQ
  is '确认日期';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.BZ0
  is '在回款确认阶段的备注';
comment on column EAM2.BIZ_BACK_CONFIRM_HEAD.SFZZHK
  is '是否为最终确认回款';
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
  is '卡片表';
comment on column EAM2.CARDINFO.ID
  is 'ID';
comment on column EAM2.CARDINFO.ZCID
  is '资产ID';
comment on column EAM2.CARDINFO.BWID
  is '办文说明ID';
comment on column EAM2.CARDINFO.CARDCODE
  is '卡片编码';
comment on column EAM2.CARDINFO.ZCNAME
  is '卡片名称';
comment on column EAM2.CARDINFO.SAVEADSRESS
  is '存放地点';
comment on column EAM2.CARDINFO.TYPECODE
  is '类别编码';
comment on column EAM2.CARDINFO.GGXH
  is '规格型号';
comment on column EAM2.CARDINFO.ADDTYPE
  is '增加方式';
comment on column EAM2.CARDINFO.ZJTYPE
  is '折旧方法';
comment on column EAM2.CARDINFO.IFJC
  is '是否承继';
comment on column EAM2.CARDINFO.GLBM
  is '管理部门';
comment on column EAM2.CARDINFO.USEPARTMENT
  is '使用部门';
comment on column EAM2.CARDINFO.ZJCDBM
  is '折旧承担部门';
comment on column EAM2.CARDINFO.USESTATUS
  is '使用状况';
comment on column EAM2.CARDINFO.ZCSTATUS
  is '资产状态';
comment on column EAM2.CARDINFO.MAINYT
  is '主要用途';
comment on column EAM2.CARDINFO.KSDATE
  is '开始使用日期';
comment on column EAM2.CARDINFO.QYDATE
  is '启用日期';
comment on column EAM2.CARDINFO.YBYZ
  is '原币原值';
comment on column EAM2.CARDINFO.YZJE
  is '月折旧额';
comment on column EAM2.CARDINFO.YZJL
  is '月折旧率';
comment on column EAM2.CARDINFO.LJZJ
  is '累计折旧';
comment on column EAM2.CARDINFO.JCZ
  is '净残值';
comment on column EAM2.CARDINFO.JCZL
  is '净残值率';
comment on column EAM2.CARDINFO.JVALUE
  is '净值';
comment on column EAM2.CARDINFO.SYYX
  is '使用月限';
comment on column EAM2.CARDINFO.YJTYF
  is '已计提月份';
comment on column EAM2.CARDINFO.JZZB
  is '减值准备';
comment on column EAM2.CARDINFO.JEVALUE
  is '净额';
comment on column EAM2.CARDINFO.OLDCODE
  is '旧卡片编号';
comment on column EAM2.CARDINFO.PGQYZ
  is '评估前原值';
comment on column EAM2.CARDINFO.PGQLJZJ
  is '评估前累计折旧';
comment on column EAM2.CARDINFO.BZSM
  is '备注';
comment on column EAM2.CARDINFO.FDJHM
  is '发动机号码';
comment on column EAM2.CARDINFO.CLPXH
  is '车辆牌照号';
comment on column EAM2.CARDINFO.TXFF
  is '摊销方法';
comment on column EAM2.CARDINFO.TXCDBM
  is '摊销承担部门';
comment on column EAM2.CARDINFO.TXNX
  is '摊销年限';
comment on column EAM2.CARDINFO.YTXYF
  is '已摊销月份';
comment on column EAM2.CARDINFO.YTXE
  is '已摊销额';
comment on column EAM2.CARDINFO.MONTXE
  is '月摊销额';
comment on column EAM2.CARDINFO.WTXE
  is '未摊销额';
comment on column EAM2.CARDINFO.QSZM
  is '权属证明';
comment on column EAM2.CARDINFO.TDZHM
  is '土地证号码';
comment on column EAM2.CARDINFO.QZSYZ
  is '权证所有者';
comment on column EAM2.CARDINFO.YSQDJZ
  is '原始取得价值';
comment on column EAM2.CARDINFO.OLDYEARYZ
  is '2004年1月1日原值';
comment on column EAM2.CARDINFO.OLDYEARJZ
  is '2004年1月1日累计折旧';
comment on column EAM2.CARDINFO.OLDJZ
  is '2004年1月1日净额';
comment on column EAM2.CARDINFO.ZYZT
  is '在用状态';
comment on column EAM2.CARDINFO.CUPXH
  is 'CUP型号';
comment on column EAM2.CARDINFO.WZYP
  is '外置硬盘';
comment on column EAM2.CARDINFO.NZYP
  is '内置硬盘';
comment on column EAM2.CARDINFO.XSQ
  is '显示器';
comment on column EAM2.CARDINFO.QPXH
  is '硬盘型号';
comment on column EAM2.CARDINFO.NSAVE
  is '内存';
comment on column EAM2.CARDINFO.SBXLH
  is '设备序列号';
comment on column EAM2.CARDINFO.GYS
  is '供应商';
comment on column EAM2.CARDINFO.HTHM
  is '合同号码';
comment on column EAM2.CARDINFO.BXQ
  is '保修期';
comment on column EAM2.CARDINFO.SMBXQ
  is '上门保修期';
comment on column EAM2.CARDINFO.SXBXQ
  is '送修保修期';
comment on column EAM2.CARDINFO.YXTLRY
  is '原系统录入人员';
comment on column EAM2.CARDINFO.USERNAME
  is '使用人';
comment on column EAM2.CARDINFO.ZHCFZR
  is '综合处负责人';
comment on column EAM2.CARDINFO.GDZCGLY
  is '固定资产管理员';
comment on column EAM2.CARDINFO.ZXRQ
  is '注销日期';
comment on column EAM2.CARDINFO.FDZHM
  is '房地证号码';
comment on column EAM2.CARDINFO.YWDYTD
  is '有无对应土地';
comment on column EAM2.CARDINFO.DYTDZH
  is '对应土地证号';
comment on column EAM2.CARDINFO.DYTDKP
  is '对应土地原卡片编号';
comment on column EAM2.CARDINFO.JZMJ
  is '建筑面积';
comment on column EAM2.CARDINFO.ZDMJ
  is '占地面积';
comment on column EAM2.CARDINFO.ZXMJ
  is '装修面积';
comment on column EAM2.CARDINFO.ZYZK
  is '在用状况';
comment on column EAM2.CARDINFO.RKDH
  is '入库单号';
comment on column EAM2.CARDINFO.PARENTID
  is '大类ID';
comment on column EAM2.CARDINFO.CHILDID
  is '小类code编码';
comment on column EAM2.CARDINFO.STATE
  is '状态标识位(01 正在使用状态 02 空闲状态 03 注销状态)';
comment on column EAM2.CARDINFO.LCTEMPID
  is '卡片临时表ID';
comment on column EAM2.CARDINFO.LRRQ
  is '未知日期';
comment on column EAM2.CARDINFO.ATTACHMENTURL
  is '附件ID';
comment on column EAM2.CARDINFO.OLDCARDID
  is '旧卡片编号';
comment on column EAM2.CARDINFO.CHANGEREASON
  is '触发流程原因';
comment on column EAM2.CARDINFO.BCJT
  is '本次计提';
comment on column EAM2.CARDINFO.FIRSTBRANCH
  is '一级分行';
comment on column EAM2.CARDINFO.SYNX
  is '使用年限';
comment on column EAM2.CARDINFO.ERPASSETCODE
  is 'erp资产标识';
comment on column EAM2.CARDINFO.ERPPK
  is 'erp关联主键';
comment on column EAM2.CARDINFO.ASSETSTATE
  is '经营分类状态--资产状态';
comment on column EAM2.CARDINFO.MEMO_1
  is '拟分类结果';
comment on column EAM2.CARDINFO.USED_PERSON
  is '正在使用该卡片的人';
comment on column EAM2.CARDINFO.USED_WORKFLOW_KEY
  is '正在使用该卡片的流程';
comment on column EAM2.CARDINFO.SFZY
  is '是否自用';
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
  is '卡片ID';
comment on column EAM2.CARD_ASSET_HISTORY.ZC_ID
  is '资产ID';
comment on column EAM2.CARD_ASSET_HISTORY.GJKSRQ
  is '挂接开始日期';
comment on column EAM2.CARD_ASSET_HISTORY.GJJSRQ
  is '挂接结束日期';
comment on column EAM2.CARD_ASSET_HISTORY.DQGJZT
  is '0：挂接中
1：已迁移';
comment on column EAM2.CARD_ASSET_HISTORY.SFWZKP
  is '0：否
1：是';
comment on column EAM2.CARD_ASSET_HISTORY.ZKPSZKSRQ
  is '主卡片设置开始日期';
comment on column EAM2.CARD_ASSET_HISTORY.ZKPSZJSRQ
  is '主卡片设置结束日期';
comment on column EAM2.CARD_ASSET_HISTORY.SPZT
  is '0：未审批
1：审批中
2：审批同意
3：审批不同意';
comment on column EAM2.CARD_ASSET_HISTORY.ZCZSB_ID
  is '资产正式表ID';
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
  is '卡片各种变动的表单头部，表体采用CA_CARDTEMP';
comment on column EAM2.CA_SHEAD.ID
  is '卡片流程表ID,UUID';
comment on column EAM2.CA_SHEAD.BIAOTI
  is '标题';
comment on column EAM2.CA_SHEAD.BIANHAO
  is '表单编号';
comment on column EAM2.CA_SHEAD.JHCD
  is '急缓程度';
comment on column EAM2.CA_SHEAD.NGR
  is '拟稿人编号';
comment on column EAM2.CA_SHEAD.LXDH
  is '联系电话';
comment on column EAM2.CA_SHEAD.NGRQ
  is '拟稿日期格式YYYYMMDD';
comment on column EAM2.CA_SHEAD.NGBM
  is '拟稿部门编号';
comment on column EAM2.CA_SHEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CA_SHEAD.ZJFS
  is '0：直接增加
1：审批增加';
comment on column EAM2.CA_SHEAD.ZYKPXZ
  is '自用卡片新增 0 否 1 是';
comment on column EAM2.CA_SHEAD.KPBLSM
  is '卡片办理说明';
comment on column EAM2.CA_SHEAD.ERPCLJG
  is 'ERP处理结果';
comment on column EAM2.CA_SHEAD.BZ
  is '备注';
comment on column EAM2.CA_SHEAD.BDLX
  is '0：卡片新增1：卡片减少2：卡片修改3：卡片减值4：卡片变动5：卡片修改6：卡片合并7：卡片拆分';
comment on column EAM2.CA_SHEAD.NGRMC
  is '拟稿人名称';
comment on column EAM2.CA_SHEAD.WFCONFIG_CODE
  is '工作流对应流程实例编号';
comment on column EAM2.CA_SHEAD.SENDERP
  is '发送ERP';
comment on column EAM2.CA_SHEAD.ERPNOTICE
  is 'ERP返回结果';
comment on column EAM2.CA_SHEAD.ISREJECTED
  is '是否拒绝';
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
  is 'ID,UUID代表记录号';
comment on column EAM2.CODE.CODE_TYPE
  is '分类编码,详细说明见CODE_CATALOG';
comment on column EAM2.CODE.CODE_NAME
  is '分类名称,详细说明见CODE_CATALOG';
comment on column EAM2.CODE.CODE_KEY
  is '编码,数字或英文';
comment on column EAM2.CODE.CODE_VALUE
  is '名称,中文';
comment on column EAM2.CODE.ORDER_NUMBER
  is '显示时的排序编号';
comment on column EAM2.CODE.USABLE
  is '可用与否1可用0不可用';
comment on column EAM2.CODE.CODE_TAG
  is '针对这一编码的TAG字段，系统备用';
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
  is '编码类型的编号';
comment on column EAM2.CODE_CATALOG.CODE_NAME
  is '编码类型的名称';
comment on column EAM2.CODE_CATALOG.CODE_TYPE_DESC
  is '编码类型的描述，描述其含义';
comment on column EAM2.CODE_CATALOG.CODE_USEDFUNCTIONS
  is '描述系统中那些具体功能要用到这个编码，系统管理用。';
comment on column EAM2.CODE_CATALOG.WRITER
  is '在系统中加入这一编码的人员姓名';
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
  is '编号';
comment on column EAM2.COMMON_ACCORDING.BT
  is '标题';
comment on column EAM2.COMMON_ACCORDING.NGR
  is '拟稿人';
comment on column EAM2.COMMON_ACCORDING.NGRQ
  is '拟稿日期';
comment on column EAM2.COMMON_ACCORDING.LCMC
  is '流程名称';
comment on column EAM2.COMMON_ACCORDING.URL
  is '显示URL';
comment on column EAM2.COMMON_ACCORDING.LCID
  is '流程ID';
comment on column EAM2.COMMON_ACCORDING.TJR
  is '添加人编号';
comment on column EAM2.COMMON_ACCORDING.TBDID
  is '被引用表单ID';
comment on column EAM2.COMMON_ACCORDING.SXMS
  is '事项描述';
comment on column EAM2.COMMON_ACCORDING.FENLEI
  is '分类';
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
  is '保存OA和EAM系统的关联的表';
comment on column EAM2.COMMON_EAM_2_OA.ID
  is 'ID';
comment on column EAM2.COMMON_EAM_2_OA.HEADID
  is '表单ID';
comment on column EAM2.COMMON_EAM_2_OA.BIAOTI
  is '标题';
comment on column EAM2.COMMON_EAM_2_OA.YWZL
  is '业务种类';
comment on column EAM2.COMMON_EAM_2_OA.YWMC
  is '业务名称';
comment on column EAM2.COMMON_EAM_2_OA.LCID
  is 'oa 的流程ID';
comment on column EAM2.COMMON_EAM_2_OA.URL
  is 'oa的URL';
comment on column EAM2.COMMON_EAM_2_OA.STATUS
  is '流程状态：0:已启动；2已办结';
comment on column EAM2.COMMON_EAM_2_OA.NGRID
  is '拟稿人ID';
comment on column EAM2.COMMON_EAM_2_OA.NGR
  is '拟稿人名称';
comment on column EAM2.COMMON_EAM_2_OA.NGRQ
  is '拟稿日期';
comment on column EAM2.COMMON_EAM_2_OA.UPDATE_DATE
  is '更新日期';
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
  is '此表是数据字典的ORACLE版本，此表为系统管理使用。';
comment on column EAM2.COMMON_TABLE_CATALOG.SUBSYSTEM
  is '所属子系统';
comment on column EAM2.COMMON_TABLE_CATALOG.XH
  is '序号';
comment on column EAM2.COMMON_TABLE_CATALOG.TABLENAME
  is '数据表名称';
comment on column EAM2.COMMON_TABLE_CATALOG.TABLECNAME
  is '中文表名称';
comment on column EAM2.COMMON_TABLE_CATALOG.TABLEDESC
  is '数据表说明';
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
  is '处理单ID';
comment on column EAM2.CZ_AZRY_XX.ST_ID
  is '所属实体ID';
comment on column EAM2.CZ_AZRY_XX.ST_FSXX_ID
  is '实体附属信息ID';
comment on column EAM2.CZ_AZRY_XX.ZCBH
  is '资产编号';
comment on column EAM2.CZ_AZRY_XX.RYBH
  is '人员编号';
comment on column EAM2.CZ_AZRY_XX.XINGMING
  is '姓名';
comment on column EAM2.CZ_AZRY_XX.FYDDH
  is '移动电话';
comment on column EAM2.CZ_AZRY_XX.FGDDH
  is '固定电话';
comment on column EAM2.CZ_AZRY_XX.FAZFS
  is '安置方式';
comment on column EAM2.CZ_AZRY_XX.FAZFY
  is '安置费用';
comment on column EAM2.CZ_AZRY_XX.CLDZT
  is '处理单状态  0：未审批   1：审批中 2：已审批';
comment on column EAM2.CZ_AZRY_XX.GZXX
  is '处置跟踪信息________';
comment on column EAM2.CZ_AZRY_XX.AZRYSFFSZC
  is '安置人员是否发生仲裁';
comment on column EAM2.CZ_AZRY_XX.AZRYZCJG
  is '安置人员仲裁机构';
comment on column EAM2.CZ_AZRY_XX.AZRYZCJIEGUO
  is '安置人员仲裁结果';
comment on column EAM2.CZ_AZRY_XX.AZRYSFQSST
  is '安置人员是否签署收条';
comment on column EAM2.CZ_AZRY_XX.AZRYSTQSQKMS
  is '安置人员收条签署情况描述';
comment on column EAM2.CZ_AZRY_XX.AZRYSFQSAZXY
  is '安置人员是否签署安置协议';
comment on column EAM2.CZ_AZRY_XX.AZRYXYQSQKMS
  is '安置人员协议签署情况描述';
comment on column EAM2.CZ_AZRY_XX.AZRYFJXZ_URL
  is '安置人员附件下载url';
comment on column EAM2.CZ_AZRY_XX.AZRYFJSC_URL
  is '安置人员附件删除url';
comment on column EAM2.CZ_AZRY_XX.AZXYXZ_URL
  is '安置协议的下载url';
comment on column EAM2.CZ_AZRY_XX.AZXYSC_URL
  is '安置协议的删除url';
comment on column EAM2.CZ_AZRY_XX.FSJAZFY
  is '实际安置费用';
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
  is 'uuid 主键';
comment on column EAM2.CZ_CZTZFA_XX.LCID
  is '流程ID';
comment on column EAM2.CZ_CZTZFA_XX.CZTZXMMC
  is '处置（投资）项目名称';
comment on column EAM2.CZ_CZTZFA_XX.BIANHAO
  is '编号';
comment on column EAM2.CZ_CZTZFA_XX.JHCD
  is '一般 ，急 ， 特急';
comment on column EAM2.CZ_CZTZFA_XX.NGRQ
  is '拟稿日期';
comment on column EAM2.CZ_CZTZFA_XX.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_CZTZFA_XX.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_CZTZFA_XX.NGR
  is '拟稿人';
comment on column EAM2.CZ_CZTZFA_XX.NGRXM
  is '拟稿人姓名';
comment on column EAM2.CZ_CZTZFA_XX.LXDH
  is '联系电话';
comment on column EAM2.CZ_CZTZFA_XX.ZCSZWZ
  is '资产所在位置';
comment on column EAM2.CZ_CZTZFA_XX.ZCLB
  is '处置投资资产类别 0：经营性固产 1：实体内资产 2： 委贷抵债物 3：实体';
comment on column EAM2.CZ_CZTZFA_XX.CZSBFS
  is '首次，变更，重报';
comment on column EAM2.CZ_CZTZFA_XX.LCMC
  is '流程名称';
comment on column EAM2.CZ_CZTZFA_XX.CLDZT
  is '处理单状态  0：未审批   1：审批中 2：已审批 3：被退回';
comment on column EAM2.CZ_CZTZFA_XX.ZCQS
  is '资产权属';
comment on column EAM2.CZ_CZTZFA_XX.PGJGMC
  is '评估机构名称';
comment on column EAM2.CZ_CZTZFA_XX.C_CZFS
  is '处置方式';
comment on column EAM2.CZ_CZTZFA_XX.ZMYZ
  is '账面原值';
comment on column EAM2.CZ_CZTZFA_XX.ZMJZ
  is '账面净值';
comment on column EAM2.CZ_CZTZFA_XX.YJCZFY
  is '预计处置费用';
comment on column EAM2.CZ_CZTZFA_XX.PGJZ
  is '评估价值';
comment on column EAM2.CZ_CZTZFA_XX.YJCZHSJE
  is '建议处置回收金额';
comment on column EAM2.CZ_CZTZFA_XX.YJSSJE
  is '预计损失金额';
comment on column EAM2.CZ_CZTZFA_XX.YJSSL
  is '预计损失率';
comment on column EAM2.CZ_CZTZFA_XX.SFYSBD
  is '是否有申报单 0：否 1：是';
comment on column EAM2.CZ_CZTZFA_XX.SFYCZFA
  is '是否有处置方案 0：否 1：是';
comment on column EAM2.CZ_CZTZFA_XX.SFYSJQK
  is '是否有审计情况 0：否 1：是';
comment on column EAM2.CZ_CZTZFA_XX.SFYPGBG
  is ' 是否有评估报告 0：否 1：是';
comment on column EAM2.CZ_CZTZFA_XX.QTSBCL
  is '其他申报材料';
comment on column EAM2.CZ_CZTZFA_XX.SFJPGSC
  is '是否经评估审查
0：否
1：是';
comment on column EAM2.CZ_CZTZFA_XX.PGBGSXQJZRQ
  is '评估报告失效期截止日期';
comment on column EAM2.CZ_CZTZFA_XX.CBCS
  is '重报次数';
comment on column EAM2.CZ_CZTZFA_XX.HGSCCS
  is '合规审查次数';
comment on column EAM2.CZ_CZTZFA_XX.SBRQ
  is '申报日期';
comment on column EAM2.CZ_CZTZFA_XX.SLXH
  is '受理序号';
comment on column EAM2.CZ_CZTZFA_XX.SCCZFAXXID
  is '上次资产处置方案信息ID';
comment on column EAM2.CZ_CZTZFA_XX.BEIZHU
  is '备注';
comment on column EAM2.CZ_CZTZFA_XX.FBLSJ
  is '发办理时间';
comment on column EAM2.CZ_CZTZFA_XX.HQBM
  is '会签部门';
comment on column EAM2.CZ_CZTZFA_XX.CSCLDID
  is '初始处理单ID，用于办理单退回时，记录处理单和资产之间的关系';
comment on column EAM2.CZ_CZTZFA_XX.C_TZYWLX
  is '投资业务类型';
comment on column EAM2.CZ_CZTZFA_XX.C_FALB
  is '租赁投资方案类别';
comment on column EAM2.CZ_CZTZFA_XX.FAFL
  is '方案分类 0：资产处置 1：承继投资';
comment on column EAM2.CZ_CZTZFA_XX.SQFYZJE
  is '申请费用总金额';
comment on column EAM2.CZ_CZTZFA_XX.SPFYZJE
  is '审批费用总金额';
comment on column EAM2.CZ_CZTZFA_XX.ZLZJE
  is '租赁总金额';
comment on column EAM2.CZ_CZTZFA_XX.HQBMID
  is '会签部门ID';
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
  is '处置跟踪方式';
comment on column EAM2.CZ_DISPOSE_TRACK.CZGZHJ
  is '处置跟踪环节';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMJGMC
  is '公开拍卖机构名称';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMSFZJTZJK
  is '公开拍卖是否在建投中介库';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMBZZJKYY
  is '公开拍卖不在中介库原因';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMBLJ
  is '公开拍卖保留价';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMBLJSFYXXF
  is '公开拍卖保留价是否允许下浮';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMYXXFCS
  is '公开拍卖允许下浮次数';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMMCXFFD
  is '公开拍卖每次下浮幅度';
comment on column EAM2.CZ_DISPOSE_TRACK.GKPMJTSFGG
  is '公开拍卖建投是否公告';
comment on column EAM2.CZ_DISPOSE_TRACK.PMSFCG
  is '拍卖是否成功';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMS
  is '成功拍卖师';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMSJ
  is '成功拍卖时间';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMDD
  is '成功拍卖地点';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMJMRS
  is '成功拍卖竞买人数';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMCJJ
  is '成功拍卖成交价';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMMSR
  is '成功拍卖买受人';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMYJJE
  is '成功拍卖佣金金额';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMJKZFFS
  is '成功拍卖价款支付方式';
comment on column EAM2.CZ_DISPOSE_TRACK.CGPMJE
  is '成功拍卖金额';
comment on column EAM2.CZ_DISPOSE_TRACK.SFWCGH
  is '是否完成过户';
comment on column EAM2.CZ_DISPOSE_TRACK.GPCQJYSMC
  is '挂牌产权交易所名称';
comment on column EAM2.CZ_DISPOSE_TRACK.GPPGJ
  is '挂牌评估价';
comment on column EAM2.CZ_DISPOSE_TRACK.GPQSRQ
  is '挂牌起始日期';
comment on column EAM2.CZ_DISPOSE_TRACK.GPJSRQ
  is '挂牌结束日期';
comment on column EAM2.CZ_DISPOSE_TRACK.GPSFCG
  is '挂牌是否成功';
comment on column EAM2.CZ_DISPOSE_TRACK.GPYXMSRS
  is '挂牌成功意向买受人数';
comment on column EAM2.CZ_DISPOSE_TRACK.GPCGCJJE
  is '挂牌成功成交金额';
comment on column EAM2.CZ_DISPOSE_TRACK.XYZRMSR
  is '协议转让买受人';
comment on column EAM2.CZ_DISPOSE_TRACK.XYZRJE
  is '协议转让金额';
comment on column EAM2.CZ_DISPOSE_TRACK.CQSFYSWBC
  is '拆迁是否有实物补偿';
comment on column EAM2.CZ_DISPOSE_TRACK.CQBCWMS
  is '拆迁补偿物描述';
comment on column EAM2.CZ_DISPOSE_TRACK.CQSFYHBBC
  is '拆迁是否有货币补偿';
comment on column EAM2.CZ_DISPOSE_TRACK.CQBCJE
  is '拆迁补偿金额';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXPCFYMC
  is '注销破产法院名称';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXSJJGMC
  is '注销审计机构名称';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXZQQCQK
  is '注销债权清偿情况';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXHKSJ
  is '注销回款时间';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXJE
  is '注销金额';
comment on column EAM2.CZ_DISPOSE_TRACK.ZXDJSJ
  is '注销登记时间';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZRSJ
  is '股权转让时间';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZRJE
  is '股权转让金额';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZRMSR
  is '股权转让买受人';
comment on column EAM2.CZ_DISPOSE_TRACK.GQZQZRQK
  is '股权债权转让情况';
comment on column EAM2.CZ_DISPOSE_TRACK.GQSFWCBG
  is '股权是否完成变更';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFPQLS
  is '人员安置是否聘请律师
律师姓名
是否聘请律师';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZLSXM
  is '人员安置律师姓名';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZLSLXFS
  is '人员安置律师联系方式';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFFBAZGG
  is '人员安置是否发布安置公告';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSTQSQKMS
  is '人员安置收条签署情况描述';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFQSST
  is '人员安置是否签署收条';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFFSZC
  is '人员安置是否发生仲裁';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZZCJG
  is '人员安置仲裁机构';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZZCJIEGUO
  is '人员安置仲裁结果';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZSFQSAZXY
  is '人员安置是否签署安置协议';
comment on column EAM2.CZ_DISPOSE_TRACK.RYAZXYQSQKMS
  is '人员安置协议签署情况描述';
comment on column EAM2.CZ_DISPOSE_TRACK.XMID
  is '项目ID';
comment on column EAM2.CZ_DISPOSE_TRACK.ZCID
  is '资产ID';
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
  is '处置跟踪主表Id';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.FSXXLX
  is '附属信息类型';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGPMSJ
  is '拍卖未成功拍卖时间';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGPMDD
  is '拍卖未成功拍卖地点';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGJMRS
  is '拍卖未成功竞买人数';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGJMZGJ
  is '拍卖未成功竞买最高价';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGBLJ
  is '拍卖未成功保留价';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.SLMC
  is '税类名称';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.FYJE
  is '费用金额';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.FYZL
  is '费用种类';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.QSXZRYXM
  is '清算小组人员姓名';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.QSXZRYLXFS
  is '清算小组人员联系方式';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.QSXZRYGZDW
  is '清算小组人员工作单位';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKSJ
  is '回款时间';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKJE
  is '回款金额';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKFY
  is '回款费用';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKSR
  is '回款收入';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKFKR
  is '回款付款人';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.HKBZ
  is '回款备注';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.PMWCGCS
  is '拍卖未成功次数';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LSXM
  is '律师姓名';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LXFS
  is '律师联系方式';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.ZXQK
  is '执行情况';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LRRBH
  is '录入人编号';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LRR
  is '录入人';
comment on column EAM2.CZ_DISPOSE_TRACK_ADJUNCT.LRRQ
  is '录入日期';
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
  is 'uuid 主键';
comment on column EAM2.CZ_FYSR_MX.BIANHAO
  is '项目编号';
comment on column EAM2.CZ_FYSR_MX.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_FYSR_MX.XM_ID
  is '项目ID';
comment on column EAM2.CZ_FYSR_MX.FENLEI
  is '0：费用
分类 1：收入';
comment on column EAM2.CZ_FYSR_MX.C_FYZL
  is '费用种类';
comment on column EAM2.CZ_FYSR_MX.YJHF
  is '预计花费';
comment on column EAM2.CZ_FYSR_MX.SJZC
  is '实际支出';
comment on column EAM2.CZ_FYSR_MX.BEIZHU
  is '备注';
comment on column EAM2.CZ_FYSR_MX.GHSLMC
  is '过户税类名称';
comment on column EAM2.CZ_FYSR_MX.GHSLJE
  is '过户税类金额';
comment on column EAM2.CZ_FYSR_MX.GHFYMC
  is '过户费用名称';
comment on column EAM2.CZ_FYSR_MX.GHFYJE
  is '过户费用金额';
comment on column EAM2.CZ_FYSR_MX.HKSJ
  is '回款时间';
comment on column EAM2.CZ_FYSR_MX.HKJE
  is '回款金额';
comment on column EAM2.CZ_FYSR_MX.HKZFYJE
  is '回款中费用金额';
comment on column EAM2.CZ_FYSR_MX.HKZSRJE
  is '回款中收入金额';
comment on column EAM2.CZ_FYSR_MX.FKR
  is '付款人';
comment on column EAM2.CZ_FYSR_MX.LRRMC
  is '录入人名称';
comment on column EAM2.CZ_FYSR_MX.LRRBH
  is '录入人编号';
comment on column EAM2.CZ_FYSR_MX.LRSJ
  is '录入时间';
comment on column EAM2.CZ_FYSR_MX.FYZT
  is '费用状态 0：已审批  1：审批中  2：已审批';
comment on column EAM2.CZ_FYSR_MX.ZCLB
  is '处置资产类别 0：经营性固产 1：实体内资产 2： 委贷抵债物 3：实体';
comment on column EAM2.CZ_FYSR_MX.AZCID
  is '经营固产ID';
comment on column EAM2.CZ_FYSR_MX.AZCBH
  is '经营固产资产编号';
comment on column EAM2.CZ_FYSR_MX.BSTID
  is '实体ID';
comment on column EAM2.CZ_FYSR_MX.STBH
  is '实体编号';
comment on column EAM2.CZ_FYSR_MX.BFSXXID
  is '实体附属信息ID';
comment on column EAM2.CZ_FYSR_MX.BZCBH
  is '实体内资产编号';
comment on column EAM2.CZ_FYSR_MX.ZYZCID
  is '自用资产ID';
comment on column EAM2.CZ_FYSR_MX.ZYZCBH
  is '自用资产编号';
comment on column EAM2.CZ_FYSR_MX.JIEDUAN
  is '处置跟踪阶段 guohufeiyong 过户费用 guohushuikuan 过户税款  chuzhihuikuan 处置回款';
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
  is 'uuid 主键';
comment on column EAM2.CZ_FYSR_MX_LSB.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_FYSR_MX_LSB.BIANHAO
  is '编号';
comment on column EAM2.CZ_FYSR_MX_LSB.ZCID
  is '资产ID';
comment on column EAM2.CZ_FYSR_MX_LSB.ZCBH
  is '资产编号';
comment on column EAM2.CZ_FYSR_MX_LSB.FYBH
  is '费用编号';
comment on column EAM2.CZ_FYSR_MX_LSB.FENLEI
  is '0：费用
分类 1：收入';
comment on column EAM2.CZ_FYSR_MX_LSB.FYZL
  is '费用种类';
comment on column EAM2.CZ_FYSR_MX_LSB.YJHF
  is '预计花费';
comment on column EAM2.CZ_FYSR_MX_LSB.SJZC
  is '实际支出';
comment on column EAM2.CZ_FYSR_MX_LSB.BEIZHU
  is '备注';
comment on column EAM2.CZ_FYSR_MX_LSB.LRRMC
  is '录入人名称';
comment on column EAM2.CZ_FYSR_MX_LSB.LRRBH
  is '录入人编号';
comment on column EAM2.CZ_FYSR_MX_LSB.LRSJ
  is '录入时间';
comment on column EAM2.CZ_FYSR_MX_LSB.FYZT
  is '费用状态 0：已审批  1：审批中  2：已审批';
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
  is '处置项目合规性审核信息表';
comment on column EAM2.CZ_HGSH_XX.ID
  is 'uuid，主键';
comment on column EAM2.CZ_HGSH_XX.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_HGSH_XX.BIANHAO
  is '编号';
comment on column EAM2.CZ_HGSH_XX.BMLDSPYJ
  is '部门领导审批意见';
comment on column EAM2.CZ_HGSH_XX.PGBGZYXQ
  is '评估报告在有效期';
comment on column EAM2.CZ_HGSH_XX.FGLDSPYJ
  is '分管领导审批意见';
comment on column EAM2.CZ_HGSH_XX.WTDWSBWJ
  is '委托单位上报文件';
comment on column EAM2.CZ_HGSH_XX.PGBGJSHYJ
  is '评估报告及审核意见';
comment on column EAM2.CZ_HGSH_XX.AYQJXGG
  is '按要求进行公告';
comment on column EAM2.CZ_HGSH_XX.BTGFZQ
  is '标题规范准确';
comment on column EAM2.CZ_HGSH_XX.GXTXGFZQ
  is '各项填写规范准确';
comment on column EAM2.CZ_HGSH_XX.JBRYJQXWW
  is '经办人意见清晰无误';
comment on column EAM2.CZ_HGSH_XX.GSGF
  is '格式规范';
comment on column EAM2.CZ_HGSH_XX.NRQXWZ
  is '内容清晰完整';
comment on column EAM2.CZ_HGSH_XX.XMJBQK
  is '项目基本情况';
comment on column EAM2.CZ_HGSH_XX.PGJQSH
  is '评估及其审核';
comment on column EAM2.CZ_HGSH_XX.CZFAJFABJ
  is '处置方案及方案比较';
comment on column EAM2.CZ_HGSH_XX.CZSY
  is '处置收益';
comment on column EAM2.CZ_HGSH_XX.CZFY
  is '处置费用';
comment on column EAM2.CZ_HGSH_XX.BMYJ
  is '部门意见';
comment on column EAM2.CZ_HGSH_XX.WZGFWW
  is '文字规范无误';
comment on column EAM2.CZ_HGSH_XX.GSJZSZQ
  is '各数据真实准确';
comment on column EAM2.CZ_HGSH_XX.YGYJYCFYJ
  is '有关意见有充分依据';
comment on column EAM2.CZ_HGSH_XX.CZFSHG
  is '处置方式合规';
comment on column EAM2.CZ_HGSH_XX.CZDJHG
  is '处置定价合规';
comment on column EAM2.CZ_HGSH_XX.CZFYHG
  is '处置费用合规';
comment on column EAM2.CZ_HGSH_XX.SXFJQQ
  is '所需附件齐全';
comment on column EAM2.CZ_HGSH_XX.FJPGBGJSHYJ
  is '附件评估报告及审核意见';
comment on column EAM2.CZ_HGSH_XX.GGYM
  is '公告页面';
comment on column EAM2.CZ_HGSH_XX.FJWTDWSBWJ
  is '附件委托单位上报文件';
comment on column EAM2.CZ_HGSH_XX.XMYGWJ
  is '项目有关文件';
comment on column EAM2.CZ_HGSH_XX.FJGSGF
  is '附件格式规范';
comment on column EAM2.CZ_HGSH_XX.GGNRGFWZ
  is '公告内容规范完整';
comment on column EAM2.CZ_HGSH_XX.GGMZSXYQ
  is '公告满足时限要求';
comment on column EAM2.CZ_HGSH_XX.SHJL
  is '审核结论';
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
  is '会议信息';
comment on column EAM2.CZ_HYXX.ID
  is 'uuid，主键';
comment on column EAM2.CZ_HYXX.SPSJ
  is '审批时间';
comment on column EAM2.CZ_HYXX.C_SPFS
  is '审批方式';
comment on column EAM2.CZ_HYXX.HYCS
  is '会议次数';
comment on column EAM2.CZ_HYXX.SPZCR
  is '审批主持人';
comment on column EAM2.CZ_HYXX.ZCRXM
  is '审批主持人姓名';
comment on column EAM2.CZ_HYXX.SPWY
  is '审批委员';
comment on column EAM2.CZ_HYXX.HBR
  is '汇报人';
comment on column EAM2.CZ_HYXX.HBRXM
  is '汇报人姓名';
comment on column EAM2.CZ_HYXX.HYJYZLR
  is '会议纪要整理人';
comment on column EAM2.CZ_HYXX.HYJYZLRXM
  is '会议纪要整理人姓名';
comment on column EAM2.CZ_HYXX.SPZT
  is '审批状态   0:上会中（组织会议后）
1:会议纪要整理人（发送会议纪要环节后）
2:会议完毕（OA返回会议纪要信息后）';
comment on column EAM2.CZ_HYXX.HYDD
  is '会议地点';
comment on column EAM2.CZ_HYXX.LC_ID
  is '流程ID';
comment on column EAM2.CZ_HYXX.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_HYXX.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_HYXX.HYJYZLRBMID
  is '会议纪要整理人所属部门ID';
comment on column EAM2.CZ_HYXX.HYJYZLRBMMC
  is '会议纪要整理人所属部门名称';
comment on column EAM2.CZ_HYXX.ZCRBMID
  is '审批主持人所属部门ID';
comment on column EAM2.CZ_HYXX.ZCRBMMC
  is '审批主持人所属部门名称';
comment on column EAM2.CZ_HYXX.HYLX
  is '会议类型';
comment on column EAM2.CZ_HYXX.SFFSCL
  is '是否发审批委员材料 0：否 1 是';
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
  is '处置公告表体';
comment on column EAM2.CZ_NOTICE_BODY.ID
  is 'ID';
comment on column EAM2.CZ_NOTICE_BODY.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_NOTICE_BODY.CCB_ID
  is '资产所在表ID';
comment on column EAM2.CZ_NOTICE_BODY.ZC_ID
  is '处置资产ID';
comment on column EAM2.CZ_NOTICE_BODY.ZCMS
  is '资产描述';
comment on column EAM2.CZ_NOTICE_BODY.CZYSBS
  is '资产处置意思表示';
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
  is '处置公告表头';
comment on column EAM2.CZ_NOTICE_HEAD.LIUCHENGID
  is '流程ID';
comment on column EAM2.CZ_NOTICE_HEAD.BIAOTI
  is '标题';
comment on column EAM2.CZ_NOTICE_HEAD.CHENGSON
  is '呈送';
comment on column EAM2.CZ_NOTICE_HEAD.BIANHAO
  is '编号';
comment on column EAM2.CZ_NOTICE_HEAD.JHCD
  is '急缓程度：一般 ，急 ， 特急';
comment on column EAM2.CZ_NOTICE_HEAD.NIGAOREN
  is '拟稿人';
comment on column EAM2.CZ_NOTICE_HEAD.NIGAORENXM
  is '拟稿人姓名';
comment on column EAM2.CZ_NOTICE_HEAD.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_NOTICE_HEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_NOTICE_HEAD.NGRQ
  is '拟稿日期';
comment on column EAM2.CZ_NOTICE_HEAD.LXDH
  is '联系电话';
comment on column EAM2.CZ_NOTICE_HEAD.FBRQ
  is '公告发布日期';
comment on column EAM2.CZ_NOTICE_HEAD.GGYXQ
  is '公告有效期';
comment on column EAM2.CZ_NOTICE_HEAD.YYYXQ
  is '受理征询或异议有效期';
comment on column EAM2.CZ_NOTICE_HEAD.GGLXR
  is '公告联系人';
comment on column EAM2.CZ_NOTICE_HEAD.GGLXDH
  is '公告联系电话';
comment on column EAM2.CZ_NOTICE_HEAD.GGLXYJ
  is '公告联系电子邮件';
comment on column EAM2.CZ_NOTICE_HEAD.JBDH
  is '对排斥、阻挠征询或异议的举报电话';
comment on column EAM2.CZ_NOTICE_HEAD.JBYJ
  is '对排斥、阻挠征询或异议的举报电子邮件';
comment on column EAM2.CZ_NOTICE_HEAD.JYDXZG
  is '交易对象资格';
comment on column EAM2.CZ_NOTICE_HEAD.JYTJ
  is '交易条件';
comment on column EAM2.CZ_NOTICE_HEAD.ZCLYBM
  is '处置资产来源表名';
comment on column EAM2.CZ_NOTICE_HEAD.BEIZHU
  is '其他需要说明的情况';
comment on column EAM2.CZ_NOTICE_HEAD.LCMC
  is '流程名称  处置公告';
comment on column EAM2.CZ_NOTICE_HEAD.CLDZT
  is '0：未审批   1：审批中 2：已审批';
comment on column EAM2.CZ_NOTICE_HEAD.HQBMID
  is '会签部门ID';
comment on column EAM2.CZ_NOTICE_HEAD.HQBM
  is '中国建投会签部门';
comment on column EAM2.CZ_NOTICE_HEAD.SFHCGG
  is '是否合成公告 0：否  1：是';
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
  is '包括过程结论和最终结论。';
comment on column EAM2.CZ_PGSC_JL.ID
  is 'uuid 主键';
comment on column EAM2.CZ_PGSC_JL.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_PGSC_JL.OLD_ID
  is '原知识库ID';
comment on column EAM2.CZ_PGSC_JL.PID
  is 'PID';
comment on column EAM2.CZ_PGSC_JL.CODE
  is '排序字段';
comment on column EAM2.CZ_PGSC_JL.VALUE
  is '内容';
comment on column EAM2.CZ_PGSC_JL.C_SCJL
  is '审查结论';
comment on column EAM2.CZ_PGSC_JL.TJYJR
  is '提交意见人';
comment on column EAM2.CZ_PGSC_JL.TJYJRXM
  is '提交意见人姓名';
comment on column EAM2.CZ_PGSC_JL.TJRQ
  is '提交日期';
comment on column EAM2.CZ_PGSC_JL.JLXZ
  is '0：过程结论
1：最终结论
2：退回结论';
comment on column EAM2.CZ_PGSC_JL.BEIZHU
  is '是否已经提交0：未提交，1：已提交';
comment on column EAM2.CZ_PGSC_JL.SFXXZ
  is '是否需知识库新增 0：否 1：是';
comment on column EAM2.CZ_PGSC_JL.BGWTBZ
  is '报告问题备注';
comment on column EAM2.CZ_PGSC_JL.TJPC
  is '提交批次';
comment on column EAM2.CZ_PGSC_JL.SCBZ
  is '删除标志 ';
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
  is '资产处置评估审查数据库';
comment on column EAM2.CZ_PGSC_SJK.LXDH
  is '联系单号';
comment on column EAM2.CZ_PGSC_SJK.SBSJ
  is '申报时间';
comment on column EAM2.CZ_PGSC_SJK.JINGBANREN
  is '经办人';
comment on column EAM2.CZ_PGSC_SJK.BCTJRQ
  is '补充提交日期';
comment on column EAM2.CZ_PGSC_SJK.SCJL
  is '审查结论';
comment on column EAM2.CZ_PGSC_SJK.CJSJ
  is '出具时间';
comment on column EAM2.CZ_PGSC_SJK.BIANHAO
  is '编号';
comment on column EAM2.CZ_PGSC_SJK.SCXM
  is '审查项目';
comment on column EAM2.CZ_PGSC_SJK.SCYD
  is '审查要点';
comment on column EAM2.CZ_PGSC_SJK.JTYJ
  is '具体意见';
comment on column EAM2.CZ_PGSC_SJK.YJTS
  is '意见条数';
comment on column EAM2.CZ_PGSC_SJK.BIAOTI
  is '标题';
comment on column EAM2.CZ_PGSC_SJK.PGJG
  is '评估机构';
comment on column EAM2.CZ_PGSC_SJK.C_BGLX
  is '报告类型';
comment on column EAM2.CZ_PGSC_SJK.SHENGFEN
  is '省份';
comment on column EAM2.CZ_PGSC_SJK.KPBH
  is '卡片编号';
comment on column EAM2.CZ_PGSC_SJK.ZCMC
  is '资产名称';
comment on column EAM2.CZ_PGSC_SJK.ZCLB
  is '资产类别';
comment on column EAM2.CZ_PGSC_SJK.JIZHUNRI
  is '基准日';
comment on column EAM2.CZ_PGSC_SJK.MUDI
  is '目的';
comment on column EAM2.CZ_PGSC_SJK.FANGFA
  is '方法';
comment on column EAM2.CZ_PGSC_SJK.JZLB
  is '价值类型';
comment on column EAM2.CZ_PGSC_SJK.JZRZMYZ
  is '基准日账面原值';
comment on column EAM2.CZ_PGSC_SJK.JZRZMJZ
  is '基准日/审查日账面净值';
comment on column EAM2.CZ_PGSC_SJK.JZRJZCZMZ
  is '基准日净资产账面值';
comment on column EAM2.CZ_PGSC_SJK.PGZ
  is '评估值';
comment on column EAM2.CZ_PGSC_SJK.PGZJZ
  is '评估值-净值（原值）';
comment on column EAM2.CZ_PGSC_SJK.ZJFD
  is '增减幅度';
comment on column EAM2.CZ_PGSC_SJK.SPJG
  is '审批结果';
comment on column EAM2.CZ_PGSC_SJK.SPSJ
  is '审批时间';
comment on column EAM2.CZ_PGSC_SJK.SPWYJ
  is '审批委意见';
comment on column EAM2.CZ_PGSC_SJK.BEIZHU
  is '备注';
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
  is '处置评估审查处理单
审查知识库处理单';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ID
  is 'uuid 主键';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LIUCHENGID
  is '流程ID';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BIAOTI
  is '标题';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BIANHAO
  is '编号';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.JHCD
  is '急缓程度';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NIGAOREN
  is '拟稿人';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NIGAORENXM
  is '拟稿人名称';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LXDH
  is '联系电话';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BLBM
  is '办理部门';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BLBMBH
  is '办理部门编号';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.NGRQ
  is '拟稿日期';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.C_BGLX
  is '报告类型';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LSSCCS
  is '历史审查次数';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGJG
  is '评估机构';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGJZR
  is '基准日';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGZZ
  is '评估总值（万元）';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZCZMJZ
  is '资产账面价值汇总值';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZJZ
  is '增减值汇总值';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZJFD
  is '增减幅度汇总值';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGMD
  is '评估目的';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.SCSJ
  is '审查时间';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.BCCLTJSJ
  is '补充材料提交时间';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.C_SCJL
  is '0  通过（无意见）1
通过（附参考意见）2
不通过
3不具备评估审查条件';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.CLDZT
  is '处理单状态  0：未审批   1：审批中 2：已审批 3：被退回';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.SCSCCLD_ID
  is '上次审查处理单ID';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.LCMC
  is '流程名称';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.PGZCLB
  is '评估资产类别 0：经营性固产 1：实体内资产 2 ：委贷抵债物 3：实体（股权） 4：债权';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.FBLSJ
  is '发办理时间';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.ZCZMYZ
  is '账面原值汇总值';
comment on column EAM2.CZ_PGSC_ZSKWH_CLD.JZRZMJZ
  is '基准日账面价值汇总';
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
  is 'uuid主键';
comment on column EAM2.CZ_PGXX_LSB.CZPGSCCLID
  is '处置评估审查处理ID';
comment on column EAM2.CZ_PGXX_LSB.ZCID
  is '经营固产ID';
comment on column EAM2.CZ_PGXX_LSB.JYGCZCBH
  is '经营固产资产编号';
comment on column EAM2.CZ_PGXX_LSB.ZCMC
  is '经营固产资产名称';
comment on column EAM2.CZ_PGXX_LSB.SFMC
  is '资产所在省份名称';
comment on column EAM2.CZ_PGXX_LSB.ZCLB
  is '资产类别';
comment on column EAM2.CZ_PGXX_LSB.ZCLBBM
  is '资产类别编码';
comment on column EAM2.CZ_PGXX_LSB.ZKPBH
  is '主卡片编号';
comment on column EAM2.CZ_PGXX_LSB.ZCYBYZ
  is '资产原币原值';
comment on column EAM2.CZ_PGXX_LSB.ZCZMJZ
  is '资产账面价值汇（净额）';
comment on column EAM2.CZ_PGXX_LSB.JINGZHI
  is '净值（元）          净值-减值准备=净额';
comment on column EAM2.CZ_PGXX_LSB.DKZH
  is '贷款账号';
comment on column EAM2.CZ_PGXX_LSB.WDID
  is '委托贷款ID';
comment on column EAM2.CZ_PGXX_LSB.CZCMC
  is '抵债物资名称';
comment on column EAM2.CZ_PGXX_LSB.CSJZYR
  is '抵债物资产实际占有人';
comment on column EAM2.CZ_PGXX_LSB.CZCBH
  is '抵债物资产编号';
comment on column EAM2.CZ_PGXX_LSB.CCFWZ
  is '抵债物内存放位置';
comment on column EAM2.CZ_PGXX_LSB.CZCLX
  is '抵债物资产类型';
comment on column EAM2.CZ_PGXX_LSB.STID
  is '实体ID';
comment on column EAM2.CZ_PGXX_LSB.STMC
  is '实体名称';
comment on column EAM2.CZ_PGXX_LSB.STZCMC
  is '实体内资产名称';
comment on column EAM2.CZ_PGXX_LSB.STFSXXID
  is '实体附属信息ID';
comment on column EAM2.CZ_PGXX_LSB.STZCBH
  is '实体内资产编号';
comment on column EAM2.CZ_PGXX_LSB.STTZCLX
  is '实体内资产类型';
comment on column EAM2.CZ_PGXX_LSB.STZCLB
  is '资产类别';
comment on column EAM2.CZ_PGXX_LSB.STSJZYR
  is '资产实际占有人';
comment on column EAM2.CZ_PGXX_LSB.STCFWZ
  is '实体内资产存放位置';
comment on column EAM2.CZ_PGXX_LSB.PGJG
  is '评估机构';
comment on column EAM2.CZ_PGXX_LSB.PINGGUZHI
  is '评估值（元）';
comment on column EAM2.CZ_PGXX_LSB.C_JZLX
  is '价值类型';
comment on column EAM2.CZ_PGXX_LSB.C_CZFS
  is '处置方式';
comment on column EAM2.CZ_PGXX_LSB.PGFF
  is '评估方法';
comment on column EAM2.CZ_PGXX_LSB.PGJZR
  is '评估基准日';
comment on column EAM2.CZ_PGXX_LSB.BEIZHU
  is '备注';
comment on column EAM2.CZ_PGXX_LSB.PGMD
  is '评估目的';
comment on column EAM2.CZ_PGXX_LSB.JZRZMJZ
  is '基准日账面价值（元）';
comment on column EAM2.CZ_PGXX_LSB.PGZCLB
  is '评估资产类别 0：经营性固产 1：实体内资产 2 委贷抵债物';
comment on column EAM2.CZ_PGXX_LSB.ZJZ
  is '增减值（评估值-账面价值=增减值）';
comment on column EAM2.CZ_PGXX_LSB.ZJFD
  is '增减幅度（增减值/账面价值=增减幅度）';
comment on column EAM2.CZ_PGXX_LSB.SPZT
  is '审批状态 0：未审批   1：审批中 2：已审批';
comment on column EAM2.CZ_PGXX_LSB.BXE
  is '变现额';
comment on column EAM2.CZ_PGXX_LSB.XZLB_________
  is '新增加资产类别__________';
comment on column EAM2.CZ_PGXX_LSB.GQSTID
  is '股权实体ID';
comment on column EAM2.CZ_PGXX_LSB.GQSTMC
  is '股权实体名称';
comment on column EAM2.CZ_PGXX_LSB.GQSTSF
  is '股权实体省份';
comment on column EAM2.CZ_PGXX_LSB.GQSTZL
  is '股权实体种类';
comment on column EAM2.CZ_PGXX_LSB.GQSTGLBM
  is '股权实体管理部门';
comment on column EAM2.CZ_PGXX_LSB.GQSTWTGLJG
  is '股权实体委托管理机构';
comment on column EAM2.CZ_PGXX_LSB.GQJZRJZCZ
  is '基准日账面净资产值';
comment on column EAM2.CZ_PGXX_LSB.ZQID
  is '债权ID';
comment on column EAM2.CZ_PGXX_LSB.ZQZL
  is '债权种类 0：全部  1：信达转让 2： 建银转让  3：其他
';
comment on column EAM2.CZ_PGXX_LSB.ZWRMC
  is '债务人名称';
comment on column EAM2.CZ_PGXX_LSB.GRZYE
  is '购入债余额';
comment on column EAM2.CZ_PGXX_LSB.PGJZRZMZQZ
  is '评估基准日账面债权值';
comment on column EAM2.CZ_PGXX_LSB.ZYZCID
  is '自用资产ID';
comment on column EAM2.CZ_PGXX_LSB.ZYZCBH
  is '自用资产编号';
comment on column EAM2.CZ_PGXX_LSB.ZYZCMC
  is '自用资产名称';
comment on column EAM2.CZ_PGXX_LSB.ZYKPBH
  is '自用资产卡片编号';
comment on column EAM2.CZ_PGXX_LSB.ZYKPMC
  is '自用资产卡片名称';
comment on column EAM2.CZ_PGXX_LSB.ZYCCYZ
  is '自用资产财产原值';
comment on column EAM2.CZ_PGXX_LSB.ZYBGDD
  is '自用资产保管地点';
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
  is '审查知识库';
comment on column EAM2.CZ_SCZSK.ID
  is 'uuid主键';
comment on column EAM2.CZ_SCZSK.PID
  is 'PID';
comment on column EAM2.CZ_SCZSK.CODE
  is 'CODE';
comment on column EAM2.CZ_SCZSK.SCBZ
  is '删除标志';
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
  is '审查知识库变动信息';
comment on column EAM2.CZ_SCZSK_BDXX.ID
  is 'uuid，主键';
comment on column EAM2.CZ_SCZSK_BDXX.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_SCZSK_BDXX.BDQFID
  is '变动前父ID';
comment on column EAM2.CZ_SCZSK_BDXX.BDHFID
  is '变动后父ID';
comment on column EAM2.CZ_SCZSK_BDXX.BDFS
  is '变动方式  修改；迁移；删除';
comment on column EAM2.CZ_SCZSK_BDXX.BDQBH
  is '变动前编号';
comment on column EAM2.CZ_SCZSK_BDXX.BDHBH
  is '变动后编号';
comment on column EAM2.CZ_SCZSK_BDXX.BDQZ
  is '变动前值';
comment on column EAM2.CZ_SCZSK_BDXX.BDHZ
  is '变动后值';
comment on column EAM2.CZ_SCZSK_BDXX.ZSK_ID
  is '原始知识库ID';
comment on column EAM2.CZ_SCZSK_BDXX.SPJG
  is '审批结果  未通过   通过';
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
  is '审查知识库处理单';
comment on column EAM2.CZ_SCZSK_HEAD.ID
  is 'uuid 主键';
comment on column EAM2.CZ_SCZSK_HEAD.LIUCHENGID
  is '流程ID';
comment on column EAM2.CZ_SCZSK_HEAD.BIAOTI
  is '标题';
comment on column EAM2.CZ_SCZSK_HEAD.BIANHAO
  is '编号';
comment on column EAM2.CZ_SCZSK_HEAD.JHCD
  is '急缓程度';
comment on column EAM2.CZ_SCZSK_HEAD.NIGAOREN
  is '拟稿人';
comment on column EAM2.CZ_SCZSK_HEAD.NIGAORENXM
  is '拟稿人名称';
comment on column EAM2.CZ_SCZSK_HEAD.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_SCZSK_HEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_SCZSK_HEAD.LXDH
  is '联系电话';
comment on column EAM2.CZ_SCZSK_HEAD.BLBM
  is '办理部门';
comment on column EAM2.CZ_SCZSK_HEAD.BLBMBH
  is '办理部门编号';
comment on column EAM2.CZ_SCZSK_HEAD.NGRQ
  is '拟稿日期';
comment on column EAM2.CZ_SCZSK_HEAD.SPRID
  is '审批人';
comment on column EAM2.CZ_SCZSK_HEAD.SPRMC
  is '审批人名称';
comment on column EAM2.CZ_SCZSK_HEAD.SPRQ
  is '审批日期';
comment on column EAM2.CZ_SCZSK_HEAD.BDZT
  is '表单状态0未提交1已提交2已审批';
comment on column EAM2.CZ_SCZSK_HEAD.SHEETTYPE
  is '表单类型';
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
  is '审查知识库临时表';
comment on column EAM2.CZ_SCZSK_LSB.ID
  is 'uuid，主键';
comment on column EAM2.CZ_SCZSK_LSB.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_SCZSK_LSB.PID
  is 'PID';
comment on column EAM2.CZ_SCZSK_LSB.CODE
  is 'CODE';
comment on column EAM2.CZ_SCZSK_LSB.VALUE
  is 'VALUE';
comment on column EAM2.CZ_SCZSK_LSB.SCBZ
  is '删除标志';
comment on column EAM2.CZ_SCZSK_LSB.ZSK_ID
  is '知识库ID';
comment on column EAM2.CZ_SCZSK_LSB.ZJBZ
  is '增加标识';
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
  is '实体整体处置人员安置及实体承继投资';
comment on column EAM2.CZ_STCZTZ.ID
  is 'uuid 主键';
comment on column EAM2.CZ_STCZTZ.LC_ID
  is '流程ID';
comment on column EAM2.CZ_STCZTZ.CZXMMC
  is '处置项目名称';
comment on column EAM2.CZ_STCZTZ.BIANHAO
  is '编号';
comment on column EAM2.CZ_STCZTZ.CHENGSONG
  is '呈送';
comment on column EAM2.CZ_STCZTZ.JHCD
  is '急缓程度    一般 ，急 ， 特急';
comment on column EAM2.CZ_STCZTZ.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_STCZTZ.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_STCZTZ.NGRXM
  is '拟稿人姓名';
comment on column EAM2.CZ_STCZTZ.NGR
  is '拟稿人';
comment on column EAM2.CZ_STCZTZ.NGRQ
  is '拟稿日期';
comment on column EAM2.CZ_STCZTZ.LXDH
  is '联系电话';
comment on column EAM2.CZ_STCZTZ.CZSBFS
  is '处置申报方式    首次， 变更， 重报';
comment on column EAM2.CZ_STCZTZ.HQBM
  is '会签部门（人员安置）';
comment on column EAM2.CZ_STCZTZ.STID
  is '实体ID';
comment on column EAM2.CZ_STCZTZ.ZCBH
  is '资产编号';
comment on column EAM2.CZ_STCZTZ.STMC
  is '实体名称';
comment on column EAM2.CZ_STCZTZ.STSCSF
  is '实体所处省份';
comment on column EAM2.CZ_STCZTZ.STXZ
  is '实体现状';
comment on column EAM2.CZ_STCZTZ.STLX
  is '实体类型：0：咨询类实体1：非咨询类实体2：外部实体';
comment on column EAM2.CZ_STCZTZ.STYWYXZC
  is '实体有无有效资产 有 ，无';
comment on column EAM2.CZ_STCZTZ.STYWRY
  is '实体有无人员';
comment on column EAM2.CZ_STCZTZ.DJTSTYZR
  is '对建投是否有负债   有 ，无';
comment on column EAM2.CZ_STCZTZ.FZJE
  is '负债金额';
comment on column EAM2.CZ_STCZTZ.RYAZFYSFXJTDF
  is '人员安置费用是否需建投垫付  是，否';
comment on column EAM2.CZ_STCZTZ.DFJE
  is '垫付金额';
comment on column EAM2.CZ_STCZTZ.GSZMNSFYYSFZJE
  is '公司账面内是否有预计负债金额  无 有';
comment on column EAM2.CZ_STCZTZ.YJFZJE
  is '预计负债金额';
comment on column EAM2.CZ_STCZTZ.AZRS
  is '安置人数';
comment on column EAM2.CZ_STCZTZ.AZFY
  is '安置总费用';
comment on column EAM2.CZ_STCZTZ.AZSM
  is '安置说明';
comment on column EAM2.CZ_STCZTZ.C_CZFS
  is '处置方式';
comment on column EAM2.CZ_STCZTZ.JYDX
  is '交易对象';
comment on column EAM2.CZ_STCZTZ.ZCPGZ
  is '资产评估值';
comment on column EAM2.CZ_STCZTZ.STPGZ
  is '实体评估值';
comment on column EAM2.CZ_STCZTZ.PGJG
  is '评估机构';
comment on column EAM2.CZ_STCZTZ.ZZC
  is '总资产';
comment on column EAM2.CZ_STCZTZ.FUZHAI
  is '负债';
comment on column EAM2.CZ_STCZTZ.GUBEN
  is '股本';
comment on column EAM2.CZ_STCZTZ.JZC
  is '净资产';
comment on column EAM2.CZ_STCZTZ.SHOURU
  is '收入';
comment on column EAM2.CZ_STCZTZ.JLR
  is '净利润';
comment on column EAM2.CZ_STCZTZ.SFSH
  is '是否需上会  是 否';
comment on column EAM2.CZ_STCZTZ.LCMC
  is '流程名称';
comment on column EAM2.CZ_STCZTZ.CLDZT
  is '处理单状态  0：未审批   1：审批中 2：已审批 3：被退回';
comment on column EAM2.CZ_STCZTZ.CBCS
  is '重报次数';
comment on column EAM2.CZ_STCZTZ.HGSCCS
  is '合规审查次数';
comment on column EAM2.CZ_STCZTZ.SBRQ
  is '申报日期';
comment on column EAM2.CZ_STCZTZ.SLXH
  is '受理序号';
comment on column EAM2.CZ_STCZTZ.SCFAXXID
  is '上次方案信息ID';
comment on column EAM2.CZ_STCZTZ.BEIZHU
  is '备注';
comment on column EAM2.CZ_STCZTZ.TZYWLX
  is '投资业务类型';
comment on column EAM2.CZ_STCZTZ.ZMZCZE
  is '账面资产总额';
comment on column EAM2.CZ_STCZTZ.ZMZCFZ
  is '账面资产负债';
comment on column EAM2.CZ_STCZTZ.FBLSJ
  is '发办理时间';
comment on column EAM2.CZ_STCZTZ.TZFS
  is '投资方式';
comment on column EAM2.CZ_STCZTZ.TZJE
  is '投资金额';
comment on column EAM2.CZ_STCZTZ.CZFS
  is '撤资方式';
comment on column EAM2.CZ_STCZTZ.CZJE
  is '撤资金额';
comment on column EAM2.CZ_STCZTZ.GQGC
  is '股权构成';
comment on column EAM2.CZ_STCZTZ.ZZQK
  is '资质情况';
comment on column EAM2.CZ_STCZTZ.BGDZ
  is '办公地址';
comment on column EAM2.CZ_STCZTZ.STRS
  is '实体现有人数';
comment on column EAM2.CZ_STCZTZ.ZMTZ
  is '账面投资(元)';
comment on column EAM2.CZ_STCZTZ.C_WTGLJG
  is '委托管理机构';
comment on column EAM2.CZ_STCZTZ.C_GLBM
  is '实体数据字典表';
comment on column EAM2.CZ_STCZTZ.CZYGSNSQK
  is '出资与工商年审情况';
comment on column EAM2.CZ_STCZTZ.ZYYW
  is '主营业务';
comment on column EAM2.CZ_STCZTZ.HQBMID
  is '会签部门ID';
comment on column EAM2.CZ_STCZTZ.C_FALB
  is '租赁投资方案类别';
comment on column EAM2.CZ_STCZTZ.FAFL
  is '方案分类 0：资产处置 1：承继投资';
comment on column EAM2.CZ_STCZTZ.SQFYZJE
  is '申请费用总金额';
comment on column EAM2.CZ_STCZTZ.SPFYZJE
  is '审批费用总金额';
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
  is '主键，迁就Hibernate的使用习惯，增加一个唯一主键';

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
  is '一般 ，急 ， 特急';
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
  is '结案处理单id';
comment on column EAM2.CZ_XMJA_BODY.XM_ID
  is '处置项目信息表CZ_XM_XX表id';
comment on column EAM2.CZ_XMJA_BODY.SJCZSR
  is '实际处置收入';
comment on column EAM2.CZ_XMJA_BODY.SJCZFY
  is '实际处置费用';
comment on column EAM2.CZ_XMJA_BODY.SFQSXY
  is '是否签署转让协议';
comment on column EAM2.CZ_XMJA_BODY.XYQSSJ
  is '协议签署或项目完成时间';
comment on column EAM2.CZ_XMJA_BODY.KPSFJS
  is '卡片是否减少';
comment on column EAM2.CZ_XMJA_BODY.FYSFJQ
  is '费用是否结清';
comment on column EAM2.CZ_XMJA_BODY.SFYYLWT
  is '是否有遗留问题';
comment on column EAM2.CZ_XMJA_BODY.BEIZHU
  is '备注';
comment on column EAM2.CZ_XMJA_BODY.SQRQ
  is '申请日期（拟稿日期）';
comment on column EAM2.CZ_XMJA_BODY.SPZT
  is '审批状态（0：未审批；1：审批中；2：已审批）';
comment on column EAM2.CZ_XMJA_BODY.SFQBJA
  is '是否全部结案';
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
  is '处置项目申请结案表头
投资项目备案申请表头
投资项目督办表头';
comment on column EAM2.CZ_XMJA_HEAD.ID
  is 'uuid 主键';
comment on column EAM2.CZ_XMJA_HEAD.LIUCHENGID
  is '流程ID';
comment on column EAM2.CZ_XMJA_HEAD.BIANHAO
  is '编号';
comment on column EAM2.CZ_XMJA_HEAD.BIAOTI
  is '标题';
comment on column EAM2.CZ_XMJA_HEAD.JHCD
  is '急缓程度';
comment on column EAM2.CZ_XMJA_HEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.CZ_XMJA_HEAD.NGBM
  is '拟稿部门';
comment on column EAM2.CZ_XMJA_HEAD.NIGAORENXM
  is '拟稿人名称';
comment on column EAM2.CZ_XMJA_HEAD.NIGAOREN
  is '拟稿人';
comment on column EAM2.CZ_XMJA_HEAD.NGRQ
  is '拟稿日期';
comment on column EAM2.CZ_XMJA_HEAD.LXDH
  is '联系电话';
comment on column EAM2.CZ_XMJA_HEAD.BEIZHU
  is 'V';
comment on column EAM2.CZ_XMJA_HEAD.CHENGSON
  is '呈送';
comment on column EAM2.CZ_XMJA_HEAD.LCMC
  is '流程名称';
comment on column EAM2.CZ_XMJA_HEAD.CLDZT
  is '处理单状态  0：未审批   1：审批中 2：已审批 ';
comment on column EAM2.CZ_XMJA_HEAD.HQBM
  is '中国建投会签部门';
comment on column EAM2.CZ_XMJA_HEAD.HQBMID
  is '会签部门ID';
comment on column EAM2.CZ_XMJA_HEAD.JAXMLX
  is '结案项目类型 0：通用资产处置  1：实体（实体整体处置和实体人员安置）';
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
  is '处置投资项目信息临时表';
comment on column EAM2.CZ_XMXX_LSB.ID
  is 'uuid，主键';
comment on column EAM2.CZ_XMXX_LSB.BIANHAO
  is '编号';
comment on column EAM2.CZ_XMXX_LSB.CZXMMC
  is '处置项目名称';
comment on column EAM2.CZ_XMXX_LSB.HBR
  is '汇报人';
comment on column EAM2.CZ_XMXX_LSB.HBRXM
  is '汇报人姓名';
comment on column EAM2.CZ_XMXX_LSB.JCSLXR
  is '监察室列席人';
comment on column EAM2.CZ_XMXX_LSB.JCSLXRXM
  is '监察室列席人姓名';
comment on column EAM2.CZ_XMXX_LSB.YJHZR
  is '意见汇总人';
comment on column EAM2.CZ_XMXX_LSB.YJHZRXM
  is '意见汇总人姓名';
comment on column EAM2.CZ_XMXX_LSB.HY_ID
  is '会议信息ID';
comment on column EAM2.CZ_XMXX_LSB.SPJL
  is '审批结论 0：不同意
1：同意';
comment on column EAM2.CZ_XMXX_LSB.SFBA
  is '是否备案 0：否
1：是';
comment on column EAM2.CZ_XMXX_LSB.ZHUANGTAI
  is '状态
0：未上会
1：上会中
2：上会完毕
3: 委员提交意见中（发送委员材料后）
4: 委员提交意见完毕（所有的委员提交意见后）
5: 主持人提交意见中（待办发送到主持人审批环节）
6: 意见汇总中（主持人提交意见完毕）';
comment on column EAM2.CZ_XMXX_LSB.FENLEI
  is '分类  0：经营性固产处置 1：实体内资产 2：委贷抵债物 3：实体整体处置 4：实体人员安置 5：承继投资';
comment on column EAM2.CZ_XMXX_LSB.SLXH
  is '受理序号';
comment on column EAM2.CZ_XMXX_LSB.SBRQ
  is '申报日期';
comment on column EAM2.CZ_XMXX_LSB.PXXH
  is '项目序号';
comment on column EAM2.CZ_XMXX_LSB.CLD_ID
  is '生成项目的处理单Id';
comment on column EAM2.CZ_XMXX_LSB.YJHZRBMID
  is '意见汇总人所属部门ID';
comment on column EAM2.CZ_XMXX_LSB.YJHZRBMMC
  is '意见汇总人所属部门名称';
comment on column EAM2.CZ_XMXX_LSB.CZSX
  is '处置时限';
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
  is '项目审批委员意见信息';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.XM_ID
  is '处置项目ID';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SPWY
  is '审批委员或主持人';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SPWYXM
  is '审批委员或主持人姓名';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SFTJSPYJ
  is '是否提交审批意见  0：否
1：是';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SPYJJY
  is '审批意见和建议';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.QTQK
  is '其他情况';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.TYYJSJ
  is '提交意见时间';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.SFWZCR
  is '是否为主持人 0：否
1：是';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.TONGYI
  is '同意';
comment on column EAM2.CZ_XM_SPW_YJ_BAK.BUTONGYI
  is '不同意';
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
  is '处置项目信息表';
comment on column EAM2.CZ_XM_XX.ID
  is 'uuid，主键';
comment on column EAM2.CZ_XM_XX.BIANHAO
  is '编号';
comment on column EAM2.CZ_XM_XX.CZXMMC
  is '处置项目名称';
comment on column EAM2.CZ_XM_XX.HBR
  is '汇报人';
comment on column EAM2.CZ_XM_XX.HBRXM
  is '汇报人姓名';
comment on column EAM2.CZ_XM_XX.JCSLXR
  is '监察室列席人';
comment on column EAM2.CZ_XM_XX.JCSLXRXM
  is '监察室列席人姓名';
comment on column EAM2.CZ_XM_XX.YJHZR
  is '意见汇总人';
comment on column EAM2.CZ_XM_XX.YJHZRXM
  is '意见汇总人姓名';
comment on column EAM2.CZ_XM_XX.HY_ID
  is '会议信息ID';
comment on column EAM2.CZ_XM_XX.SPJL
  is '审批结论 0：不同意
1：同意';
comment on column EAM2.CZ_XM_XX.SFBA
  is '是否备案 0：否
1：是';
comment on column EAM2.CZ_XM_XX.ZHUANGTAI
  is '状态 0：处置方案未执行
1：处置方案执行中
2：已结案


';
comment on column EAM2.CZ_XM_XX.FENLEI
  is '分类 0：经营性固产处置
1：实体内资产
2：委贷抵债物
3：承继投资';
comment on column EAM2.CZ_XM_XX.FWWH
  is '发文文号';
comment on column EAM2.CZ_XM_XX.SLXH
  is '受理序号';
comment on column EAM2.CZ_XM_XX.SBRQ
  is '申报日期';
comment on column EAM2.CZ_XM_XX.CLD_ID
  is '生成项目的处理单Id';
comment on column EAM2.CZ_XM_XX.XMLSB
  is '项目临时表id';
comment on column EAM2.CZ_XM_XX.CZSX
  is '处置时限';
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
  is '处置资产信息';
comment on column EAM2.CZ_ZC_XX.ID
  is 'uuid 主键';
comment on column EAM2.CZ_ZC_XX.CLD_ID
  is '处理单ID';
comment on column EAM2.CZ_ZC_XX.ZCLB
  is '处置投资资产类别 0：经营性固产 1：实体内资产 2： 委贷抵债物 3：实体';
comment on column EAM2.CZ_ZC_XX.AZCID
  is '经营固产ID';
comment on column EAM2.CZ_ZC_XX.AZCBH
  is '经营固产资产编号';
comment on column EAM2.CZ_ZC_XX.AZCMC
  is '经营固产资产名称';
comment on column EAM2.CZ_ZC_XX.AZKPBH
  is '主卡片编号';
comment on column EAM2.CZ_ZC_XX.AZKPMC
  is '主卡片名称';
comment on column EAM2.CZ_ZC_XX.AZCGLBM
  is '经营性固产管理部门';
comment on column EAM2.CZ_ZC_XX.AZCGLBMMC
  is '经营性固产管理部门名称';
comment on column EAM2.CZ_ZC_XX.AZCSYBM
  is '经营性固产使用部门';
comment on column EAM2.CZ_ZC_XX.AZCSYBMMC
  is '经营性固产使用部门名称';
comment on column EAM2.CZ_ZC_XX.AZMYZ
  is '资产账面原值';
comment on column EAM2.CZ_ZC_XX.AZMJZ
  is '资产账面净值';
comment on column EAM2.CZ_ZC_XX.APGJZ
  is '资产评估价值';
comment on column EAM2.CZ_ZC_XX.AC_ZCDQ
  is '地区,引用数据字典表';
comment on column EAM2.CZ_ZC_XX.AC_JYFL
  is '经营分类：1经营类 2择机处置类3加快处置类4有处置障碍类5盘亏或报废类';
comment on column EAM2.CZ_ZC_XX.AZYNX
  is '准用年限';
comment on column EAM2.CZ_ZC_XX.AQYRQ
  is '启用日期';
comment on column EAM2.CZ_ZC_XX.AYSYNX
  is '已使用年限';
comment on column EAM2.CZ_ZC_XX.ASKSYNX
  is '尚可使用年限';
comment on column EAM2.CZ_ZC_XX.AC_YT
  is '用途';
comment on column EAM2.CZ_ZC_XX.AC_ZCZC
  is '资产状态';
comment on column EAM2.CZ_ZC_XX.AC_JBHBH
  is '经办行 (一级经办行)';
comment on column EAM2.CZ_ZC_XX.AC_EJFHBH
  is '二级分行(二级经办行)';
comment on column EAM2.CZ_ZC_XX.AC_FYZL
  is '费用种类';
comment on column EAM2.CZ_ZC_XX.ABLSM
  is '办理说明';
comment on column EAM2.CZ_ZC_XX.ASQJE
  is '每个资产申请金额总值';
comment on column EAM2.CZ_ZC_XX.ASDJE
  is '每个资产审定金额总值';
comment on column EAM2.CZ_ZC_XX.ASQFYMX
  is '申请费用明细';
comment on column EAM2.CZ_ZC_XX.JYDX
  is '建行、非建行';
comment on column EAM2.CZ_ZC_XX.ZLQSRQ
  is '租赁起始日期';
comment on column EAM2.CZ_ZC_XX.ZLDQRQ
  is '租赁到期日期';
comment on column EAM2.CZ_ZC_XX.CZR
  is '资产承租人';
comment on column EAM2.CZ_ZC_XX.YXZLMJ
  is '意向租赁面积';
comment on column EAM2.CZ_ZC_XX.YXZJZJE
  is '意向租金总金额';
comment on column EAM2.CZ_ZC_XX.CZYT
  is '出租用途';
comment on column EAM2.CZ_ZC_XX.YXZQ
  is '意向租期';
comment on column EAM2.CZ_ZC_XX.ZLSM
  is '租赁说明';
comment on column EAM2.CZ_ZC_XX.AFYMC
  is '费用名称';
comment on column EAM2.CZ_ZC_XX.BSTID
  is '实体ID';
comment on column EAM2.CZ_ZC_XX.STBH
  is '实体编号';
comment on column EAM2.CZ_ZC_XX.BSTMC
  is '实体名称';
comment on column EAM2.CZ_ZC_XX.BFSXXID
  is '实体附属信息ID';
comment on column EAM2.CZ_ZC_XX.BZCBH
  is '实体内资产编号';
comment on column EAM2.CZ_ZC_XX.BZCMC
  is '实体内资产名称';
comment on column EAM2.CZ_ZC_XX.BSTZCLX
  is '实体内资产类型';
comment on column EAM2.CZ_ZC_XX.BSJZYR
  is '资产实际占有人';
comment on column EAM2.CZ_ZC_XX.BPGZ
  is '实体内资产评估值';
comment on column EAM2.CZ_ZC_XX.BCFWZ
  is '实体内资产存放位置';
comment on column EAM2.CZ_ZC_XX.CDKZH
  is '贷款账号';
comment on column EAM2.CZ_ZC_XX.CZCBH
  is '抵债物资产编号';
comment on column EAM2.CZ_ZC_XX.CZCMC
  is '抵债物资名称';
comment on column EAM2.CZ_ZC_XX.CZCLX
  is '抵债物资产类型';
comment on column EAM2.CZ_ZC_XX.CSJZYR
  is '抵债物资产实际占有人';
comment on column EAM2.CZ_ZC_XX.CCFWZ
  is '抵债物内存放位置';
comment on column EAM2.CZ_ZC_XX.CPGZ
  is '抵债物评估值';
comment on column EAM2.CZ_ZC_XX.ZHUANGTAI
  is '状态 0：未审批 1：审批中 2：已审批 3：流程作废 4 被删除';
comment on column EAM2.CZ_ZC_XX.DQSHCS
  is '当前上会次数';
comment on column EAM2.CZ_ZC_XX.C_SHENGFEN
  is '实体数据字典表';
comment on column EAM2.CZ_ZC_XX.C_DIJISHI
  is '实体数据字典表';
comment on column EAM2.CZ_ZC_XX.C_GLBM
  is '实体数据字典表';
comment on column EAM2.CZ_ZC_XX.C_WTGLJG
  is '委托管理机构';
comment on column EAM2.CZ_ZC_XX.ZYYW
  is '主营业务';
comment on column EAM2.CZ_ZC_XX.CZYGSNSQK
  is '出资与工商年审情况';
comment on column EAM2.CZ_ZC_XX.BGDZ
  is '办公地址';
comment on column EAM2.CZ_ZC_XX.ZZQK
  is '资质情况';
comment on column EAM2.CZ_ZC_XX.ZMTZ
  is '账面投资(元)';
comment on column EAM2.CZ_ZC_XX.STRS
  is '实体现有人数';
comment on column EAM2.CZ_ZC_XX.ZZC
  is '总资产';
comment on column EAM2.CZ_ZC_XX.FUZHAI
  is '负债';
comment on column EAM2.CZ_ZC_XX.GUBEN
  is '股本';
comment on column EAM2.CZ_ZC_XX.JZC
  is '净资产';
comment on column EAM2.CZ_ZC_XX.STSR
  is '实体收入';
comment on column EAM2.CZ_ZC_XX.JLR
  is '净利润';
comment on column EAM2.CZ_ZC_XX.ZCBH
  is '资产编号';
comment on column EAM2.CZ_ZC_XX.ZCMC
  is '资产名称';
comment on column EAM2.CZ_ZC_XX.TZZCLB
  is '投资资产类别';
comment on column EAM2.CZ_ZC_XX.SHENGFEN
  is '资产所属省份';
comment on column EAM2.CZ_ZC_XX.ZCGLBMMC
  is '资产管理部门名称';
comment on column EAM2.CZ_ZC_XX.ZYZCID
  is '自用资产ID';
comment on column EAM2.CZ_ZC_XX.ZYZCBH
  is '自用资产编号';
comment on column EAM2.CZ_ZC_XX.ZYZCMC
  is '自用资产名称';
comment on column EAM2.CZ_ZC_XX.ZYKPBH
  is '自用资产卡片编号';
comment on column EAM2.CZ_ZC_XX.ZYKPMC
  is '自用资产卡片名称';
comment on column EAM2.CZ_ZC_XX.ZYCCYZ
  is '自用资产财产原值';
comment on column EAM2.CZ_ZC_XX.ZYBGDD
  is '自用资产保管地点';
comment on column EAM2.CZ_ZC_XX.C_ZCQS
  is '资产权属';
comment on column EAM2.CZ_ZC_XX.C_CZFS
  is '处置方式';
comment on column EAM2.CZ_ZC_XX.FZQ_ID
  is '债券ID,UUID';
comment on column EAM2.CZ_ZC_XX.FZQXM_ID
  is '债券项目ID';
comment on column EAM2.CZ_ZC_XX.FZQXMMC
  is '债券项目名称';
comment on column EAM2.CZ_ZC_XX.JHFHID
  is '从INDIVIDTREE中选取,类型为department';
comment on column EAM2.CZ_ZC_XX.JHFHBM
  is '建行分行编码,INDIVIDTREE';
comment on column EAM2.CZ_ZC_XX.JHFHMC
  is '建行分行名称,INDIVIDTREE';
comment on column EAM2.CZ_ZC_XX.ZQZLID
  is '债券种类ID,来自CODE表';
comment on column EAM2.CZ_ZC_XX.ZQZLBM
  is '债券种类编码,来自CODE表';
comment on column EAM2.CZ_ZC_XX.ZQZLMC
  is '债券种类名称,来自CODE表';
comment on column EAM2.CZ_ZC_XX.ZQMC
  is '债券名称';
comment on column EAM2.CZ_ZC_XX.DQR
  is '到期日';
comment on column EAM2.CZ_ZC_XX.YZMJ
  is '已租面积';
comment on column EAM2.CZ_ZC_XX.ZJM
  is '总面积';
comment on column EAM2.CZ_ZC_XX.ZDMJ
  is '占地面积';
comment on column EAM2.CZ_ZC_XX.AC_ZCLX
  is '经营性固定资产资产类型';
comment on column EAM2.CZ_ZC_XX.STLX
  is '实体类型';
comment on column EAM2.CZ_ZC_XX.SFCZWB
  is '是否处置完毕';
comment on column EAM2.CZ_ZC_XX.CJTZSYYZD_______
  is '承继投资其他业务类型使用字段';
comment on column EAM2.CZ_ZC_XX.TZZCBH
  is '投资资产编号
';
comment on column EAM2.CZ_ZC_XX.TZZCMC
  is '投资资产名称
';
comment on column EAM2.CZ_ZC_XX.TZZCGLBM
  is '投资资产管理部门名称';
comment on column EAM2.CZ_ZC_XX.TZZCDZ
  is '投资资产地址
';
comment on column EAM2.CZ_ZC_XX.TZZCID
  is '投资资产ID';
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
  is '建投、实体债权债务信息表';
comment on column EAM2.DEBT_INFO.ZQRMC
  is '债权人名称包括中国建投和内部实体';
comment on column EAM2.DEBT_INFO.ZQRID
  is '债权人ID，如果债权人是中国建投，id记录中国建投编号，如果是内部实体，记录内部实体id';
comment on column EAM2.DEBT_INFO.ZWRMC
  is '债务人名称';
comment on column EAM2.DEBT_INFO.ZWRID
  is '债务人ID';
comment on column EAM2.DEBT_INFO.GLSTLX
  is '内部实体、外部实体';
comment on column EAM2.DEBT_INFO.GRZYE
  is '购入债余额';
comment on column EAM2.DEBT_INFO.BJ
  is '本金';
comment on column EAM2.DEBT_INFO.LX
  is '利息';
comment on column EAM2.DEBT_INFO.HJ
  is '合计';
comment on column EAM2.DEBT_INFO.BZID
  is '合同金额币种ID,对应CODE表';
comment on column EAM2.DEBT_INFO.BZBM
  is '币种编码，取自CODE表';
comment on column EAM2.DEBT_INFO.BZMC
  is '币种名称，取自CODE表';
comment on column EAM2.DEBT_INFO.HTJE
  is '合同金额原币金额';
comment on column EAM2.DEBT_INFO.HTBH
  is '合同档案编号';
comment on column EAM2.DEBT_INFO.HTQSRQ
  is '合同起始日期';
comment on column EAM2.DEBT_INFO.HTZZRQ
  is '合同终止日期';
comment on column EAM2.DEBT_INFO.DBLXID
  is '担保类型ID,取自CODE表';
comment on column EAM2.DEBT_INFO.DBLXBM
  is '担保类型编码';
comment on column EAM2.DEBT_INFO.DBLXMC
  is '担保类型名称';
comment on column EAM2.DEBT_INFO.DBHTBH
  is '担保合同编号';
comment on column EAM2.DEBT_INFO.DBHTJE
  is '担保合同金额';
comment on column EAM2.DEBT_INFO.DBWZLBID
  is '担保物资类别ID';
comment on column EAM2.DEBT_INFO.DBWZLBBH
  is '担保物资类别编号';
comment on column EAM2.DEBT_INFO.DBWZLBMC
  is '担保物资类别名称';
comment on column EAM2.DEBT_INFO.BZRMC
  is '保证人名称';
comment on column EAM2.DEBT_INFO.SFSS
  is '1是诉讼0不诉讼';
comment on column EAM2.DEBT_INFO.SSFY
  is '诉讼费用';
comment on column EAM2.DEBT_INFO.SFYSXFLWS
  is '1有0无';
comment on column EAM2.DEBT_INFO.ZHTSFSS
  is '1是0否';
comment on column EAM2.DEBT_INFO.DBHTSFSS
  is '1是0否';
comment on column EAM2.DEBT_INFO.FSHX
  is '1是0否';
comment on column EAM2.DEBT_INFO.DJZR
  is '对价转让情况';
comment on column EAM2.DEBT_INFO.BEIZHU
  is '备注';
comment on column EAM2.DEBT_INFO.CZZT
  is '处置状态 0未处置 1：处置中2：已处置';
comment on column EAM2.DEBT_INFO.SHENGFEN
  is '省份';
comment on column EAM2.DEBT_INFO.ZQZL
  is '债权种类 0：全部  1：信达转让 2： 建银转让  3：其他
';
comment on column EAM2.DEBT_INFO.DJZRJE
  is '对价转让金额';
comment on column EAM2.DEBT_INFO.DBFS
  is '担保方式';
comment on column EAM2.DEBT_INFO.ZQJE
  is '债权金额';
comment on column EAM2.DEBT_INFO.SSSX
  is '诉讼时效';
comment on column EAM2.DEBT_INFO.BZRDSM
  is '保证人等说明';
comment on column EAM2.DEBT_INFO.ZWRQKJS
  is '债务人情况介绍';
comment on column EAM2.DEBT_INFO.FZJS
  is '负债介绍';
comment on column EAM2.DEBT_INFO.ZQQX
  is '债权期限（天）';
comment on column EAM2.DEBT_INFO.HTMC
  is '合同名称';
comment on column EAM2.DEBT_INFO.DYZYCC
  is '抵押质押财产';
comment on column EAM2.DEBT_INFO.SFBC
  is '			是否保存';
comment on column EAM2.DEBT_INFO.ZWRBH
  is '债务人编号，如果实体是内部实体，存资产编号';
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
  is '建投、实体债权债务信息临时表';
comment on column EAM2.DEBT_INFO_LSB.CLD_ID
  is '处理单ID';
comment on column EAM2.DEBT_INFO_LSB.ZQXX_ID
  is '债权信息表ID';
comment on column EAM2.DEBT_INFO_LSB.ZQRMC
  is '债权人名称包括中国建投和内部实体';
comment on column EAM2.DEBT_INFO_LSB.ZQRID
  is '债权人ID，如果债权人是中国建投，id记录中国建投编号，如果是内部实体，记录内部实体id';
comment on column EAM2.DEBT_INFO_LSB.ZWRBH
  is '债务人编号，如果实体是内部实体，存资产编号';
comment on column EAM2.DEBT_INFO_LSB.ZWRMC
  is '债务人名称';
comment on column EAM2.DEBT_INFO_LSB.ZWRID
  is '债务人ID';
comment on column EAM2.DEBT_INFO_LSB.GLSTLX
  is '内部实体、外部实体';
comment on column EAM2.DEBT_INFO_LSB.GRZYE
  is '购入债余额';
comment on column EAM2.DEBT_INFO_LSB.BJ
  is '本金';
comment on column EAM2.DEBT_INFO_LSB.LX
  is '利息';
comment on column EAM2.DEBT_INFO_LSB.HJ
  is '合计';
comment on column EAM2.DEBT_INFO_LSB.BZID
  is '合同金额币种ID,对应CODE表';
comment on column EAM2.DEBT_INFO_LSB.BZBM
  is '币种编码，取自CODE表';
comment on column EAM2.DEBT_INFO_LSB.BZMC
  is '币种名称，取自CODE表';
comment on column EAM2.DEBT_INFO_LSB.HTJE
  is '合同金额原币金额';
comment on column EAM2.DEBT_INFO_LSB.HTBH
  is '合同档案编号';
comment on column EAM2.DEBT_INFO_LSB.HTQSRQ
  is '合同起始日期';
comment on column EAM2.DEBT_INFO_LSB.HTZZRQ
  is '合同终止日期';
comment on column EAM2.DEBT_INFO_LSB.DBLXID
  is '担保类型ID,取自CODE表';
comment on column EAM2.DEBT_INFO_LSB.DBLXBM
  is '担保类型编码';
comment on column EAM2.DEBT_INFO_LSB.DBLXMC
  is '担保类型名称';
comment on column EAM2.DEBT_INFO_LSB.DBHTBH
  is '担保合同编号';
comment on column EAM2.DEBT_INFO_LSB.DBHTJE
  is '担保合同金额';
comment on column EAM2.DEBT_INFO_LSB.DBWZLBID
  is '担保物资类别ID';
comment on column EAM2.DEBT_INFO_LSB.DBWZLBBH
  is '担保物资类别编号';
comment on column EAM2.DEBT_INFO_LSB.DBWZLBMC
  is '担保物资类别名称';
comment on column EAM2.DEBT_INFO_LSB.BZRMC
  is '保证人名称';
comment on column EAM2.DEBT_INFO_LSB.SFSS
  is '1是诉讼0不诉讼';
comment on column EAM2.DEBT_INFO_LSB.SSFY
  is '诉讼费用';
comment on column EAM2.DEBT_INFO_LSB.SFYSXFLWS
  is '1有0无';
comment on column EAM2.DEBT_INFO_LSB.ZHTSFSS
  is '1是0否';
comment on column EAM2.DEBT_INFO_LSB.DBHTSFSS
  is '1是0否';
comment on column EAM2.DEBT_INFO_LSB.FSHX
  is '1是0否';
comment on column EAM2.DEBT_INFO_LSB.DJZR
  is '对价转让情况';
comment on column EAM2.DEBT_INFO_LSB.BEIZHU
  is '备注';
comment on column EAM2.DEBT_INFO_LSB.CZZT
  is '处置状态 0未处置 1：处置中2：已处置';
comment on column EAM2.DEBT_INFO_LSB.SHENGFEN
  is '省份';
comment on column EAM2.DEBT_INFO_LSB.ZQZL
  is '债权种类 0：全部  1：信达转让 2： 建银转让  3：其他
';
comment on column EAM2.DEBT_INFO_LSB.DJZRJE
  is '对价转让金额';
comment on column EAM2.DEBT_INFO_LSB.DBFS
  is '担保方式';
comment on column EAM2.DEBT_INFO_LSB.ZQJE
  is '债权金额';
comment on column EAM2.DEBT_INFO_LSB.SSSX
  is '诉讼时效';
comment on column EAM2.DEBT_INFO_LSB.BZRDSM
  is '保证人等说明';
comment on column EAM2.DEBT_INFO_LSB.ZWRQKJS
  is '债务人情况介绍';
comment on column EAM2.DEBT_INFO_LSB.FZJS
  is '负债介绍';
comment on column EAM2.DEBT_INFO_LSB.ZQQX
  is '债权期限（天）';
comment on column EAM2.DEBT_INFO_LSB.HTMC
  is '合同名称';
comment on column EAM2.DEBT_INFO_LSB.DYZYCC
  is '抵押质押财产';
comment on column EAM2.DEBT_INFO_LSB.SFBC
  is '是否保存';
comment on column EAM2.DEBT_INFO_LSB.C_ZCQS
  is '资产权属';
comment on column EAM2.DEBT_INFO_LSB.WTRMC
  is '委托人名称';
comment on column EAM2.DEBT_INFO_LSB.ZRJE
  is '转让金额';
comment on column EAM2.DEBT_INFO_LSB.CLDZT
  is '审批状态  0：未审批   1：审批中 2：已审批';
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
  is '债权工作日志ID,UUID';
comment on column EAM2.DEBT_WORKLOG.CSR
  is '催收人ID';
comment on column EAM2.DEBT_WORKLOG.CSRMC
  is '催收人姓名';
comment on column EAM2.DEBT_WORKLOG.CSSJ
  is '催收时间';
comment on column EAM2.DEBT_WORKLOG.CSFS
  is '催收方式';
comment on column EAM2.DEBT_WORKLOG.ZWFZR
  is '债务负责人';
comment on column EAM2.DEBT_WORKLOG.ZWFZRDH
  is '债务负责人电话';
comment on column EAM2.DEBT_WORKLOG.BLJG
  is '办理结果';
comment on column EAM2.DEBT_WORKLOG.BZ
  is '备注';
comment on column EAM2.DEBT_WORKLOG.ZQID
  is '对应债券ID';
comment on column EAM2.DEBT_WORKLOG.SFBC
  is '是否保存';
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
  is '用于程序中查询使用';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPEORDER
  is '用于控制分类在列表的显示顺序';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPEAREA
  is '用于控制不同数据分类在不同的业务模块中显示';
comment on column EAM2.DIC_APP_ASSETTYPE1.TYPENAME
  is '在页面上展现给用户的分类名称';
comment on column EAM2.DIC_APP_ASSETTYPE1.ORGID
  is '控制不同数据分类在不同的部门内部显示。';
comment on column EAM2.DIC_APP_ASSETTYPE1.MEMO_1
  is '用于后期属性的扩展';
comment on column EAM2.DIC_APP_ASSETTYPE1.MEMO_2
  is '用于后期属性的扩展';
comment on column EAM2.DIC_APP_ASSETTYPE1.ASSETTYPE1_ID
  is '采用 sequence';
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
  is '用于程序中查询使用';
comment on column EAM2.DIC_APP_ASSETTYPE2.MAINCODE
  is '第一级分类的代码';
comment on column EAM2.DIC_APP_ASSETTYPE2.TYPEORDER
  is '用于控制分类在列表的显示顺序';
comment on column EAM2.DIC_APP_ASSETTYPE2.TYPENAME
  is '在页面上展现给用户的分类名称';
comment on column EAM2.DIC_APP_ASSETTYPE2.ORGID
  is '控制不同数据分类在不同的部门内部显示。';
comment on column EAM2.DIC_APP_ASSETTYPE2.MEMO_1
  is '用于后期属性的扩展';
comment on column EAM2.DIC_APP_ASSETTYPE2.MEMO_2
  is '用于后期属性的扩展';
comment on column EAM2.DIC_APP_ASSETTYPE2.ASSETTYPE2_ID
  is '采用 sequence';
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
  is '用于程序中查询使用';
comment on column EAM2.DIC_APP_ASSETTYPE3.MAINCODE
  is '第一级分类的代码';
comment on column EAM2.DIC_APP_ASSETTYPE3.SECONDCODE
  is '第二级分类的代码';
comment on column EAM2.DIC_APP_ASSETTYPE3.TYPEORDER
  is '用于控制分类在列表的显示顺序';
comment on column EAM2.DIC_APP_ASSETTYPE3.TYPENAME
  is '在页面上展现给用户的分类名称';
comment on column EAM2.DIC_APP_ASSETTYPE3.ORGID
  is '控制不同数据分类在不同的部门内部显示。';
comment on column EAM2.DIC_APP_ASSETTYPE3.MEMO_1
  is '用于后期属性的扩展';
comment on column EAM2.DIC_APP_ASSETTYPE3.MEMO_2
  is '用于后期属性的扩展';
comment on column EAM2.DIC_APP_ASSETTYPE3.ASSETTYPE3_ID
  is '采用 sequence';
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
  is '资产字典状态表';
comment on column EAM2.DIC_APP_ASSET_STATE.CODE
  is '状态代码';
comment on column EAM2.DIC_APP_ASSET_STATE.NAME
  is '状态名称';
comment on column EAM2.DIC_APP_ASSET_STATE.TYPE
  is '字典类型';
comment on column EAM2.DIC_APP_ASSET_STATE.TYPEINFO
  is '类型描述';
comment on column EAM2.DIC_APP_ASSET_STATE.PARENTID
  is '父节点编码';
comment on column EAM2.DIC_APP_ASSET_STATE.TYPEORDER
  is '属性排序';
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
  is '编号';
comment on column EAM2.E_T_COUNTERSIGN.TITLE
  is '待办标题';
comment on column EAM2.E_T_COUNTERSIGN.DEPTID
  is '会签部门编号';
comment on column EAM2.E_T_COUNTERSIGN.ASSIGNID
  is '处理人编号';
comment on column EAM2.E_T_COUNTERSIGN.PIID
  is '流程实例编号';
comment on column EAM2.E_T_COUNTERSIGN.CREATTIME
  is '创建时间';
comment on column EAM2.E_T_COUNTERSIGN.ISFINISHED
  is '是否完成(0未完成，1已完成)';
comment on column EAM2.E_T_COUNTERSIGN.BIZ_PIID
  is '业务单实例流编号';
comment on column EAM2.E_T_COUNTERSIGN.HEADID
  is '业务单编号';
comment on column EAM2.E_T_COUNTERSIGN.HEAD_TYPE
  is '业务单类型';
comment on column EAM2.E_T_COUNTERSIGN.URL
  is '业务单查询明细url';

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
  is '编号';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.USERID
  is '参与者编号';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.TIME
  is '委派时间';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.COUNTERSIGNID
  is '会签主记录编号';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ISFINISHED
  is '是否完成(0未完成，1已完成)';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ASSIGNPERSONID
  is '加签人编号';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ASSIGNTASKID
  is '加签任务';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.PIID
  is '该会签所在流程实例编号';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.TASKID
  is '该会签所在任务编号';
comment on column EAM2.E_T_COUNTERSIGN_PARTICIPANT.ASSIGNPARTICIPANTID
  is '指派加签记录编号';

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
  is '意见提交时间';
comment on column EAM2.E_T_LC_YJ.YJTJR
  is '意见提交人';
comment on column EAM2.E_T_LC_YJ.YJMC
  is '意见标题';
comment on column EAM2.E_T_LC_YJ.TID
  is '主键编号';
comment on column EAM2.E_T_LC_YJ.YJNR
  is '意见内容';
comment on column EAM2.E_T_LC_YJ.CLDBH
  is '业务单主键';
comment on column EAM2.E_T_LC_YJ.DEPT_ID
  is '部门编号';
comment on column EAM2.E_T_LC_YJ.YJLX
  is '意见类型';
comment on column EAM2.E_T_LC_YJ.HJ
  is '所在环节';
comment on column EAM2.E_T_LC_YJ.FLCBH
  is '父流程编号';
comment on column EAM2.E_T_LC_YJ.ZZYJ
  is '最终意见';
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
  is '卡片专用字典';
comment on column EAM2.INDIVIDUALTREE.CATEGORYID
  is 'Id,原有记录保留，新记录采用UUID';
comment on column EAM2.INDIVIDUALTREE.PARENTCATEGORYID
  is '父节点Id';
comment on column EAM2.INDIVIDUALTREE.CATEGORYNAME
  is '节点名称';
comment on column EAM2.INDIVIDUALTREE.ACTIVITYSTATUS
  is '活动状态Y有效N无效';
comment on column EAM2.INDIVIDUALTREE.OPERATELEVEL
  is '权限(无用字段)';
comment on column EAM2.INDIVIDUALTREE.URL
  is 'url地址(无用字段)';
comment on column EAM2.INDIVIDUALTREE.TREETYPE
  is '树的类型,这个字段是树的根本分类';
comment on column EAM2.INDIVIDUALTREE.NODEORDER
  is '同一结点下的顺序';
comment on column EAM2.INDIVIDUALTREE.NODEVALUE
  is '结点上所代表的实际值,编码值';
comment on column EAM2.INDIVIDUALTREE.HASCHILD
  is '是否有子结点的标志 0:没有子结点，1有子节点';
comment on column EAM2.INDIVIDUALTREE.COLONIZEVALUE
  is '拓展属性，用户绑定一些特殊的值。';
comment on column EAM2.INDIVIDUALTREE.LEAF
  is '是否有叶子节点,含义与Haschild重复';
comment on column EAM2.INDIVIDUALTREE.NODETAG
  is '节点的扩展TAG，系统备用';
comment on column EAM2.INDIVIDUALTREE.ROOTNOTE
  is 'Y是根节点';
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
  is '树的类型英文名';
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREENAME
  is '树的类型中文名';
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREETYPE_DESC
  is '树对应类型的详细描述';
comment on column EAM2.INDIVIDUALTREE_CATALOG.TREETYPE_USEDFUNCTIONS
  is '描述在应用系统中何处会使用这棵树';
comment on column EAM2.INDIVIDUALTREE_CATALOG.WRITER
  is '这条信息的录入人员';

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
  is '固产投保信息';
comment on column EAM2.JJZC_GCTB_XX.CLD_ID
  is '处理单ID';
comment on column EAM2.JJZC_GCTB_XX.ZC_ID
  is '资产ID';
comment on column EAM2.JJZC_GCTB_XX.BXGSMC
  is '保险公司名称';
comment on column EAM2.JJZC_GCTB_XX.SYXBF
  is '商业险保费';
comment on column EAM2.JJZC_GCTB_XX.SYXKSRQ
  is '商业险开始日期';
comment on column EAM2.JJZC_GCTB_XX.SYXJSRQ
  is '商业险结束日期';
comment on column EAM2.JJZC_GCTB_XX.JQXBF
  is '交强险保费';
comment on column EAM2.JJZC_GCTB_XX.JQXKSRQ
  is '交强险开始日期';
comment on column EAM2.JJZC_GCTB_XX.JQXJSRQ
  is '交强险结束日期';
comment on column EAM2.JJZC_GCTB_XX.SFHJ
  is '税费合计';
comment on column EAM2.JJZC_GCTB_XX.CCSJE
  is '车船税金额';
comment on column EAM2.JJZC_GCTB_XX.PJTBZE
  is '车辆去年平均投保总额';
comment on column EAM2.JJZC_GCTB_XX.GCTBKSRQ
  is '固产投保开始日期';
comment on column EAM2.JJZC_GCTB_XX.GCTBJSRQ
  is '固产投保结束日期';
comment on column EAM2.JJZC_GCTB_XX.CCYQXTBZCZE
  is '财产一切险投保资产总额';
comment on column EAM2.JJZC_GCTB_XX.CZYQXFL
  is '财产一切险费率';
comment on column EAM2.JJZC_GCTB_XX.CZYQXZK
  is '财产一切险折扣';
comment on column EAM2.JJZC_GCTB_XX.CZYQXBF
  is '财产一切险保费';
comment on column EAM2.JJZC_GCTB_XX.JQSHXTBZCZE
  is '机器损坏险投保资产总额';
comment on column EAM2.JJZC_GCTB_XX.JQSHXFL
  is '机器损坏险费率';
comment on column EAM2.JJZC_GCTB_XX.JQSHXZK
  is '机器损坏险折扣';
comment on column EAM2.JJZC_GCTB_XX.JIQISHXBF
  is '机器损坏险保费';
comment on column EAM2.JJZC_GCTB_XX.GGZRXBE
  is '公共责任险保额';
comment on column EAM2.JJZC_GCTB_XX.GGZRXBXFL
  is '公共责任险折扣';
comment on column EAM2.JJZC_GCTB_XX.GGZRXBF
  is '公共责任险保费';
comment on column EAM2.JJZC_GCTB_XX.SPZT
  is '审批状态  0：未审批
1：审批中
2：审批结束';
comment on column EAM2.JJZC_GCTB_XX.TBLX
  is '投保类型0：车险投保 1：非车险投保';
comment on column EAM2.JJZC_GCTB_XX.CLQNTPJE
  is '车辆去年投保平均额';
comment on column EAM2.JJZC_GCTB_XX.TBZE
  is '非车险投保总额';
comment on column EAM2.JJZC_GCTB_XX.TBZHJ
  is '投保总合计';
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
  is '流程ID';
comment on column EAM2.JJZC_HTQS_HEAD.BIAOTI
  is '标题';
comment on column EAM2.JJZC_HTQS_HEAD.BIANHAO
  is '编号';
comment on column EAM2.JJZC_HTQS_HEAD.JHCD
  is '急缓程度';
comment on column EAM2.JJZC_HTQS_HEAD.NGR
  is '拟稿人编号';
comment on column EAM2.JJZC_HTQS_HEAD.NGRMC
  is '拟稿人名称';
comment on column EAM2.JJZC_HTQS_HEAD.LXDH
  is '联系电话';
comment on column EAM2.JJZC_HTQS_HEAD.NGRQ
  is '拟稿日期';
comment on column EAM2.JJZC_HTQS_HEAD.NGBM
  is '拟稿部门';
comment on column EAM2.JJZC_HTQS_HEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.JJZC_HTQS_HEAD.BEIZHU
  is '备注';
comment on column EAM2.JJZC_HTQS_HEAD.YWLX
  is '0：确权审批
1：更新改造
2：业务维修
3：其他费用审批';
comment on column EAM2.JJZC_HTQS_HEAD.LCMC
  is '流程名称';
comment on column EAM2.JJZC_HTQS_HEAD.SFBB
  is '拟稿部门是否为本部  0：否
1：是';
comment on column EAM2.JJZC_HTQS_HEAD.SHEETTYPE
  is '表单类型';
comment on column EAM2.JJZC_HTQS_HEAD.QSPC
  is '清算批次';
comment on column EAM2.JJZC_HTQS_HEAD.QSLX
  is '清算类型';
comment on column EAM2.JJZC_HTQS_HEAD.YSYFZJE
  is '应收/应付总金额';
comment on column EAM2.JJZC_HTQS_HEAD.TZZJE
  is '调整总金额';
comment on column EAM2.JJZC_HTQS_HEAD.THYSYFZJE
  is '调整后应收/应付总金额';
comment on column EAM2.JJZC_HTQS_HEAD.SSZJE
  is '实收总金额';
comment on column EAM2.JJZC_HTQS_HEAD.SSTZZJE
  is '实收调整总金额';
comment on column EAM2.JJZC_HTQS_HEAD.THSSZJE
  is '调整后实收总金额';
comment on column EAM2.JJZC_HTQS_HEAD.ZHUANGTAI
  is '状态 1审批中 2已审批';
comment on column EAM2.JJZC_HTQS_HEAD.CHENGSONG
  is '呈送';
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
  is 'uuid，主键';
comment on column EAM2.JJZC_HT_BX.CLD_ID
  is '处理单ID';
comment on column EAM2.JJZC_HT_BX.HTBH
  is '合同编号';
comment on column EAM2.JJZC_HT_BX.SWHTBH
  is '实物合同编号';
comment on column EAM2.JJZC_HT_BX.HTLX
  is '合同类型  车险合同 非车险合同';
comment on column EAM2.JJZC_HT_BX.C_HTZT
  is '合同状态';
comment on column EAM2.JJZC_HT_BX.C_YJFH
  is '一级分行';
comment on column EAM2.JJZC_HT_BX.BXGSMC
  is '保险公司名称';
comment on column EAM2.JJZC_HT_BX.BXGSDZ
  is '保险公司地址';
comment on column EAM2.JJZC_HT_BX.BXGSLXR
  is '保险公司联系人';
comment on column EAM2.JJZC_HT_BX.LXRDH
  is '联系人电话';
comment on column EAM2.JJZC_HT_BX.CPH
  is '车牌号';
comment on column EAM2.JJZC_HT_BX.SYXBF
  is '商业险保费';
comment on column EAM2.JJZC_HT_BX.SYXKSRQ
  is '商业险开始日期';
comment on column EAM2.JJZC_HT_BX.SYXJSRQ
  is '商业险结束日期';
comment on column EAM2.JJZC_HT_BX.JQXBF
  is '交强险保费';
comment on column EAM2.JJZC_HT_BX.JQXKSRQ
  is '交强险开始日期';
comment on column EAM2.JJZC_HT_BX.JQXJSRQ
  is '交强险结束日期';
comment on column EAM2.JJZC_HT_BX.CCSJE
  is '车船税金额';
comment on column EAM2.JJZC_HT_BX.SFHJ
  is '税费合计';
comment on column EAM2.JJZC_HT_BX.JIQISHXBXFL
  is '机器损坏险保险费率';
comment on column EAM2.JJZC_HT_BX.JIQISHXBF
  is '机器损坏险保费';
comment on column EAM2.JJZC_HT_BX.JIQIXKSRQ
  is '机器险开始日期';
comment on column EAM2.JJZC_HT_BX.JIQIXJSRQ
  is '机器险结束日期';
comment on column EAM2.JJZC_HT_BX.GGZRXBXFL
  is '公共责任险保险费率';
comment on column EAM2.JJZC_HT_BX.GGZRXBF
  is '公共责任险保费';
comment on column EAM2.JJZC_HT_BX.GGZRXKSRQ
  is '公共责任险开始日期';
comment on column EAM2.JJZC_HT_BX.GGZRXJSRQ
  is '公共责任险结束日期';
comment on column EAM2.JJZC_HT_BX.CCXBXFL
  is '财产险保险费率';
comment on column EAM2.JJZC_HT_BX.CCXBF
  is '财产险保费';
comment on column EAM2.JJZC_HT_BX.CCXKSRQ
  is '财产险开始日期';
comment on column EAM2.JJZC_HT_BX.CCXJSRQ
  is '财产险结束日期';
comment on column EAM2.JJZC_HT_BX.HTQSRQ
  is '合同起始日期';
comment on column EAM2.JJZC_HT_BX.HTDQRQ
  is '合同到期日期';
comment on column EAM2.JJZC_HT_BX.SPZT
  is '审批状态  0：未审批
1：审批中
2：审批结束';
comment on column EAM2.JJZC_HT_BX.ZCID
  is '资产ID';
comment on column EAM2.JJZC_HT_BX.ZCBH
  is '资产编号';
comment on column EAM2.JJZC_HT_BX.ZCMC
  is '资产名称';
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
  is '非车险一张合同对照多项资产，记录合同和资产关系信息';
comment on column EAM2.JJZC_HT_BXZCGX.ID
  is 'uuid，主键';
comment on column EAM2.JJZC_HT_BXZCGX.ZC_ID
  is '资产ID';
comment on column EAM2.JJZC_HT_BXZCGX.BXHT_ID
  is '保险合同ID';
comment on column EAM2.JJZC_HT_BXZCGX.SPZT
  is '审批状态  0：未审批
1：审批中
2：审批结束';
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
  is '租赁合同阶段租金';
comment on column EAM2.JJZC_HT_JDZJ.ID
  is 'ID';
comment on column EAM2.JJZC_HT_JDZJ.HT_ID
  is '合同ID';
comment on column EAM2.JJZC_HT_JDZJ.KSRQ
  is '开始日期';
comment on column EAM2.JJZC_HT_JDZJ.JSRQ
  is '结束日期';
comment on column EAM2.JJZC_HT_JDZJ.BIANDONG
  is '变动';
comment on column EAM2.JJZC_HT_JDZJ.YZJ
  is '月租金';
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
  is '租赁合同阶段租金临时表';
comment on column EAM2.JJZC_HT_JDZJ_LSB.ID
  is 'ID';
comment on column EAM2.JJZC_HT_JDZJ_LSB.HT_ID
  is '合同ID';
comment on column EAM2.JJZC_HT_JDZJ_LSB.KSRQ
  is '开始日期';
comment on column EAM2.JJZC_HT_JDZJ_LSB.JSRQ
  is '结束日期';
comment on column EAM2.JJZC_HT_JDZJ_LSB.BIANDONG
  is '变动';
comment on column EAM2.JJZC_HT_JDZJ_LSB.YZJ
  is '月租金';
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
  is '租赁委管合同';
comment on column EAM2.JJZC_HT_ZLWG.ID
  is 'ID';
comment on column EAM2.JJZC_HT_ZLWG.ZCID
  is '资产ID';
comment on column EAM2.JJZC_HT_ZLWG.ZCBH
  is '资产编号';
comment on column EAM2.JJZC_HT_ZLWG.ZCMC
  is '资产名称';
comment on column EAM2.JJZC_HT_ZLWG.SWHTBH
  is '实物合同编号';
comment on column EAM2.JJZC_HT_ZLWG.C_HTLX
  is '合同类型';
comment on column EAM2.JJZC_HT_ZLWG.HTBH
  is '合同编号';
comment on column EAM2.JJZC_HT_ZLWG.C_HTZT
  is '合同状态';
comment on column EAM2.JJZC_HT_ZLWG.CZR
  is '承租人';
comment on column EAM2.JJZC_HT_ZLWG.C_CZRXZ
  is '承租人性质';
comment on column EAM2.JJZC_HT_ZLWG.CZLXR
  is '承租联系人';
comment on column EAM2.JJZC_HT_ZLWG.CZFLXDH
  is '承租方联系电话';
comment on column EAM2.JJZC_HT_ZLWG.JBRLXDH
  is '经办人联系电话';
comment on column EAM2.JJZC_HT_ZLWG.JYDX
  is '交易对象';
comment on column EAM2.JJZC_HT_ZLWG.CZSL
  is '承租数量';
comment on column EAM2.JJZC_HT_ZLWG.YZJ
  is '月租金';
comment on column EAM2.JJZC_HT_ZLWG.ZJSFHWYF
  is '租金包含费用';
comment on column EAM2.JJZC_HT_ZLWG.ZJSFHSDF
  is '租金包含其他费用';
comment on column EAM2.JJZC_HT_ZLWG.ZJJG
  is '租金价格';
comment on column EAM2.JJZC_HT_ZLWG.JSFS
  is '结算方式';
comment on column EAM2.JJZC_HT_ZLWG.C_ZJJSFS
  is '租金支付方式';
comment on column EAM2.JJZC_HT_ZLWG.DDTLFWZJJG
  is '当地同类房屋租金价格';
comment on column EAM2.JJZC_HT_ZLWG.LJZJ
  is '累计租金';
comment on column EAM2.JJZC_HT_ZLWG.YAJIN
  is '押金';
comment on column EAM2.JJZC_HT_ZLWG.YSYJ
  is '已收押金';
comment on column EAM2.JJZC_HT_ZLWG.WYJ
  is '违约金';
comment on column EAM2.JJZC_HT_ZLWG.YSWYJ
  is '已收违约金';
comment on column EAM2.JJZC_HT_ZLWG.HTQSRQ
  is '合同起始日期';
comment on column EAM2.JJZC_HT_ZLWG.HTDQRQ
  is '合同到期日期';
comment on column EAM2.JJZC_HT_ZLWG.MZQSRQ
  is '免租起始日期';
comment on column EAM2.JJZC_HT_ZLWG.MZDQRQ
  is '免租到期日期';
comment on column EAM2.JJZC_HT_ZLWG.SCQSRQ
  is '上次清算日期';
comment on column EAM2.JJZC_HT_ZLWG.ZLQSTZJE
  is '清算调整金额';
comment on column EAM2.JJZC_HT_ZLWG.SCQSJZRQ
  is '上次清算调整日期';
comment on column EAM2.JJZC_HT_ZLWG.CZRDZ
  is '承租人地址';
comment on column EAM2.JJZC_HT_ZLWG.CZRFDDZ
  is '承租人法定地址';
comment on column EAM2.JJZC_HT_ZLWG.ZLYT
  is '租赁用途';
comment on column EAM2.JJZC_HT_ZLWG.ZJSYCBL
  is '租金收益成本率';
comment on column EAM2.JJZC_HT_ZLWG.LRR
  is '录入人';
comment on column EAM2.JJZC_HT_ZLWG.LRRQ
  is '录入日期';
comment on column EAM2.JJZC_HT_ZLWG.WGHTBZ
  is '委管合同币种';
comment on column EAM2.JJZC_HT_ZLWG.C_YJFH
  is '一级分行';
comment on column EAM2.JJZC_HT_ZLWG.C_WTGLDW
  is '委托管理单位';
comment on column EAM2.JJZC_HT_ZLWG.WTGLYZ
  is '委托管理原值';
comment on column EAM2.JJZC_HT_ZLWG.WTFYBI
  is '委托费用比例';
comment on column EAM2.JJZC_HT_ZLWG.WTGLJG
  is '委托管理价格';
comment on column EAM2.JJZC_HT_ZLWG.WTGLSL
  is '委托管理数量';
comment on column EAM2.JJZC_HT_ZLWG.YWTGLF
  is '月委托管理费';
comment on column EAM2.JJZC_HT_ZLWG.LJSSWGF
  is '累计实收委管费';
comment on column EAM2.JJZC_HT_ZLWG.LJYSWGF
  is '累计应收委管费';
comment on column EAM2.JJZC_HT_ZLWG.DLDW
  is '度量单位';
comment on column EAM2.JJZC_HT_ZLWG.KPBH
  is '主卡片编号';
comment on column EAM2.JJZC_HT_ZLWG.HTSFTQZZ
  is '合同是否提前终止 0：否
1：是';
comment on column EAM2.JJZC_HT_ZLWG.HTZZRQ
  is '合同终止日期';
comment on column EAM2.JJZC_HT_ZLWG.ZZBLSM
  is '终止办理说明';
comment on column EAM2.JJZC_HT_ZLWG.C_ZZYY
  is '终止原因';
comment on column EAM2.JJZC_HT_ZLWG.BODYIDLOCK
  is '标识是否正在被清算 记录清算body表id';
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
  is '记录和流程相关的合同信息。';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ID
  is 'ID';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CLD_ID
  is '处理单ID';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZCID
  is '资产ID';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZCBH
  is '资产编号';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZCMC
  is '资产名称';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SWHTBH
  is '实物合同编号';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_HTLX
  is '合同类型';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTBH
  is '合同编号';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_HTZT
  is '合同状态';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZR
  is '承租人';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_CZRXZ
  is '承租人性质';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZLXR
  is '承租联系人';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZFLXDH
  is '承租方联系电话';
comment on column EAM2.JJZC_HT_ZLWG_LSB.JBRLXDH
  is '经办人联系电话';
comment on column EAM2.JJZC_HT_ZLWG_LSB.JYDX
  is '交易对象';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZSL
  is '承租数量';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YZJ
  is '月租金';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJSFHWYF
  is '租金包含费用';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJSFHSDF
  is '租金包含其他费用';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJJG
  is '租金价格';
comment on column EAM2.JJZC_HT_ZLWG_LSB.JSFS
  is '结算方式';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_ZJJSFS
  is '租金支付方式';
comment on column EAM2.JJZC_HT_ZLWG_LSB.DDTLFWZJJG
  is '当地同类房屋租金价格';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LJZJ
  is '累计租金';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YAJIN
  is '押金';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YSYJ
  is '已收押金';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WYJ
  is '违约金';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YSWYJ
  is '已收违约金';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTQSRQ
  is '合同起始日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTDQRQ
  is '合同到期日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.MZQSRQ
  is '免租起始日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.MZDQRQ
  is '免租到期日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SCQSRQ
  is '上次清算日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZLQSTZJE
  is '清算调整金额';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SCQSJZRQ
  is '上次清算截止日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZRDZ
  is '承租人地址';
comment on column EAM2.JJZC_HT_ZLWG_LSB.CZRFDDZ
  is '承租人法定地址';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZLYT
  is '租赁用途';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZJSYCBL
  is '租金收益成本率';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LRR
  is '录入人';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LRRQ
  is '录入日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WGHTBZ
  is '委管合同币种';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_YJFH
  is '一级分行';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_WTGLDW
  is '委托管理单位';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTGLYZ
  is '委托管理原值';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTFYBI
  is '委托费用比例';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTGLJG
  is '委托管理价格';
comment on column EAM2.JJZC_HT_ZLWG_LSB.WTGLSL
  is '委托管理数量';
comment on column EAM2.JJZC_HT_ZLWG_LSB.YWTGLF
  is '月委托管理费';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LJSSWGF
  is '累计实收委管费';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LJYSWGF
  is '累计应收委管费';
comment on column EAM2.JJZC_HT_ZLWG_LSB.DLDW
  is '度量单位';
comment on column EAM2.JJZC_HT_ZLWG_LSB.KPBH
  is '主卡片编号';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTSFTQZZ
  is '合同是否提前终止0：否
1：是';
comment on column EAM2.JJZC_HT_ZLWG_LSB.HTZZRQ
  is '合同终止日期';
comment on column EAM2.JJZC_HT_ZLWG_LSB.ZZBLSM
  is '终止办理说明';
comment on column EAM2.JJZC_HT_ZLWG_LSB.C_ZZYY
  is '终止原因';
comment on column EAM2.JJZC_HT_ZLWG_LSB.LCMC
  is '0：合同新增
1：合同变动
2：合同终止';
comment on column EAM2.JJZC_HT_ZLWG_LSB.SPZT
  is '审批状态 0：未审批
1：审批中
2：审批结束';
comment on column EAM2.JJZC_HT_ZLWG_LSB.NGRQ
  is '拟稿日期';
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
  is '投保固产信息';
comment on column EAM2.JJZC_TBGC_XX.ID
  is 'uuid，主键';
comment on column EAM2.JJZC_TBGC_XX.ZC_ID
  is '资产ID';
comment on column EAM2.JJZC_TBGC_XX.GCTB_ID
  is '固产投保信息ID';
comment on column EAM2.JJZC_TBGC_XX.TBJE
  is '投保金额';
comment on column EAM2.JJZC_TBGC_XX.SPZT
  is '审批状态  0：未审批
1：审批中
2：审批结束';
comment on column EAM2.JJZC_TBGC_XX.CLD_ID
  is '处理单ID';
comment on column EAM2.JJZC_TBGC_XX.TBLB
  is '投保类别  0：车险  1：非车险';
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
  is '经营性固产表头';
comment on column EAM2.JYZC_HEAD.ID
  is '资产表头ID,UUID';
comment on column EAM2.JYZC_HEAD.LC_ID
  is '流程ID';
comment on column EAM2.JYZC_HEAD.BIAOTI
  is '标题';
comment on column EAM2.JYZC_HEAD.BIANHAO
  is '编号';
comment on column EAM2.JYZC_HEAD.JHCD
  is '急缓程度：一般，急，特急';
comment on column EAM2.JYZC_HEAD.NGR
  is '拟稿人';
comment on column EAM2.JYZC_HEAD.NGRMC
  is '拟稿人名称';
comment on column EAM2.JYZC_HEAD.LXDH
  is '联系电话';
comment on column EAM2.JYZC_HEAD.NGRQ
  is '拟稿日期';
comment on column EAM2.JYZC_HEAD.NGBM
  is '拟稿部门';
comment on column EAM2.JYZC_HEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.JYZC_HEAD.CHENGSONG
  is '呈送';
comment on column EAM2.JYZC_HEAD.PDJG
  is '盘点结果 0：盘盈1：盘亏';
comment on column EAM2.JYZC_HEAD.HQBM
  is '会签部门';
comment on column EAM2.JYZC_HEAD.BEIZHU
  is '备注';
comment on column EAM2.JYZC_HEAD.YWLX
  is '业务类型 0：确权审批 1：更新改造 2：业务维修 3：其他费用审批';
comment on column EAM2.JYZC_HEAD.SFSJFY
  is '是否涉及费用 0：是 1：否';
comment on column EAM2.JYZC_HEAD.LCMC
  is '流程名称 0：资产新增 1：资产变动 2：盘点管理 3：日常管理 4：资产报废';
comment on column EAM2.JYZC_HEAD.DESCRIBE
  is '费用用途';
comment on column EAM2.JYZC_HEAD.APPLY_MONEY
  is '申请费用金额';
comment on column EAM2.JYZC_HEAD.APPROVE_MONEY
  is '审批费用金额';
comment on column EAM2.JYZC_HEAD.MONEY_APPROVED
  is '已报销金额';
comment on column EAM2.JYZC_HEAD.ISREJECTED
  is '是否拒绝
';
comment on column EAM2.JYZC_HEAD.ERPNOTICE
  is 'ERP返回结果';
comment on column EAM2.JYZC_HEAD.REGION
  is '存储一级分行信息，发送ERP需要';
comment on column EAM2.JYZC_HEAD.SENDERP
  is '发送ERP

';
comment on column EAM2.JYZC_HEAD.XLID
  is '发送erp使用';
comment on column EAM2.JYZC_HEAD.SHEETTYPE
  is '表单类型';
comment on column EAM2.JYZC_HEAD.HQBMID
  is '会签部门ID';
comment on column EAM2.JYZC_HEAD.SYHQBM
  is '建银实业会签部门';
comment on column EAM2.JYZC_HEAD.SYHQBMID
  is '建银实业会签部门ID';
comment on column EAM2.JYZC_HEAD.CLD_ZT
  is '处理单状态';
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
  is '合同清算表体';
comment on column EAM2.JYZC_HTQS_BODY.ID
  is 'uuid，主键';
comment on column EAM2.JYZC_HTQS_BODY.CLD_ID
  is '处理单ID';
comment on column EAM2.JYZC_HTQS_BODY.HT_ID
  is '合同ID';
comment on column EAM2.JYZC_HTQS_BODY.HTBH
  is '合同编号';
comment on column EAM2.JYZC_HTQS_BODY.ZC_ID
  is '资产ID';
comment on column EAM2.JYZC_HTQS_BODY.ZCBH
  is '资产编号';
comment on column EAM2.JYZC_HTQS_BODY.ZCMC
  is '资产名称';
comment on column EAM2.JYZC_HTQS_BODY.C_ZCLX
  is '资产类型';
comment on column EAM2.JYZC_HTQS_BODY.QSKSRQ
  is '清算开始日期';
comment on column EAM2.JYZC_HTQS_BODY.QSJZRQ
  is '清算截至日期';
comment on column EAM2.JYZC_HTQS_BODY.YSZJ
  is '应收租金';
comment on column EAM2.JYZC_HTQS_BODY.XGHYSZJ
  is '修改后应收租金';
comment on column EAM2.JYZC_HTQS_BODY.YSXGYY
  is '应收修改原因';
comment on column EAM2.JYZC_HTQS_BODY.SSZJ
  is '实收租金';
comment on column EAM2.JYZC_HTQS_BODY.SCBDJE
  is '实收变动租金';
comment on column EAM2.JYZC_HTQS_BODY.BCBDJE
  is '本次变动金额';
comment on column EAM2.JYZC_HTQS_BODY.QSTZJE
  is '清算调整金额';
comment on column EAM2.JYZC_HTQS_BODY.TZYY
  is '调整原因';
comment on column EAM2.JYZC_HTQS_BODY.MEMO
  is '备注';
comment on column EAM2.JYZC_HTQS_BODY.SPZT
  is '审批状态0：未审批
1：审批中
2：审批结束';
comment on column EAM2.JYZC_HTQS_BODY.QSPC
  is '清算批次';
comment on column EAM2.JYZC_HTQS_BODY.C_HTLX
  is '合同类型';
comment on column EAM2.JYZC_HTQS_BODY.MZQ
  is '免租期';
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
  is '0：出租
1：变更
2：退租';
comment on column EAM2.JYZC_JYZL_HEAD.HQBMID
  is '会签部门ID';
comment on column EAM2.JYZC_JYZL_HEAD.SYHQBM
  is '建银实业会签部门';
comment on column EAM2.JYZC_JYZL_HEAD.SYHQBMID
  is '建银实业会签部门ID';
comment on column EAM2.JYZC_JYZL_HEAD.CLD_ZT
  is '处理单状态';
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
  is '经营租赁临时表';
comment on column EAM2.JYZC_JYZL_LSB.ID
  is 'uuid，主键';
comment on column EAM2.JYZC_JYZL_LSB.CLD_ID
  is '处理单ID';
comment on column EAM2.JYZC_JYZL_LSB.ZC_ID
  is '资产ID';
comment on column EAM2.JYZC_JYZL_LSB.JYDX
  is '建行、非建行';
comment on column EAM2.JYZC_JYZL_LSB.C_JBHSF
  is '经办行省份';
comment on column EAM2.JYZC_JYZL_LSB.C_EJJBH
  is '二级经办行';
comment on column EAM2.JYZC_JYZL_LSB.ZLQSRQ
  is '租赁起始日期';
comment on column EAM2.JYZC_JYZL_LSB.ZLDQRQ
  is '租赁到期日期';
comment on column EAM2.JYZC_JYZL_LSB.CZR
  is '资产承租人';
comment on column EAM2.JYZC_JYZL_LSB.YXZLMJ
  is '意向租赁面积';
comment on column EAM2.JYZC_JYZL_LSB.YXZJZJE
  is '意向租金总金额';
comment on column EAM2.JYZC_JYZL_LSB.CZYT
  is '出租用途';
comment on column EAM2.JYZC_JYZL_LSB.YXZQ
  is '意向租期';
comment on column EAM2.JYZC_JYZL_LSB.ZLSM
  is '租赁说明';
comment on column EAM2.JYZC_JYZL_LSB.BGSM
  is '变更说明';
comment on column EAM2.JYZC_JYZL_LSB.TZRQ
  is '退租日期';
comment on column EAM2.JYZC_JYZL_LSB.TZYY
  is '退租原因';
comment on column EAM2.JYZC_JYZL_LSB.TZBLSM
  is '退租办理说明';
comment on column EAM2.JYZC_JYZL_LSB.SPZT
  is '审批状态 0：未审批 1：审批中 2：已审批';
comment on column EAM2.JYZC_JYZL_LSB.JYZL_ID
  is '经营租赁信息表ID';
comment on column EAM2.JYZC_JYZL_LSB.HTJYDX
  is '合同交易对象';
comment on column EAM2.JYZC_JYZL_LSB.HTCZR
  is '合同中承租人';
comment on column EAM2.JYZC_JYZL_LSB.HTQSRQ
  is '合同起始日期';
comment on column EAM2.JYZC_JYZL_LSB.HTDQRQ
  is '合同到期日期';
comment on column EAM2.JYZC_JYZL_LSB.HTZLYT
  is '合同中租赁用途';
comment on column EAM2.JYZC_JYZL_LSB.HTID
  is '合同ID';
comment on column EAM2.JYZC_JYZL_LSB.DLDW
  is '度量单位';
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
  is '处理单ID';
comment on column EAM2.JYZC_JYZL_XX.ZC_ID
  is '资产ID';
comment on column EAM2.JYZC_JYZL_XX.JYDX
  is '建行、非建行';
comment on column EAM2.JYZC_JYZL_XX.C_JBHSF
  is '经办行省份';
comment on column EAM2.JYZC_JYZL_XX.C_EJJBH
  is '二级经办行';
comment on column EAM2.JYZC_JYZL_XX.ZLQSRQ
  is '租赁起始日期';
comment on column EAM2.JYZC_JYZL_XX.ZLDQRQ
  is '租赁到期日期';
comment on column EAM2.JYZC_JYZL_XX.CZR
  is '资产承租人';
comment on column EAM2.JYZC_JYZL_XX.YXZLMJ
  is '意向租赁面积';
comment on column EAM2.JYZC_JYZL_XX.YXZJZJE
  is '意向租金总金额';
comment on column EAM2.JYZC_JYZL_XX.CZYT
  is '出租用途';
comment on column EAM2.JYZC_JYZL_XX.YXZQ
  is '意向租期';
comment on column EAM2.JYZC_JYZL_XX.ZLSM
  is '租赁说明';
comment on column EAM2.JYZC_JYZL_XX.BGSM
  is '变更说明';
comment on column EAM2.JYZC_JYZL_XX.TZRQ
  is '退租日期';
comment on column EAM2.JYZC_JYZL_XX.TZYY
  is '退租原因';
comment on column EAM2.JYZC_JYZL_XX.TZBLSM
  is '退租办理说明';
comment on column EAM2.JYZC_JYZL_XX.LRRQ
  is '录入日期';
comment on column EAM2.JYZC_JYZL_XX.HTJYDX
  is '合同交易对象';
comment on column EAM2.JYZC_JYZL_XX.HTCZR
  is '合同中承租人';
comment on column EAM2.JYZC_JYZL_XX.HTQSRQ
  is '合同起始日期';
comment on column EAM2.JYZC_JYZL_XX.HTDQRQ
  is '合同到期日期';
comment on column EAM2.JYZC_JYZL_XX.HTZLYT
  is '合同中租赁用途';
comment on column EAM2.JYZC_JYZL_XX.HTID
  is '合同ID';
comment on column EAM2.JYZC_JYZL_XX.DLDW
  is '度量单位';
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
  is '记录盘亏的资产的卡片信息。';
comment on column EAM2.JYZC_PDKP_XX.CLD_ID
  is '处理单ID';
comment on column EAM2.JYZC_PDKP_XX.ZC_ID
  is '资产信息表ID';
comment on column EAM2.JYZC_PDKP_XX.ZC_LSB_ID
  is '资产临时表ID';
comment on column EAM2.JYZC_PDKP_XX.KP_ID
  is '卡片信息表ID';
comment on column EAM2.JYZC_PDKP_XX.CARDCODE
  is '卡片编码';
comment on column EAM2.JYZC_PDKP_XX.ZCNAME
  is '卡片名称';
comment on column EAM2.JYZC_PDKP_XX.GLBM
  is '管理部门';
comment on column EAM2.JYZC_PDKP_XX.USEPARTMENT
  is '使用部门';
comment on column EAM2.JYZC_PDKP_XX.FIRSTBRANCH
  is '一级分行';
comment on column EAM2.JYZC_PDKP_XX.SPZT
  is '审批状态';
comment on column EAM2.JYZC_PDKP_XX.YBYZ
  is '原币原值';
comment on column EAM2.JYZC_PDKP_XX.PDZT
  is '盘点状态';
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
  is '经营性固定资产风险信息';
comment on column EAM2.JYZC_RISK.ID
  is '风险ID,UUID';
comment on column EAM2.JYZC_RISK.C_FXLX
  is '风险类型，数据字典表';
comment on column EAM2.JYZC_RISK.FXBH
  is '风险编号';
comment on column EAM2.JYZC_RISK.FXMS
  is '风险描述';
comment on column EAM2.JYZC_RISK.FXZT
  is '风险状态 0：打开 1：执行中 2：关闭';
comment on column EAM2.JYZC_RISK.FXKZ
  is '风险控制';
comment on column EAM2.JYZC_RISK.LRRQ
  is '录入日期';
comment on column EAM2.JYZC_RISK.LRRBH
  is '录入人编号';
comment on column EAM2.JYZC_RISK.LRR
  is '录入人';
comment on column EAM2.JYZC_RISK.ZCZSB_ID
  is '资产正式表ID';
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
  is '经营性固定资产风险信息';
comment on column EAM2.JYZC_RISK_LSB.ID
  is '风险ID,UUID';
comment on column EAM2.JYZC_RISK_LSB.C_FXLX
  is '风险类型，数据字典表';
comment on column EAM2.JYZC_RISK_LSB.FXBH
  is '风险编号';
comment on column EAM2.JYZC_RISK_LSB.FXMS
  is '风险描述';
comment on column EAM2.JYZC_RISK_LSB.FXZT
  is '风险状态 0：打开 1：执行中 2：关闭';
comment on column EAM2.JYZC_RISK_LSB.FXKZ
  is '风险控制';
comment on column EAM2.JYZC_RISK_LSB.LRRQ
  is '录入日期';
comment on column EAM2.JYZC_RISK_LSB.LRRBH
  is '录入人编号';
comment on column EAM2.JYZC_RISK_LSB.LRR
  is '录入人';
comment on column EAM2.JYZC_RISK_LSB.ZC_ID
  is '资产临时表ID';
comment on column EAM2.JYZC_RISK_LSB.ZHUANGTAI
  is '状态 0：未审批 1：审批中 2：审批同意 3：审批不同意';
comment on column EAM2.JYZC_RISK_LSB.CLD_ID
  is '处理单ID';
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
  is '申请审定费用明细';
comment on column EAM2.JYZC_SQSDFY_XX.ID
  is '申请费用ID,UUID';
comment on column EAM2.JYZC_SQSDFY_XX.ZC_ID
  is '资产ID';
comment on column EAM2.JYZC_SQSDFY_XX.XMMC
  is '项目名称';
comment on column EAM2.JYZC_SQSDFY_XX.SQJE
  is '申请金额';
comment on column EAM2.JYZC_SQSDFY_XX.SDJE
  is '审定金额';
comment on column EAM2.JYZC_SQSDFY_XX.SJFY
  is '实际费用';
comment on column EAM2.JYZC_SQSDFY_XX.SPZT
  is '审批状态0未提交1审批中2审批通过3审批不通过';
comment on column EAM2.JYZC_SQSDFY_XX.CLD_ID
  is '处理单ID';
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
  is '记录资产（不动产、交通工具、设备及其他）的主信息和基本信息。';
comment on column EAM2.JYZC_XX.ID
  is '经营性固定资产ID,UUID';
comment on column EAM2.JYZC_XX.C_ZCLX
  is '资产类型:不动产、交通运输设备、设备及其他  见数据字典表';
comment on column EAM2.JYZC_XX.C_ZCZLBM
  is '资产种类编码,引用数据字典表';
comment on column EAM2.JYZC_XX.C_ZCDQ
  is '地区,引用数据字典表';
comment on column EAM2.JYZC_XX.ZCBH
  is '系统按一定规则自动生成';
comment on column EAM2.JYZC_XX.ZCMC
  is '资产名称';
comment on column EAM2.JYZC_XX.C_JYFL
  is '经营分类：1经营类 2择机处置类3加快处置类4有处置障碍类5盘亏或报废类';
comment on column EAM2.JYZC_XX.XXDZ
  is '详细地址';
comment on column EAM2.JYZC_XX.C_YT
  is '用途';
comment on column EAM2.JYZC_XX.JBDW
  is '经办单位';
comment on column EAM2.JYZC_XX.C_ZJFS
  is '增加方式';
comment on column EAM2.JYZC_XX.QSQK
  is '权属情况';
comment on column EAM2.JYZC_XX.ZWHJ
  is '周围环境';
comment on column EAM2.JYZC_XX.C_ZCZC
  is '资产状态';
comment on column EAM2.JYZC_XX.KSSYRQ
  is '开始使用日期';
comment on column EAM2.JYZC_XX.EJDQ
  is '二级地区';
comment on column EAM2.JYZC_XX.C_YJWTJG
  is '一级委托机构';
comment on column EAM2.JYZC_XX.C_ERWTJG
  is '二级委托机构';
comment on column EAM2.JYZC_XX.LRRQ
  is '系统当前日期';
comment on column EAM2.JYZC_XX.LRR
  is '录入人';
comment on column EAM2.JYZC_XX.JCRQ
  is '建成日期';
comment on column EAM2.JYZC_XX.FWJG
  is '房屋结构';
comment on column EAM2.JYZC_XX.YANGAO
  is '檐高(米)';
comment on column EAM2.JYZC_XX.BZCG
  is '标准层高(米)';
comment on column EAM2.JYZC_XX.ZCS
  is '总层数';
comment on column EAM2.JYZC_XX.ZLZDJC
  is '坐落在第几层';
comment on column EAM2.JYZC_XX.FJH
  is '房间号';
comment on column EAM2.JYZC_XX.JZMJ
  is '建筑面积(M2)';
comment on column EAM2.JYZC_XX.CBDJ
  is '成本单价';
comment on column EAM2.JYZC_XX.FDFLFW
  is '房地分离房屋 0：否；1：是';
comment on column EAM2.JYZC_XX.C_YWTD
  is '有无土地  0代表否 1代表是';
comment on column EAM2.JYZC_XX.FCZSYQR
  is '房产证所有权人';
comment on column EAM2.JYZC_XX.FCZH
  is '房产证号';
comment on column EAM2.JYZC_XX.FCZTDWJ
  is '房产证替代文件';
comment on column EAM2.JYZC_XX.FCZWYXWJ
  is '房产证无有效文件 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.FWYBZ
  is '房屋已办证 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.FCZBLSJ
  is '房产证办理时间';
comment on column EAM2.JYZC_XX.KONGDI
  is '空地 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.C_YDXZ
  is '用地性质';
comment on column EAM2.JYZC_XX.TDMJ
  is '土地面积';
comment on column EAM2.JYZC_XX.QDRQ
  is '取得日期';
comment on column EAM2.JYZC_XX.ZYNX
  is '准用年限';
comment on column EAM2.JYZC_XX.SYSYNX
  is '剩余使用年限';
comment on column EAM2.JYZC_XX.KFCD
  is '开发程度';
comment on column EAM2.JYZC_XX.FDFLTD
  is '房地分离土地 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.TDZSYQR
  is '土地证使用权人';
comment on column EAM2.JYZC_XX.TDZH
  is '土地证号';
comment on column EAM2.JYZC_XX.TDZTDWJ
  is '土地证替代文件';
comment on column EAM2.JYZC_XX.TDWYXWJ
  is '土地无有效文件 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.TDYBZ
  is '土地已办证 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.TDZBLSJ
  is '土地证办理时间';
comment on column EAM2.JYZC_XX.GZWJG
  is '构筑物结构';
comment on column EAM2.JYZC_XX.GGCC
  is '规格尺寸';
comment on column EAM2.JYZC_XX.JLDW
  is '计量单位';
comment on column EAM2.JYZC_XX.GZWSL
  is '构筑物数量';
comment on column EAM2.JYZC_XX.GZWCBDJ
  is '构筑物成本单价';
comment on column EAM2.JYZC_XX.GZWJCSJ
  is '构筑物建成时间';
comment on column EAM2.JYZC_XX.FDHY
  is '房地合一 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.FDHYYBZ
  is '房地合一已办证 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.FDHYQZH
  is '房地合一权证号';
comment on column EAM2.JYZC_XX.TSLX
  is '特殊类型';
comment on column EAM2.JYZC_XX.WFBZYY
  is '无法办证的原因';
comment on column EAM2.JYZC_XX.LZQWB
  is '两证全未办 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX.CLPH
  is '车辆牌号';
comment on column EAM2.JYZC_XX.CLXSZSYR
  is '车辆行驶证所有人';
comment on column EAM2.JYZC_XX.CLMCJGGXH
  is '车辆名称及规格型号';
comment on column EAM2.JYZC_XX.GZRQ
  is '购置日期';
comment on column EAM2.JYZC_XX.QYRQ
  is '启用日期';
comment on column EAM2.JYZC_XX.YXSLC
  is '已行驶里程';
comment on column EAM2.JYZC_XX.SBMC
  is '设备名称';
comment on column EAM2.JYZC_XX.GGXH
  is '规格型号';
comment on column EAM2.JYZC_XX.SCCJ
  is '生产厂家';
comment on column EAM2.JYZC_XX.C_JLDW
  is '设备计量单位';
comment on column EAM2.JYZC_XX.SBSL
  is '设备数量';
comment on column EAM2.JYZC_XX.ZLZT
  is '当前租赁状态 0：空闲 1：在租';
comment on column EAM2.JYZC_XX.C_ZCQS
  is '资产权属';
comment on column EAM2.JYZC_XX.WTRMC
  is '委托人名称';
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
  is '记录资产（不动产、交通工具、设备及其他）的主信息和基本信息。';
comment on column EAM2.JYZC_XX_LSB.ID
  is '经营资产临时表ID,UUID';
comment on column EAM2.JYZC_XX_LSB.CLD_ID
  is '处理单ID';
comment on column EAM2.JYZC_XX_LSB.C_ZCZLBM
  is '资产种类编码,引用数据字典表';
comment on column EAM2.JYZC_XX_LSB.C_ZCLX
  is '资产类型 不动产、交通运输设备、设备及其他  数据字典表';
comment on column EAM2.JYZC_XX_LSB.C_ZCDQ
  is '地区';
comment on column EAM2.JYZC_XX_LSB.ZCBH
  is '资产编号';
comment on column EAM2.JYZC_XX_LSB.ZCMC
  is '资产名称';
comment on column EAM2.JYZC_XX_LSB.C_JYFL
  is '经营分类 1经营类2择机处置类3加快处置类4有处置障碍类5盘亏或报废类';
comment on column EAM2.JYZC_XX_LSB.XXDZ
  is '详细地址';
comment on column EAM2.JYZC_XX_LSB.C_YT
  is '用途';
comment on column EAM2.JYZC_XX_LSB.JBDW
  is '经办单位';
comment on column EAM2.JYZC_XX_LSB.C_ZJFS
  is '增加方式';
comment on column EAM2.JYZC_XX_LSB.QSQK
  is '权属情况';
comment on column EAM2.JYZC_XX_LSB.ZWHJ
  is '周围环境';
comment on column EAM2.JYZC_XX_LSB.C_ZCZC
  is '资产状态';
comment on column EAM2.JYZC_XX_LSB.KSSYRQ
  is '开始使用日期';
comment on column EAM2.JYZC_XX_LSB.EJDQ
  is '二级地区';
comment on column EAM2.JYZC_XX_LSB.C_YJWTJG
  is '一级委托机构';
comment on column EAM2.JYZC_XX_LSB.C_ERWTJG
  is '二级委托机构';
comment on column EAM2.JYZC_XX_LSB.LRRQ
  is '录入日期 系统当前日期';
comment on column EAM2.JYZC_XX_LSB.LRR
  is '录入人';
comment on column EAM2.JYZC_XX_LSB.JCRQ
  is '建成日期';
comment on column EAM2.JYZC_XX_LSB.FWJG
  is '房屋结构';
comment on column EAM2.JYZC_XX_LSB.YANGAO
  is '檐高(米)';
comment on column EAM2.JYZC_XX_LSB.BZCG
  is '标准层高(米)';
comment on column EAM2.JYZC_XX_LSB.ZCS
  is '总层数';
comment on column EAM2.JYZC_XX_LSB.ZLZDJC
  is '坐落在第几层';
comment on column EAM2.JYZC_XX_LSB.FJH
  is '房间号';
comment on column EAM2.JYZC_XX_LSB.JZMJ
  is '建筑面积(M2)';
comment on column EAM2.JYZC_XX_LSB.CBDJ
  is '成本单价';
comment on column EAM2.JYZC_XX_LSB.FDFLFW
  is '房地分离房屋0：否；1：是';
comment on column EAM2.JYZC_XX_LSB.C_YWTD
  is '有无土地 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.FCZSYQR
  is '房产证所有权人';
comment on column EAM2.JYZC_XX_LSB.FCZH
  is '房产证号';
comment on column EAM2.JYZC_XX_LSB.FCZTDWJ
  is '房产证替代文件';
comment on column EAM2.JYZC_XX_LSB.FCZWYXWJ
  is '房产证无有效文件 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.FWYBZ
  is '房屋已办证 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.FCZBLSJ
  is '房产证办理时间';
comment on column EAM2.JYZC_XX_LSB.KONGDI
  is '空地 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.C_YDXZ
  is '用地性质';
comment on column EAM2.JYZC_XX_LSB.TDMJ
  is '土地面积';
comment on column EAM2.JYZC_XX_LSB.QDRQ
  is '取得日期';
comment on column EAM2.JYZC_XX_LSB.ZYNX
  is '准用年限';
comment on column EAM2.JYZC_XX_LSB.SYSYNX
  is '剩余使用年限';
comment on column EAM2.JYZC_XX_LSB.KFCD
  is '开发程度';
comment on column EAM2.JYZC_XX_LSB.FDFLTD
  is '房地分离土地 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.TDZSYQR
  is '土地证使用权人';
comment on column EAM2.JYZC_XX_LSB.TDZH
  is '土地证号';
comment on column EAM2.JYZC_XX_LSB.TDZTDWJ
  is '土地证替代文件';
comment on column EAM2.JYZC_XX_LSB.TDWYXWJ
  is '土地无有效文件 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.TDYBZ
  is '土地已办证 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.TDZBLSJ
  is '土地证办理时间';
comment on column EAM2.JYZC_XX_LSB.GZWJG
  is '构筑物结构';
comment on column EAM2.JYZC_XX_LSB.GGCC
  is '规格尺寸';
comment on column EAM2.JYZC_XX_LSB.JLDW
  is '计量单位';
comment on column EAM2.JYZC_XX_LSB.GZWSL
  is '构筑物数量';
comment on column EAM2.JYZC_XX_LSB.GZWCBDJ
  is '构筑物成本单价';
comment on column EAM2.JYZC_XX_LSB.GZWJCSJ
  is '构筑物建成时间';
comment on column EAM2.JYZC_XX_LSB.FDHY
  is '房地合一 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.FDHYYBZ
  is '房地合一已办证 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.FDHYQZH
  is '房地合一权证号';
comment on column EAM2.JYZC_XX_LSB.TSLX
  is '特殊类型';
comment on column EAM2.JYZC_XX_LSB.WFBZYY
  is '无法办证的原因';
comment on column EAM2.JYZC_XX_LSB.LZQWB
  is '两证全未办 是、否  0代表否 1代表是';
comment on column EAM2.JYZC_XX_LSB.CLPH
  is '车辆牌号';
comment on column EAM2.JYZC_XX_LSB.CLXSZSYR
  is '车辆行驶证所有人';
comment on column EAM2.JYZC_XX_LSB.CLMCJGGXH
  is '车辆名称及规格型号';
comment on column EAM2.JYZC_XX_LSB.GZRQ
  is '购置日期';
comment on column EAM2.JYZC_XX_LSB.QYRQ
  is '启用日期';
comment on column EAM2.JYZC_XX_LSB.YXSLC
  is '已行驶里程';
comment on column EAM2.JYZC_XX_LSB.SBMC
  is '设备名称';
comment on column EAM2.JYZC_XX_LSB.GGXH
  is '规格型号';
comment on column EAM2.JYZC_XX_LSB.SCCJ
  is '生产厂家';
comment on column EAM2.JYZC_XX_LSB.C_JLDW
  is '设备计量单位';
comment on column EAM2.JYZC_XX_LSB.SBSL
  is '设备数量';
comment on column EAM2.JYZC_XX_LSB.SPZT
  is '审批状态 0：未审批1：审批中2：已审批';
comment on column EAM2.JYZC_XX_LSB.C_JBHBH
  is '经办行';
comment on column EAM2.JYZC_XX_LSB.C_EJFHBH
  is '二级分行';
comment on column EAM2.JYZC_XX_LSB.C_FYZL
  is '费用种类';
comment on column EAM2.JYZC_XX_LSB.BLSM
  is '办理说明';
comment on column EAM2.JYZC_XX_LSB.XLID
  is '发送erp序列号';
comment on column EAM2.JYZC_XX_LSB.YSYNX
  is '已使用年限';
comment on column EAM2.JYZC_XX_LSB.SKSYNX
  is '尚可使用年限';
comment on column EAM2.JYZC_XX_LSB.C_ZCQS
  is '资产权属';
comment on column EAM2.JYZC_XX_LSB.WTRMC
  is '委托人';
comment on column EAM2.JYZC_XX_LSB.SJHF
  is '实际花费';
comment on column EAM2.JYZC_XX_LSB.C_JSFS
  is '结算方式';
comment on column EAM2.JYZC_XX_LSB.C_BZ
  is '币种';
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
  is 'uuid ，主键';
comment on column EAM2.JYZC_ZL_BGMX.JYZL_ID
  is '经营租赁ID';
comment on column EAM2.JYZC_ZL_BGMX.BGSX
  is '变更事项';
comment on column EAM2.JYZC_ZL_BGMX.BGQNR
  is '变更前内容';
comment on column EAM2.JYZC_ZL_BGMX.BGHNR
  is '变更后内容';
comment on column EAM2.JYZC_ZL_BGMX.SPZT
  is '审批状态 0：未审批  1：审批中 2：已审批';
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
  is '入账科目对照表ID,UUID';
comment on column EAM2.KP_RZKM_DZB.KMBH
  is '科目编号';
comment on column EAM2.KP_RZKM_DZB.RZKM
  is '入账科目名称';
comment on column EAM2.KP_RZKM_DZB.SFCJ
  is '0：否1：是';
comment on column EAM2.KP_RZKM_DZB.LBMC
  is '卡片类别编码，采用DIC_APP_STATE表中编码';
comment on column EAM2.KP_RZKM_DZB.QYRQ
  is '启用日期';
comment on column EAM2.KP_RZKM_DZB.TYRQ
  is '停用日期,如果未停用，此字段为空';
comment on column EAM2.KP_RZKM_DZB.DQZT
  is '0：停用1：启用';
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
  is '卡片表(二期)';
comment on column EAM2.LC_CARDTEMP.ID
  is 'ID';
comment on column EAM2.LC_CARDTEMP.KPXZID
  is '表单ID';
comment on column EAM2.LC_CARDTEMP.WFCONFIG_CODE
  is '流程编号';
comment on column EAM2.LC_CARDTEMP.BWID
  is '办文说明ID';
comment on column EAM2.LC_CARDTEMP.CARDCODE
  is '卡片编码';
comment on column EAM2.LC_CARDTEMP.ZCID
  is '资产ID';
comment on column EAM2.LC_CARDTEMP.ZCNAME
  is '卡片名称';
comment on column EAM2.LC_CARDTEMP.SAVEADSRESS
  is '存放地点';
comment on column EAM2.LC_CARDTEMP.TYPECODE
  is '类别编码';
comment on column EAM2.LC_CARDTEMP.GGXH
  is '规格型号';
comment on column EAM2.LC_CARDTEMP.ADDTYPE
  is '增加方式';
comment on column EAM2.LC_CARDTEMP.ZJTYPE
  is '折旧方法';
comment on column EAM2.LC_CARDTEMP.IFJC
  is '是否承继';
comment on column EAM2.LC_CARDTEMP.GLBM
  is '管理部门';
comment on column EAM2.LC_CARDTEMP.USEPARTMENT
  is '使用部门';
comment on column EAM2.LC_CARDTEMP.ZJCDBM
  is '折旧承担部门';
comment on column EAM2.LC_CARDTEMP.USESTATUS
  is '使用状况';
comment on column EAM2.LC_CARDTEMP.ZCSTATUS
  is '资产状态';
comment on column EAM2.LC_CARDTEMP.MAINYT
  is '主要用途';
comment on column EAM2.LC_CARDTEMP.KSDATE
  is '开始使用日期';
comment on column EAM2.LC_CARDTEMP.QYDATE
  is '启用日期';
comment on column EAM2.LC_CARDTEMP.YBYZ
  is '原币原值';
comment on column EAM2.LC_CARDTEMP.YZJE
  is '月折旧额';
comment on column EAM2.LC_CARDTEMP.YZJL
  is '月折旧率';
comment on column EAM2.LC_CARDTEMP.LJZJ
  is '累计折旧';
comment on column EAM2.LC_CARDTEMP.JCZ
  is '净残值';
comment on column EAM2.LC_CARDTEMP.JCZL
  is '净残值率';
comment on column EAM2.LC_CARDTEMP.JVALUE
  is '净值';
comment on column EAM2.LC_CARDTEMP.SYYX
  is '使用月限';
comment on column EAM2.LC_CARDTEMP.YJTYF
  is '已计提月份';
comment on column EAM2.LC_CARDTEMP.JZZB
  is '减值准备';
comment on column EAM2.LC_CARDTEMP.JEVALUE
  is '净额';
comment on column EAM2.LC_CARDTEMP.OLDCODE
  is '旧卡片编号';
comment on column EAM2.LC_CARDTEMP.PGQYZ
  is '评估前原值';
comment on column EAM2.LC_CARDTEMP.PGQLJZJ
  is '评估前累计折旧';
comment on column EAM2.LC_CARDTEMP.BZSM
  is '备注';
comment on column EAM2.LC_CARDTEMP.YXTLRY
  is '原系统录入人员';
comment on column EAM2.LC_CARDTEMP.FDJHM
  is '发动机号码';
comment on column EAM2.LC_CARDTEMP.CLPXH
  is '车辆牌照号';
comment on column EAM2.LC_CARDTEMP.TXFF
  is '摊销方法';
comment on column EAM2.LC_CARDTEMP.TXCDBM
  is '摊销承担部门';
comment on column EAM2.LC_CARDTEMP.TXNX
  is '摊销年限';
comment on column EAM2.LC_CARDTEMP.YTXYF
  is '已摊销月份';
comment on column EAM2.LC_CARDTEMP.YTXE
  is '已摊销额';
comment on column EAM2.LC_CARDTEMP.MONTXE
  is '月摊销额';
comment on column EAM2.LC_CARDTEMP.WTXE
  is '未摊销额';
comment on column EAM2.LC_CARDTEMP.QSZM
  is '权属证明';
comment on column EAM2.LC_CARDTEMP.TDZHM
  is '土地证号码';
comment on column EAM2.LC_CARDTEMP.QZSYZ
  is '权证所有者';
comment on column EAM2.LC_CARDTEMP.YSQDJZ
  is '原始取得价值';
comment on column EAM2.LC_CARDTEMP.OLDYEARYZ
  is '2004年1月1日原值';
comment on column EAM2.LC_CARDTEMP.OLDYEARJZ
  is '2004年1月1日累计折旧';
comment on column EAM2.LC_CARDTEMP.OLDJZ
  is '2004年1月1日净额';
comment on column EAM2.LC_CARDTEMP.ZYZT
  is '在用状态';
comment on column EAM2.LC_CARDTEMP.CUPXH
  is 'CUP型号';
comment on column EAM2.LC_CARDTEMP.WZYP
  is '外置硬盘';
comment on column EAM2.LC_CARDTEMP.NZYP
  is '内置硬盘';
comment on column EAM2.LC_CARDTEMP.XSQ
  is '显示器';
comment on column EAM2.LC_CARDTEMP.QPXH
  is '硬盘型号';
comment on column EAM2.LC_CARDTEMP.NSAVE
  is '内存';
comment on column EAM2.LC_CARDTEMP.SBXLH
  is '设备序列号';
comment on column EAM2.LC_CARDTEMP.GYS
  is '供应商';
comment on column EAM2.LC_CARDTEMP.HTHM
  is '合同号码';
comment on column EAM2.LC_CARDTEMP.BXQ
  is '保修期';
comment on column EAM2.LC_CARDTEMP.SMBXQ
  is '上门保修期';
comment on column EAM2.LC_CARDTEMP.SXBXQ
  is '送修保修期';
comment on column EAM2.LC_CARDTEMP.USERNAME
  is '使用人';
comment on column EAM2.LC_CARDTEMP.ZHCFZR
  is '综合处负责人';
comment on column EAM2.LC_CARDTEMP.GDZCGLY
  is '固定资产管理员';
comment on column EAM2.LC_CARDTEMP.ZXRQ
  is '注销日期';
comment on column EAM2.LC_CARDTEMP.FDZHM
  is '房地证号码';
comment on column EAM2.LC_CARDTEMP.YWDYTD
  is '有无对应土地';
comment on column EAM2.LC_CARDTEMP.DYTDZH
  is '对应土地证号';
comment on column EAM2.LC_CARDTEMP.DYTDKP
  is '对应土地原卡片编号';
comment on column EAM2.LC_CARDTEMP.JZMJ
  is '建筑面积';
comment on column EAM2.LC_CARDTEMP.ZDMJ
  is '占地面积';
comment on column EAM2.LC_CARDTEMP.ZXMJ
  is '装修面积';
comment on column EAM2.LC_CARDTEMP.ZYZK
  is '在用状况';
comment on column EAM2.LC_CARDTEMP.RKDH
  is '入库单号';
comment on column EAM2.LC_CARDTEMP.PARENTID
  is '大类ID';
comment on column EAM2.LC_CARDTEMP.CHILDID
  is '小类code编码';
comment on column EAM2.LC_CARDTEMP.STATE
  is '状态标识位(01 正在使用状态 02 空闲状态 03 注销状态)';
comment on column EAM2.LC_CARDTEMP.CARDINFOID
  is '拆分合并后的卡片ID';
comment on column EAM2.LC_CARDTEMP.BOXID
  is '拆分合并前的卡片';
comment on column EAM2.LC_CARDTEMP.LRRQ
  is '未知日期';
comment on column EAM2.LC_CARDTEMP.ATTACHMENTURL
  is '附件ID';
comment on column EAM2.LC_CARDTEMP.OLDCARDID
  is '旧卡片编号';
comment on column EAM2.LC_CARDTEMP.CHANGEREASON
  is '触发流程原因';
comment on column EAM2.LC_CARDTEMP.BCJT
  is '本次计提';
comment on column EAM2.LC_CARDTEMP.FIRSTBRANCH
  is '一级分行';
comment on column EAM2.LC_CARDTEMP.CHANGEWAY
  is '卡片变动方式';
comment on column EAM2.LC_CARDTEMP.SYNX
  is '使用年限';
comment on column EAM2.LC_CARDTEMP.ERPASSETCODE
  is 'erp资产标识';
comment on column EAM2.LC_CARDTEMP.ERPPK
  is 'erp关联主键';
comment on column EAM2.LC_CARDTEMP.BEFORECHANGEVALUE
  is '修改前值，形成一个字符串组合存储';
comment on column EAM2.LC_CARDTEMP.ASSETSTATE
  is '经营分类状态--资产状态';
comment on column EAM2.LC_CARDTEMP.LINESTATE
  is '用户erp返回以后，设置显示的状态';
comment on column EAM2.LC_CARDTEMP.COULDBATCHMODIFY
  is '含义不明';
comment on column EAM2.LC_CARDTEMP.MEMO_1
  is '拟分类结果';
comment on column EAM2.LC_CARDTEMP.DEALMETHOD
  is '变动方式';
comment on column EAM2.LC_CARDTEMP.EAMTIMESTAMP
  is 'EAM系统时间戳';
comment on column EAM2.LC_CARDTEMP.CARD_STATE
  is '卡片状态';
comment on column EAM2.LC_CARDTEMP.USED_PERSON
  is '正在使用该卡片的人';
comment on column EAM2.LC_CARDTEMP.USED_WORKFLOW_KEY
  is '正在使用该卡片的流程';
comment on column EAM2.LC_CARDTEMP.RZKM
  is '入账科目名称';
comment on column EAM2.LC_CARDTEMP.TXYX
  is '摊销月限';
comment on column EAM2.LC_CARDTEMP.YTXL
  is '月摊销率';
comment on column EAM2.LC_CARDTEMP.KPLX
  is '卡片类型，从卡片类别编码可得到的大类';
comment on column EAM2.LC_CARDTEMP.SFZY
  is '是否是自用卡片';
comment on column EAM2.LC_CARDTEMP.SYRBM
  is '使用人编码';
comment on column EAM2.LC_CARDTEMP.SYRRC
  is '使用人名称';
comment on column EAM2.LC_CARDTEMP.LCTEMPID
  is '卡片临时表ID';

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
  is '卡片表(二期)';
comment on column EAM2.LC_CARDTEMP_BACKUP.ID
  is 'ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.KPXZID
  is '表单ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.WFCONFIG_CODE
  is '流程编号';
comment on column EAM2.LC_CARDTEMP_BACKUP.BWID
  is '办文说明ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.CARDCODE
  is '卡片编码';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZCID
  is '资产ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZCNAME
  is '卡片名称';
comment on column EAM2.LC_CARDTEMP_BACKUP.SAVEADSRESS
  is '存放地点';
comment on column EAM2.LC_CARDTEMP_BACKUP.TYPECODE
  is '类别编码';
comment on column EAM2.LC_CARDTEMP_BACKUP.GGXH
  is '规格型号';
comment on column EAM2.LC_CARDTEMP_BACKUP.ADDTYPE
  is '增加方式';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZJTYPE
  is '折旧方法';
comment on column EAM2.LC_CARDTEMP_BACKUP.IFJC
  is '是否承继';
comment on column EAM2.LC_CARDTEMP_BACKUP.GLBM
  is '管理部门';
comment on column EAM2.LC_CARDTEMP_BACKUP.USEPARTMENT
  is '使用部门';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZJCDBM
  is '折旧承担部门';
comment on column EAM2.LC_CARDTEMP_BACKUP.USESTATUS
  is '使用状况';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZCSTATUS
  is '资产状态';
comment on column EAM2.LC_CARDTEMP_BACKUP.MAINYT
  is '主要用途';
comment on column EAM2.LC_CARDTEMP_BACKUP.KSDATE
  is '开始使用日期';
comment on column EAM2.LC_CARDTEMP_BACKUP.QYDATE
  is '启用日期';
comment on column EAM2.LC_CARDTEMP_BACKUP.YBYZ
  is '原币原值';
comment on column EAM2.LC_CARDTEMP_BACKUP.YZJE
  is '月折旧额';
comment on column EAM2.LC_CARDTEMP_BACKUP.YZJL
  is '月折旧率';
comment on column EAM2.LC_CARDTEMP_BACKUP.LJZJ
  is '累计折旧';
comment on column EAM2.LC_CARDTEMP_BACKUP.JCZ
  is '净残值';
comment on column EAM2.LC_CARDTEMP_BACKUP.JCZL
  is '净残值率';
comment on column EAM2.LC_CARDTEMP_BACKUP.JVALUE
  is '净值';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYYX
  is '使用月限';
comment on column EAM2.LC_CARDTEMP_BACKUP.YJTYF
  is '已计提月份';
comment on column EAM2.LC_CARDTEMP_BACKUP.JZZB
  is '减值准备';
comment on column EAM2.LC_CARDTEMP_BACKUP.JEVALUE
  is '净额';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDCODE
  is '旧卡片编号';
comment on column EAM2.LC_CARDTEMP_BACKUP.PGQYZ
  is '评估前原值';
comment on column EAM2.LC_CARDTEMP_BACKUP.PGQLJZJ
  is '评估前累计折旧';
comment on column EAM2.LC_CARDTEMP_BACKUP.BZSM
  is '备注';
comment on column EAM2.LC_CARDTEMP_BACKUP.YXTLRY
  is '原系统录入人员';
comment on column EAM2.LC_CARDTEMP_BACKUP.FDJHM
  is '发动机号码';
comment on column EAM2.LC_CARDTEMP_BACKUP.CLPXH
  is '车辆牌照号';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXFF
  is '摊销方法';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXCDBM
  is '摊销承担部门';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXNX
  is '摊销年限';
comment on column EAM2.LC_CARDTEMP_BACKUP.YTXYF
  is '已摊销月份';
comment on column EAM2.LC_CARDTEMP_BACKUP.YTXE
  is '已摊销额';
comment on column EAM2.LC_CARDTEMP_BACKUP.MONTXE
  is '月摊销额';
comment on column EAM2.LC_CARDTEMP_BACKUP.WTXE
  is '未摊销额';
comment on column EAM2.LC_CARDTEMP_BACKUP.QSZM
  is '权属证明';
comment on column EAM2.LC_CARDTEMP_BACKUP.TDZHM
  is '土地证号码';
comment on column EAM2.LC_CARDTEMP_BACKUP.QZSYZ
  is '权证所有者';
comment on column EAM2.LC_CARDTEMP_BACKUP.YSQDJZ
  is '原始取得价值';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDYEARYZ
  is '2004年1月1日原值';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDYEARJZ
  is '2004年1月1日累计折旧';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDJZ
  is '2004年1月1日净额';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZYZT
  is '在用状态';
comment on column EAM2.LC_CARDTEMP_BACKUP.CUPXH
  is 'CUP型号';
comment on column EAM2.LC_CARDTEMP_BACKUP.WZYP
  is '外置硬盘';
comment on column EAM2.LC_CARDTEMP_BACKUP.NZYP
  is '内置硬盘';
comment on column EAM2.LC_CARDTEMP_BACKUP.XSQ
  is '显示器';
comment on column EAM2.LC_CARDTEMP_BACKUP.QPXH
  is '硬盘型号';
comment on column EAM2.LC_CARDTEMP_BACKUP.NSAVE
  is '内存';
comment on column EAM2.LC_CARDTEMP_BACKUP.SBXLH
  is '设备序列号';
comment on column EAM2.LC_CARDTEMP_BACKUP.GYS
  is '供应商';
comment on column EAM2.LC_CARDTEMP_BACKUP.HTHM
  is '合同号码';
comment on column EAM2.LC_CARDTEMP_BACKUP.BXQ
  is '保修期';
comment on column EAM2.LC_CARDTEMP_BACKUP.SMBXQ
  is '上门保修期';
comment on column EAM2.LC_CARDTEMP_BACKUP.SXBXQ
  is '送修保修期';
comment on column EAM2.LC_CARDTEMP_BACKUP.USERNAME
  is '使用人';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZHCFZR
  is '综合处负责人';
comment on column EAM2.LC_CARDTEMP_BACKUP.GDZCGLY
  is '固定资产管理员';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZXRQ
  is '注销日期';
comment on column EAM2.LC_CARDTEMP_BACKUP.FDZHM
  is '房地证号码';
comment on column EAM2.LC_CARDTEMP_BACKUP.YWDYTD
  is '有无对应土地';
comment on column EAM2.LC_CARDTEMP_BACKUP.DYTDZH
  is '对应土地证号';
comment on column EAM2.LC_CARDTEMP_BACKUP.DYTDKP
  is '对应土地原卡片编号';
comment on column EAM2.LC_CARDTEMP_BACKUP.JZMJ
  is '建筑面积';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZDMJ
  is '占地面积';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZXMJ
  is '装修面积';
comment on column EAM2.LC_CARDTEMP_BACKUP.ZYZK
  is '在用状况';
comment on column EAM2.LC_CARDTEMP_BACKUP.RKDH
  is '入库单号';
comment on column EAM2.LC_CARDTEMP_BACKUP.PARENTID
  is '大类ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.CHILDID
  is '小类code编码';
comment on column EAM2.LC_CARDTEMP_BACKUP.STATE
  is '状态标识位(01 正在使用状态 02 空闲状态 03 注销状态)';
comment on column EAM2.LC_CARDTEMP_BACKUP.CARDINFOID
  is '拆分合并后的卡片ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.BOXID
  is '拆分合并前的卡片';
comment on column EAM2.LC_CARDTEMP_BACKUP.LRRQ
  is '未知日期';
comment on column EAM2.LC_CARDTEMP_BACKUP.ATTACHMENTURL
  is '附件ID';
comment on column EAM2.LC_CARDTEMP_BACKUP.OLDCARDID
  is '旧卡片编号';
comment on column EAM2.LC_CARDTEMP_BACKUP.CHANGEREASON
  is '触发流程原因';
comment on column EAM2.LC_CARDTEMP_BACKUP.BCJT
  is '本次计提';
comment on column EAM2.LC_CARDTEMP_BACKUP.FIRSTBRANCH
  is '一级分行';
comment on column EAM2.LC_CARDTEMP_BACKUP.CHANGEWAY
  is '卡片变动方式';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYNX
  is '使用年限';
comment on column EAM2.LC_CARDTEMP_BACKUP.ERPASSETCODE
  is 'erp资产标识';
comment on column EAM2.LC_CARDTEMP_BACKUP.ERPPK
  is 'erp关联主键';
comment on column EAM2.LC_CARDTEMP_BACKUP.BEFORECHANGEVALUE
  is '修改前值，形成一个字符串组合存储';
comment on column EAM2.LC_CARDTEMP_BACKUP.ASSETSTATE
  is '经营分类状态--资产状态';
comment on column EAM2.LC_CARDTEMP_BACKUP.LINESTATE
  is '用户erp返回以后，设置显示的状态';
comment on column EAM2.LC_CARDTEMP_BACKUP.COULDBATCHMODIFY
  is '含义不明';
comment on column EAM2.LC_CARDTEMP_BACKUP.MEMO_1
  is '拟分类结果';
comment on column EAM2.LC_CARDTEMP_BACKUP.DEALMETHOD
  is '变动方式';
comment on column EAM2.LC_CARDTEMP_BACKUP.EAMTIMESTAMP
  is 'EAM系统时间戳';
comment on column EAM2.LC_CARDTEMP_BACKUP.CARD_STATE
  is '卡片状态';
comment on column EAM2.LC_CARDTEMP_BACKUP.USED_PERSON
  is '正在使用该卡片的人';
comment on column EAM2.LC_CARDTEMP_BACKUP.USED_WORKFLOW_KEY
  is '正在使用该卡片的流程';
comment on column EAM2.LC_CARDTEMP_BACKUP.RZKM
  is '入账科目名称';
comment on column EAM2.LC_CARDTEMP_BACKUP.TXYX
  is '摊销月限';
comment on column EAM2.LC_CARDTEMP_BACKUP.YTXL
  is '月摊销率';
comment on column EAM2.LC_CARDTEMP_BACKUP.KPLX
  is '卡片类型，从卡片类别编码可得到的大类';
comment on column EAM2.LC_CARDTEMP_BACKUP.SFZY
  is '是否是自用卡片';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYRBM
  is '使用人编码';
comment on column EAM2.LC_CARDTEMP_BACKUP.SYRRC
  is '使用人名称';
comment on column EAM2.LC_CARDTEMP_BACKUP.LCTEMPID
  is '卡片临时表ID';
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
  is '报废流程';
comment on column EAM2.P_T_ABANDON.ID
  is 'ID';
comment on column EAM2.P_T_ABANDON.USER_ID
  is '(拟稿)用户ID';
comment on column EAM2.P_T_ABANDON.SEND_USER_ID
  is '待办发送人名称';
comment on column EAM2.P_T_ABANDON.HEAD_TYPE
  is '表单类型';
comment on column EAM2.P_T_ABANDON.HEAD_ID
  is '表单ID';
comment on column EAM2.P_T_ABANDON.TITLE
  is '标题';
comment on column EAM2.P_T_ABANDON.DRAFT_DATE
  is '拟稿日期';
comment on column EAM2.P_T_ABANDON.ACCEPT_DATE
  is '收到日期';
comment on column EAM2.P_T_ABANDON.ABANDON_DATE
  is '报废日期';
comment on column EAM2.P_T_ABANDON.URL
  is '访问URL';
comment on column EAM2.P_T_ABANDON.PROC_INST_ID
  is '流程实例ID';
comment on column EAM2.P_T_ABANDON.PROC_INST_NAME
  is '流程名称';
comment on column EAM2.P_T_ABANDON.SUBSYSTEM
  is '所属子系统';
comment on column EAM2.P_T_ABANDON.TASK_ID
  is '任务id';
comment on column EAM2.P_T_ABANDON.TASK_NAME
  is '任务名称';
comment on column EAM2.P_T_ABANDON.CREATE_TYPE
  is '1 正常流转
2 收回
3 单节点循环
4 作废
';
comment on column EAM2.P_T_ABANDON.IS_READ
  is '0:未读，1：已读';
comment on column EAM2.P_T_ABANDON.SHEET_ID
  is '表单编号';
comment on column EAM2.P_T_ABANDON.DRAFT_DEPT_ID
  is '拟稿部门编号';
comment on column EAM2.P_T_ABANDON.DRAFT_USERID
  is '拟稿人Id';
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
  is '编号';
comment on column EAM2.P_T_ATTACHMENT.BDID
  is '表单编号';
comment on column EAM2.P_T_ATTACHMENT.FJLX
  is '附件类型（**附件）';
comment on column EAM2.P_T_ATTACHMENT.FJBT
  is '附件标题';
comment on column EAM2.P_T_ATTACHMENT.YWJM
  is '源文件名';
comment on column EAM2.P_T_ATTACHMENT.WJLX
  is '文件类型（后缀）';
comment on column EAM2.P_T_ATTACHMENT.WJDX
  is '文件大小';
comment on column EAM2.P_T_ATTACHMENT.SCRID
  is '上传人ID';
comment on column EAM2.P_T_ATTACHMENT.SCRBH
  is '上传人编号';
comment on column EAM2.P_T_ATTACHMENT.SCSJ
  is '上传时间';
comment on column EAM2.P_T_ATTACHMENT.SCBM
  is '上传部门';
comment on column EAM2.P_T_ATTACHMENT.DEL
  is '删除状态';
comment on column EAM2.P_T_ATTACHMENT.SWID
  is '实物ID';
comment on column EAM2.P_T_ATTACHMENT.TEMPLATEID
  is '模板key,在spring配置文件中定义';
comment on column EAM2.P_T_ATTACHMENT.SORTID
  is '排序值';
comment on column EAM2.P_T_ATTACHMENT.ZZFJ
  is '0：否、1：是';
comment on column EAM2.P_T_ATTACHMENT.STATE
  is '0：否、1：是';
comment on column EAM2.P_T_ATTACHMENT.SESSIONID
  is '文件大小';
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
  is 'ID,对应附件信息表的ID号';
comment on column EAM2.P_T_ATTACHMENT_BLOB.CONTENT
  is '附件的详细内容，用BLOB存储';
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
  is '记录编号';
comment on column EAM2.P_T_COMMON_OPINION.BDID
  is '表单编号';
comment on column EAM2.P_T_COMMON_OPINION.TASKID
  is '任务编号';
comment on column EAM2.P_T_COMMON_OPINION.BDBH
  is '表单编号';
comment on column EAM2.P_T_COMMON_OPINION.TJR
  is '提交人';
comment on column EAM2.P_T_COMMON_OPINION.TJRQ
  is '日期提交';
comment on column EAM2.P_T_COMMON_OPINION.YJYLX
  is '意见域类型';
comment on column EAM2.P_T_COMMON_OPINION.YJLX
  is '意见类型';
comment on column EAM2.P_T_COMMON_OPINION.YJNR
  is '意见内容';
comment on column EAM2.P_T_COMMON_OPINION.YJBM
  is '意见部门';
comment on column EAM2.P_T_COMMON_OPINION.ZZYJ
  is '最终意见';
comment on column EAM2.P_T_COMMON_OPINION.COUNTERSIGNID
  is '会签主记录编号';
comment on column EAM2.P_T_COMMON_OPINION.PARTICIPANTID
  is '提交会签记录编号';
comment on column EAM2.P_T_COMMON_OPINION.TASK_NAME
  is '任务名称';
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
  is '主键ID';
comment on column EAM2.P_T_DEPT.PAR_ID
  is '父节点编号';
comment on column EAM2.P_T_DEPT.DEPT_CODE
  is '部门/机构编号';
comment on column EAM2.P_T_DEPT.DEPT_NAME
  is '部门/机构名称';
comment on column EAM2.P_T_DEPT.DEPT_DESC
  is '部门/机构描述';
comment on column EAM2.P_T_DEPT.DEPT_TYPE_CD
  is '部门/机构类别';
comment on column EAM2.P_T_DEPT.SORT_ORDER
  is '顺序号';
comment on column EAM2.P_T_DEPT.DEL_FLAG_CD
  is '是否删除';
comment on column EAM2.P_T_DEPT.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_DEPT.SYS_UPDATE_TIME
  is '更新时间';
comment on column EAM2.P_T_DEPT.RSVD_DATE1
  is '保留字段日期1';
comment on column EAM2.P_T_DEPT.RSVD_DATE2
  is '保留字段日期2';
comment on column EAM2.P_T_DEPT.RSVD_NUM1
  is '大部门ID';
comment on column EAM2.P_T_DEPT.RSVD_NUM2
  is '保留字段数字2';
comment on column EAM2.P_T_DEPT.RSVD_STR1
  is '大部门名称';
comment on column EAM2.P_T_DEPT.RSVD_STR2
  is '保留字段字符2';
comment on column EAM2.P_T_DEPT.RSVD_STR3
  is '保留字段字符3';
comment on column EAM2.P_T_DEPT.RSVD_STR4
  is '保留字段字符4';
comment on column EAM2.P_T_DEPT.RSVD_STR5
  is '保留字段字符5';
comment on column EAM2.P_T_DEPT.RSVD_STR6
  is '保留字段字符6';
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
  is '已办';
comment on column EAM2.P_T_DID.ID
  is 'ID';
comment on column EAM2.P_T_DID.USER_ID
  is '已办所属用户ID';
comment on column EAM2.P_T_DID.HEAD_TYPE
  is '表单类型';
comment on column EAM2.P_T_DID.HEAD_ID
  is '表单ID';
comment on column EAM2.P_T_DID.TITLE
  is '标题';
comment on column EAM2.P_T_DID.DRAFT_USERID
  is '拟稿人Id';
comment on column EAM2.P_T_DID.DRAFT_DATE
  is '拟稿日期';
comment on column EAM2.P_T_DID.CREATE_DATE
  is '创建日期';
comment on column EAM2.P_T_DID.URL
  is '访问URL';
comment on column EAM2.P_T_DID.PROC_INST_ID
  is '流程实例ID';
comment on column EAM2.P_T_DID.PROC_INST_NAME
  is '流程名称';
comment on column EAM2.P_T_DID.TASKNAME
  is '任务名称';
comment on column EAM2.P_T_DID.SUBSYSTEM
  is '所属子系统';
comment on column EAM2.P_T_DID.SHEET_ID
  is '表单编号';
comment on column EAM2.P_T_DID.TASKID
  is '任务编号';
comment on column EAM2.P_T_DID.STATU
  is '待办状态——0:已删除，1:有效,';
comment on column EAM2.P_T_DID.SEND_USERID
  is '待办发送人Id';
comment on column EAM2.P_T_DID.NEXTTASKID
  is '下一任务编号';
comment on column EAM2.P_T_DID.NEXTTASKNAME
  is '下一任务名称';
comment on column EAM2.P_T_DID.DRAFT_DEPT_ID
  is '拟稿部门编号';
comment on column EAM2.P_T_DID.DEPT_ID
  is '任务处理人部门编号';
comment on column EAM2.P_T_DID.PARAM
  is 'url参数';
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
  is '草稿';
comment on column EAM2.P_T_DRAFT.ID
  is 'ID';
comment on column EAM2.P_T_DRAFT.USER_ID
  is '用户ID';
comment on column EAM2.P_T_DRAFT.HEAD_TYPE
  is '表单类型';
comment on column EAM2.P_T_DRAFT.HEAD_ID
  is '表单ID';
comment on column EAM2.P_T_DRAFT.TITLE
  is '标题';
comment on column EAM2.P_T_DRAFT.URL
  is '访问URL';
comment on column EAM2.P_T_DRAFT.SUBSYSTEM
  is '所属子系统';
comment on column EAM2.P_T_DRAFT.CREATE_DATE
  is '草稿创建时间';
comment on column EAM2.P_T_DRAFT.DRAFT_DATE
  is '拟稿时间';
comment on column EAM2.P_T_DRAFT.STATE
  is '0:表示删除，1:表示有效';
comment on column EAM2.P_T_DRAFT.PROCESSDEFINITIONKEY
  is '流程定义KEY';
comment on column EAM2.P_T_DRAFT.DEPT_ID
  is '拟稿部门编号';
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
  is '办结';
comment on column EAM2.P_T_END.ID
  is 'ID';
comment on column EAM2.P_T_END.USER_ID
  is '办结所属用户ID';
comment on column EAM2.P_T_END.HEAD_TYPE
  is '表单类型';
comment on column EAM2.P_T_END.HEAD_ID
  is '表单ID';
comment on column EAM2.P_T_END.TITLE
  is '标题';
comment on column EAM2.P_T_END.DRAFT_DATE
  is '拟稿日期';
comment on column EAM2.P_T_END.CREATE_DATE
  is '创建日期';
comment on column EAM2.P_T_END.URL
  is '访问URL';
comment on column EAM2.P_T_END.PROC_INST_ID
  is '流程实例ID';
comment on column EAM2.P_T_END.PROC_INST_NAME
  is '流程名称';
comment on column EAM2.P_T_END.SUBSYSTEM
  is '所属子系统';
comment on column EAM2.P_T_END.SHEET_ID
  is '表单编号';
comment on column EAM2.P_T_END.DRAFT_DEPT_ID
  is '拟稿部门编号';
comment on column EAM2.P_T_END.PARAM
  is 'url参数';
comment on column EAM2.P_T_END.DRAFT_USERID
  is '拟稿人Id';
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
  is '错误日志';
comment on column EAM2.P_T_ERROR_LOG.ID
  is 'ID';
comment on column EAM2.P_T_ERROR_LOG.LOG_DATE
  is '错误发生时间';
comment on column EAM2.P_T_ERROR_LOG.METHOD_NAME
  is '外部调用API方法';
comment on column EAM2.P_T_ERROR_LOG.PROC_INST_NAME
  is '流程名称';
comment on column EAM2.P_T_ERROR_LOG.PROC_INST_ID
  is '流程ID';
comment on column EAM2.P_T_ERROR_LOG.PROC_NODE_NAME
  is '错误发生节点';
comment on column EAM2.P_T_ERROR_LOG.LOG_MESSAGE
  is '错误描述';
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
  is '主键ID';
comment on column EAM2.P_T_EXCEPTION_LOG.EXCEPTION_CLASS
  is '异常类';
comment on column EAM2.P_T_EXCEPTION_LOG.EXCEPTION_MSG
  is '异常信息';
comment on column EAM2.P_T_EXCEPTION_LOG.MODULE_NAME
  is 'MODULE名称';
comment on column EAM2.P_T_EXCEPTION_LOG.ACTION_NAME
  is 'ACTION名称';
comment on column EAM2.P_T_EXCEPTION_LOG.METHOD_NAME
  is 'METHOD名称';
comment on column EAM2.P_T_EXCEPTION_LOG.CLASS_NAME
  is 'CLASS名称';
comment on column EAM2.P_T_EXCEPTION_LOG.LINE_NUM
  is '行号';
comment on column EAM2.P_T_EXCEPTION_LOG.PARAMETERS
  is '参数';
comment on column EAM2.P_T_EXCEPTION_LOG.MACHINE_NAME
  is '设备名称';
comment on column EAM2.P_T_EXCEPTION_LOG.MACHINE_IP
  is '设备IP地址';
comment on column EAM2.P_T_EXCEPTION_LOG.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_EXCEPTION_LOG.SYS_UPDATE_TIME
  is '更新时间';
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
  is '主键';
comment on column EAM2.P_T_FILE.FILE_NAME
  is '文件名称 ';
comment on column EAM2.P_T_FILE.FILE_EXTENSION
  is '文件扩展名称';
comment on column EAM2.P_T_FILE.FILE_CONTENT
  is '文件正文';
comment on column EAM2.P_T_FILE.FILE_SIZE
  is '文件字';
comment on column EAM2.P_T_FILE.BIZ_ID
  is '业务单号';
comment on column EAM2.P_T_FILE.BIZ_INDEX
  is '业务索引号';
comment on column EAM2.P_T_FILE.BIZ_TABLE
  is '业务表';
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
  is '主键ID';
comment on column EAM2.P_T_FUNCTION_GROUP.PAR_ID
  is '父节点编号';
comment on column EAM2.P_T_FUNCTION_GROUP.FUNCTION_ID
  is '功能资源编号';
comment on column EAM2.P_T_FUNCTION_GROUP.FUNC_GROUP_TYPE_CD
  is '功能组类别';
comment on column EAM2.P_T_FUNCTION_GROUP.FUNC_GROUP_NAME
  is '功能组名称';
comment on column EAM2.P_T_FUNCTION_GROUP.SORT_ORDER
  is '顺序号';
comment on column EAM2.P_T_FUNCTION_GROUP.IS_LEAF
  is '是否为叶子节点';
comment on column EAM2.P_T_FUNCTION_GROUP.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_FUNCTION_GROUP.SYS_UPDATE_TIME
  is '更新时间';
comment on column EAM2.P_T_FUNCTION_GROUP.TARGET
  is '目标框架';
comment on column EAM2.P_T_FUNCTION_GROUP.PARAMETER
  is '链接参数';
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
  is '主键ID';
comment on column EAM2.P_T_FUNCTION_RES.FUNCTION_NAME
  is 'FUNCTION名称';
comment on column EAM2.P_T_FUNCTION_RES.MODULE_NAME
  is 'MODULE名称';
comment on column EAM2.P_T_FUNCTION_RES.ACTION_NAME
  is 'ACTION名称';
comment on column EAM2.P_T_FUNCTION_RES.METHOD_NAME
  is 'METHOD名称';
comment on column EAM2.P_T_FUNCTION_RES.CLASS_NAME
  is 'CLASS名称';
comment on column EAM2.P_T_FUNCTION_RES.IS_LOGIN_NEEDED
  is '是否需要登录';
comment on column EAM2.P_T_FUNCTION_RES.IS_TOKEN_NEEDED
  is '是否需要令牌';
comment on column EAM2.P_T_FUNCTION_RES.IS_CHECK_MID
  is '是否检查MID';
comment on column EAM2.P_T_FUNCTION_RES.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_FUNCTION_RES.SYS_UPDATE_TIME
  is '更新时间';
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
  is '主键ID';
comment on column EAM2.P_T_LOGON_INFO.USER_ID
  is '用户编号';
comment on column EAM2.P_T_LOGON_INFO.LOGIN_TYPE_CD
  is '登录类别';
comment on column EAM2.P_T_LOGON_INFO.LOGIN_TIME
  is '登录时间';
comment on column EAM2.P_T_LOGON_INFO.LOGOUT_TYPE_CD
  is '退出类别';
comment on column EAM2.P_T_LOGON_INFO.LOGOUT_TIME
  is '退出时间';
comment on column EAM2.P_T_LOGON_INFO.MACHINE_NAME
  is '设备名称';
comment on column EAM2.P_T_LOGON_INFO.MACHINE_IP
  is '设备IP地址';
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
  is '消息中心';
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
  is '0:未读,1:已读';
comment on column EAM2.P_T_MESSAGE.TYPE
  is '1:消息,2:传阅';
comment on column EAM2.P_T_MESSAGE.PARAM
  is 'url参数';
comment on column EAM2.P_T_MESSAGE.DEPT_ID
  is '消息接收人所属部门';
comment on column EAM2.P_T_MESSAGE.PROC_INST_ID
  is '流程实例ID';
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
  is '主键ID';
comment on column EAM2.P_T_REFERENCE.REF_CODE
  is '字典编码';
comment on column EAM2.P_T_REFERENCE.PAR_REF_CODE
  is '父节点编号';
comment on column EAM2.P_T_REFERENCE.REF_NAME
  is '字典名称';
comment on column EAM2.P_T_REFERENCE.SORT_ORDER
  is '顺序号';
comment on column EAM2.P_T_REFERENCE.STATUS_CD
  is '字典状态';
comment on column EAM2.P_T_REFERENCE.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_REFERENCE.SYS_UPDATE_TIME
  is '更新时间';
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
  is '主键ID';
comment on column EAM2.P_T_ROLE.ROLE_NAME
  is '角色名称';
comment on column EAM2.P_T_ROLE.ROLE_DESC
  is '角色描述';
comment on column EAM2.P_T_ROLE.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_ROLE.SYS_UPDATE_TIME
  is '更新时间';
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
  is '主键ID';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.ROLE_ID
  is '角色编号';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.FUNC_GROUP_ID
  is '功能组编号';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_ROLE_L_FUNC_GROUP.SYS_UPDATE_TIME
  is '更新时间';
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
  is '待办';
comment on column EAM2.P_T_TODO.ID
  is 'ID';
comment on column EAM2.P_T_TODO.USER_ID
  is '待办所属用户ID';
comment on column EAM2.P_T_TODO.SEND_USERID
  is '待办发送人Id';
comment on column EAM2.P_T_TODO.HEAD_TYPE
  is '表单类型';
comment on column EAM2.P_T_TODO.HEAD_ID
  is '表单ID';
comment on column EAM2.P_T_TODO.TITLE
  is '标题';
comment on column EAM2.P_T_TODO.DRAFT_USERID
  is '拟稿人Id';
comment on column EAM2.P_T_TODO.DRAFT_DATE
  is '拟稿日期';
comment on column EAM2.P_T_TODO.CREATE_DATE
  is '创建日期';
comment on column EAM2.P_T_TODO.URL
  is '访问URL';
comment on column EAM2.P_T_TODO.PROC_INST_ID
  is '流程实例ID';
comment on column EAM2.P_T_TODO.PROC_INST_NAME
  is '流程名称';
comment on column EAM2.P_T_TODO.SUBSYSTEM
  is '所属子系统';
comment on column EAM2.P_T_TODO.STATU
  is '待办状态——0:已删除，1:有效,';
comment on column EAM2.P_T_TODO.TASKID
  is '任务编号';
comment on column EAM2.P_T_TODO.TASKNAME
  is '任务名称';
comment on column EAM2.P_T_TODO.SHEET_ID
  is '表单编号';
comment on column EAM2.P_T_TODO.IS_READ
  is '0：未读，1：已读';
comment on column EAM2.P_T_TODO.UPERTASKID
  is '上一任务编号';
comment on column EAM2.P_T_TODO.UPERTASKNAME
  is '上一任务名称';
comment on column EAM2.P_T_TODO.DRAFT_DEPT_ID
  is '拟稿部门编号';
comment on column EAM2.P_T_TODO.DEPT_ID
  is '任务处理人部门编号';
comment on column EAM2.P_T_TODO.PARAM
  is 'url参数';
comment on column EAM2.P_T_TODO.HAS_UNREAD_COUNTERSIGN
  is '0：没有，1：有（是否有未读的会签意见）';
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
  is '主键ID';
comment on column EAM2.P_T_USER.LOGIN_ID
  is '登录帐号';
comment on column EAM2.P_T_USER.USERNAME
  is '用户名称';
comment on column EAM2.P_T_USER.PASSWORD
  is '登录密码';
comment on column EAM2.P_T_USER.GENDER_CD
  is '性别';
comment on column EAM2.P_T_USER.BIRTH_DATE
  is '出生日期';
comment on column EAM2.P_T_USER.ID_NUMBER
  is '证件号码';
comment on column EAM2.P_T_USER.EMAIL
  is '电子邮件';
comment on column EAM2.P_T_USER.CELLPHONE
  is '移动电话';
comment on column EAM2.P_T_USER.HOME_PHONE
  is '家庭电话';
comment on column EAM2.P_T_USER.BUSINESS_PHONE
  is '办公电话';
comment on column EAM2.P_T_USER.ADDRESS
  is '地址';
comment on column EAM2.P_T_USER.POSTCODE
  is '邮编';
comment on column EAM2.P_T_USER.DESCRIPTION
  is '描述信息';
comment on column EAM2.P_T_USER.STATUS_CD
  is '状态';
comment on column EAM2.P_T_USER.DEL_FLAG_CD
  is '是否删除';
comment on column EAM2.P_T_USER.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_USER.SYS_UPDATE_TIME
  is '更新时间';
comment on column EAM2.P_T_USER.RSVD_DATE1
  is '保留字段日期1';
comment on column EAM2.P_T_USER.RSVD_DATE2
  is '保留字段日期2';
comment on column EAM2.P_T_USER.RSVD_NUM1
  is '保留字段数字1';
comment on column EAM2.P_T_USER.RSVD_NUM2
  is '保留字段数字2';
comment on column EAM2.P_T_USER.RSVD_STR1
  is '保留字段字符1';
comment on column EAM2.P_T_USER.RSVD_STR2
  is '保留字段字符2';
comment on column EAM2.P_T_USER.RSVD_STR3
  is '保留字段字符3';
comment on column EAM2.P_T_USER.RSVD_STR4
  is '保留字段字符4';
comment on column EAM2.P_T_USER.RSVD_STR5
  is '保留字段字符5';
comment on column EAM2.P_T_USER.RSVD_STR6
  is '保留字段字符6';
comment on column EAM2.P_T_USER.RSVD_STR7
  is '保留字段字符7';
comment on column EAM2.P_T_USER.RSVD_STR8
  is '保留字段字符8';
comment on column EAM2.P_T_USER.RSVD_STR9
  is '保留字段字符9';
comment on column EAM2.P_T_USER.RSVD_STR10
  is '保留字段字符10';
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
  is '主键ID';
comment on column EAM2.P_T_USER_L_DEPT.USER_ID
  is '用户编号';
comment on column EAM2.P_T_USER_L_DEPT.DEPT_ID
  is '部门编号';
comment on column EAM2.P_T_USER_L_DEPT.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_USER_L_DEPT.SYS_UPDATE_TIME
  is '更新时间';
comment on column EAM2.P_T_USER_L_DEPT.USER_NAME
  is '用户名称';
comment on column EAM2.P_T_USER_L_DEPT.DEPT_NAME
  is '部门名称';
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
  is '主键ID';
comment on column EAM2.P_T_USER_L_ROLE.USER_ID
  is '用户编号';
comment on column EAM2.P_T_USER_L_ROLE.ROLE_ID
  is '角色编号';
comment on column EAM2.P_T_USER_L_ROLE.SYS_UPDATE_USER
  is '更新用户编号';
comment on column EAM2.P_T_USER_L_ROLE.SYS_UPDATE_TIME
  is '更新时间';
comment on column EAM2.P_T_USER_L_ROLE.USER_NAME
  is '用户名称';
comment on column EAM2.P_T_USER_L_ROLE.ROLE_NAME
  is '角色名称';
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
  is '审查知识库';
comment on column EAM2.QY_CZ_SCZSK.ID
  is 'uuid主键';
comment on column EAM2.QY_CZ_SCZSK.PID
  is 'PID';
comment on column EAM2.QY_CZ_SCZSK.CODE
  is 'CODE';
comment on column EAM2.QY_CZ_SCZSK.SCBZ
  is '删除标志';
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
  is '债权人名称包括中国建投和内部实体';
comment on column EAM2.QY_DEBT_INFO.ZQRID
  is '债权人ID，如果债权人是中国建投，id记录中国建投编号，如果是内部实体，记录内部实体id';
comment on column EAM2.QY_DEBT_INFO.ZWRMC
  is '债务人名称';
comment on column EAM2.QY_DEBT_INFO.ZWRID
  is '债务人ID';
comment on column EAM2.QY_DEBT_INFO.GLSTLX
  is '内部实体、外部实体';
comment on column EAM2.QY_DEBT_INFO.SFSS
  is '是否诉讼';
comment on column EAM2.QY_DEBT_INFO.BEIZHU
  is '备注';
comment on column EAM2.QY_DEBT_INFO.SHENGFEN
  is '省份';
comment on column EAM2.QY_DEBT_INFO.DBFS
  is '担保方式';
comment on column EAM2.QY_DEBT_INFO.ZQJE
  is '债券金额';
comment on column EAM2.QY_DEBT_INFO.SSSX
  is '诉讼时效';
comment on column EAM2.QY_DEBT_INFO.ZWRQKJS
  is '债务人情况介绍';
comment on column EAM2.QY_DEBT_INFO.FZJS
  is '负债介绍';
comment on column EAM2.QY_DEBT_INFO.ZQQX
  is '债券期限(天)';
comment on column EAM2.QY_DEBT_INFO.DYZYCC
  is '抵押财产、质押财产、保证人等说明';

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
  is '2010低值易耗品台账';
comment on column EAM2.QY_DZYHP_TZ.ID
  is '序号';
comment on column EAM2.QY_DZYHP_TZ.XL
  is '小类';
comment on column EAM2.QY_DZYHP_TZ.ZCMC
  is '名称';
comment on column EAM2.QY_DZYHP_TZ.GG
  is '规格型号';
comment on column EAM2.QY_DZYHP_TZ.SYR
  is '领用人';
comment on column EAM2.QY_DZYHP_TZ.SYBM
  is '使用部门';
comment on column EAM2.QY_DZYHP_TZ.ZCBH
  is '资产编码';
comment on column EAM2.QY_DZYHP_TZ.CGRQ
  is '采购日期';
comment on column EAM2.QY_DZYHP_TZ.GYS
  is '供应商';
comment on column EAM2.QY_DZYHP_TZ.CZYZ
  is '财产原值';
comment on column EAM2.QY_DZYHP_TZ.BGDD
  is '保管地点';
comment on column EAM2.QY_DZYHP_TZ.ZTWZ
  is '编号粘贴位置';
comment on column EAM2.QY_DZYHP_TZ.BZ
  is '备注';
comment on column EAM2.QY_DZYHP_TZ.YJFLBM
  is '一级分类编码';
comment on column EAM2.QY_DZYHP_TZ.YJFLMC
  is '一级分类名称';
comment on column EAM2.QY_DZYHP_TZ.EJFLBM
  is '二级分类编码';
comment on column EAM2.QY_DZYHP_TZ.EJFLMC
  is '二级分类名称';
comment on column EAM2.QY_DZYHP_TZ.SJFLBM
  is '三级分类编码';
comment on column EAM2.QY_DZYHP_TZ.SJFLMC
  is '三级分类名称';
comment on column EAM2.QY_DZYHP_TZ.ZC_ID
  is '资产ID和资产表对应';
comment on column EAM2.QY_DZYHP_TZ.RKSL
  is '入库数量';
comment on column EAM2.QY_DZYHP_TZ.CKSL
  is '出库数量';
comment on column EAM2.QY_DZYHP_TZ.KCSL
  is '库存数量';
comment on column EAM2.QY_DZYHP_TZ.LYBMBM
  is '领用部门编码';
comment on column EAM2.QY_DZYHP_TZ.LYRBH
  is '领用借用人编号';
comment on column EAM2.QY_DZYHP_TZ.SYZK
  is '使用状况';
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
  is '一期ERP数据 -> 卡片表';
comment on column EAM2.QY_ERP_CARDINFO.ZCID
  is '卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CODE
  is '资产编码';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZYMC
  is '资产名称';
comment on column EAM2.QY_ERP_CARDINFO.CARD_LBMC
  is '类别名称';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BZ
  is '币种';
comment on column EAM2.QY_ERP_CARDINFO.ZJTYPE
  is '折旧方法';
comment on column EAM2.QY_ERP_CARDINFO.USEPARTMENT
  is '使用部门';
comment on column EAM2.QY_ERP_CARDINFO.GLBM
  is '管理部门';
comment on column EAM2.QY_ERP_CARDINFO.ADDTYPE
  is '增加方式';
comment on column EAM2.QY_ERP_CARDINFO.USESTATUS
  is '使用状况';
comment on column EAM2.QY_ERP_CARDINFO.ZJCDBM
  is '折旧承担部门';
comment on column EAM2.QY_ERP_CARDINFO.YJTYF
  is '已计提月份';
comment on column EAM2.QY_ERP_CARDINFO.KSDATE
  is '开始使用日期';
comment on column EAM2.QY_ERP_CARDINFO.YBYZ
  is '原币原值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BBYZ
  is '本币原值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HBDW
  is '货币单位';
comment on column EAM2.QY_ERP_CARDINFO.LJZJ
  is '累计折旧';
comment on column EAM2.QY_ERP_CARDINFO.JCZL
  is '净残值率％';
comment on column EAM2.QY_ERP_CARDINFO.USERNAME
  is '使用人';
comment on column EAM2.QY_ERP_CARDINFO.SYYX
  is '使用月限';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DWZJ
  is '单位折旧';
comment on column EAM2.QY_ERP_CARDINFO.YZJL
  is '月折旧率';
comment on column EAM2.QY_ERP_CARDINFO.YZJE
  is '月折旧额';
comment on column EAM2.QY_ERP_CARDINFO.GGXH
  is '规格型号';
comment on column EAM2.QY_ERP_CARDINFO.SAVEADSRESS
  is '存放地点';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZLDW
  is '工作量单位';
comment on column EAM2.QY_ERP_CARDINFO.CARD_LJGZL
  is '累计工作量';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZZL
  is '工作总量';
comment on column EAM2.QY_ERP_CARDINFO.JZZB
  is '减值准备';
comment on column EAM2.QY_ERP_CARDINFO.TYPECODE
  is '类别编码';
comment on column EAM2.QY_ERP_CARDINFO.JVALUE
  is '净值';
comment on column EAM2.QY_ERP_CARDINFO.JCZ
  is '净残值';
comment on column EAM2.QY_ERP_CARDINFO.JEVALUE
  is '净额';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCTH
  is '资产套号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YGZL
  is '月工作量';
comment on column EAM2.QY_ERP_CARDINFO.GYS
  is '供应商';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZZX
  is '工作中心';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SL
  is '数量';
comment on column EAM2.QY_ERP_CARDINFO.CARD_XMGLDA
  is '项目管理档案';
comment on column EAM2.QY_ERP_CARDINFO.CLPXH
  is '车辆牌照号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JDW
  is '净吨位';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZJLY
  is '资金来源';
comment on column EAM2.QY_ERP_CARDINFO.CARD_TDJB
  is '土地级别';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JLDW
  is '计量单位';
comment on column EAM2.QY_ERP_CARDINFO.ZDMJ
  is '土地面积';
comment on column EAM2.QY_ERP_CARDINFO.ZXMJ
  is '建筑面积';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JS
  is '间[座]数';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZCBS
  is '建筑承包商';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DJGL
  is '电机功率';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DJSL
  is '电机数量';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CCRQ
  is '出厂日期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SCCS
  is '生产厂商';
comment on column EAM2.QY_ERP_CARDINFO.SMBXQ
  is '上门保修期';
comment on column EAM2.QY_ERP_CARDINFO.SXBXQ
  is '送修保修期';
comment on column EAM2.QY_ERP_CARDINFO.CUPXH
  is 'CPU型号 ';
comment on column EAM2.QY_ERP_CARDINFO.NSAVE
  is '内存';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ASS
  is '安时数';
comment on column EAM2.QY_ERP_CARDINFO.QPXH
  is '硬盘型号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GL
  is '功率';
comment on column EAM2.QY_ERP_CARDINFO.CARD_MACDZ
  is 'MAC地址 ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_IPDZ
  is 'IP地址';
comment on column EAM2.QY_ERP_CARDINFO.CARD_XXDH
  is '信息点号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SYRDH
  is '使用人电话';
comment on column EAM2.QY_ERP_CARDINFO.SBXLH
  is '设备序列号';
comment on column EAM2.QY_ERP_CARDINFO.RKDH
  is '入库单号';
comment on column EAM2.QY_ERP_CARDINFO.NZYP
  is '内置硬盘';
comment on column EAM2.QY_ERP_CARDINFO.WZYP
  is '外置硬盘';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HBYCSJ
  is '后备延迟时间';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DCRL
  is '电池容量';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BB
  is '版本';
comment on column EAM2.QY_ERP_CARDINFO.BXQ
  is '保修期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZMJ
  is '建筑面积';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZDMJ
  is '占地面积';
comment on column EAM2.QY_ERP_CARDINFO.CARD_FCZHM
  is '房产证号码';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZXFCKPBH
  is '装修房产卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.ZXMJ01
  is '装修面积';
comment on column EAM2.QY_ERP_CARDINFO.QSZM
  is '权属证明';
comment on column EAM2.QY_ERP_CARDINFO.YWDYTD
  is '有无对应土地';
comment on column EAM2.QY_ERP_CARDINFO.DYTDKP
  is '对应土地原卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.DYTDZH
  is '对应土地证号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BZQK
  is '办证情况';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSZH
  is '权属证号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSZSYR
  is '权属证所有权人';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDQSWJ
  is '对应土地权属文件';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDTDWJ
  is '对应土地土地证号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDKPBH
  is '对应土地卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YT
  is '用途';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCS
  is '总层数';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZLDJC
  is '坐落在第几层';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YG
  is '檐高';
comment on column EAM2.QY_ERP_CARDINFO.QYDATE
  is '启用日期';
comment on column EAM2.QY_ERP_CARDINFO.OLDCODE
  is '旧卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.MAINYT
  is '主要用途';
comment on column EAM2.QY_ERP_CARDINFO.QZSYZ
  is '权证所有者';
comment on column EAM2.QY_ERP_CARDINFO.YXTLRY
  is '原系统录入员';
comment on column EAM2.QY_ERP_CARDINFO.PGQYZ
  is '评估前原值';
comment on column EAM2.QY_ERP_CARDINFO.PGQLJZJ
  is '评估前累计折旧';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CLMCJGGXH
  is '车辆名称及规格型号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GZRQ
  is '购置日期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CLPH
  is '车辆牌号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YWFP
  is '有无发票';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CLXCZSYR
  is '车辆行驶证所有人';
comment on column EAM2.QY_ERP_CARDINFO.CARD_PZHM
  is '牌照号码';
comment on column EAM2.QY_ERP_CARDINFO.FDJHM
  is '发动机号码';
comment on column EAM2.QY_ERP_CARDINFO.CARD_KFCD
  is '开发程度';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SYSYNX
  is '剩余使用年限';
comment on column EAM2.QY_ERP_CARDINFO.SYNX
  is '准用年限';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YDXZ
  is '用地性质';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SJYT
  is '实际用途';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GHYT
  is '规划用途';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYFWYKPBH
  is '对应房屋原卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YWDYDSW
  is '有无对应地上物';
comment on column EAM2.QY_ERP_CARDINFO.TDZHM
  is '土地证号码';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYFCFCZBH
  is '对应房产房产证编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYFCYKPBH
  is '对应房产原卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YWDYFC
  is '有无对应房产';
comment on column EAM2.QY_ERP_CARDINFO.ZXRQ
  is '注销日期';
comment on column EAM2.QY_ERP_CARDINFO.XSQ
  is '系统显示器';
comment on column EAM2.QY_ERP_CARDINFO.HTHM
  is '合同号码';
comment on column EAM2.QY_ERP_CARDINFO.IFJC
  is '是否承继';
comment on column EAM2.QY_ERP_CARDINFO.OLDYEARYZ
  is '2004年1月1日原值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_2004JZ
  is '2004年1月1日净值';
comment on column EAM2.QY_ERP_CARDINFO.OLDYEARJZ
  is '2004年1月1日累计折旧';
comment on column EAM2.QY_ERP_CARDINFO.YSQDJZ
  is '原始取得价值';
comment on column EAM2.QY_ERP_CARDINFO.ZCSTATUS
  is '资产状态';
comment on column EAM2.QY_ERP_CARDINFO.ZYZT
  is '在用状态';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JBH
  is '经办行';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04JZZB
  is '04年1月1日减值准备';
comment on column EAM2.QY_ERP_CARDINFO.CARD_06YTXYX
  is '06年1月1日已摊销月限';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YJSYYX
  is '预计使用月限';
comment on column EAM2.QY_ERP_CARDINFO.BZSM
  is '备注';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSWJWYXWJ
  is '权属文件无有效文件';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSTDWJ
  is '权属替代文件';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSWJQSYWZY
  is '权属文件权属有无争议';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QSWJSFDY
  is '权属文件是否抵押';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDZSYQR
  is '对应土地证使用权人';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDQSWJWYXWJ
  is '对应土地权属文件无有效文件';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDQSWJWTDWJ
  is '对应土地权属文件替代文件';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JCRQ
  is '建成日期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JG
  is '结构';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BZCG
  is '标准层高';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CBDJ
  is '成本单价';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCDYWJXH
  is '资产抵押文件序号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCZLWJXH
  is '资产租赁文件序号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCCZWJXH
  is '资产处置文件序号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QTYGSMWJXH
  is '其他有关说明文件序号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_PGYZ
  is '评估原值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZZL
  is '增值率';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CXL
  is '成新率';
comment on column EAM2.QY_ERP_CARDINFO.CARD_PGJZ
  is '评估净值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZWZCYSQDJG
  is '账外资产原始取得价格';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCCZZXYJ
  is '资产处置咨询意见';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZJCZJZ
  is '择机处置价值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JKCZJZ
  is '尽快处置价值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NCZMYZ
  is '04年年初账面原值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NCZMJZZB
  is '04年年初账面减值准备';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NCZMJZ
  is '04年年初账面净值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZP
  is '照片';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZSJ
  is '处置时间';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZDYZMYZ
  is '处置当月账面原值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZDYZMJZ
  is '处置当月账面净值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZHTBH
  is '处置合同编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_CZSR
  is '处置收入';
comment on column EAM2.QY_ERP_CARDINFO.CARD_RZCZSR
  is '入账处置收入';
comment on column EAM2.QY_ERP_CARDINFO.CARD_RZCZFY
  is '入账处置费用';
comment on column EAM2.QY_ERP_CARDINFO.CARD_RZCZSY
  is '入账处置损益';
comment on column EAM2.QY_ERP_CARDINFO.CARD_2005YXSLC
  is '2005年9月30日已行驶里程 ';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JFCZFLJF
  is '是否存在法律纠纷';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SFDY
  is '是否抵押';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HCPGBZ
  is '核查评估备注';
comment on column EAM2.QY_ERP_CARDINFO.CARD_DYTDKPBH01
  is '对应土地旧卡片编号';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QDRQ
  is '取得日期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_04NZZMTDZ
  is '04年年初账面土地值';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GCZT
  is '工程状态';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JGCS
  is '结构层数';
comment on column EAM2.QY_ERP_CARDINFO.CARD_KGRQ
  is '开工日期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_YJWGRQ
  is '预计完工日期';
comment on column EAM2.QY_ERP_CARDINFO.CARD_XXJD
  is '形象进度';
comment on column EAM2.QY_ERP_CARDINFO.CARD_FKBL
  is '付款比例';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GSS
  is '概算数';
comment on column EAM2.QY_ERP_CARDINFO.CARD_TDCRHT
  is '土地出让合同';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZYDXKZ
  is '建筑用地许可证';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZGHXKZ
  is '建筑规划许可证';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JZKGXKZ
  is '建筑开工许可证';
comment on column EAM2.QY_ERP_CARDINFO.CARD_JSFS
  is '结算方式';
comment on column EAM2.QY_ERP_CARDINFO.CARD_SFYJF
  is '是否有纠纷';
comment on column EAM2.QY_ERP_CARDINFO.CARD_GCQKE
  is '工程欠款额';
comment on column EAM2.QY_ERP_CARDINFO.CARD_HCYSFSE
  is '核查原始发生额';
comment on column EAM2.QY_ERP_CARDINFO.CARD_ZCXMBS
  is '资产项目标识';
comment on column EAM2.QY_ERP_CARDINFO.CARD_FCBZSJ
  is '房产办证时间';
comment on column EAM2.QY_ERP_CARDINFO.CARD_TDBZSJ
  is '土地办证时间';
comment on column EAM2.QY_ERP_CARDINFO.CARD_QQBZ
  is '确权备注';
comment on column EAM2.QY_ERP_CARDINFO.CARD_BNQQYY
  is '不能确权原因';
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
  is '2010固定资产实物台账';
comment on column EAM2.QY_GDZCSW_TZ.ID
  is '序号';
comment on column EAM2.QY_GDZCSW_TZ.KPBH
  is '卡片编号';
comment on column EAM2.QY_GDZCSW_TZ.ZCBH
  is '资产编码';
comment on column EAM2.QY_GDZCSW_TZ.ZCMC
  is '资产名称';
comment on column EAM2.QY_GDZCSW_TZ.GG
  is '规格型号';
comment on column EAM2.QY_GDZCSW_TZ.LBMC
  is '类别名称';
comment on column EAM2.QY_GDZCSW_TZ.SYBM
  is '使用部门';
comment on column EAM2.QY_GDZCSW_TZ.SYZK
  is '使用状况';
comment on column EAM2.QY_GDZCSW_TZ.CZYZ
  is '原币原值';
comment on column EAM2.QY_GDZCSW_TZ.SYR
  is '使用人';
comment on column EAM2.QY_GDZCSW_TZ.KSSYRQ
  is '开始使用日期';
comment on column EAM2.QY_GDZCSW_TZ.FDJBH
  is '发动机号码';
comment on column EAM2.QY_GDZCSW_TZ.BGDD
  is '存放地点';
comment on column EAM2.QY_GDZCSW_TZ.YLRR
  is '原系统录入员';
comment on column EAM2.QY_GDZCSW_TZ.ZTWZ
  is '编号粘贴位置';
comment on column EAM2.QY_GDZCSW_TZ.YJFLBM
  is '一级分类编码';
comment on column EAM2.QY_GDZCSW_TZ.YJFLMC
  is '一级分类名称';
comment on column EAM2.QY_GDZCSW_TZ.EJFLBM
  is '二级分类编码';
comment on column EAM2.QY_GDZCSW_TZ.EJFLMC
  is '二级分类名称';
comment on column EAM2.QY_GDZCSW_TZ.SJFLBM
  is '三级分类编码';
comment on column EAM2.QY_GDZCSW_TZ.SJFLMC
  is '三级分类名称';
comment on column EAM2.QY_GDZCSW_TZ.ZC_ID
  is '资产ID和资产表对应';
comment on column EAM2.QY_GDZCSW_TZ.RKSL
  is '入库数量';
comment on column EAM2.QY_GDZCSW_TZ.CKSL
  is '出库数量';
comment on column EAM2.QY_GDZCSW_TZ.KCSL
  is '库存数量';
comment on column EAM2.QY_GDZCSW_TZ.LYBMBM
  is '领用部门编码';
comment on column EAM2.QY_GDZCSW_TZ.LYRBH
  is '领用借用人编号';
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
  is '计算机类低值耗材';
comment on column EAM2.QY_JSJLDZHC.ID
  is '序号';
comment on column EAM2.QY_JSJLDZHC.YJFLBM
  is '一级分类编码';
comment on column EAM2.QY_JSJLDZHC.SYRQ
  is '领用日期';
comment on column EAM2.QY_JSJLDZHC.ZCMC
  is '名称/物品名称';
comment on column EAM2.QY_JSJLDZHC.GG
  is '型号/品牌规格型号';
comment on column EAM2.QY_JSJLDZHC.DJ
  is '单价';
comment on column EAM2.QY_JSJLDZHC.SL
  is '数量';
comment on column EAM2.QY_JSJLDZHC.JG
  is '总价/价格';
comment on column EAM2.QY_JSJLDZHC.SYR
  is '使用人';
comment on column EAM2.QY_JSJLDZHC.BZ
  is '备注';
comment on column EAM2.QY_JSJLDZHC.SYBM
  is '领用部门';
comment on column EAM2.QY_JSJLDZHC.SYZK
  is '状态';
comment on column EAM2.QY_JSJLDZHC.YJFLMC
  is '一级分类名称';
comment on column EAM2.QY_JSJLDZHC.EJFLBM
  is '二级分类编码';
comment on column EAM2.QY_JSJLDZHC.EJFLMC
  is '二级分类名称';
comment on column EAM2.QY_JSJLDZHC.SJFLBM
  is '三级分类编码';
comment on column EAM2.QY_JSJLDZHC.SJFLMC
  is '三级分类名称';
comment on column EAM2.QY_JSJLDZHC.ZC_ID
  is '资产ID和资产表对应';
comment on column EAM2.QY_JSJLDZHC.RKSL
  is '入库数量';
comment on column EAM2.QY_JSJLDZHC.CKSL
  is '出库数量';
comment on column EAM2.QY_JSJLDZHC.KCSL
  is '库存数量';
comment on column EAM2.QY_JSJLDZHC.LYBMBM
  is '领用部门编码';
comment on column EAM2.QY_JSJLDZHC.LYRBH
  is '领用借用人编号';
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
  is '计算机类固定资产';
comment on column EAM2.QY_JSJLGDZC.ID
  is '序号';
comment on column EAM2.QY_JSJLGDZC.EJFLBM
  is '二级分类编码';
comment on column EAM2.QY_JSJLGDZC.ZCMC
  is '物品名称';
comment on column EAM2.QY_JSJLGDZC.GG
  is '规格型号';
comment on column EAM2.QY_JSJLGDZC.XLH
  is '设备序列号';
comment on column EAM2.QY_JSJLGDZC.SL
  is '数量';
comment on column EAM2.QY_JSJLGDZC.BXQ
  is '保修期';
comment on column EAM2.QY_JSJLGDZC.CZYZ
  is '原币原值';
comment on column EAM2.QY_JSJLGDZC.SYZK
  is '使用状况';
comment on column EAM2.QY_JSJLGDZC.BGDD
  is '存放地点';
comment on column EAM2.QY_JSJLGDZC.SYBM
  is '使用部门';
comment on column EAM2.QY_JSJLGDZC.SYR
  is '使用人';
comment on column EAM2.QY_JSJLGDZC.CPUXH
  is 'CPU型号';
comment on column EAM2.QY_JSJLGDZC.MEMORY
  is '内存';
comment on column EAM2.QY_JSJLGDZC.DISK
  is '硬盘型号';
comment on column EAM2.QY_JSJLGDZC.NZDISK
  is '内置硬盘';
comment on column EAM2.QY_JSJLGDZC.XTXSQ
  is '系统显示器';
comment on column EAM2.QY_JSJLGDZC.BZ
  is '备注';
comment on column EAM2.QY_JSJLGDZC.EJFLMC
  is '二级分类名称';
comment on column EAM2.QY_JSJLGDZC.YJFLBM
  is '一级分类编码';
comment on column EAM2.QY_JSJLGDZC.YJFLMC
  is '一级分类名称';
comment on column EAM2.QY_JSJLGDZC.SJFLBM
  is '三级分类编码';
comment on column EAM2.QY_JSJLGDZC.SJFLMC
  is '三级分类名称';
comment on column EAM2.QY_JSJLGDZC.ZC_ID
  is '资产ID和资产表对应';
comment on column EAM2.QY_JSJLGDZC.RKSL
  is '入库数量';
comment on column EAM2.QY_JSJLGDZC.CKSL
  is '出库数量';
comment on column EAM2.QY_JSJLGDZC.KCSL
  is '库存数量';
comment on column EAM2.QY_JSJLGDZC.LYBMBM
  is '领用部门编码';
comment on column EAM2.QY_JSJLGDZC.LYRBH
  is '领用借用人编号';
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
  is '建银投资债券投资明细表';
comment on column EAM2.QY_JYTZZQTZ_MX.ID
  is '序号';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQZL
  is '债券种类';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQMC
  is '债券名称';
comment on column EAM2.QY_JYTZZQTZ_MX.DQR
  is '到期日';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_ZQMZHSKM
  is '原建行账面年初数债券面值核算科目';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_JE1
  is '原建行账面年初数金额（1）';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_YSLXHSKM
  is '原建行账面年初数应收利息核算科目';
comment on column EAM2.QY_JYTZZQTZ_MX.YJH_JE2
  is '原建行账面年初数金额（2）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_ZQMZ
  is '建银投资年初数债券面值（3）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_JZZB
  is '建银投资年初数债券投资减值准备（4）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_ZQTZJE
  is '建银投资年初数债券投资净额（5）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_YSLX
  is '建银投资年初数应收利息（6）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_YSLXHZZB
  is '建银投资年初数应收利息坏账准备（7）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNCS_YSLXJE
  is '建银投资年初数应收利息净额（8）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_ZQMZ
  is '建银投资年末数债券面值（9）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_JZZB
  is '建银投资年末数债券投资减值准备（10）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_ZQTZJE
  is '建银投资年末数债券投资净额（11）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_YSLX
  is '建银投资年末数应收利息（12）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_YSLXHZZB
  is '建银投资年末数应收利息坏账准备（13）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_YSLXJE
  is '建银投资年末数应收利息净额（14）';
comment on column EAM2.QY_JYTZZQTZ_MX.JYTZNMS_ZQTZSY
  is '建银投资年末数债券投资损益（15）';
comment on column EAM2.QY_JYTZZQTZ_MX.BZ
  is '备注';
comment on column EAM2.QY_JYTZZQTZ_MX.JHFHID
  is '从INDIVIDTREE中选取,类型为department';
comment on column EAM2.QY_JYTZZQTZ_MX.XMMC_BH
  is '分行编号';
comment on column EAM2.QY_JYTZZQTZ_MX.JHFHMC
  is '建行分行名称';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQZLID
  is '债券种类ID,来自CODE表';
comment on column EAM2.QY_JYTZZQTZ_MX.ZQZLBM
  is '债券种类编码,来自CODE表';
comment on column EAM2.QY_JYTZZQTZ_MX.XM_ID
  is '项目ID';
comment on column EAM2.QY_JYTZZQTZ_MX.XMMC
  is '项目名称';
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
  is '资产包基本情况汇总表';
comment on column EAM2.QY_JYWTRMB_HZ.ID
  is '序号';
comment on column EAM2.QY_JYWTRMB_HZ.ZQRMC
  is '债权人名称';
comment on column EAM2.QY_JYWTRMB_HZ.ZWRMC
  is '债务人名称';
comment on column EAM2.QY_JYWTRMB_HZ.JKHTBH_DABH
  is '借款合同编号/档案编号';
comment on column EAM2.QY_JYWTRMB_HZ.HTQX_QSRQ
  is '合同期限_起始日期';
comment on column EAM2.QY_JYWTRMB_HZ.HTQX_ZZRQ
  is '合同期限_终止日期';
comment on column EAM2.QY_JYWTRMB_HZ.HTJE_BZ
  is '合同金额_币种';
comment on column EAM2.QY_JYWTRMB_HZ.HTJE_YBJE
  is '合同金额_原币金额';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_GRZQYE
  is '截止日债权金额_购入债权余额';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_HJ
  is '截止日债权金额_合计';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_BJ
  is '截止日债权金额_本金';
comment on column EAM2.QY_JYWTRMB_HZ.JZR_LX
  is '截止日债权金额_利息';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DBLX
  is '担保情况_担保类型';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DBHTBH
  is '担保情况_担保合同编号';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DBHTJE
  is '担保情况_担保合同金额';
comment on column EAM2.QY_JYWTRMB_HZ.DBQK_DYW
  is '担保情况_抵质押物类别/保证人名称';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_SFSS
  is '涉及法律程序情况_是否诉讼';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_SSFY
  is '涉及法律程序情况_诉讼费用';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_FLWS
  is '涉及法律程序情况_是否有生效法律文书';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_ZHT
  is '涉及法律程序情况_诉讼结果主合同';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_DBHT
  is '涉及法律程序情况_诉讼结果担保合同';
comment on column EAM2.QY_JYWTRMB_HZ.SJFL_ZXQK
  is '涉及法律程序情况_执行情况';
comment on column EAM2.QY_JYWTRMB_HZ.BZ
  is '备注';
comment on column EAM2.QY_JYWTRMB_HZ.BZID
  is '合同金额币种ID,对应CODE表';
comment on column EAM2.QY_JYWTRMB_HZ.BZBM
  is '币种编码，取自CODE表';
comment on column EAM2.QY_JYWTRMB_HZ.DBLXID
  is '担保类型ID,取自CODE表';
comment on column EAM2.QY_JYWTRMB_HZ.DBLXBM
  is '担保类型编码';
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
  is '建银投资债券投资明细表';
comment on column EAM2.QY_LPB.ID
  is '序号';
comment on column EAM2.QY_LPB.XM
  is '姓名';
comment on column EAM2.QY_LPB.DLM
  is '登录名';
comment on column EAM2.QY_LPB.LPH
  is '令牌号';
comment on column EAM2.QY_LPB.QX
  is '权限';
comment on column EAM2.QY_LPB.ZT
  is '状态';
comment on column EAM2.QY_LPB.LPSX
  is '令牌时限';
comment on column EAM2.QY_LPB.ZC_ID
  is '资产ID和资产表对应';
comment on column EAM2.QY_LPB.YJFLBM
  is '一级分类编码';
comment on column EAM2.QY_LPB.YJFLMC
  is '一级分类名称';
comment on column EAM2.QY_LPB.EJFLBM
  is '二级分类编码';
comment on column EAM2.QY_LPB.EJFLMC
  is '二级分类名称';
comment on column EAM2.QY_LPB.SJFLBM
  is '三级分类编码';
comment on column EAM2.QY_LPB.SJFLMC
  is '三级分类名称';
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
  is '诉讼ID,UUID';
comment on column EAM2.QY_SS_BASEINFO.SFID
  is '省份ID,来自CODE表';
comment on column EAM2.QY_SS_BASEINFO.SFMC
  is '省份';
comment on column EAM2.QY_SS_BASEINFO.SAZCLBID
  is '涉案资产类别ID,来自CODE表 实体：2';
comment on column EAM2.QY_SS_BASEINFO.SAZCLBBM
  is 'CODE表 实体';
comment on column EAM2.QY_SS_BASEINFO.SAZCLBMC
  is '涉案资产类别名称,来自CODE表 实体类';
comment on column EAM2.QY_SS_BASEINFO.SAZCID
  is '涉案资产ID';
comment on column EAM2.QY_SS_BASEINFO.SAZCMC
  is '涉案资产名称';
comment on column EAM2.QY_SS_BASEINFO.SSLXID
  is '被诉：1 起诉：0';
comment on column EAM2.QY_SS_BASEINFO.SSLXMC
  is '被诉 起诉';
comment on column EAM2.QY_SS_BASEINFO.YG
  is '原告';
comment on column EAM2.QY_SS_BASEINFO.BG
  is '被告';
comment on column EAM2.QY_SS_BASEINFO.DSR
  is '第三人';
comment on column EAM2.QY_SS_BASEINFO.AY
  is '案由';
comment on column EAM2.QY_SS_BASEINFO.BDE
  is '标的额';
comment on column EAM2.QY_SS_BASEINFO.AQJS
  is '基本案情介绍';
comment on column EAM2.QY_SS_BASEINFO.SSZTID
  is '直接增加:3';
comment on column EAM2.QY_SS_BASEINFO.SSZTMC
  is '诉讼阶段 1：一审 2：二审 3：执行 4：再审';
comment on column EAM2.QY_SS_BASEINFO.BZ
  is '备注';
comment on column EAM2.QY_SS_BASEINFO.DLR
  is '代理律师姓名';

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
  is '项目ID';
comment on column EAM2.QY_STOCK_SDZMZ_XX.SHIDIAN
  is '时点';
comment on column EAM2.QY_STOCK_SDZMZ_XX.ZMZ
  is '账面值';
comment on column EAM2.QY_STOCK_SDZMZ_XX.JZZB
  is '减值准备';
comment on column EAM2.QY_STOCK_SDZMZ_XX.BEIZHU
  is '备注';
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
  is '实体附属表ID,UUID';
comment on column EAM2.QY_ST_FSXX.LEIXING
  is '实体人员、股权、大事记、财务报表、实体内资产、文件及公章存放情况';
comment on column EAM2.QY_ST_FSXX.STID
  is '实体基本信息ID';
comment on column EAM2.QY_ST_FSXX.ACFDD
  is '存放地点';
comment on column EAM2.QY_ST_FSXX.ABGJG
  is '保管机构';
comment on column EAM2.QY_ST_FSXX.EGDMC
  is '股东名称';
comment on column EAM2.QY_ST_FSXX.FXINGMING
  is '姓名';
comment on column EAM2.QY_ST_FSXX.FC_RYLX
  is '人员类型数据字典表';
comment on column EAM2.QY_ST_FSXX.FYDDH
  is '移动电话';
comment on column EAM2.QY_ST_FSXX.FGDDH
  is '固定电话';
comment on column EAM2.QY_ST_FSXX.JTDQDFS
  is '土地取得方式';
comment on column EAM2.QY_ST_FSXX.JSJZYR
  is '实际占有人';
comment on column EAM2.QY_ST_FSXX.JTDSYQZ
  is '土地使用权证1：有2：无3：下落不明';
comment on column EAM2.QY_ST_FSXX.JXLBMYY
  is '《土地使用权证》没有及下落不明的原因';
comment on column EAM2.QY_ST_FSXX.JTDSFDY
  is '土地是否抵押0：否1：是
';
comment on column EAM2.QY_ST_FSXX.JTDDYQKJS
  is '土地抵押情况介绍';
comment on column EAM2.QY_ST_FSXX.JTDSYQR
  is '土地使用权人';
comment on column EAM2.QY_ST_FSXX.JTDMS
  is '土地描述';
comment on column EAM2.QY_ST_FSXX.KFWSYQR
  is '房屋所有权人';
comment on column EAM2.QY_ST_FSXX.KFWSJZYR
  is '房屋实际占有人';
comment on column EAM2.QY_ST_FSXX.KSFDY
  is '房屋是否抵押';
comment on column EAM2.QY_ST_FSXX.KDYQK
  is '房屋抵押情况介绍';
comment on column EAM2.QY_ST_FSXX.KFWMS
  is '房屋描述';
comment on column EAM2.QY_ST_FSXX.LJTGJCFWZ
  is '交通工具存放何处';
comment on column EAM2.QY_ST_FSXX.LQS
  is '交通工具权属';
comment on column EAM2.QY_ST_FSXX.LSJZYR
  is '交通工具实际占有人';
comment on column EAM2.QY_ST_FSXX.LSFDY
  is '交通工具是否抵押';
comment on column EAM2.QY_ST_FSXX.LDYJS
  is '交通工具抵押情况介绍';
comment on column EAM2.QY_ST_FSXX.LJTGJMS
  is '交通运输工具描述';
comment on column EAM2.QY_ST_FSXX.MSBCFWZ
  is '机器设备存放位置';
comment on column EAM2.QY_ST_FSXX.MSBQS
  is '机器设备权属';
comment on column EAM2.QY_ST_FSXX.MSBSJZYR
  is '机器设备实际占有人';
comment on column EAM2.QY_ST_FSXX.MSBSFDY
  is '机器设备是否抵押';
comment on column EAM2.QY_ST_FSXX.MSBDYJS
  is '机器设备抵押情况介绍';
comment on column EAM2.QY_ST_FSXX.MSBMS
  is '机器设备描述';
comment on column EAM2.QY_ST_FSXX.NTZE
  is '投资额(元)';
comment on column EAM2.QY_ST_FSXX.NTZFS
  is '投资方式';
comment on column EAM2.QY_ST_FSXX.NTZQKMS
  is '投资情况描述';
comment on column EAM2.QY_ST_FSXX.PQTZCSFDY
  is '其他资产是否抵押';
comment on column EAM2.QY_ST_FSXX.PZCMS
  is '其他资产描述';
comment on column EAM2.QY_ST_FSXX.QZCZB
  is '注册资本';
comment on column EAM2.QY_ST_FSXX.QC_CZFS
  is '出资方式';
comment on column EAM2.QY_ST_FSXX.QC_CZQK
  is '出资情况';
comment on column EAM2.QY_ST_FSXX.QCZBSSE
  is '出资不实的数额';
comment on column EAM2.QY_ST_FSXX.QC_CTCZ
  is '抽逃出资';
comment on column EAM2.QY_ST_FSXX.QCTSE
  is '抽逃数额';
comment on column EAM2.QY_ST_FSXX.QDLFRZG
  is '独立法人资格';
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
  is '实体ID,UUID';
comment on column EAM2.QY_ST_JBXX.STLX
  is '实体类型';
comment on column EAM2.QY_ST_JBXX.STZWMC
  is '实体中文名称';
comment on column EAM2.QY_ST_JBXX.JYFL
  is '经营分类';
comment on column EAM2.QY_ST_JBXX.C_SHENGFEN
  is '省份';
comment on column EAM2.QY_ST_JBXX.ZMTZ
  is '账面投资(元)/注册资本';
comment on column EAM2.QY_ST_JBXX.CLSJ
  is '成立时间';
comment on column EAM2.QY_ST_JBXX.BEIZHU
  is '备注';

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
  is '实体ID';
comment on column EAM2.QY_ST_SKJN_XX.SFASJN
  is '是否按时交纳0：否1：是';
comment on column EAM2.QY_ST_SKJN_XX.TQSKSE
  is '拖欠税款数额';
comment on column EAM2.QY_ST_SKJN_XX.TQSJ
  is '拖欠时间';
comment on column EAM2.QY_ST_SKJN_XX.SWJGSFKJM
  is '税务机关是否可以减免0：否1：是';
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
  is '委托贷款信息';
comment on column EAM2.QY_WD_LN_MORE_INFOR.LN_ACCT_NO
  is '贷款系统账户';
comment on column EAM2.QY_WD_LN_MORE_INFOR.C_CUST_ID
  is '贷款客户编号';
comment on column EAM2.QY_WD_LN_MORE_INFOR.SA_SYS_ACCT_NO
  is '基金系统账户';
comment on column EAM2.QY_WD_LN_MORE_INFOR.D_ACCT_NO
  is '委托方客户编号';
comment on column EAM2.QY_WD_LN_MORE_INFOR.SAV_CUST_ACCT_NO
  is '委托人基金户账号';
comment on column EAM2.QY_WD_LN_MORE_INFOR.C_ACCT_NO
  is '借款人账号（数据平台）';
comment on column EAM2.QY_WD_LN_MORE_INFOR.XULIE
  is '序列';

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
  is '债券投资清单——2009-6';
comment on column EAM2.QY_ZQTZ_QD.ID
  is '序号';
comment on column EAM2.QY_ZQTZ_QD.FH
  is '分行';
comment on column EAM2.QY_ZQTZ_QD.XMMC
  is '项目名称';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_2009
  is '2009年6月30日账面值';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_YZ_2006
  is '2006年12月31日账面值_原值';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_JZZB_2006
  is '2006年12月31日账面值_减值准备';
comment on column EAM2.QY_ZQTZ_QD.QRJG
  is '项目名称确认结果';
comment on column EAM2.QY_ZQTZ_QD.BZ
  is '备注';
comment on column EAM2.QY_ZQTZ_QD.XMMC_BH
  is '分行编号';
comment on column EAM2.QY_ZQTZ_QD.XM_ID
  is '项目ID';
comment on column EAM2.QY_ZQTZ_QD.ZMZ_JZZB_2009
  is '2009年6月30日账面值_减值准备';
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
  is '变动历史、日志';
comment on column EAM2.RECORDHISTORY.ID
  is '主键';
comment on column EAM2.RECORDHISTORY.NAME
  is '变动列名';
comment on column EAM2.RECORDHISTORY.BEFORE
  is '变动前值';
comment on column EAM2.RECORDHISTORY.AFTER
  is '变动后值';
comment on column EAM2.RECORDHISTORY.WF_CODE
  is '流程ID';
comment on column EAM2.RECORDHISTORY.PK_ID
  is '处理单ID';
comment on column EAM2.RECORDHISTORY.ZC_ID
  is '变动记录ID';
comment on column EAM2.RECORDHISTORY.ZC_TYPE
  is '备用字段，用于存储不同对象（卡片，资产，合同）的特殊内容';
comment on column EAM2.RECORDHISTORY.CHANGETYPE
  is '变动的类型（卡片、资产、合同）';
comment on column EAM2.RECORDHISTORY.CHANGESTATE
  is '变动信息的状态（01：临时表的变动信息，02：信息表的变动信息）';
comment on column EAM2.RECORDHISTORY.CHANGEINFOID
  is '变动的信息表对应的id';
comment on column EAM2.RECORDHISTORY.CHANGEDATE
  is '变动日期';
comment on column EAM2.RECORDHISTORY.CHANGEPERSON
  is '变动人姓名';
comment on column EAM2.RECORDHISTORY.BIAOMING
  is '变动表名';
comment on column EAM2.RECORDHISTORY.CHANGEPERSONID
  is '变动人编号';
comment on column EAM2.RECORDHISTORY.ZHUANGTAI
  is '状态 0：未审批 1：审批中 2：审批同意 3：审批不同意';
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
  is '诉讼基本信息';
comment on column EAM2.SS_BASEINFO.ID
  is '诉讼ID,UUID';
comment on column EAM2.SS_BASEINFO.AJBH
  is '案件编号';
comment on column EAM2.SS_BASEINFO.SFID
  is '省份ID,来自CODE表';
comment on column EAM2.SS_BASEINFO.SFBM
  is '省份编码,来自CODE表';
comment on column EAM2.SS_BASEINFO.SFMC
  is '省份名称,来自CODE表';
comment on column EAM2.SS_BASEINFO.SAZCLBID
  is '涉案资产类别ID,来自CODE表';
comment on column EAM2.SS_BASEINFO.SAZCLBBM
  is '涉案资产类别编码,来自CODE表';
comment on column EAM2.SS_BASEINFO.SAZCLBMC
  is '涉案资产类别名称,来自CODE表';
comment on column EAM2.SS_BASEINFO.SAZCID
  is '涉案资产ID';
comment on column EAM2.SS_BASEINFO.SAZCMC
  is '涉案资产名称';
comment on column EAM2.SS_BASEINFO.LARQ
  is '立案日期';
comment on column EAM2.SS_BASEINFO.QSSJ
  is '起诉时间';
comment on column EAM2.SS_BASEINFO.SSLXID
  is '诉讼类型ID来自CODE表';
comment on column EAM2.SS_BASEINFO.SSLXBM
  is '诉讼类型编码,来自CODE表';
comment on column EAM2.SS_BASEINFO.SSLXMC
  is '诉讼类型名称,来自CODE表';
comment on column EAM2.SS_BASEINFO.YG
  is '原告';
comment on column EAM2.SS_BASEINFO.BG
  is '被告';
comment on column EAM2.SS_BASEINFO.DSR
  is '第三人';
comment on column EAM2.SS_BASEINFO.AY
  is '案由';
comment on column EAM2.SS_BASEINFO.BDE
  is '标的额';
comment on column EAM2.SS_BASEINFO.ZXHK
  is '执行回款';
comment on column EAM2.SS_BASEINFO.SSQQ
  is '诉讼请求';
comment on column EAM2.SS_BASEINFO.BHGLH
  is '建行(本行关联行)';
comment on column EAM2.SS_BASEINFO.JAZTID
  is '结案状态ID,来自CODE表';
comment on column EAM2.SS_BASEINFO.JAZTBM
  is '结案状态编码,来自CODE表';
comment on column EAM2.SS_BASEINFO.JAZTMC
  is '结案状态名称,来自CODE表';
comment on column EAM2.SS_BASEINFO.JTSFWDSR
  is '中国建投是否为当事人1是0否';
comment on column EAM2.SS_BASEINFO.JBR
  is '建投(部门及经办人)';
comment on column EAM2.SS_BASEINFO.AQJS
  is '案情简述';
comment on column EAM2.SS_BASEINFO.LRRID
  is '录入人ID,平台提供ID';
comment on column EAM2.SS_BASEINFO.LRR
  is '录入人';
comment on column EAM2.SS_BASEINFO.LRSJ
  is '录入时间';
comment on column EAM2.SS_BASEINFO.SSZTID
  is '诉讼状态ID,来自CODE表';
comment on column EAM2.SS_BASEINFO.SSZTBM
  is '诉讼状态编码,来自CODE表';
comment on column EAM2.SS_BASEINFO.SSZTMC
  is '诉讼状态名称,来自CODE表';
comment on column EAM2.SS_BASEINFO.BZ
  is '备注';
comment on column EAM2.SS_BASEINFO.DLR
  is '代理人';
comment on column EAM2.SS_BASEINFO.AJLBID
  is '案件类别id';
comment on column EAM2.SS_BASEINFO.AJLBBM
  is '案件类别编码';
comment on column EAM2.SS_BASEINFO.AJLBMC
  is '案件类别名称';
comment on column EAM2.SS_BASEINFO.SARQ
  is '收案日期';
comment on column EAM2.SS_BASEINFO.DJSBM
  is '地级市编码';
comment on column EAM2.SS_BASEINFO.DJSMC
  is '地级市名称';
comment on column EAM2.SS_BASEINFO.ZCZSB_ID
  is '资产正式表ID';
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
  is '诉讼过程信息';
comment on column EAM2.SS_PROC.ID
  is '诉讼过程ID';
comment on column EAM2.SS_PROC.SSJBXX_ID
  is '诉讼ID,参照诉讼基本信息表';
comment on column EAM2.SS_PROC.SSJDID
  is '诉讼阶段ID,来自CODE表';
comment on column EAM2.SS_PROC.SSJDBM
  is '诉讼阶段编码,来自CODE表';
comment on column EAM2.SS_PROC.SSJDMC
  is '诉讼阶段名称,来自CODE表';
comment on column EAM2.SS_PROC.SSJDMS
  is '诉讼阶段描述';
comment on column EAM2.SS_PROC.SSSJ
  is '诉讼时间';
comment on column EAM2.SS_PROC.ZCT
  is '管辖/法院/仲裁庭';
comment on column EAM2.SS_PROC.CPSXSJ
  is '裁判生效时间';
comment on column EAM2.SS_PROC.SXPJJG
  is '生效判决结果';
comment on column EAM2.SS_PROC.DLR
  is '代理人';
comment on column EAM2.SS_PROC.ACYS
  is '案程要述';
comment on column EAM2.SS_PROC.LRRID
  is '录入人ID';
comment on column EAM2.SS_PROC.LRR
  is '录入人';
comment on column EAM2.SS_PROC.LRRQ
  is '录入日期';
comment on column EAM2.SS_PROC.BZ
  is '备注';
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
  is '建银投资所拥有的债券的账面价值,目前设计按年来存储。';
comment on column EAM2.STOCK_BOOKVALUE.ID
  is '债券面值ID,UUID';
comment on column EAM2.STOCK_BOOKVALUE.STOCKID
  is '债券ID';
comment on column EAM2.STOCK_BOOKVALUE.ZQMC
  is '债券名称,来自STOCK_INFO表';
comment on column EAM2.STOCK_BOOKVALUE.NF
  is '年份,格式为YYYY';
comment on column EAM2.STOCK_BOOKVALUE.ZQMZ
  is '债券面值_年初';
comment on column EAM2.STOCK_BOOKVALUE.TZJCZB
  is '投资减持准备_年初';
comment on column EAM2.STOCK_BOOKVALUE.ZQTZJE
  is '债券投资净额_年初';
comment on column EAM2.STOCK_BOOKVALUE.YSLX
  is '应收利息_年初';
comment on column EAM2.STOCK_BOOKVALUE.YSLXHZZB
  is '应收利息坏账准备_年初';
comment on column EAM2.STOCK_BOOKVALUE.YSLXJE
  is '应收利息净额_年初';
comment on column EAM2.STOCK_BOOKVALUE.ZQMZ2
  is '债券面值_年末';
comment on column EAM2.STOCK_BOOKVALUE.TZJCZB2
  is '投资减持准备_年末';
comment on column EAM2.STOCK_BOOKVALUE.ZQTZJE2
  is '债券投资净额_年末';
comment on column EAM2.STOCK_BOOKVALUE.YSLX2
  is '应收利息_年末';
comment on column EAM2.STOCK_BOOKVALUE.YSLXHZZB2
  is '应收利息坏账准备_年末';
comment on column EAM2.STOCK_BOOKVALUE.YSLXJE2
  is '应收利息净额_年末';
comment on column EAM2.STOCK_BOOKVALUE.BZ
  is '备注';
comment on column EAM2.STOCK_BOOKVALUE.TZSYNC
  is '债券投资损益(年初)';
comment on column EAM2.STOCK_BOOKVALUE.TZSYNM
  is '债券投资损益(年末)';
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
  is '债券ID,UUID';
comment on column EAM2.STOCK_INFO.JHFHID
  is '从INDIVIDTREE中选取,类型为department';
comment on column EAM2.STOCK_INFO.JHFHBM
  is '建行分行编码,INDIVIDTREE';
comment on column EAM2.STOCK_INFO.JHFHMC
  is '建行分行名称,INDIVIDTREE';
comment on column EAM2.STOCK_INFO.ZQZLID
  is '债券种类ID,来自CODE表';
comment on column EAM2.STOCK_INFO.ZQZLBM
  is '债券种类编码,来自CODE表';
comment on column EAM2.STOCK_INFO.ZQZLMC
  is '债券种类名称,来自CODE表';
comment on column EAM2.STOCK_INFO.ZQMC
  is '债券名称';
comment on column EAM2.STOCK_INFO.DQR
  is '到期日';
comment on column EAM2.STOCK_INFO.ZQMZHSKM
  is '债券面值核算科目';
comment on column EAM2.STOCK_INFO.JE1
  is '金额1';
comment on column EAM2.STOCK_INFO.YSLXHSKM
  is '应收利息核算科目';
comment on column EAM2.STOCK_INFO.JE2
  is '金额2';
comment on column EAM2.STOCK_INFO.BZ
  is '备注';
comment on column EAM2.STOCK_INFO.XM_ID
  is '项目ID';
comment on column EAM2.STOCK_INFO.XMMC
  is '项目名称';
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
  is '债权投资清单ID,UUID';
comment on column EAM2.STOCK_LIST.FHBM
  is '建行分行编号，取自INDIVIDUALTREE';
comment on column EAM2.STOCK_LIST.FHMC
  is '分行名称,取自INDIVIDUALTREE';
comment on column EAM2.STOCK_LIST.XMMC
  is '项目名称';
comment on column EAM2.STOCK_LIST.Y2009M6D30ZMZ
  is '2009年6月30日账面值';
comment on column EAM2.STOCK_LIST.Y2006M12D31ZMZYZ
  is '2006年12月31日账面值原值';
comment on column EAM2.STOCK_LIST.Y2006M12D31ZMZJZZB
  is '2006年12月31日账面值减值准备';
comment on column EAM2.STOCK_LIST.XMMCQR
  is '项目名称确认';
comment on column EAM2.STOCK_LIST.BZ
  is '备注';
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
  is '表单ID';
comment on column EAM2.STOCK_SBODY.STOCK_ID
  is '债券ID,UUID';
comment on column EAM2.STOCK_SBODY.JHFHMC
  is '建行分行名称,INDIVIDTREE';
comment on column EAM2.STOCK_SBODY.ZQZLMC
  is '债券种类名称,来自CODE表';
comment on column EAM2.STOCK_SBODY.ZQMC
  is '债券名称';
comment on column EAM2.STOCK_SBODY.DQR
  is '到期日';
comment on column EAM2.STOCK_SBODY.ZQZXMZNC
  is '债券最新面值年初';
comment on column EAM2.STOCK_SBODY.ZQZXMZNM
  is '债券最新面值年末';
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
  is '项目ID';
comment on column EAM2.STOCK_SDZMZ_XX.SHIDIAN
  is '时点';
comment on column EAM2.STOCK_SDZMZ_XX.ZMZ
  is '账面值';
comment on column EAM2.STOCK_SDZMZ_XX.JZZB
  is '减值准备';
comment on column EAM2.STOCK_SDZMZ_XX.BEIZHU
  is '备注';
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
  is '债券单据表头';
comment on column EAM2.STOCK_SHEAD.SHEAD_ID
  is '系统内部编号 ';
comment on column EAM2.STOCK_SHEAD.SHEET_TYPE
  is '表单类型，详见数据字典定义设计';
comment on column EAM2.STOCK_SHEAD.TITLE
  is '表单标题，手工录入';
comment on column EAM2.STOCK_SHEAD.SHEET_ID
  is '表单编号，根据编号规则自动生成';
comment on column EAM2.STOCK_SHEAD.NGRQ
  is '拟稿日期，格式为YYYYMMDD';
comment on column EAM2.STOCK_SHEAD.NGRBH
  is '拟稿人编号';
comment on column EAM2.STOCK_SHEAD.NGRMC
  is '拟稿人名称';
comment on column EAM2.STOCK_SHEAD.NGBMBH
  is '拟稿部门编号';
comment on column EAM2.STOCK_SHEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.STOCK_SHEAD.LDXH
  is '联系电话，人工输入';
comment on column EAM2.STOCK_SHEAD.JHCD
  is '急缓程度 一般；急；特急';
comment on column EAM2.STOCK_SHEAD.BDZT
  is '表单状态0 拟稿1进行中2审批完成';
comment on column EAM2.STOCK_SHEAD.BZ
  is '备注,债券的相关事项';
comment on column EAM2.STOCK_SHEAD.HQBM
  is '会签部门';
comment on column EAM2.STOCK_SHEAD.CHENGSONG
  is '呈送';
comment on column EAM2.STOCK_SHEAD.LC_ID
  is '流程ID';
comment on column EAM2.STOCK_SHEAD.LCMC
  is '流程名称';
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
  is '工作日志ID';
comment on column EAM2.STOCK_WORKLOG.STOCKID
  is '债券ID';
comment on column EAM2.STOCK_WORKLOG.CBRID
  is '催办人ID';
comment on column EAM2.STOCK_WORKLOG.CBRMC
  is '催办人名称';
comment on column EAM2.STOCK_WORKLOG.CBRQ
  is '催办日期';
comment on column EAM2.STOCK_WORKLOG.CBFSBM
  is '催办方式编码';
comment on column EAM2.STOCK_WORKLOG.CBFSMC
  is '催办方式名称';
comment on column EAM2.STOCK_WORKLOG.ZWFZR
  is '债务负责人';
comment on column EAM2.STOCK_WORKLOG.ZWFZRDH
  is '债务负责人电话';
comment on column EAM2.STOCK_WORKLOG.BLJG
  is '办理结果';
comment on column EAM2.STOCK_WORKLOG.BZ
  is '备注';
comment on column EAM2.STOCK_WORKLOG.SFBC
  is '是否保存';
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
  is '实体附属表ID,UUID';
comment on column EAM2.ST_FSXX.LEIXING
  is '实体人员、股权、大事记、财务报表、实体内资产、文件及公章存放情况';
comment on column EAM2.ST_FSXX.STID
  is '实体基本信息ID';
comment on column EAM2.ST_FSXX.AWJGZBH
  is '文件公章编号';
comment on column EAM2.ST_FSXX.ACFDD
  is '存放地点';
comment on column EAM2.ST_FSXX.ABGJG
  is '保管机构';
comment on column EAM2.ST_FSXX.AZYLXR
  is '主要联系人';
comment on column EAM2.ST_FSXX.ALXFS
  is '联系方式';
comment on column EAM2.ST_FSXX.ACFNR
  is '存放内容';
comment on column EAM2.ST_FSXX.DBBBH
  is '报表编号';
comment on column EAM2.ST_FSXX.DC_BBFL
  is '报表分类数据字典表';
comment on column EAM2.ST_FSXX.DC_BBLX
  is '报表类型';
comment on column EAM2.ST_FSXX.DHYLX
  is '行业类型';
comment on column EAM2.ST_FSXX.DBBRQ
  is '报表日期';
comment on column EAM2.ST_FSXX.DBBSCRQ
  is '报表上传日期';
comment on column EAM2.ST_FSXX.EGDBH
  is '股东编号';
comment on column EAM2.ST_FSXX.EGDXZ
  is '股东性质';
comment on column EAM2.ST_FSXX.EGDMC
  is '股东名称';
comment on column EAM2.ST_FSXX.ECGSL
  is '持股数量';
comment on column EAM2.ST_FSXX.ECGBL
  is '持股比例';
comment on column EAM2.ST_FSXX.EBGRQ
  is '报告日期';
comment on column EAM2.ST_FSXX.EBBSFKG
  is '本部是否控股0：否1：是2：未知';
comment on column EAM2.ST_FSXX.FSFFR
  is '是否法人代表1是0否';
comment on column EAM2.ST_FSXX.FRYBH
  is '人员编号';
comment on column EAM2.ST_FSXX.FBYSJ
  is '毕业时间';
comment on column EAM2.ST_FSXX.FGYSM
  is '雇佣说明';
comment on column EAM2.ST_FSXX.FZYZGQK
  is '执业资格情况';
comment on column EAM2.ST_FSXX.FXINGMING
  is '姓名';
comment on column EAM2.ST_FSXX.FXINGBIE
  is '性别1：男2：女';
comment on column EAM2.ST_FSXX.FNIANLING
  is '年龄';
comment on column EAM2.ST_FSXX.FSFZH
  is '身份证号';
comment on column EAM2.ST_FSXX.FC_HYZK
  is '婚姻状况1：已婚2：未婚';
comment on column EAM2.ST_FSXX.FMINZU
  is '民族';
comment on column EAM2.ST_FSXX.FJIGUAN
  is '籍贯';
comment on column EAM2.ST_FSXX.FCSNY
  is '出生年月';
comment on column EAM2.ST_FSXX.FC_ZHIWU
  is '职务';
comment on column EAM2.ST_FSXX.FBYXX
  is '毕业学校';
comment on column EAM2.ST_FSXX.FZHUANYE
  is '专业';
comment on column EAM2.ST_FSXX.FC_XUELI
  is '学历';
comment on column EAM2.ST_FSXX.FSHOUJI
  is '手机';
comment on column EAM2.ST_FSXX.FJTZZ
  is '家庭住址';
comment on column EAM2.ST_FSXX.FYZBM
  is '邮政编码';
comment on column EAM2.ST_FSXX.FDIANHUA
  is '单位电话';
comment on column EAM2.ST_FSXX.FDZYX
  is '电子邮箱';
comment on column EAM2.ST_FSXX.FRZSJ
  is '任职时间';
comment on column EAM2.ST_FSXX.FLZSJ
  is '离职时间';
comment on column EAM2.ST_FSXX.FSHOURU
  is '收入';
comment on column EAM2.ST_FSXX.FGZFFDW
  is '工资发放单位';
comment on column EAM2.ST_FSXX.FC_RYLX
  is '人员类型数据字典表';
comment on column EAM2.ST_FSXX.FDACFDW
  is '档案存放单位';
comment on column EAM2.ST_FSXX.FYDDH
  is '移动电话';
comment on column EAM2.ST_FSXX.FGDDH
  is '固定电话';
comment on column EAM2.ST_FSXX.FC_RYLB
  is '人员类别实体数据字典表';
comment on column EAM2.ST_FSXX.FAZFS
  is '安置方式';
comment on column EAM2.ST_FSXX.FAZFY
  is '安置费用';
comment on column EAM2.ST_FSXX.FAZZT
  is '安置状态 0：未安置1：安置审批中2：安置执行中 3:已安置
';
comment on column EAM2.ST_FSXX.FSFYAZXY
  is '是否有安置协议0：否1：是';
comment on column EAM2.ST_FSXX.FSFYST
  is '是否有收条0：否1：是';
comment on column EAM2.ST_FSXX.GDSJBH
  is '大事记编号';
comment on column EAM2.ST_FSXX.GDSFSRQ
  is '大事发生日期';
comment on column EAM2.ST_FSXX.GC_SJLX
  is '事件类型数据字典表';
comment on column EAM2.ST_FSXX.GDSNR
  is '大事内容';
comment on column EAM2.ST_FSXX.GDSJBZ
  is '大事件备注';
comment on column EAM2.ST_FSXX.HXJBH
  is '现金编号';
comment on column EAM2.ST_FSXX.HZHANGHU
  is '账户';
comment on column EAM2.ST_FSXX.HZHMC
  is '账户名称';
comment on column EAM2.ST_FSXX.HJINE
  is '金额';
comment on column EAM2.ST_FSXX.JTDBH
  is '土地编号';
comment on column EAM2.ST_FSXX.JTDMC
  is '土地名称';
comment on column EAM2.ST_FSXX.JTDQDFS
  is '土地取得方式';
comment on column EAM2.ST_FSXX.JSJZYR
  is '实际占有人';
comment on column EAM2.ST_FSXX.JTDSYQZ
  is '土地使用权证1：有2：无3：下落不明';
comment on column EAM2.ST_FSXX.JXLBMYY
  is '《土地使用权证》没有及下落不明的原因';
comment on column EAM2.ST_FSXX.JTDSFDY
  is '土地是否抵押0：否1：是
';
comment on column EAM2.ST_FSXX.JTDDYQKJS
  is '土地抵押情况介绍';
comment on column EAM2.ST_FSXX.JTDMJ
  is '土地面积';
comment on column EAM2.ST_FSXX.JTDSYQR
  is '土地使用权人';
comment on column EAM2.ST_FSXX.JTDPGZ
  is '土地评估值（元）';
comment on column EAM2.ST_FSXX.JBXE
  is '变现额（元）';
comment on column EAM2.ST_FSXX.JTDMS
  is '土地描述';
comment on column EAM2.ST_FSXX.JTDZT
  is '土地状态0：未处置1：处置中2：已处置';
comment on column EAM2.ST_FSXX.JC_CZFS
  is '土地处置方式数据字典表';
comment on column EAM2.ST_FSXX.KFWBH
  is '房屋编号';
comment on column EAM2.ST_FSXX.KFWMC
  is '房屋名称';
comment on column EAM2.ST_FSXX.KFWDZ
  is '房屋地址';
comment on column EAM2.ST_FSXX.KFWSYQR
  is '房屋所有权人';
comment on column EAM2.ST_FSXX.KFWQDFS
  is '房屋取得方式';
comment on column EAM2.ST_FSXX.KFWSJZYR
  is '房屋实际占有人';
comment on column EAM2.ST_FSXX.KYWFWSYQZ
  is '有无房屋使用权证';
comment on column EAM2.ST_FSXX.KXLBMYY
  is '房屋使用权证》没有及下落不明的原因';
comment on column EAM2.ST_FSXX.KSFDY
  is '房屋是否抵押';
comment on column EAM2.ST_FSXX.KDYQK
  is '房屋抵押情况介绍';
comment on column EAM2.ST_FSXX.KFWMJ
  is '房屋面积（平方米）';
comment on column EAM2.ST_FSXX.KSYQR
  is '房屋使用权人';
comment on column EAM2.ST_FSXX.KFWPGZ
  is '房屋评估值（元）';
comment on column EAM2.ST_FSXX.KFWBXE
  is '房屋变现额（元）';
comment on column EAM2.ST_FSXX.KFWMS
  is '房屋描述';
comment on column EAM2.ST_FSXX.KFWZT
  is '房屋状态
资产状态';
comment on column EAM2.ST_FSXX.KC_CZFS
  is '房屋处置方式
房屋处置方式';
comment on column EAM2.ST_FSXX.LJTGJBH
  is '交通工具编号';
comment on column EAM2.ST_FSXX.LCPH
  is '交通工具名称（车牌号）';
comment on column EAM2.ST_FSXX.LJTGJCFWZ
  is '交通工具存放何处';
comment on column EAM2.ST_FSXX.LQS
  is '交通工具权属';
comment on column EAM2.ST_FSXX.LSJZYR
  is '交通工具实际占有人';
comment on column EAM2.ST_FSXX.LSFDY
  is '交通工具是否抵押';
comment on column EAM2.ST_FSXX.LDYJS
  is '交通工具抵押情况介绍';
comment on column EAM2.ST_FSXX.LPGZ
  is '交通工具评估值（元）';
comment on column EAM2.ST_FSXX.LBXE
  is '交通工具变现额（元）';
comment on column EAM2.ST_FSXX.LJTGJMS
  is '交通运输工具描述';
comment on column EAM2.ST_FSXX.LJTGJZT
  is '交通工具资产状态';
comment on column EAM2.ST_FSXX.LC_CZFS
  is '交通工具处置方式';
comment on column EAM2.ST_FSXX.MSBBH
  is '机器设备编号';
comment on column EAM2.ST_FSXX.MSBMC
  is '机器设备名称';
comment on column EAM2.ST_FSXX.MSBCFWZ
  is '机器设备存放位置';
comment on column EAM2.ST_FSXX.MSBQS
  is '机器设备权属';
comment on column EAM2.ST_FSXX.MSBSJZYR
  is '机器设备实际占有人';
comment on column EAM2.ST_FSXX.MSBSFDY
  is '机器设备是否抵押';
comment on column EAM2.ST_FSXX.MSBDYJS
  is '机器设备抵押情况介绍';
comment on column EAM2.ST_FSXX.MSBPGZ
  is '机器设备评估值（元）';
comment on column EAM2.ST_FSXX.MSBBXE
  is '机器设备变现额（元）';
comment on column EAM2.ST_FSXX.MSBMS
  is '机器设备描述';
comment on column EAM2.ST_FSXX.MSBZT
  is '机器设备状态';
comment on column EAM2.ST_FSXX.MC_CZFS
  is '机器设备处置方式';
comment on column EAM2.ST_FSXX.NDWTZBH
  is '对外投资编号';
comment on column EAM2.ST_FSXX.NBTQYMC
  is '被投资企业名称';
comment on column EAM2.ST_FSXX.NTZE
  is '投资额(元)';
comment on column EAM2.ST_FSXX.NTZFS
  is '投资方式';
comment on column EAM2.ST_FSXX.NTZQKMS
  is '投资情况描述';
comment on column EAM2.ST_FSXX.PQTZCBH
  is '其他资产编号';
comment on column EAM2.ST_FSXX.PQTZCMC
  is '其他资产名称';
comment on column EAM2.ST_FSXX.PQTZCCFWZ
  is '其他资产存放位置';
comment on column EAM2.ST_FSXX.PQTZCQS
  is '其他资产权属';
comment on column EAM2.ST_FSXX.PQTZCSJZYR
  is '其他资产实际占有人';
comment on column EAM2.ST_FSXX.PQTZCSFDY
  is '其他资产是否抵押';
comment on column EAM2.ST_FSXX.PDYJS
  is '其他资产抵押情况介绍';
comment on column EAM2.ST_FSXX.PPGZ
  is '其他资产评估值（元）';
comment on column EAM2.ST_FSXX.PBXE
  is '其他资产变现额（元）';
comment on column EAM2.ST_FSXX.PZCMS
  is '其他资产描述';
comment on column EAM2.ST_FSXX.PZCZT
  is '其他资产状态';
comment on column EAM2.ST_FSXX.PC_CZFS
  is '其他资产处置方式';
comment on column EAM2.ST_FSXX.QGDMC
  is '非咨询股东名称';
comment on column EAM2.ST_FSXX.QKGBL
  is '控股比例';
comment on column EAM2.ST_FSXX.QZCZB
  is '注册资本';
comment on column EAM2.ST_FSXX.QC_CZFS
  is '出资方式';
comment on column EAM2.ST_FSXX.QC_CZQK
  is '出资情况';
comment on column EAM2.ST_FSXX.QCZBSSE
  is '出资不实的数额';
comment on column EAM2.ST_FSXX.QC_CTCZ
  is '抽逃出资';
comment on column EAM2.ST_FSXX.QCTSE
  is '抽逃数额';
comment on column EAM2.ST_FSXX.QDLFRZG
  is '独立法人资格';
comment on column EAM2.ST_FSXX.STNZCFL
  is '实体内资产分类编码，见数据字典';
comment on column EAM2.ST_FSXX.SFBC
  is '是否保存';
comment on column EAM2.ST_FSXX.CWDID
  is '委托贷款ID';
comment on column EAM2.ST_FSXX.CDKZH
  is '贷款账号';
comment on column EAM2.ST_FSXX.RYLRSJ
  is '人员信息录入时间';
comment on column EAM2.ST_FSXX.RYAZSJ
  is '人员安置时间';
comment on column EAM2.ST_FSXX.BEIZHU
  is '备注';

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
  is '处理单ID';
comment on column EAM2.ST_GLBT.ST_ID
  is '实体ID';
comment on column EAM2.ST_GLBT.GZGW
  is '工作岗位';
comment on column EAM2.ST_GLBT.C_XUELI
  is '学历';
comment on column EAM2.ST_GLBT.ZZYQ
  is '资质要求';
comment on column EAM2.ST_GLBT.C_XINGBIE
  is '性别';
comment on column EAM2.ST_GLBT.GONGLING
  is '工龄';
comment on column EAM2.ST_GLBT.RENSHU
  is '人数';
comment on column EAM2.ST_GLBT.QTXX
  is '其他信息';
comment on column EAM2.ST_GLBT.C_SQSXLX
  is '申请事项类型';
comment on column EAM2.ST_GLBT.SQJE
  is '申请金额';
comment on column EAM2.ST_GLBT.SQSM
  is '申请说明';
comment on column EAM2.ST_GLBT.SDJE
  is '审定金额';
comment on column EAM2.ST_GLBT.SQXMMC
  is '申请项目名称';
comment on column EAM2.ST_GLBT.FRBH
  is '法人编号';
comment on column EAM2.ST_GLBT.SFFRDB
  is '是否法人代表1是0否';
comment on column EAM2.ST_GLBT.XINGMING
  is '法人代表姓名';
comment on column EAM2.ST_GLBT.NIANLING
  is '年龄';
comment on column EAM2.ST_GLBT.SFZH
  is '身份证号';
comment on column EAM2.ST_GLBT.C_HYZK
  is '婚姻状况1：已婚2：未婚';
comment on column EAM2.ST_GLBT.MINZU
  is '民族';
comment on column EAM2.ST_GLBT.JIGUAN
  is '籍贯';
comment on column EAM2.ST_GLBT.CSNY
  is '出生年月';
comment on column EAM2.ST_GLBT.C_ZHIWU
  is '职务';
comment on column EAM2.ST_GLBT.BYXX
  is '毕业学校';
comment on column EAM2.ST_GLBT.BYSJ
  is '毕业时间';
comment on column EAM2.ST_GLBT.ZHUANYE
  is '专业';
comment on column EAM2.ST_GLBT.SHOUJI
  is '手机';
comment on column EAM2.ST_GLBT.JTZZ
  is '家庭住址';
comment on column EAM2.ST_GLBT.YZBM
  is '邮政编码';
comment on column EAM2.ST_GLBT.DIANHUA
  is '单位电话';
comment on column EAM2.ST_GLBT.DZYX
  is '电子邮箱';
comment on column EAM2.ST_GLBT.XINZI
  is '薪资';
comment on column EAM2.ST_GLBT.GYQX
  is '雇佣期限';
comment on column EAM2.ST_GLBT.SHOURU
  is '收入';
comment on column EAM2.ST_GLBT.GZFFDW
  is '工资发放单位';
comment on column EAM2.ST_GLBT.RYLX
  is '人员类型';
comment on column EAM2.ST_GLBT.DACFDW
  is '档案存放单位';
comment on column EAM2.ST_GLBT.GYSM
  is '雇佣说明';
comment on column EAM2.ST_GLBT.TZFS
  is '投资方式';
comment on column EAM2.ST_GLBT.TZJE
  is '投资金额';
comment on column EAM2.ST_GLBT.CZFS
  is '撤资方式';
comment on column EAM2.ST_GLBT.CZJE
  is '撤资金额';
comment on column EAM2.ST_GLBT.FYZL
  is '费用种类';
comment on column EAM2.ST_GLBT.FYMC
  is '费用名称';
comment on column EAM2.ST_GLBT.BXFY
  is '报销费用';
comment on column EAM2.ST_GLBT.SJFY
  is '实际费用';
comment on column EAM2.ST_GLBT.SPZT
  is '审批状态0未提交1审批中2审批通过3审批不通过';
comment on column EAM2.ST_GLBT.FZYZGQK
  is '执业资格情况';
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
  is '实体

实体增资（减资）申请处理单

实体用工计划处理单

实体法人代表变更处理单

重大财务事项处理单

确权审批处理单

实体管理表头
';
comment on column EAM2.ST_HEAD.ID
  is '实体表头ID,UUID';
comment on column EAM2.ST_HEAD.LC_ID
  is '流程ID';
comment on column EAM2.ST_HEAD.BIAOTI
  is '标题';
comment on column EAM2.ST_HEAD.CHENGSONG
  is '呈送';
comment on column EAM2.ST_HEAD.BIANHAO
  is '表单编号';
comment on column EAM2.ST_HEAD.JHCD
  is '急缓程度';
comment on column EAM2.ST_HEAD.NGR
  is '拟稿人编号';
comment on column EAM2.ST_HEAD.NGRXM
  is '拟稿人姓名';
comment on column EAM2.ST_HEAD.LXDH
  is '联系电话';
comment on column EAM2.ST_HEAD.NGRQ
  is '拟稿日期';
comment on column EAM2.ST_HEAD.NGBM
  is '拟稿部门编号';
comment on column EAM2.ST_HEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.ST_HEAD.YWLX
  is '业务类型0：增资1：减资';
comment on column EAM2.ST_HEAD.HQBM
  is '会签部门';
comment on column EAM2.ST_HEAD.BZ
  is '备注';
comment on column EAM2.ST_HEAD.LCMC
  is '流程名称0：增资减资 1：用工计划 2：法人代表变更 3：重大财务事项审批 4：确权审批 5：其他事项审批';
comment on column EAM2.ST_HEAD.JHXZRS
  is '计划新增人数';
comment on column EAM2.ST_HEAD.SPZT
  is '审批状态0：未提交1：审批中2：已审批';
comment on column EAM2.ST_HEAD.SFSJFY
  is '是否涉及费用 0：否  1：是';
comment on column EAM2.ST_HEAD.ST_ID
  is '实体ID';
comment on column EAM2.ST_HEAD.ZCBH
  is '资产编号';
comment on column EAM2.ST_HEAD.STZWMC
  is '实体中文名称';
comment on column EAM2.ST_HEAD.DIQU
  is '地区';
comment on column EAM2.ST_HEAD.GQGC
  is '股权构成';
comment on column EAM2.ST_HEAD.ZZQK
  is '资质情况';
comment on column EAM2.ST_HEAD.BGDZ
  is '办公地址';
comment on column EAM2.ST_HEAD.STRS
  is '实体现有人数';
comment on column EAM2.ST_HEAD.ZMTZ
  is '账面投资(元)';
comment on column EAM2.ST_HEAD.C_WTGLJG
  is '委托管理机构';
comment on column EAM2.ST_HEAD.C_GLBM
  is '实体数据字典表';
comment on column EAM2.ST_HEAD.CZYGSNSQK
  is '出资与工商年审情况';
comment on column EAM2.ST_HEAD.ZYYW
  is '主营业务';
comment on column EAM2.ST_HEAD.ZZC
  is '总资产';
comment on column EAM2.ST_HEAD.FUZHAI
  is '负债';
comment on column EAM2.ST_HEAD.GUBEN
  is '股本';
comment on column EAM2.ST_HEAD.JZC
  is '净资产';
comment on column EAM2.ST_HEAD.STSR
  is '实体收入';
comment on column EAM2.ST_HEAD.JLR
  is '净利润';
comment on column EAM2.ST_HEAD.SQJEHJ
  is '申请金额合计';
comment on column EAM2.ST_HEAD.SDJEHJ
  is '审定金额合计';
comment on column EAM2.ST_HEAD.HQBMID
  is '会签部门ID';
comment on column EAM2.ST_HEAD.SYHQBMID
  is '建银实业会签部门ID';
comment on column EAM2.ST_HEAD.SYHQBM
  is '建银实业会签部门';
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
  is '实体ID,UUID';
comment on column EAM2.ST_JBXX.STLX
  is '实体类型：0：咨询类实体   1：非咨询处置类实体       2：外部实体   3：非咨询持续经营类实体';
comment on column EAM2.ST_JBXX.ZCBH
  is '资产编号';
comment on column EAM2.ST_JBXX.STXZ
  is '实体性质0：非上市实体1：上市实体';
comment on column EAM2.ST_JBXX.STZWMC
  is '实体中文名称';
comment on column EAM2.ST_JBXX.STYWMC
  is '实体英文名称';
comment on column EAM2.ST_JBXX.JYFL
  is '经营分类0：持续经营类1：处置类';
comment on column EAM2.ST_JBXX.C_HANGYE
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.C_STZT
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.C_SHENGFEN
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.C_DIJISHI
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.C_GLBM
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.C_WTGLJG
  is '委托管理机构';
comment on column EAM2.ST_JBXX.FRDB
  is '法人代表';
comment on column EAM2.ST_JBXX.ZCDZ
  is '注册地址';
comment on column EAM2.ST_JBXX.MYCYR
  is '名义持有人';
comment on column EAM2.ST_JBXX.ZJL
  is '总经理';
comment on column EAM2.ST_JBXX.YEZXH
  is '营业执照号';
comment on column EAM2.ST_JBXX.YEZZYXQ
  is '营业执照有效期';
comment on column EAM2.ST_JBXX.SWDJBH
  is '税务登记编号';
comment on column EAM2.ST_JBXX.GPDM
  is '股票代码';
comment on column EAM2.ST_JBXX.YJHTZRQ
  is '原建行投资日期';
comment on column EAM2.ST_JBXX.YTZGS
  is '原投资公司';
comment on column EAM2.ST_JBXX.ZMTZ
  is '账面投资(元)';
comment on column EAM2.ST_JBXX.SJTZ
  is '实际投资(元)';
comment on column EAM2.ST_JBXX.LXR
  is '联系人';
comment on column EAM2.ST_JBXX.CHUANZHEN
  is '传真';
comment on column EAM2.ST_JBXX.LXDH
  is '联系电话';
comment on column EAM2.ST_JBXX.ZYDZ
  is '主页地址';
comment on column EAM2.ST_JBXX.BGDZ
  is '办公地址';
comment on column EAM2.ST_JBXX.YZBM
  is '邮政编码';
comment on column EAM2.ST_JBXX.DZYX
  is '电子邮箱';
comment on column EAM2.ST_JBXX.JJXZ
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.ZYYW
  is '主营业务';
comment on column EAM2.ST_JBXX.JYYW
  is '兼营业务';
comment on column EAM2.ST_JBXX.CZYGSNSQK
  is '出资与工商年审情况';
comment on column EAM2.ST_JBXX.STJJ
  is '实体简介';
comment on column EAM2.ST_JBXX.CLSJ
  is '成立时间';
comment on column EAM2.ST_JBXX.STXZ2
  is '实体数据字典表';
comment on column EAM2.ST_JBXX.SYRYS
  is '尚有人员数';
comment on column EAM2.ST_JBXX.YWLSYLWT
  is '有无历史遗留问题 1：有2：无';
comment on column EAM2.ST_JBXX.LSYLWTMS
  is '历史遗留问题描述';
comment on column EAM2.ST_JBXX.YUANZHI
  is '原值';
comment on column EAM2.ST_JBXX.JINGZHI
  is '净值';
comment on column EAM2.ST_JBXX.JZZB
  is '减值准备';
comment on column EAM2.ST_JBXX.DJTSFYFZ
  is '对建投是否有负债1：有2：无';
comment on column EAM2.ST_JBXX.FZJE
  is '负债金额';
comment on column EAM2.ST_JBXX.ZMNSFYYJFZ
  is '账面内是否有预计负债1：有2：无';
comment on column EAM2.ST_JBXX.YJFZJE
  is '预计负债金额';
comment on column EAM2.ST_JBXX.ZMZCZE
  is '账面资产总额';
comment on column EAM2.ST_JBXX.ZMZCFZ
  is '账面资产负债';
comment on column EAM2.ST_JBXX.KHYH
  is '开户银行';
comment on column EAM2.ST_JBXX.ZZQK
  is '资质情况';
comment on column EAM2.ST_JBXX.BEIZHU
  is '备注';
comment on column EAM2.ST_JBXX.XXZT
  is '信息状态0：临时数据1：结果数据';
comment on column EAM2.ST_JBXX.SJKZDW
  is '实际控制单位';
comment on column EAM2.ST_JBXX.MQJYZT
  is '目前经营状态';
comment on column EAM2.ST_JBXX.SFBC
  is '是否保存 0：未保存 1：保存';
comment on column EAM2.ST_JBXX.ZCZJ
  is '注册资金 外部实体使用';
comment on column EAM2.ST_JBXX.C_ZCQS
  is '资产权属';
comment on column EAM2.ST_JBXX.WTRMC
  is '委托人名称';
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
  is '实体ID';
comment on column EAM2.ST_SKJN_XX.SKMC
  is '税款名称';
comment on column EAM2.ST_SKJN_XX.SFASJN
  is '是否按时交纳0：否1：是';
comment on column EAM2.ST_SKJN_XX.TQSKSE
  is '拖欠税款数额';
comment on column EAM2.ST_SKJN_XX.TQSJ
  is '拖欠时间';
comment on column EAM2.ST_SKJN_XX.SWJGSFKJM
  is '税务机关是否可以减免0：否1：是';
comment on column EAM2.ST_SKJN_XX.SFBC
  is '（是否保存  0 不保存 1 保存）
';
comment on column EAM2.ST_SKJN_XX.BEIZHU
  is '备注';
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
  is '委托贷款信息';
comment on column EAM2.WD_LN_MORE_INFOR.RISK_DATE
  is '分类日期';
comment on column EAM2.WD_LN_MORE_INFOR.LN_ACCT_NO
  is '贷款系统账户';
comment on column EAM2.WD_LN_MORE_INFOR.C_CUST_ID
  is '贷款客户编号';
comment on column EAM2.WD_LN_MORE_INFOR.C_ACCT_NO
  is '贷款客户账户';
comment on column EAM2.WD_LN_MORE_INFOR.MAG_DPT
  is '资产管理部门';
comment on column EAM2.WD_LN_MORE_INFOR.C_CUST_NAME
  is '贷款方名称';
comment on column EAM2.WD_LN_MORE_INFOR.ASSET_TYPE
  is '资产类型';
comment on column EAM2.WD_LN_MORE_INFOR.D_ACCT_NO
  is '委托方客户编号';
comment on column EAM2.WD_LN_MORE_INFOR.SA_SYS_ACCT_NO
  is '基金系统账户';
comment on column EAM2.WD_LN_MORE_INFOR.SAV_CUST_ACCT_NO
  is '基金客户账户';
comment on column EAM2.WD_LN_MORE_INFOR.FUND_ACCOUNTS_TASTER
  is '基金账户审批人';
comment on column EAM2.WD_LN_MORE_INFOR.RISK_REASON
  is '担险原因';
comment on column EAM2.WD_LN_MORE_INFOR.FUND_TYPE
  is '基金情况 空:未知
1:无基金2:有基金
3:超基金
';
comment on column EAM2.WD_LN_MORE_INFOR.LOST_RATE
  is '预计损失率%';
comment on column EAM2.WD_LN_MORE_INFOR.LOST_JE
  is '预计损失金额';
comment on column EAM2.WD_LN_MORE_INFOR.VERIFIED_DATE
  is '审核日期';
comment on column EAM2.WD_LN_MORE_INFOR.VER_RISK_LEVE
  is '审核风险等级';
comment on column EAM2.WD_LN_MORE_INFOR.VER_LOST_RATE
  is '审核预计损失率%';
comment on column EAM2.WD_LN_MORE_INFOR.VER_LOST_JE
  is '审核预计损失金额';
comment on column EAM2.WD_LN_MORE_INFOR.VER_PERSON
  is '审核人';
comment on column EAM2.WD_LN_MORE_INFOR.VER_LEVEL
  is '审核级别';
comment on column EAM2.WD_LN_MORE_INFOR.MEMO_INFO
  is '备注';
comment on column EAM2.WD_LN_MORE_INFOR.XULIE
  is '序列';
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
  is '表头ID';
comment on column EAM2.WTDK_END_INFO.FUND_ACCOUNT
  is '基金账户';
comment on column EAM2.WTDK_END_INFO.KHBH
  is '客户编号';
comment on column EAM2.WTDK_END_INFO.KHMC
  is '客户名称';
comment on column EAM2.WTDK_END_INFO.KYYE
  is '可用余额';
comment on column EAM2.WTDK_END_INFO.ZHYE
  is '账户余额';
comment on column EAM2.WTDK_END_INFO.DKZHYE
  is '贷款账户余额';
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
  is '系统基金账号';
comment on column EAM2.WTDK_FUNC_BACK_INFO.JJKHMC
  is '基金客户名称';
comment on column EAM2.WTDK_FUNC_BACK_INFO.JJZHYE
  is '基金账户余额';
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
  is '包含两部分内容：  1、基金退回审批  2、终止委托代理关系
';
comment on column EAM2.WTDK_GL_HEAD.HQBM
  is '会签部门名称';
comment on column EAM2.WTDK_GL_HEAD.HQBMID
  is '会签部门ID';
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
  is 'uuid主键';
comment on column EAM2.ZC_PG_XX.ZCID
  is '经营固产ID';
comment on column EAM2.ZC_PG_XX.JYGCZCBH
  is '经营固产资产编号';
comment on column EAM2.ZC_PG_XX.ZCMC
  is '经营固产资产名称';
comment on column EAM2.ZC_PG_XX.SFMC
  is '资产所在省份名称';
comment on column EAM2.ZC_PG_XX.ZCLB
  is '资产类别';
comment on column EAM2.ZC_PG_XX.ZCLBBM
  is '资产类别编码';
comment on column EAM2.ZC_PG_XX.ZKPBH
  is '主卡片编号';
comment on column EAM2.ZC_PG_XX.ZCZMJZ
  is '资产账面价值汇';
comment on column EAM2.ZC_PG_XX.DKZH
  is '贷款账号';
comment on column EAM2.ZC_PG_XX.WDID
  is '委托贷款ID';
comment on column EAM2.ZC_PG_XX.CZCMC
  is '抵债物资名称';
comment on column EAM2.ZC_PG_XX.CSJZYR
  is '抵债物资产实际占有人';
comment on column EAM2.ZC_PG_XX.CZCBH
  is '抵债物资产编号';
comment on column EAM2.ZC_PG_XX.CCFWZ
  is '抵债物内存放位置';
comment on column EAM2.ZC_PG_XX.CZCLX
  is '抵债物资产类型';
comment on column EAM2.ZC_PG_XX.STID
  is '实体ID';
comment on column EAM2.ZC_PG_XX.STMC
  is '实体名称';
comment on column EAM2.ZC_PG_XX.STZCMC
  is '实体内资产名称';
comment on column EAM2.ZC_PG_XX.STFSXXID
  is '实体附属信息ID';
comment on column EAM2.ZC_PG_XX.STZCBH
  is '实体内资产编号';
comment on column EAM2.ZC_PG_XX.STTZCLX
  is '实体内资产类型';
comment on column EAM2.ZC_PG_XX.STZCLB
  is '资产类别';
comment on column EAM2.ZC_PG_XX.STSJZYR
  is '资产实际占有人';
comment on column EAM2.ZC_PG_XX.STCFWZ
  is '实体内资产存放位置';
comment on column EAM2.ZC_PG_XX.PGJG
  is '评估机构';
comment on column EAM2.ZC_PG_XX.PINGGUZHI
  is '评估值（元）';
comment on column EAM2.ZC_PG_XX.C_JZLX
  is '价值类型';
comment on column EAM2.ZC_PG_XX.C_CZFS
  is '处置方式';
comment on column EAM2.ZC_PG_XX.PGFF
  is '评估方法';
comment on column EAM2.ZC_PG_XX.PGJZR
  is '评估基准日';
comment on column EAM2.ZC_PG_XX.BEIZHU
  is '备注';
comment on column EAM2.ZC_PG_XX.PGMD
  is '评估目的';
comment on column EAM2.ZC_PG_XX.JZRZMJZ
  is '基准日账面价值（元）';
comment on column EAM2.ZC_PG_XX.PGZCLB
  is '评估资产类别 0：经营性固产 1：实体内资产 2 委贷抵债物';
comment on column EAM2.ZC_PG_XX.ZJZ
  is '增减值汇总值';
comment on column EAM2.ZC_PG_XX.ZJFD
  is '增减幅度汇总值';
comment on column EAM2.ZC_PG_XX.JINGZHI
  is '净值（元）';
comment on column EAM2.ZC_PG_XX.ZCYBYZ
  is '资产原币原值';
comment on column EAM2.ZC_PG_XX.BXE
  is '变现额';
comment on column EAM2.ZC_PG_XX.XZLB_________
  is '新增加资产类别__________';
comment on column EAM2.ZC_PG_XX.GQSTID
  is '股权实体ID';
comment on column EAM2.ZC_PG_XX.GQSTMC
  is '股权实体名称';
comment on column EAM2.ZC_PG_XX.GQSTSF
  is '股权实体省份';
comment on column EAM2.ZC_PG_XX.GQSTZL
  is '股权实体种类';
comment on column EAM2.ZC_PG_XX.GQSTGLBM
  is '股权实体管理部门';
comment on column EAM2.ZC_PG_XX.GQSTWTGLJG
  is '股权实体委托管理机构';
comment on column EAM2.ZC_PG_XX.GQJZRJZCZ
  is '基准日账面净资产值';
comment on column EAM2.ZC_PG_XX.ZQID
  is '债权ID';
comment on column EAM2.ZC_PG_XX.ZQZL
  is '债权种类 0：全部  1：信达转让 2： 建银转让  3：其他
';
comment on column EAM2.ZC_PG_XX.ZWRMC
  is '债务人名称';
comment on column EAM2.ZC_PG_XX.GRZYE
  is '购入债余额';
comment on column EAM2.ZC_PG_XX.PGJZRZMZQZ
  is '评估基准日账面债权值';
comment on column EAM2.ZC_PG_XX.SFBC
  is '是否保存 0：否 1：是';
comment on column EAM2.ZC_PG_XX.ZYZCID
  is '自用资产ID';
comment on column EAM2.ZC_PG_XX.ZYZCBH
  is '自用资产编号';
comment on column EAM2.ZC_PG_XX.ZYZCMC
  is '自用资产名称';
comment on column EAM2.ZC_PG_XX.ZYKPBH
  is '自用资产卡片编号';
comment on column EAM2.ZC_PG_XX.ZYKPMC
  is '自用资产卡片名称';
comment on column EAM2.ZC_PG_XX.ZYCCYZ
  is '自用资产财产原值';
comment on column EAM2.ZC_PG_XX.ZYBGDD
  is '自用资产保管地点';
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
  is '库存台账ID';
comment on column EAM2.ZY_KCTZ.ZC_ID
  is '资产ID';
comment on column EAM2.ZY_KCTZ.RQ
  is '日期';
comment on column EAM2.ZY_KCTZ.RKSL
  is '入库数量';
comment on column EAM2.ZY_KCTZ.CKSL
  is '出库数量';
comment on column EAM2.ZY_KCTZ.KCSL
  is '库存数量';
comment on column EAM2.ZY_KCTZ.LYBMBM
  is '领用部门编码';
comment on column EAM2.ZY_KCTZ.LYBMMC
  is '领用部门名称';
comment on column EAM2.ZY_KCTZ.JYBMBM
  is '借用部门编码';
comment on column EAM2.ZY_KCTZ.JYBMMC
  is '借用部门名称';
comment on column EAM2.ZY_KCTZ.LYRBH
  is '领用借用人编号';
comment on column EAM2.ZY_KCTZ.LYRMC
  is '领用借用人名称';
comment on column EAM2.ZY_KCTZ.LYRQ
  is '领借用日期';
comment on column EAM2.ZY_KCTZ.JYDQRQ
  is '借用到期日期，借用单填写';
comment on column EAM2.ZY_KCTZ.BDYY
  is '变动原因';
comment on column EAM2.ZY_KCTZ.DJLX
  is '对应单据类型：领用单、借用单、续借单、物品更换单、盘盈盘亏单，报废单，
续借两次算领用';
comment on column EAM2.ZY_KCTZ.DJH
  is '对应单据号';
comment on column EAM2.ZY_KCTZ.SFZXJL
  is '是否是最新记录，同一资产只有一条最新记录1是0非';
comment on column EAM2.ZY_KCTZ.GHSJ
  is '领用借用物品的归还日期';
comment on column EAM2.ZY_KCTZ.GHBH
  is '归还申请单编号';
comment on column EAM2.ZY_KCTZ.TZZT
  is '台账状态';
comment on column EAM2.ZY_KCTZ.BZ
  is '备注';
comment on column EAM2.ZY_KCTZ.SFXJ
  is '是否续借，只对借用单有效1是0否';
comment on column EAM2.ZY_KCTZ.WXFY
  is '维修费用';
comment on column EAM2.ZY_KCTZ.JYTS
  is '借用天数';
comment on column EAM2.ZY_KCTZ.GHRBMBM
  is '归还人部门编码';
comment on column EAM2.ZY_KCTZ.GHRBMMC
  is '归还人部门名称';
comment on column EAM2.ZY_KCTZ.GHRXM
  is '归还人姓名';
comment on column EAM2.ZY_KCTZ.GHRBM
  is '归还人编号';
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
  is '自用资产表盘点盘库表';
comment on column EAM2.ZY_PDXX.SBODY_ID
  is '记录主键,自动生成';
comment on column EAM2.ZY_PDXX.SHEAD_ID
  is '系统内部编号,对应表单头';
comment on column EAM2.ZY_PDXX.PDRQ
  is '盘点日期';
comment on column EAM2.ZY_PDXX.PDPC
  is '盘点批次';
comment on column EAM2.ZY_PDXX.YJFLBM
  is '从分类表中选取';
comment on column EAM2.ZY_PDXX.EJFLBM
  is '从分类表中选取';
comment on column EAM2.ZY_PDXX.SJFLBM
  is '分分类表中选取';
comment on column EAM2.ZY_PDXX.YJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_PDXX.EJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_PDXX.SJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_PDXX.ZC_ID
  is '如果是易耗品,从资产表中选择易耗品编号,其余为0';
comment on column EAM2.ZY_PDXX.ZCBH
  is '资产编号';
comment on column EAM2.ZY_PDXX.ZCMC
  is '资产名称';
comment on column EAM2.ZY_PDXX.GG
  is '从资产表中自动读取,其余手工输入';
comment on column EAM2.ZY_PDXX.SL
  is '账面数量，易耗品代表库存数量，其余为1';
comment on column EAM2.ZY_PDXX.JLDW
  is '计量单位';
comment on column EAM2.ZY_PDXX.CFDD
  is '存放地点';
comment on column EAM2.ZY_PDXX.SYBMBH
  is '使用部门编号';
comment on column EAM2.ZY_PDXX.SYBMBMC
  is '使用部门名称';
comment on column EAM2.ZY_PDXX.SYRBH
  is '使用人编号';
comment on column EAM2.ZY_PDXX.SYRMC
  is '使用人名称';
comment on column EAM2.ZY_PDXX.PDJG
  is '0正在盘点中1、账实相符2、盘盈3、盘亏
';
comment on column EAM2.ZY_PDXX.PDSL
  is '盘点数量';
comment on column EAM2.ZY_PDXX.BZ
  is '备注';
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
  is '记录主键,自动生成';
comment on column EAM2.ZY_SBODY.SHEAD_ID
  is '系统内部编号,对应表单头';
comment on column EAM2.ZY_SBODY.YJFLBM
  is '从分类表中选取';
comment on column EAM2.ZY_SBODY.EJFLBM
  is '从分类表中选取';
comment on column EAM2.ZY_SBODY.SJFLBM
  is '分分类表中选取';
comment on column EAM2.ZY_SBODY.YJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_SBODY.EJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_SBODY.SJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_SBODY.ZC_ID
  is '如果是易耗品,从资产表中选择易耗品编号,其余为0';
comment on column EAM2.ZY_SBODY.ZCBH
  is '资产编号';
comment on column EAM2.ZY_SBODY.ZCMC
  is '资产名称';
comment on column EAM2.ZY_SBODY.GG
  is '易耗品从资产表中自动读取,其余手工输入';
comment on column EAM2.ZY_SBODY.SL
  is '数量';
comment on column EAM2.ZY_SBODY.JLDW
  is '计量单位';
comment on column EAM2.ZY_SBODY.DJ
  is '单价';
comment on column EAM2.ZY_SBODY.JE
  is '金额,等于数量乘以单价';
comment on column EAM2.ZY_SBODY.GYS
  is '供应商,采购处理单,采购单用';
comment on column EAM2.ZY_SBODY.CBRQ
  is '出保日期,采购处理单,采购单用,';
comment on column EAM2.ZY_SBODY.BXJG
  is '保修机构,采购处理单,采购单用';
comment on column EAM2.ZY_SBODY.JYTS
  is '借用单填写';
comment on column EAM2.ZY_SBODY.WRKSL
  is '未入库数量';
comment on column EAM2.ZY_SBODY.BZ1
  is '备注1';
comment on column EAM2.ZY_SBODY.BXFWS
  is '保修服务商';
comment on column EAM2.ZY_SBODY.XXBRQ
  is '新续保日期';
comment on column EAM2.ZY_SBODY.BZ2
  is '备注2';
comment on column EAM2.ZY_SBODY.FYBH
  is '费用编号';
comment on column EAM2.ZY_SBODY.SQFY
  is '申请费用';
comment on column EAM2.ZY_SBODY.SPJE
  is '审批金额';
comment on column EAM2.ZY_SBODY.YBXJE
  is '已报销金额';
comment on column EAM2.ZY_SBODY.BZ3
  is '备注3';
comment on column EAM2.ZY_SBODY.CGRQ
  is '采购日期';
comment on column EAM2.ZY_SBODY.CGDBODYID
  is '对应采购单BODYID,入库单使用';
comment on column EAM2.ZY_SBODY.GRSQDBODYID
  is '对应个人申请单BODYID,部门领用借用单使用';
comment on column EAM2.ZY_SBODY.SQRID
  is '对应个人申请单个人ID,部门领用借用单使用';
comment on column EAM2.ZY_SBODY.SQRMC
  is '对应个人申请单个人名称,部门领用借用单使用';
comment on column EAM2.ZY_SBODY.PDPC
  is '盘点批次';
comment on column EAM2.ZY_SBODY.ZCZT
  is '1、在库
2、已领借用
3、维修
4、报废';
comment on column EAM2.ZY_SBODY.JYLYRQ
  is '借用领用日期';
comment on column EAM2.ZY_SBODY.JYDQRQ
  is '借用到期日期';
comment on column EAM2.ZY_SBODY.WXFY
  is '维修费用';
comment on column EAM2.ZY_SBODY.LPH
  is '令牌号';
comment on column EAM2.ZY_SBODY.LPSX
  is '令牌时限';
comment on column EAM2.ZY_SBODY.LPQX
  is '令牌权限';
comment on column EAM2.ZY_SBODY.LPDLM
  is '令牌登录名';
comment on column EAM2.ZY_SBODY.SYZT
  is '使用状态  0：变更前  1：变更后
';
comment on column EAM2.ZY_SBODY.XLH
  is '序列号';
comment on column EAM2.ZY_SBODY.FDJBH
  is '发动机编号';
comment on column EAM2.ZY_SBODY.CPUXH
  is 'CPU型号';
comment on column EAM2.ZY_SBODY.MEMORY
  is '内存';
comment on column EAM2.ZY_SBODY.DISK
  is '硬盘';
comment on column EAM2.ZY_SBODY.NZDISK
  is '内置硬盘';
comment on column EAM2.ZY_SBODY.XTXSQ
  is '系统显示器';
comment on column EAM2.ZY_SBODY.SSZG
  is '所属账管';
comment on column EAM2.ZY_SBODY.SQBMID
  is '领用借用部门ID
';
comment on column EAM2.ZY_SBODY.SQBMMC
  is '领用借用部门名称
';
comment on column EAM2.ZY_SBODY.TXMBH
  is '条形码编号';
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
  is '系统内部编号 ';
comment on column EAM2.ZY_SHEAD.SHEET_TYPE
  is '表单类型，详见数据字典定义设计';
comment on column EAM2.ZY_SHEAD.TITLE
  is '表单标题，手工录入';
comment on column EAM2.ZY_SHEAD.SHEET_ID
  is '表单编号，根据编号规则自动生成';
comment on column EAM2.ZY_SHEAD.NGRQ
  is '拟稿日期，格式为YYYYMMDD';
comment on column EAM2.ZY_SHEAD.NGRBH
  is '拟稿人编号';
comment on column EAM2.ZY_SHEAD.NGRMC
  is '拟稿人名称';
comment on column EAM2.ZY_SHEAD.NGBMBH
  is '拟稿部门编号';
comment on column EAM2.ZY_SHEAD.NGBMMC
  is '拟稿部门名称';
comment on column EAM2.ZY_SHEAD.LDXH
  is '联系电话，人工输入';
comment on column EAM2.ZY_SHEAD.JHCD
  is '急缓程度1一般；2急；3特急';
comment on column EAM2.ZY_SHEAD.YTXQ
  is '用途与需求，采购单专用字段';
comment on column EAM2.ZY_SHEAD.CGYJ
  is '采购依据，从其他流程选取单据号或者手工录入';
comment on column EAM2.ZY_SHEAD.NGBMYJ
  is '拟稿部门意见,此字段废弃，作为存储ca_shead表的id使用';
comment on column EAM2.ZY_SHEAD.SPBMYJ
  is '审批部门意见,此字段废弃';
comment on column EAM2.ZY_SHEAD.HQYJ
  is '会签意见,此字段废弃';
comment on column EAM2.ZY_SHEAD.YWYYZYJ
  is '业务运营组意见,此字段废弃';
comment on column EAM2.ZY_SHEAD.LDPSYJ
  is '批示意见此字段废弃';
comment on column EAM2.ZY_SHEAD.BDZT
  is '表单状态0 拟稿1进行中2审批完成3数据已办结';
comment on column EAM2.ZY_SHEAD.YSRQ
  is '验收日期，格式yyyy-mm-dd';
comment on column EAM2.ZY_SHEAD.BFRQ
  is '报废日期YYYY-MM-DD';
comment on column EAM2.ZY_SHEAD.HQBM
  is '会签部门';
comment on column EAM2.ZY_SHEAD.HQBMID
  is '会签部门ID';
comment on column EAM2.ZY_SHEAD.PDPC
  is '盘点批次';
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
  is '从分类表中选取';
comment on column EAM2.ZY_ZC.EJFLBM
  is '从分类表中选取';
comment on column EAM2.ZY_ZC.SJFLBM
  is '分分类表中选取';
comment on column EAM2.ZY_ZC.YJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_ZC.EJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_ZC.SJFLMC
  is '冗余字段,与编码关联变化,不可修改';
comment on column EAM2.ZY_ZC.ZCBH
  is '资产编号:卡片号/条码号/自编号';
comment on column EAM2.ZY_ZC.ZCMC
  is '资产名称';
comment on column EAM2.ZY_ZC.KPBH
  is '固定资产卡片编号,来自ERP系统';
comment on column EAM2.ZY_ZC.TXMBH
  is '固定资产和低值品有,易耗品没有';
comment on column EAM2.ZY_ZC.XLH
  is '序列号';
comment on column EAM2.ZY_ZC.SL
  is '按标准规格计算数量,冗余字段，以台账为准';
comment on column EAM2.ZY_ZC.JLDW
  is '资产的具体计量单位';
comment on column EAM2.ZY_ZC.GG
  is '资产的具体规格，例如U盘的1G,2G';
comment on column EAM2.ZY_ZC.ZCZT
  is '1、在库
2、已领借用
3、维修
4、报废';
comment on column EAM2.ZY_ZC.WZBH
  is '根据业务要求进行编号';
comment on column EAM2.ZY_ZC.YJKCSL
  is '预警库存数量';
comment on column EAM2.ZY_ZC.ZTWZ
  is '编号粘贴位置';
comment on column EAM2.ZY_ZC.CZYZ
  is '财产原值';
comment on column EAM2.ZY_ZC.BGDD
  is '保管地点';
comment on column EAM2.ZY_ZC.SYZK
  is '固定资产使用状况';
comment on column EAM2.ZY_ZC.KSSYRQ
  is '开始使用日期';
comment on column EAM2.ZY_ZC.FDJBH
  is '发动机编号';
comment on column EAM2.ZY_ZC.YLRR
  is '原系统录入人员';
comment on column EAM2.ZY_ZC.DZYHDJ
  is '低值易耗单价';
comment on column EAM2.ZY_ZC.DZYHJG
  is '低值易耗价格';
comment on column EAM2.ZY_ZC.CBRQ
  is '出保日期';
comment on column EAM2.ZY_ZC.CPUXH
  is 'CPU型号';
comment on column EAM2.ZY_ZC.MEMORY
  is '内存';
comment on column EAM2.ZY_ZC.DISK
  is '硬盘';
comment on column EAM2.ZY_ZC.NZDISK
  is '内置硬盘';
comment on column EAM2.ZY_ZC.XTXSQ
  is '系统显示器';
comment on column EAM2.ZY_ZC.ZJXGSJ
  is '记录此条记录的最近修改日期时间,备查';
comment on column EAM2.ZY_ZC.SSZG
  is '所属账管';
comment on column EAM2.ZY_ZC.BZ
  is '备注';
comment on column EAM2.ZY_ZC.ZJPDRQ
  is '最近盘点日期';
comment on column EAM2.ZY_ZC.RKRQ
  is '入库日期';
comment on column EAM2.ZY_ZC.ZJPKRQ
  is '最近盘库日期';
comment on column EAM2.ZY_ZC.BXFWS
  is '保修服务商';
comment on column EAM2.ZY_ZC.GYS
  is '供应商';
comment on column EAM2.ZY_ZC.LPH
  is '令牌号';
comment on column EAM2.ZY_ZC.LPSX
  is '令牌时限';
comment on column EAM2.ZY_ZC.LPQX
  is '令牌权限';
comment on column EAM2.ZY_ZC.LPDLM
  is '令牌登录名';
comment on column EAM2.ZY_ZC.SFSCKP
  is '是否已生成卡片';
comment on column EAM2.ZY_ZC.CGRQ
  is '采购日期';
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
 --将ERP中的费用种类转化成EAM系统的种类
begin
  if (opertionkey = '代理费支出') then
     Result := '财务预算表';
     elsif (opertionkey = '宣传费') then
    Result := '业务管理费';
     elsif (opertionkey = '外事费') then
    Result := '业务管理费';
     elsif (opertionkey = '营销费--差旅费' or opertionkey = '营销费--低值易耗品' or  opertionkey ='营销费--会议费'
      or opertionkey ='营销费--书报资料费' or opertionkey ='营销费--宣传费' or opertionkey ='营销费--印刷费'
      or opertionkey ='营销费--邮电费' or opertionkey ='营销费--招待费' or opertionkey ='营销费-差旅费'
      or opertionkey ='营销费-低值易耗品' or opertionkey ='营销费-公杂费' or opertionkey ='营销费-会议费'
      or opertionkey ='营销费-其它业务费' or opertionkey ='营销费-书报资料费' or opertionkey ='营销费-邮电费'
      or opertionkey ='营销费-招待费') then
    Result := '业务管理费';
     elsif (opertionkey = '财产保险费' or opertionkey = '代理财产保险费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理车辆第三方强制险' or opertionkey = '邮电费') then
    Result := '业务管理费';
     elsif (opertionkey = '印刷费') then
    Result := '业务管理费';
     elsif (opertionkey = '差旅费') then
    Result := '业务管理费';
     elsif (opertionkey = '会议费') then
    Result := '业务管理费';
     elsif (opertionkey = '书报资料费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理补缴养路费' or opertionkey = '代理车辆第三方强制险' or opertionkey = '代理车辆年检费'
     or opertionkey = '代理养路费' or opertionkey = '业务用车费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理修理费' or opertionkey = '修理费') then
    Result := '业务管理费';
     elsif (opertionkey = '评估费') then
    Result := '业务管理费';
     elsif (opertionkey = '咨询费') then
    Result := '业务管理费';
     elsif (opertionkey = '尽职调查费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理律师费' or opertionkey = '律师费') then
    Result := '业务管理费';
    elsif (opertionkey = '代理诉讼费' or opertionkey = '诉讼费') then
    Result := '业务管理费';
     elsif (opertionkey = '公证费') then
    Result := '业务管理费';
     elsif (opertionkey = '审计费') then
    Result := '业务管理费';
     elsif (opertionkey = '拍卖费') then
    Result := '业务管理费';
     elsif (opertionkey = '广告费') then
    Result := '业务管理费';
     elsif (opertionkey = '水电费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理物业管理费' or opertionkey = '物业费') then
    Result := '业务管理费';
     elsif (opertionkey = '绿化费') then
    Result := '业务管理费';
     elsif (opertionkey = '公杂费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理车船使用税') then
    Result := '业务管理费';
     elsif (opertionkey = '代理补缴土地使用税' or opertionkey = '代理土地使用税') then
    Result := '业务管理费';
     elsif (opertionkey = '代理房产税' or opertionkey = '代理补缴房产税') then
    Result := '业务管理费';
     elsif (opertionkey = '代理印花税') then
    Result := '业务管理费';
     elsif (opertionkey = '网络通信费') then
    Result := '业务管理费';
     elsif (opertionkey = '劳务费') then
    Result := '业务管理费';
    elsif (opertionkey = '安全防卫费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理其他税金') then
    Result := '业务管理费';
     elsif (opertionkey = '董事会费') then
    Result := '业务管理费';
     elsif (opertionkey = '计算机设备运转费') then
    Result := '业务管理费';
     elsif (opertionkey = '其他电子设备运转费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理土地租金' or opertionkey = '租赁费') then
    Result := '业务管理费';
     elsif (opertionkey = '部门公务交通补贴') then
    Result := '业务管理费';
     elsif (opertionkey = '代理其他业务支出' or opertionkey = '其他业务费') then
    Result := '业务管理费';
     elsif (opertionkey = '其他管理费' or opertionkey = '代理其他审批费用') then
    Result := '业务管理费';
     elsif (opertionkey = '手续费') then
    Result := '业务管理费';
     elsif (opertionkey = '代理计入固定资产原值的其他审批费用') then
    Result := '资本性支出';
     elsif (opertionkey = '代理补缴契税' or opertionkey = '代理房地产办证费（税费）'
     or opertionkey = '代理契税' or opertionkey = '固定资产办证支出') then
    Result := '资本性支出';
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
 --将ERP中的费用种类转化成EAM系统的种类
begin
  if (opertionkey = '代理费支出') then
     Result := '代理费支出';
     elsif (opertionkey = '宣传费') then
    Result := '宣传费';
     elsif (opertionkey = '外事费') then
    Result := '外事费';
     elsif (opertionkey = '营销费--差旅费' or opertionkey = '营销费--低值易耗品' or  opertionkey ='营销费--会议费'
      or opertionkey ='营销费--书报资料费' or opertionkey ='营销费--宣传费' or opertionkey ='营销费--印刷费'
      or opertionkey ='营销费--邮电费' or opertionkey ='营销费--招待费' or opertionkey ='营销费-差旅费'
      or opertionkey ='营销费-低值易耗品' or opertionkey ='营销费-公杂费' or opertionkey ='营销费-会议费'
      or opertionkey ='营销费-其它业务费' or opertionkey ='营销费-书报资料费' or opertionkey ='营销费-邮电费'
      or opertionkey ='营销费-招待费') then
    Result := '营销费';
     elsif (opertionkey = '代理车辆第三方强制险' or opertionkey = '财产保险费' or opertionkey = '代理财产保险费') then
    Result := '财产保险费';
     elsif (opertionkey = '邮电费') then
    Result := '邮电费';
     elsif (opertionkey = '印刷费') then
    Result := '印刷费';
     elsif (opertionkey = '差旅费') then
    Result := '差旅费';
     elsif (opertionkey = '会议费') then
    Result := '会议费';
     elsif (opertionkey = '书报资料费') then
    Result := '书报资料费';
     elsif (opertionkey = '代理补缴养路费' or opertionkey = '代理车辆年检费'
     or opertionkey = '代理养路费' or opertionkey = '业务用车费') then
    Result := '业务用车费';
     elsif (opertionkey = '代理修理费' or opertionkey = '修理费') then
    Result := '修理费';
     elsif (opertionkey = '评估费') then
    Result := '评估费';
     elsif (opertionkey = '咨询费') then
    Result := '咨询费';
     elsif (opertionkey = '尽职调查费') then
    Result := '尽职调查费';
     elsif (opertionkey = '代理律师费' or opertionkey = '律师费') then
    Result := '律师费';
    elsif (opertionkey = '代理诉讼费' or opertionkey = '诉讼费') then
    Result := '诉讼费';
     elsif (opertionkey = '公证费') then
    Result := '公证费';
     elsif (opertionkey = '审计费') then
    Result := '审计费';
     elsif (opertionkey = '拍卖费') then
    Result := '拍卖费';
     elsif (opertionkey = '广告费') then
    Result := '广告费';
     elsif (opertionkey = '水电费') then
    Result := '水电费';
     elsif (opertionkey = '代理物业管理费' or opertionkey = '物业费') then
    Result := '物业费';
     elsif (opertionkey = '绿化费') then
    Result := '绿化费';
     elsif (opertionkey = '公杂费') then
    Result := '公杂费';
     elsif (opertionkey = '代理车船使用税') then
    Result := '车船使用税';
     elsif (opertionkey = '代理补缴土地使用税' or opertionkey = '代理土地使用税') then
    Result := '土地使用税';
     elsif (opertionkey = '代理房产税' or opertionkey = '代理补缴房产税') then
    Result := '房产税';
     elsif (opertionkey = '代理印花税') then
    Result := '印花税';
     elsif (opertionkey = '网络通信费') then
    Result := '网络通信费';
     elsif (opertionkey = '劳务费') then
    Result := '劳务费';
    elsif (opertionkey = '安全防卫费') then
    Result := '安全防卫费';
     elsif (opertionkey = '代理其他税金') then
    Result := '其他税金';
     elsif (opertionkey = '董事会费') then
    Result := '董事会费';
     elsif (opertionkey = '计算机设备运转费') then
    Result := '计算机设备运转费';
     elsif (opertionkey = '其他电子设备运转费') then
    Result := '其他电子设备运转费';
     elsif (opertionkey = '代理土地租金' or opertionkey = '租赁费') then
    Result := '租赁费';
     elsif (opertionkey = '部门公务交通补贴') then
    Result := '交通补贴';
     elsif (opertionkey = '代理其他业务支出' or opertionkey = '其他业务费') then
    Result := '其他业务费';
     elsif (opertionkey = '其他管理费' or opertionkey = '代理其他审批费用') then
    Result := '其他管理费';
     elsif (opertionkey = '手续费') then
    Result := '手续费支出';
     elsif (opertionkey = '代理计入固定资产原值的其他审批费用') then
    Result := '装修改造';
     elsif (opertionkey = '代理补缴契税' or opertionkey = '代理房地产办证费（税费）'
     or opertionkey = '代理契税' or opertionkey = '固定资产办证支出') then
    Result := '确权费用';
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
