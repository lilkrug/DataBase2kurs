Use Exam_shcema;
--����� �����, � ������� �� ���� ������� � ������ � 01.01.2007 �� 01.01.2008.
select d.OFFICE from OFFICES as d
where OFFICE not in
(select distinct OFFICE from SALESREPS r
join OFFICES ofs on r.REP_OFFICE = ofs.OFFICE
join ORDERS ord on ord.REP = r.EMPL_NUM where ORDER_DATE between '01-01-2007' and '01-01-2008')

