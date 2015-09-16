create or replace function expense_username(inputcode in varchar2) return
 varchar2  is Result varchar2(200);
begin
  select t.user_password into Result from erp.erp_sm_user t where t.cuserid = trim(inputcode);
     return(Result);
end expense_username;
/
