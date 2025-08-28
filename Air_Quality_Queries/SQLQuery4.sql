--Create a Stations Tabl

--Each monitoring station belongs to a location.

Create table Stations(
StationID int Primary Key Identity (1,1),
StationName Nvarchar(200),
LocationID Int, 
Latitude Decimal(9,6),
Longitude DECIMAL(9,6),
Foreign Key (LocationID) References Locations(LocationID)

);


INSERT INTO Stations (StationName, LocationID, Latitude, Longitude)
SELECT DISTINCT 
    station,
    L.LocationID,
    latitude,
    longitude
FROM Air_Quality R
JOIN Locations L 
    ON R.city = L.City AND R.state = L.States;

select * from Stations;