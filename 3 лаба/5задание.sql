Use Круглик_Base3;

Select COUNT(*) From Товары;
Select Count(*) From Товары,Заказы;
Select Count(*) From Товары,Заказы,Заказчики;
Select Наименования[Дешевые товары] From Товары
	Where Цена < 19
Select Distinct Top(3) Наименовая_товара,Цена_продажи
	From Заказы Order By Цена_продажи Desc;
