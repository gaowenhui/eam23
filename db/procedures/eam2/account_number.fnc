create or replace function account_number(opertionkey in varchar2) return
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
