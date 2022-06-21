Use Univer;
				SELECT * 
	FROM (select CASE 
					when NOTE between 4 and 5 then '4-5'
					when NOTE between 6 and 7 then '6-7'
					when NOTE between 8 and 9 then '8-9'
					when NOTE = 10 then '10'
		 end [Пределы Оценок], COUNT(*) [Количество]
		 From PROGRESS Group By Case
					when NOTE between 4 and 5 then '4-5'
					when NOTE between 6 and 7 then '6-7'
					when NOTE between 8 and 9 then '8-9'
					when NOTE = 10 then '10' 
		 end) as T  
	order by CASE [Пределы Оценок] 
		when '10' then 1
		when '8-9' then 2
		when '6-7' then 3
		when '4-5' then 4
		else 0
		end;