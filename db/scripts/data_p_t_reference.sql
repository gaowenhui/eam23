-- 数据状态编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1000, '001', null, '数据状态编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1001, '001001', '001', '启用', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1002, '001002', '001', '停用', null, '001001', 9999, sysdate);


-- 逻辑删除编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1003, '002', null, '逻辑删除编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1004, '002001', '002', '是', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1005, '002002', '002', '否', null, '001001', 9999, sysdate);


-- 功能组类别编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1006, '003', null, '功能组类别编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1007, '003001', '003', '菜单', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1008, '003002', '003', '页面', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1009, '003003', '003', '链接', null, '001001', 9999, sysdate);


-- 角色功能组关联类别编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1010, '004', null, '角色功能组关联类别编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1011, '004001', '004', '功能组', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1012, '004002', '004', '角色', null, '001001', 9999, sysdate);
    
-- 公共业务数据状态编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1013, '005', null, '公共业务数据状态编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1014, '005001', '005', '流程未启动', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (1015, '005002', '005', '流程已启动', null, '001001', 9999, sysdate);


-- 部门机构类别编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2000, '040', null, '部门机构类别编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2001, '040001', '040', '机构', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2002, '040002', '040', '部门', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2003, '040003', '040', '工作组', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2004, '040004', '040', '处室', null, '001001', 9999, sysdate);
    
-- 用户状态编码
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2005, '041', null, '用户状态编码', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2006, '041001', '041', '正常', null, '001001', 9999, sysdate);
insert into P_T_REFERENCE
    (TID, REF_CODE, PAR_REF_CODE, REF_NAME, SORT_ORDER, STATUS_CD, SYS_UPDATE_USER, SYS_UPDATE_TIME)
values
    (2007, '041002', '041', '禁用', null, '001001', 9999, sysdate);
