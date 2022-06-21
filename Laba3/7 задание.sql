Use Круглик_Base3;
Select Distinct Наименовая_товара,Цена_продажи,Дата_поставки From Заказы
	Where Дата_поставки Between '2014-05-06' And '2014-07-09'
Select Наименовая_товара From Заказы 
	Where Наименовая_товара Like 'П%'
Select Distinct Наименовая_товара From Заказы 
	Where Цена_продажи In(152,210)