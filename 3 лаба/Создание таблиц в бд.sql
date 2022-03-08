Use Круглик_Base3;
Create Table Товары
(
  Наименования nvarchar(50) primary key,
  Цена real unique not null,
  Количество int
);
Create Table Заказчики
(
  Наименование_фирмы nvarchar(50) primary key,
  Адрес nvarchar(50),
  Расчетный_счёт nvarchar(50)
);
Create Table Заказы
(
  Номер_заказа int primary key,
  Наименовая_товара nvarchar(50) foreign key references Товары(Наименования),
  Цена_продажи real,
  Количество int,
  Дата_поставки date,
  Заказчик nvarchar(50) foreign key references Заказчики(Наименование_фирмы)
);


