SELECT *
FROM [dbo].[uber]

SELECT *
FROM [dbo].[uber]
Order by date

--total fare amount
SELECT SUM(fare_amount)
FROM [dbo].[uber]
where fare_amount is not null

--fare amount per year
SELECT SUM(fare_amount) TotalFare_09
FROM [dbo].[uber]
where YEAR(date) = 2009

SELECT SUM(fare_amount) TotalFare_10
FROM [dbo].[uber]
where YEAR(date) = 2010

SELECT SUM(fare_amount) TotalFare_11
FROM [dbo].[uber]
where YEAR(date) = 2011

SELECT SUM(fare_amount) TotalFare_12
FROM [dbo].[uber]
where YEAR(date) = 2012

SELECT SUM(fare_amount) TotalFare_13
FROM [dbo].[uber]
where YEAR(date) = 2013

SELECT SUM(fare_amount) TotalFare_14
FROM [dbo].[uber]
where YEAR(date) = 2014

SELECT SUM(fare_amount) TotalFare_15
FROM [dbo].[uber]
where YEAR(date) = 2015

--count of order
SELECT  count(kunci) TotalTrip
FROM [dbo].[uber]
where kunci is not null

--count of order per year
SELECT  count(kunci) TotalTrip_09
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2009

SELECT  count(kunci) TotalTrip_10
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2010

SELECT  count(kunci) TotalTrip_11
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2011

SELECT  count(kunci) TotalTrip_12
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2012

SELECT  count(kunci) TotalTrip_13
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2013

SELECT  count(kunci) TotalTrip_14
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2014

SELECT  count(kunci) TotalTrip_15
FROM [dbo].[uber]
where kunci is not null and YEAR(date) = 2015

--count of passenger
SELECT SUM(passenger_count) PassengerTotal
FROM [dbo].[uber]
where passenger_count is not null

--count of passenger per year
SELECT sum(passenger_count) PassengerTotal_09
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2009

SELECT sum(passenger_count) PassengerTotal_10
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2010

SELECT sum(passenger_count) PassengerTotal_11
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2011

SELECT sum(passenger_count) PassengerTotal_12
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2012

SELECT sum(passenger_count) PassengerTotal_13
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2013

SELECT sum(passenger_count) PassengerTotal_14
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2014

SELECT sum(passenger_count) PassengerTotal_15
FROM [dbo].[uber]
where passenger_count is not null and YEAR(date) = 2015

--average count of passenger
with pass_total as (
SELECT passenger_count PassengerTotal
FROM [dbo].[uber]
where passenger_count is not null
)

select AVG(PassengerTotal)
from pass_total

-- COUNT IN EXCEL 
-- total distance
SELECT pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude
FROM [dbo].[uber]

--order amount by weekdays 

with amount as(
SELECT datename(dw, date) Weekdays, sum(fare_amount) FareAmount
FROM [dbo].[uber]
group by date
)

SELECT Weekdays, sum(FareAmount) FareAmount
from amount
where FareAmount is not null
group by Weekdays

--hourly trend for order
with byHour as (
SELECT DATEPART(hour, Time) Hourly, Count(Kunci) TotalOrder
FROM [dbo].[uber]
group by Time
)

select Hourly, sum(TotalOrder) as OrderTotal
from byHour
where hourly is not null
group by Hourly
order by Hourly

--Avg amount by Weekdays
with average as(
SELECT datename(dw, date) Weekdays, avg(fare_amount) FareAmount
FROM [dbo].[uber]
group by date
)

select Weekdays, sum(FareAmount) AvgAmount
from average
where Weekdays is not null
group by Weekdays

