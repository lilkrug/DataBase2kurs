Use Exam_shcema;
--1.���������� ���������� ������� , ���������� ������������ ������� ����� � �������������
--�� �������� ���� �������
Select s.rep_office, count(*) as amount_of_goods from ORDERS o
inner join salesreps s on s.empl_num = o.rep
group by s.rep_office
order by amount_of_goods desc;

--2.����� �����, � ������� ���� ������ � ������ � 01.01.2007 �� 01.01.2008
select distinct s.OFFICE from OFFICES s inner join ORDERS o
on o.ORDER_DATE between '01.01.2007' and '01.01.2008'
group by s.OFFICE



 