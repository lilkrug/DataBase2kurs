Use Exam_shcema;
--1запрос
--Ќайти среднюю цену товаров, которые заказывали сотрудников из офисов «ападного региона
go
CREATE FUNCTION PriceGoods(@region varchar (20)) returns int
as begin
declare @rc int = 0
set @rc = (SELECT avg(p.PRICE) as AVG_PRICE FROM PRODUCTS p
INNER JOIN ORDERS o ON p.MFR_ID = o.MFR AND p.PRODUCT_ID = o.PRODUCT
INNER JOIN CUSTOMERS c ON o.CUST = c.CUST_NUM
INNER JOIN SALESREPS s on o.REP = s.EMPL_NUM AND c.CUST_REP = s.EMPL_NUM
INNER JOIN OFFICES ofi ON s.EMPL_NUM = ofi.MGR Where ofi.REGION = @region);
return @rc
end

Declare @price int = dbo.PriceGoods('Western');
print 'Average Price on goods = '+ cast(@price as varchar(5))
--Drop FUNCTION dbo.PriceGoods


Select distinct Offices.Region, dbo.PriceGoods(Offices.Region) as Average_Price_on_goods  from OFFICES 



--2запрос
--Ќайти 3 покупателей с кредитным лимитом меньше 50000, которые выполнили больше всех заказов
go 
CREATE FUNCTION ThreeCustomers(@count int, @credit_limited  int) returns table
as return 
Select top(@count) t.Name,t.[кол-во заказов] from(
select rep.NAME,Count(*)[кол-во заказов]
from SALESREPS rep
join ORDERS ord on ord.REP = rep.EMPL_NUM 
join CUSTOMERS cust on ord.CUST=cust.CUST_NUM and cust.CREDIT_LIMIT < @credit_limited 
group by rep.NAME) t
--Drop function dbo.ThreeCustomers
SELECT * From dbo.ThreeCustomers(3,50000)