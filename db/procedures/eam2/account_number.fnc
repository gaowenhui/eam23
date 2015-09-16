create or replace function account_number(opertionkey in varchar2) return
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
