Use �������_Base3;
Create Table ������
(
  ������������ nvarchar(50) primary key,
  ���� real unique not null,
  ���������� int
);
Create Table ���������
(
  ������������_����� nvarchar(50) primary key,
  ����� nvarchar(50),
  ���������_���� nvarchar(50)
);
Create Table ������
(
  �����_������ int primary key,
  ����������_������ nvarchar(50) foreign key references ������(������������),
  ����_������� real,
  ���������� int,
  ����_�������� date,
  �������� nvarchar(50) foreign key references ���������(������������_�����)
);


