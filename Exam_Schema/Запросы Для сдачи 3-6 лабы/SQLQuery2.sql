Use Exam_shcema;
--1)����� �����������, � ������� ���� ����� ���������� ���� 2000, � ������������� �� �������� ��������� ������.
Select s.Name, o.AMOUNT from ORDERS o
inner join SALESREPS s on s.EMPL_NUM = o.REP
Where o.AMOUNT > 2000
order by o.AMOUNT desc;

--2)����� ������, ������� �� ���������� ���������� �� ������ ���������� �������
Select distinct p.Product_id From Products p
where not exists (select * from SALESREPS r  inner join OFFICES ofs on r.REP_OFFICE = ofs.OFFICE 
and ofs.REGION = 'Eastern' inner join ORDERS o on o.REP = r.EMPL_NUM and p.PRODUCT_ID = o.Product)

