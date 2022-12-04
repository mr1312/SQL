
/*
create database Mike_Database; 
-------No other joined tables with data will need to add later---------
create table migration_nz
(
	Measure varchar(50),
	Citizenship Varchar(70),
	Country Varchar(70),
	Year int, 
	Value int,
	Primary key (Measure, Citizenship, Country) -- The data lacked any ID entry so a combinational primary key is needed 
);

drop View total_Emigration_Australia;
drop view total_migration_Asia_2000_2016;
drop view Net_Migration_Countries_2016;
drop view  Net_Migration_Countries_2016_all;
*/

--------------------Views--------------------

-- View for total migration from asia 
go 
	create view total_migration_Asia_2000_2016 
	as
		select m.Year,m.Value
		from migration_nz m
		Where m.Year >= '2000' and m.Year <= '2016' and m.Measure = 'Net'  and m.Country = 'Asia' and m.Citizenship = 'Total All Citizenships'
		Group by m.Year,m.Value
-- View for total migration from Eurpoe 
go --SQL manager wants a batch seperator effectivly a scope declaration of values inside for SQL 
	create view total_Emigration_Australia 
	as
		select m.Year,m.Value
		from migration_nz m
		Where m.Year >= '2000' and m.Year <= '2016' and m.Measure = 'Net' and m.Country = 'Australia'  and m.Citizenship = 'Total All Citizenships'
		Group by m.Year,m.Value
--------------2016 Worldwide migration-------------------------------
go 
	create view Net_Migration_Countries_2016_all
	as
		select m.Country,m.Value
		from migration_nz m
		Where m.Year = '2016' and m.Measure = 'Net' and m.Citizenship = 'Total All Citizenships' and m.Country not like 'All countries' and m.Value  !< '0' and m.Value != '0'
		Group by m.Country,m.Value;
		
