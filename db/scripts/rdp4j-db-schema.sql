DROP SEQUENCE SEQ_P_T_DEPT;


CREATE SEQUENCE SEQ_P_T_DEPT
	INCREMENT BY 1
	START WITH 2000
	MAXVALUE 999999999999999999
	MINVALUE 2000
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_EXCEPTION_LOG;


CREATE SEQUENCE SEQ_P_T_EXCEPTION_LOG
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_FUNCTION_GROUP;


CREATE SEQUENCE SEQ_P_T_FUNCTION_GROUP
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_FUNCTION_RES;


CREATE SEQUENCE SEQ_P_T_FUNCTION_RES
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_LOGON_INFO;


CREATE SEQUENCE SEQ_P_T_LOGON_INFO
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_REFERENCE;


CREATE SEQUENCE SEQ_P_T_REFERENCE
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_ROLE;


CREATE SEQUENCE SEQ_P_T_ROLE
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_ROLE_L_FUNC_GROUP;


CREATE SEQUENCE SEQ_P_T_ROLE_L_FUNC_GROUP
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_USER;


CREATE SEQUENCE SEQ_P_T_USER
	INCREMENT BY 1
	START WITH 2000
	MAXVALUE 999999999999999999
	MINVALUE 2000
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_USER_L_DEPT;


CREATE SEQUENCE SEQ_P_T_USER_L_DEPT
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP SEQUENCE SEQ_P_T_USER_L_ROLE;


CREATE SEQUENCE SEQ_P_T_USER_L_ROLE
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999999999999999
	MINVALUE 1
	NOCYCLE
	CACHE 10
	ORDER;


DROP INDEX PK1_P_T_REFERENCE;


DROP TABLE P_T_REFERENCE CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_USER_L_DEPT;


DROP INDEX XAK1_P_T_USER_L_DEPT;


DROP TABLE P_T_USER_L_DEPT CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_DEPT;


DROP TABLE P_T_DEPT CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_EXCEPTION_LOG;


DROP TABLE P_T_EXCEPTION_LOG CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_ROLE_L_FUNC_GROUP;


DROP INDEX XAK1_P_T_ROLE_L_FUNC_GROUP;


DROP TABLE P_T_ROLE_L_FUNC_GROUP CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_FUNCTION_GROUP;


DROP TABLE P_T_FUNCTION_GROUP CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_FUNCTION_RES;


DROP TABLE P_T_FUNCTION_RES CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_USER_L_ROLE;


DROP INDEX XAK1_P_T_USER_L_ROLE;


DROP TABLE P_T_USER_L_ROLE CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_ROLE;


DROP TABLE P_T_ROLE CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_LOGON_INFO;


DROP TABLE P_T_LOGON_INFO CASCADE CONSTRAINTS;


DROP INDEX PK1_P_T_USER;


DROP TABLE P_T_USER CASCADE CONSTRAINTS;


DROP INDEX XPK_P_T_COMPNENT_RES;


DROP TABLE P_T_COMPONENT_RES CASCADE CONSTRAINTS;


CREATE TABLE P_T_COMPONENT_RES
(
	TID  NUMBER(22)  NOT NULL ,
	COMP_NAME  VARCHAR2(40)  NULL 
);


CREATE  UNIQUE INDEX XPK_P_T_COMPNENT_RES ON P_T_COMPONENT_RES
(
	TID  ASC
);


ALTER TABLE P_T_COMPONENT_RES
	ADD CONSTRAINT  XPK_P_T_COMPNENT_RES PRIMARY KEY (TID);


CREATE TABLE P_T_DEPT
(
	TID  NUMBER(22)  NOT NULL ,
	PAR_ID  NUMBER(22)  NULL ,
	DEPT_CODE  VARCHAR2(40)  NULL ,
	DEPT_NAME  VARCHAR2(200)  NULL ,
	DEPT_DESC  VARCHAR2(2000)  NULL ,
	DEPT_TYPE_CD  VARCHAR2(20)  NULL ,
	SORT_ORDER  NUMBER(10)  NULL ,
	DEL_FLAG_CD  VARCHAR2(20)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL ,
	RSVD_DATE1  DATE  NULL ,
	RSVD_DATE2  DATE  NULL ,
	RSVD_NUM1  NUMBER(10)  NULL ,
	RSVD_NUM2  NUMBER(10)  NULL ,
	RSVD_STR1  VARCHAR2(200)  NULL ,
	RSVD_STR2  VARCHAR2(200)  NULL ,
	RSVD_STR3  VARCHAR2(200)  NULL ,
	RSVD_STR4  VARCHAR2(200)  NULL ,
	RSVD_STR5  VARCHAR2(2000)  NULL ,
	RSVD_STR6  VARCHAR2(2000)  NULL 
);


COMMENT ON COLUMN P_T_DEPT.TID IS '����ID';


COMMENT ON COLUMN P_T_DEPT.PAR_ID IS '���ڵ���';


COMMENT ON COLUMN P_T_DEPT.DEPT_CODE IS '����/�������';


COMMENT ON COLUMN P_T_DEPT.DEPT_NAME IS '����/��������';


COMMENT ON COLUMN P_T_DEPT.DEPT_DESC IS '����/��������';


COMMENT ON COLUMN P_T_DEPT.DEPT_TYPE_CD IS '����/�������

040-���Ż���������
040001-����
040002-����
040003-������
040004-����';


COMMENT ON COLUMN P_T_DEPT.SORT_ORDER IS '˳���';


COMMENT ON COLUMN P_T_DEPT.DEL_FLAG_CD IS '�Ƿ�ɾ��

001-�߼�ɾ������
001001-��
001000-��';


COMMENT ON COLUMN P_T_DEPT.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_DEPT.SYS_UPDATE_TIME IS '����ʱ��';


COMMENT ON COLUMN P_T_DEPT.RSVD_DATE1 IS '�����ֶ�����1';


COMMENT ON COLUMN P_T_DEPT.RSVD_DATE2 IS '�����ֶ�����2';


COMMENT ON COLUMN P_T_DEPT.RSVD_NUM1 IS '�����ֶ�����1';


COMMENT ON COLUMN P_T_DEPT.RSVD_NUM2 IS '�����ֶ�����2';


COMMENT ON COLUMN P_T_DEPT.RSVD_STR1 IS '�����ֶ��ַ�1';


COMMENT ON COLUMN P_T_DEPT.RSVD_STR2 IS '�����ֶ��ַ�2';


COMMENT ON COLUMN P_T_DEPT.RSVD_STR3 IS '�����ֶ��ַ�3';


COMMENT ON COLUMN P_T_DEPT.RSVD_STR4 IS '�����ֶ��ַ�4';


COMMENT ON COLUMN P_T_DEPT.RSVD_STR5 IS '�����ֶ��ַ�5';


COMMENT ON COLUMN P_T_DEPT.RSVD_STR6 IS '�����ֶ��ַ�6';


CREATE  UNIQUE INDEX PK1_P_T_DEPT ON P_T_DEPT
(
	TID  ASC
);


ALTER TABLE P_T_DEPT
	ADD CONSTRAINT  PK_DEPT PRIMARY KEY (TID);


CREATE TABLE P_T_EXCEPTION_LOG
(
	TID  NUMBER(22)  NOT NULL ,
	EXCEPTION_CLASS  VARCHAR2(200)  NULL ,
	EXCEPTION_MSG  VARCHAR2(2000)  NULL ,
	MODULE_NAME  VARCHAR2(40)  NULL ,
	ACTION_NAME  VARCHAR2(40)  NULL ,
	METHOD_NAME  VARCHAR2(40)  NULL ,
	CLASS_NAME  VARCHAR2(200)  NULL ,
	LINE_NUM  NUMBER(10)  NULL ,
	PARAMETERS  VARCHAR2(2000)  NULL ,
	MACHINE_NAME  VARCHAR2(200)  NULL ,
	MACHINE_IP  VARCHAR2(40)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL 
);


COMMENT ON COLUMN P_T_EXCEPTION_LOG.TID IS '����ID';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.EXCEPTION_CLASS IS '�쳣��';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.EXCEPTION_MSG IS '�쳣��Ϣ';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.MODULE_NAME IS 'MODULE����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.ACTION_NAME IS 'ACTION����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.METHOD_NAME IS 'METHOD����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.CLASS_NAME IS 'CLASS����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.LINE_NUM IS '�к�';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.PARAMETERS IS '����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.MACHINE_NAME IS '�豸����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.MACHINE_IP IS '�豸IP��ַ';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_EXCEPTION_LOG.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_EXCEPTION_LOG ON P_T_EXCEPTION_LOG
(
	TID  ASC
);


ALTER TABLE P_T_EXCEPTION_LOG
	ADD CONSTRAINT  PK_EXCEPTION_LOG PRIMARY KEY (TID);


CREATE TABLE P_T_FUNCTION_GROUP
(
	TID  NUMBER(22)  NOT NULL ,
	PAR_ID  NUMBER(22)  NULL ,
	FUNCTION_ID  NUMBER(22)  NOT NULL ,
	FUNC_GROUP_TYPE_CD  VARCHAR2(20)  NULL ,
	FUNC_GROUP_NAME  VARCHAR2(40)  NULL ,
	SORT_ORDER  NUMBER(10)  NULL ,
	IS_LEAF  NUMBER(2)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL 
);


COMMENT ON COLUMN P_T_FUNCTION_GROUP.TID IS '����ID';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.PAR_ID IS '���ڵ���';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.FUNCTION_ID IS '������Դ���';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.FUNC_GROUP_TYPE_CD IS '���������

003-���������
003001-�˵�
003002-ҳ��
003003-����';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.FUNC_GROUP_NAME IS '����������';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.SORT_ORDER IS '˳���';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.IS_LEAF IS '�Ƿ�ΪҶ�ӽڵ�';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_FUNCTION_GROUP.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_FUNCTION_GROUP ON P_T_FUNCTION_GROUP
(
	TID  ASC
);


ALTER TABLE P_T_FUNCTION_GROUP
	ADD CONSTRAINT  PK_FUNCTION_GROUP PRIMARY KEY (TID);


CREATE TABLE P_T_FUNCTION_RES
(
	TID  NUMBER(22)  NOT NULL ,
	FUNCTION_NAME  VARCHAR2(200)  NULL ,
	MODULE_NAME  VARCHAR2(200)  NULL ,
	ACTION_NAME  VARCHAR2(200)  NULL ,
	METHOD_NAME  VARCHAR2(200)  NULL ,
	CLASS_NAME  VARCHAR2(200)  NULL ,
	IS_LOGIN_NEEDED  NUMBER(2)  NULL ,
	IS_TOKEN_NEEDED  NUMBER(2)  NULL ,
	IS_CHECK_MID  NUMBER(2)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL 
);


COMMENT ON COLUMN P_T_FUNCTION_RES.TID IS '����ID';


COMMENT ON COLUMN P_T_FUNCTION_RES.FUNCTION_NAME IS 'FUNCTION����';


COMMENT ON COLUMN P_T_FUNCTION_RES.MODULE_NAME IS 'MODULE����';


COMMENT ON COLUMN P_T_FUNCTION_RES.ACTION_NAME IS 'ACTION����';


COMMENT ON COLUMN P_T_FUNCTION_RES.METHOD_NAME IS 'METHOD����';


COMMENT ON COLUMN P_T_FUNCTION_RES.CLASS_NAME IS 'CLASS����';


COMMENT ON COLUMN P_T_FUNCTION_RES.IS_LOGIN_NEEDED IS '�Ƿ���Ҫ��¼';


COMMENT ON COLUMN P_T_FUNCTION_RES.IS_TOKEN_NEEDED IS '�Ƿ���Ҫ����';


COMMENT ON COLUMN P_T_FUNCTION_RES.IS_CHECK_MID IS '�Ƿ���MID';


COMMENT ON COLUMN P_T_FUNCTION_RES.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_FUNCTION_RES.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_FUNCTION_RES ON P_T_FUNCTION_RES
(
	TID  ASC
);


ALTER TABLE P_T_FUNCTION_RES
	ADD CONSTRAINT  PK_FUNCTION_RES PRIMARY KEY (TID);


CREATE TABLE P_T_LOGON_INFO
(
	TID  NUMBER(22)  NOT NULL ,
	USER_ID  NUMBER(22)  NULL ,
	LOGIN_TYPE_CD  VARCHAR2(20)  NULL ,
	LOGIN_TIME  TIMESTAMP  NULL ,
	LOGOUT_TYPE_CD  VARCHAR2(20)  NULL ,
	LOGOUT_TIME  TIMESTAMP  NULL ,
	MACHINE_NAME  VARCHAR2(40)  NULL ,
	MACHINE_IP  VARCHAR2(40)  NULL 
);


COMMENT ON COLUMN P_T_LOGON_INFO.TID IS '����ID';


COMMENT ON COLUMN P_T_LOGON_INFO.USER_ID IS '�û����';


COMMENT ON COLUMN P_T_LOGON_INFO.LOGIN_TYPE_CD IS '��¼���';


COMMENT ON COLUMN P_T_LOGON_INFO.LOGIN_TIME IS '��¼ʱ��';


COMMENT ON COLUMN P_T_LOGON_INFO.LOGOUT_TYPE_CD IS '�˳����';


COMMENT ON COLUMN P_T_LOGON_INFO.LOGOUT_TIME IS '�˳�ʱ��';


COMMENT ON COLUMN P_T_LOGON_INFO.MACHINE_NAME IS '�豸����';


COMMENT ON COLUMN P_T_LOGON_INFO.MACHINE_IP IS '�豸IP��ַ';


CREATE  UNIQUE INDEX PK1_P_T_LOGON_INFO ON P_T_LOGON_INFO
(
	TID  ASC
);


ALTER TABLE P_T_LOGON_INFO
	ADD CONSTRAINT  PK1_P_T_LOGON_INFO PRIMARY KEY (TID);


CREATE TABLE P_T_REFERENCE
(
	TID  NUMBER(22)  NOT NULL ,
	REF_CODE  VARCHAR2(20)  NOT NULL ,
	PAR_REF_CODE  VARCHAR2(20)  NULL ,
	REF_NAME  VARCHAR2(40)  NULL ,
	SORT_ORDER  NUMBER(10)  NULL ,
	STATUS_CD  VARCHAR2(20)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NULL ,
	SYS_UPDATE_TIME  TIMESTAMP  NOT NULL 
);


COMMENT ON COLUMN P_T_REFERENCE.TID IS '����ID';


COMMENT ON COLUMN P_T_REFERENCE.REF_CODE IS '�ֵ����';


COMMENT ON COLUMN P_T_REFERENCE.PAR_REF_CODE IS '���ڵ���';


COMMENT ON COLUMN P_T_REFERENCE.REF_NAME IS '�ֵ�����';


COMMENT ON COLUMN P_T_REFERENCE.SORT_ORDER IS '˳���';


COMMENT ON COLUMN P_T_REFERENCE.STATUS_CD IS '�ֵ�״̬';


COMMENT ON COLUMN P_T_REFERENCE.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_REFERENCE.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_REFERENCE ON P_T_REFERENCE
(
	TID  ASC,
	REF_CODE  ASC
);


ALTER TABLE P_T_REFERENCE
	ADD CONSTRAINT  PK1_P_T_REFERENCE PRIMARY KEY (TID,REF_CODE);


CREATE TABLE P_T_ROLE
(
	TID  NUMBER(22)  NOT NULL ,
	ROLE_NAME  VARCHAR2(40)  NULL ,
	ROLE_DESC  VARCHAR2(500)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL 
);


COMMENT ON COLUMN P_T_ROLE.TID IS '����ID';


COMMENT ON COLUMN P_T_ROLE.ROLE_NAME IS '��ɫ����';


COMMENT ON COLUMN P_T_ROLE.ROLE_DESC IS '��ɫ����';


COMMENT ON COLUMN P_T_ROLE.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_ROLE.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_ROLE ON P_T_ROLE
(
	TID  ASC
);


ALTER TABLE P_T_ROLE
	ADD CONSTRAINT  PK_ROLE PRIMARY KEY (TID);


CREATE TABLE P_T_ROLE_L_FUNC_GROUP
(
	TID  NUMBER(22)  NOT NULL ,
	ROLE_ID  NUMBER(22)  NOT NULL ,
	LINK_TYPE_CD  VARCHAR2(20)  NULL ,
	FUNC_GROUP_ID  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_TIME  TIMESTAMP  NOT NULL 
);


COMMENT ON COLUMN P_T_ROLE_L_FUNC_GROUP.TID IS '����ID';


COMMENT ON COLUMN P_T_ROLE_L_FUNC_GROUP.ROLE_ID IS '��ɫ���';


COMMENT ON COLUMN P_T_ROLE_L_FUNC_GROUP.LINK_TYPE_CD IS '�������

002-�������
002001-������
002002-��ɫ';


COMMENT ON COLUMN P_T_ROLE_L_FUNC_GROUP.FUNC_GROUP_ID IS '������/��ɫ���';


COMMENT ON COLUMN P_T_ROLE_L_FUNC_GROUP.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_ROLE_L_FUNC_GROUP.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_ROLE_L_FUNC_GROUP ON P_T_ROLE_L_FUNC_GROUP
(
	TID  ASC
);


ALTER TABLE P_T_ROLE_L_FUNC_GROUP
	ADD CONSTRAINT  PK_ROLE_L_ROLEFUN PRIMARY KEY (TID);


CREATE  UNIQUE INDEX XAK1_P_T_ROLE_L_FUNC_GROUP ON P_T_ROLE_L_FUNC_GROUP
(
	ROLE_ID  ASC,
	FUNC_GROUP_ID  ASC
);


CREATE TABLE P_T_USER
(
	TID  NUMBER(22)  NOT NULL ,
	LOGIN_ID  VARCHAR2(40)  NULL ,
	USERNAME  VARCHAR2(40)  NULL ,
	PASSWORD  VARCHAR2(40)  NULL ,
	GENDER_CD  VARCHAR2(20)  NULL ,
	BIRTH_DATE  DATE  NULL ,
	ID_NUMBER  VARCHAR2(40)  NULL ,
	EMAIL  VARCHAR2(40)  NULL ,
	CELLPHONE  VARCHAR2(40)  NULL ,
	HOME_PHONE  VARCHAR2(40)  NULL ,
	BUSINESS_PHONE  VARCHAR2(40)  NULL ,
	ADDRESS  VARCHAR2(200)  NULL ,
	POSTCODE  VARCHAR2(40)  NULL ,
	DESCRIPTION  VARCHAR2(500)  NULL ,
	STATUS_CD  VARCHAR2(20)  NULL ,
	DEL_FLAG_CD  VARCHAR2(20)  NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL ,
	RSVD_DATE1  DATE  NULL ,
	RSVD_DATE2  DATE  NULL ,
	RSVD_NUM1  NUMBER(10)  NULL ,
	RSVD_NUM2  NUMBER(10)  NULL ,
	RSVD_STR1  VARCHAR2(200)  NULL ,
	RSVD_STR2  VARCHAR2(200)  NULL ,
	RSVD_STR3  VARCHAR2(200)  NULL ,
	RSVD_STR4  VARCHAR2(200)  NULL ,
	RSVD_STR5  VARCHAR2(200)  NULL ,
	RSVD_STR6  VARCHAR2(200)  NULL ,
	RSVD_STR7  VARCHAR2(200)  NULL ,
	RSVD_STR8  VARCHAR2(200)  NULL ,
	RSVD_STR9  VARCHAR2(2000)  NULL ,
	RSVD_STR10  VARCHAR2(2000)  NULL 
);


COMMENT ON COLUMN P_T_USER.TID IS '����ID';


COMMENT ON COLUMN P_T_USER.LOGIN_ID IS '��¼�ʺ�';


COMMENT ON COLUMN P_T_USER.USERNAME IS '�û�����';


COMMENT ON COLUMN P_T_USER.PASSWORD IS '��¼����';


COMMENT ON COLUMN P_T_USER.GENDER_CD IS '�Ա�';


COMMENT ON COLUMN P_T_USER.BIRTH_DATE IS '��������';


COMMENT ON COLUMN P_T_USER.ID_NUMBER IS '֤������';


COMMENT ON COLUMN P_T_USER.EMAIL IS '�����ʼ�';


COMMENT ON COLUMN P_T_USER.CELLPHONE IS '�ƶ��绰';


COMMENT ON COLUMN P_T_USER.HOME_PHONE IS '��ͥ�绰';


COMMENT ON COLUMN P_T_USER.BUSINESS_PHONE IS '�칫�绰';


COMMENT ON COLUMN P_T_USER.ADDRESS IS '��ַ';


COMMENT ON COLUMN P_T_USER.POSTCODE IS '�ʱ�';


COMMENT ON COLUMN P_T_USER.DESCRIPTION IS '������Ϣ';


COMMENT ON COLUMN P_T_USER.STATUS_CD IS '״̬';


COMMENT ON COLUMN P_T_USER.DEL_FLAG_CD IS '�Ƿ�ɾ��

001-�߼�ɾ������
001001-��
001000-��';


COMMENT ON COLUMN P_T_USER.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_USER.SYS_UPDATE_TIME IS '����ʱ��';


COMMENT ON COLUMN P_T_USER.RSVD_DATE1 IS '�����ֶ�����1';


COMMENT ON COLUMN P_T_USER.RSVD_DATE2 IS '�����ֶ�����2';


COMMENT ON COLUMN P_T_USER.RSVD_NUM1 IS '�����ֶ�����1';


COMMENT ON COLUMN P_T_USER.RSVD_NUM2 IS '�����ֶ�����2';


COMMENT ON COLUMN P_T_USER.RSVD_STR1 IS '�����ֶ��ַ�1';


COMMENT ON COLUMN P_T_USER.RSVD_STR2 IS '�����ֶ��ַ�2';


COMMENT ON COLUMN P_T_USER.RSVD_STR3 IS '�����ֶ��ַ�3';


COMMENT ON COLUMN P_T_USER.RSVD_STR4 IS '�����ֶ��ַ�4';


COMMENT ON COLUMN P_T_USER.RSVD_STR5 IS '�����ֶ��ַ�5';


COMMENT ON COLUMN P_T_USER.RSVD_STR6 IS '�����ֶ��ַ�6';


COMMENT ON COLUMN P_T_USER.RSVD_STR7 IS '�����ֶ��ַ�7';


COMMENT ON COLUMN P_T_USER.RSVD_STR8 IS '�����ֶ��ַ�8';


COMMENT ON COLUMN P_T_USER.RSVD_STR9 IS '�����ֶ��ַ�9';


COMMENT ON COLUMN P_T_USER.RSVD_STR10 IS '�����ֶ��ַ�10';


CREATE  UNIQUE INDEX PK1_P_T_USER ON P_T_USER
(
	TID  ASC
);


ALTER TABLE P_T_USER
	ADD CONSTRAINT  PK_USER PRIMARY KEY (TID);


CREATE TABLE P_T_USER_L_DEPT
(
	TID  NUMBER(22)  NOT NULL ,
	USER_ID  NUMBER(22)  NOT NULL ,
	DEPT_ID  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL 
);


COMMENT ON COLUMN P_T_USER_L_DEPT.TID IS '����ID';


COMMENT ON COLUMN P_T_USER_L_DEPT.USER_ID IS '�û����';


COMMENT ON COLUMN P_T_USER_L_DEPT.DEPT_ID IS '���ű��';


COMMENT ON COLUMN P_T_USER_L_DEPT.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_USER_L_DEPT.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_USER_L_DEPT ON P_T_USER_L_DEPT
(
	TID  ASC
);


ALTER TABLE P_T_USER_L_DEPT
	ADD CONSTRAINT  PK_DEP_L_USER PRIMARY KEY (TID);


CREATE  UNIQUE INDEX XAK1_P_T_USER_L_DEPT ON P_T_USER_L_DEPT
(
	USER_ID  ASC,
	DEPT_ID  ASC
);


CREATE TABLE P_T_USER_L_ROLE
(
	TID  NUMBER(22)  NOT NULL ,
	USER_ID  NUMBER(22)  NOT NULL ,
	ROLE_ID  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_USER  NUMBER(22)  NOT NULL ,
	SYS_UPDATE_TIME  TIMESTAMP(6)  NOT NULL 
);


COMMENT ON COLUMN P_T_USER_L_ROLE.TID IS '����ID';


COMMENT ON COLUMN P_T_USER_L_ROLE.USER_ID IS '�û����';


COMMENT ON COLUMN P_T_USER_L_ROLE.ROLE_ID IS '��ɫ���';


COMMENT ON COLUMN P_T_USER_L_ROLE.SYS_UPDATE_USER IS '�����û����';


COMMENT ON COLUMN P_T_USER_L_ROLE.SYS_UPDATE_TIME IS '����ʱ��';


CREATE  UNIQUE INDEX PK1_P_T_USER_L_ROLE ON P_T_USER_L_ROLE
(
	TID  ASC
);


ALTER TABLE P_T_USER_L_ROLE
	ADD CONSTRAINT  PK_USER_L_ROLE PRIMARY KEY (TID);


CREATE  UNIQUE INDEX XAK1_P_T_USER_L_ROLE ON P_T_USER_L_ROLE
(
	USER_ID  ASC,
	ROLE_ID  ASC
);

