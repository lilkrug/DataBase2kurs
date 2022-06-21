use Exam_shcema
--за 2007
select T1.CITY as '@город',
(select count(*) from SALESREPS where SALESREPS.REP_OFFICE = T1.OFFICE) as '@Кол_во_работников',
(
			select S.NAME as '@имя',
			(SELECT COUNT(ORDERS.REP) from ORDERS inner join SALESREPS on ORDERS.REP=SALESREPS.EMPL_NUM and S.EMPL_NUM=ORDERS.REP and ORDERS.ORDER_DATE between '2007-01-01' and '2008-01-01') as '@Количество_заказов',
			(Select count(*) from ORDERS inner join SALESREPS on ORDERS.REP = SALESREPS.EMPL_NUM 
				for xml path('Orders'), type
			)
			from SALESREPS as S
			where S.REP_OFFICE = T1.OFFICE
			for xml path('Name'), type
			)

from OFFICES as T1
group by CITY, OFFICE
for xml path('CITY'), root('CITIES')




--за 2008
select T1.CITY as '@город',
(select count(*) from SALESREPS where SALESREPS.REP_OFFICE = T1.OFFICE) as '@Кол_во_работников',
(
select S.NAME as '@имя',
(SELECT COUNT(ORDERS.REP) from ORDERS inner join SALESREPS on ORDERS.REP=SALESREPS.EMPL_NUM and S.EMPL_NUM=ORDERS.REP and ORDERS.ORDER_DATE between '2008-01-01' and '2009-01-01') as '@Количество_заказов'
from SALESREPS as S
where S.REP_OFFICE = T1.OFFICE
for xml path('REP'), type
)
from OFFICES as T1
group by CITY, OFFICE
for xml path('CITY'), root('CITIES')