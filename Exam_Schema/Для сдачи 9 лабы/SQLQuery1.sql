Use Exam_shcema;
go
select offi.OFFICE [Офис] from OFFICES offi
inner join SALESREPS s on s.REP_OFFICE = offi.OFFICE
inner join ORDERS o on o.REP = s.EMPL_NUM
where o.ORDER_DATE between '2007-01-01' and '2008-01-01'
group by offi.OFFICE

--0,0239298
create index t1 on ORDERS(REP) --не меняется
create index t2 on SALESREPS(REP_OFFICE) --0,020517
create index t3 on ORDERS(ORDER_DATE) where ORDER_DATE >= '2007-01-01' and ORDER_DATE <= '2008-01-01' --0,021517
create index t4 on ORDERS(ORDER_DATE) include (REP) --0,0238703
create nonclustered index t5 on OFFICES(OFFICE) --не меняется
create nonclustered index t6 on ORDERS(REP) -- не меняется
create nonclustered index t7 on ORDERS(ORDER_NUM) --не меняетcя
create nonclustered index t8 on ORDERS(ORDER_NUM, ORDER_DATE, REP) --0,0201517
--0,0199936

Drop index t1 on ORDERS;
Drop index t2 on SALESREPS;
Drop index t3 on ORDERS;
Drop index t4 on ORDERS;
Drop index t5 on OFFICES;
Drop index t6 on ORDERS;
Drop index t7 on ORDERS;
Drop index t8 on ORDERS;

--0,0239298

-----------
go 
Select s.rep_office, count(*) as amount_of_goods from ORDERS o
	inner join salesreps s on s.empl_num = o.rep
	group by s.rep_office
	order by amount_of_goods desc
	--0,0195773
	create index n1 on ORDERS(REP) --не меняется
	create index n2 on SALESREPS(empl_num) --
	create nonclustered index n5 on OFFICES(OFFICE) --не меняется
	create nonclustered index n6 on ORDERS(REP) -- не меняется
	create nonclustered index n7 on ORDERS(ORDER_NUM) --не меняетcя
	create nonclustered index n8 on ORDERS(ORDER_NUM, ORDER_DATE, REP) --0,0201517
