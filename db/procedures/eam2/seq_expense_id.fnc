create or replace function seq_expense_id return number is
  Result number;
begin
  select seq_expense.nextval into Result from dual;
  return(Result);
end seq_expense_id;
/
