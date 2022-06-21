Use Exam_shcema;
--найти 3 товара , которые заказывали меньше всего
Select top(3) QTY, PRODUCT From Orders
order by QTY;
--Ќайти сотрудников , у которых нет заказов стоимостью выше 5000...
Select distinct s.Name,o.CITY From SALESREPS s inner join ORDERS ord on s.EMPL_NUM = ord.REP
inner join OFFICES o on o.MGR = ord.REP Where ord.AMOUNT < 5000
order by o.CITY
--Ќайти офисы, которые выполн€ли заказы...
Select ofs.Office From OFFICES ofs
inner join CUSTOMERS c on ofs.MGR = c.CUST_REP and c.CREDIT_LIMIT > 20000
group by ofs.OFFICE



