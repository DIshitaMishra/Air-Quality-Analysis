-- For Normalizing the Air_Quality table we have to separate the table with repitate row names.
-- We have created Locations table for States and Cities

create table Locations(
LocationID INT PRIMARY KEY IDENTITY(1,1),
City Nvarchar(100),
States Nvarchar(100)
);

insert into Locations(City,States)
select distinct city, state from Air_Quality;

select * from Locations;

select * from Air_Quality;