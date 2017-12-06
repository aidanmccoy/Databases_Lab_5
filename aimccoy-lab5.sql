-- BAKERY-1 For each pastry flavor which is found in more than three types of
-- pastries sold by the bakery, report the average price of an item of this
-- flavor and the total number of different pastrties of this flavor on the
-- menu. Sort the output in ascending order by the average price.
SELECT AVG(price), Flavor, COUNT(GId) 
FROM 
	goods GROUP BY Flavor 
HAVING 
	COUNT(GId) > 3 
ORDER BY
	AVG(price);

-- BAKERY-2 Find the total amount of money the bakery earned in October 2007
-- from selling eclairs. Report just the amount.
SELECT SUM(PRICE) From items
INNER JOIN
	goods on items.Item = goods.GId
INNER JOIN 
	receipts on receipts.RNumber = items.Receipt
WHERE
	MONTH(SaleDate) = 10 AND
    YEAR(SaleDate) = 2007 AND
    Food = 'Eclair';

-- BAKERY-3 Report all days on which more than ten tarts were purchased, sorted
-- in chronological order.
SELECT SaleDate, COUNT(GId) FROM receipts
INNER JOIN 
	items on items.Receipt = receipts.RNumber
INNER JOIN
	goods on goods.GId = items.Item 
GROUP BY
	SaleDate
HAVING COUNT(GId) > 10;

-- CSU-1 For each campus that averaged more than $2500 in fees between 2000
-- and 2005 (inclusive), report the total cost of fees for this six year period.
-- Sort in ascending order by fee.
SELECT DISTINCT Campus, AVG(fee) FROM campuses
INNER JOIN
	fees on fees.CampusId = campuses.Id
WHERE fees.Year <= 2005 AND fees.Year >= 2000
GROUP BY 
	Campus
HAVING 
	AVG(fee) > 2500
ORDER BY 
	AVG(fee) ASC;

SELECT * FROM campuses
INNER JOIN
	fees on fees.CampusId = campuses.Id
GROUP BY 
	Campus;

-- CSU-2 For each campus for which data exists for more than 60 years, report
-- the average, the maximum and the minimum enrollment (for all years).
-- Sort your output by average enrollment.
SELECT Campus, MAX(Enrolled), MIN(Enrolled), AVG(Enrolled) FROM enrollments
INNER JOIN
	campuses on campuses.Id = enrollments.CampusId
GROUP BY
	CampusId
HAVING
	(MAX(enrollments.Year) - MIN(enrollments.Year)) > 60
ORDER BY
	AVG(Enrolled) ASC;

-- CSU-3 For each campus in LA and Orange counties report the total number
-- of degrees granted between 1998 and 2002 (inclusive). Sort the output
-- in descending order by the number of degrees.
SELECT Campus, SUM(degrees) FROM degrees 
INNER JOIN 
	campuses on degrees.CampusID = campuses.Id
    WHERE County = 'Los Angeles' OR County = 'Orange' AND (degrees.year > 1997 AND degrees.year <  2003)
GROUP BY
	CampusId
ORDER BY
	SUM(degrees) DESC;

-- CSU-4 For each campus that had more than 20000 enrolled students in 2004
-- report the number of disciplines for which the campus had non-zero
-- graduate enrollment. Sort the output in alphabetical order by the
-- name of the campus. (This query should exclude campuses that had
-- no graduate enrollment at all).
SELECT Campus, COUNT(Discipline) FROM enrollments 
INNER JOIN
	campuses on campuses.Id = enrollments.CampusId
INNER JOIN
	discEnr on discEnr.CampusId = enrollments.CampusId
WHERE
	enrollments.Year = 2004 AND Enrolled > 20000 AND GR > 0
GROUP BY
	enrollments.CampusId
ORDER BY Campus;

-- AIRLINES-1 Find all airports with exactly 17 outgoing flights. Report airport code
-- and the full name of the airport sorted in alphabetical order by the
-- code.
SELECT Campus, COUNT(Discipline) FROM enrollments 
INNER JOIN
	campuses on campuses.Id = enrollments.CampusId
INNER JOIN
	discEnr on discEnr.CampusId = enrollments.CampusId
WHERE
	enrollments.Year = 2004 AND Enrolled > 20000 AND GR > 0
GROUP BY
	enrollments.CampusId
ORDER BY Campus;

-- AIRLINES-2 Find the number of airports from which airport ANP can be reached
-- with exactly one transfer. (make sure to exclude ANP itself from the
-- count). Report just the number.


-- AIRLINES-3 For each airline report the total number of airports from which it has
-- at least one outgoing flight. Report the full name of the airline and
-- the number of airports computed. Report the results sorted by the
-- number of airports in descending order.
SELECT NAME, COUNT(DISTINCT Destination) FROM flights
INNER JOIN
	airlines on airlines.Id = flights.Airline
GROUP BY Airline
ORDER BY COUNT(DISTINCT Destination) DESC;