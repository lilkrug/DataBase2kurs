Use Exam_shcema;
--���������� ������� ���� ������ ��� ������� ����������...
select avg(p.Price) from PRODUCTS p inner join Orders o
on p.MFR_ID = o.MFR inner join SALESREPS s on o.REP = s.EMPL_NUM
where  p.PRICE > 600
group by Price
--����� ������ , ������� ���������� ���������� �� ������ ����...
Select p.Product_id from PRODUCTS p inner join Orders o
on p.PRODUCT_ID = o.PRODUCT inner join SALESREPS s 
on o.REP = s.EMPL_NUM inner join OFFICES ofs 
on s.EMPL_NUM = ofs.MGR
where ofs.REGION = 'Eastern'


