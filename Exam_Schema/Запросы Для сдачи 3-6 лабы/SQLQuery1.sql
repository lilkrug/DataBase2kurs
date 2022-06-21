Use Exam_shcema;
--1.ѕодсчитать количество товаров , заказанных сотрудниками каждого офиса и отсортировать
--по убыванию всех заказов
Select s.rep_office, count(*) as amount_of_goods from ORDERS o
inner join salesreps s on s.empl_num = o.rep
group by s.rep_office
order by amount_of_goods desc;

--2.Ќайти офисы, в которых были заказы в период с 01.01.2007 по 01.01.2008
select distinct s.OFFICE from OFFICES s inner join ORDERS o
on o.ORDER_DATE between '01.01.2007' and '01.01.2008'
group by s.OFFICE



 