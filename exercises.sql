use usairlineflights;

#exercise 1
SELECT count(*) FROM usairlineflights.flights;

#exercise 2
SELECT Origin, AVG(DepDelay) as Average_Departure_Delay, AVG(ArrDelay) as Average_Arrival_Delay
FROM flights
GROUP BY Origin;

#exercise 3
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS Delays
FROM usairlineflights.flights 
GROUP BY Origin, colYear, colMonth;

#exercise 4
SELECT City, colYear, colMonth, AVG(ArrDelay) AS Delays
FROM usairlineflights.flights 
LEFT JOIN usairports ON flights.Origin = usairports.IATA 
GROUP BY City, colYear, colMonth
ORDER BY City, colYear, colMonth;

#exercise 5
SELECT COUNT(Cancelled) as Total_cancelled, Description AS Company
FROM flights 
JOIN carriers ON flights.UniqueCarrier = carriers.CarrierCode
WHERE Cancelled = 1
GROUP BY UniqueCarrier 
ORDER BY Total_cancelled DESC;

#exercise 6
SELECT TailNum as Plane, SUM(Distance) as Total_Distance 
FROM usairlineflights.flights 
GROUP BY Plane 
ORDER BY Total_Distance DESC 
LIMIT 10;

#exercise 7
SELECT Description AS Company, AVG(ArrDelay) AS Delays
FROM flights
JOIN carriers ON flights.UniqueCarrier = carriers.CarrierCode
GROUP BY Description
HAVING AVG(ArrDelay) > '10';

