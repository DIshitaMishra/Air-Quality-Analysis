-- Now Merging all the distinct data in one table Measuerment

CREATE TABLE Measurement (
    MeasurementID INT PRIMARY KEY IDENTITY(1,1),
    StationID INT FOREIGN KEY REFERENCES Stations(StationID),
    PollutantID INT FOREIGN KEY REFERENCES Pollutant(PollutantID),
    MeasurementDate DATE,
    MeasurementTime TIME,
    PollutantMin DECIMAL(10,3),
    PollutantMax DECIMAL(10,3),
    PollutantAvg DECIMAL(10,3)
);

INSERT INTO Measurement (StationID, PollutantID, [MeasurementDate], [MeasurementTime],  PollutantMin, PollutantMax, PollutantAvg)
SELECT 
    s.StationID,
    p.PollutantID,
    CAST(r.last_update AS DATE) AS [MeasurementDate],
    CAST(r.last_update AS TIME) AS [MeasurementTime],
    r.pollutant_min,
    r.pollutant_max,
    r.pollutant_avg
FROM Air_Quality r
JOIN Stations s 
    ON r.station = s.StationName
JOIN Pollutant p
    ON r.pollutant_id = p.PollutantCode;

select * from Measurement;


--Count Null Values

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN PollutantMin IS NULL THEN 1 ELSE 0 END) AS Null_PollutantMin,
    SUM(CASE WHEN PollutantMax IS NULL THEN 1 ELSE 0 END) AS Null_PollutantMax,
    SUM(CASE WHEN PollutantAvg IS NULL THEN 1 ELSE 0 END) AS Null_PollutantAvg
FROM Measurement;

-- Drop (Delete) Rows with Null Values

DELETE FROM Measurement
WHERE PollutantMin IS NULL
   OR PollutantMax IS NULL
   OR PollutantAvg IS NULL;
