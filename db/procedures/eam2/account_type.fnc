create or replace function account_type(opertionkey in varchar2) return
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
