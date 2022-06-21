Use Exam_shcema;
--����� 2 ����������� , ������� ��������� ������ ���� ������� � ������������ � ��������� ������� ������ 30000
Select top(2) s.Name from SALESREPS s inner join ORDERS ord
on s.EMPL_NUM = ord.REP inner join CUSTOMERS c on ord.REP = c.CUST_REP 
where c.CREDIT_LIMIT < 30000
--����� ������� ���� ������	��� ������� �����
Select avg(o.Amount) as Amount, COUNT(*) as Office 
From OFFICES ofs inner join ORDERS o
on ofs.MGR = o.REP
group by o.Amount
order by Amount desc;
