Use Exam_shcema;
--����� 3 ������ , ������� ���������� ������ �����
Select top(3) QTY, PRODUCT From Orders
order by QTY;
--����� ����������� , � ������� ��� ������� ���������� ���� 5000...
Select distinct s.Name,o.CITY From SALESREPS s inner join ORDERS ord on s.EMPL_NUM = ord.REP
inner join OFFICES o on o.MGR = ord.REP Where ord.AMOUNT < 5000
order by o.CITY
--����� �����, ������� ��������� ������...
Select ofs.Office From OFFICES ofs
inner join CUSTOMERS c on ofs.MGR = c.CUST_REP and c.CREDIT_LIMIT > 20000
group by ofs.OFFICE



