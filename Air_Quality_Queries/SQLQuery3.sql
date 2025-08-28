-- We are creating another table for Pollutant

CREATE TABLE Pollutant (
    PollutantID INT PRIMARY KEY IDENTITY(1,1),
    PollutantCode NVARCHAR(50) -- like PM2.5, NO2 etc.
);

Insert into Pollutant(
PollutantCode
)
Select distinct Pollutant_ID
from Air_Quality;

Select * from Pollutant;