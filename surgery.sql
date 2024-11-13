/*
	hhs_region int
	county text
	facility text
	measure_name text
	measure_value int
	year int

*/

-- QUERY THAT CREATES texas_surgery TABLE
CREATE TABLE texas_surgery(

	hhs_region int,
	county text,
	facility text,
	measure_name text,
	measure_value int,
	calendar_year int

);

-- CREATES REFORMATED TABLE
CREATE TABLE updated_surgery AS
	SELECT calendar_year, county,
		SUM(measure_value) FILTER (WHERE measure_name = 'Outpatient surgical operations') AS Outpatient_Surgical_Operations,
		SUM(measure_value) FILTER (WHERE measure_name = 'Number of operating rooms') AS Number_Of_Operating_Rooms,
		SUM(measure_value) FILTER (WHERE measure_name = 'Inpatient surgical operations') AS Inpatient_Surgical_Operations
	
	FROM texas_surgery
	GROUP BY calendar_year, county
	ORDER BY calendar_year, county;

-- TABLE THAT SUMS OPERATIONS INTO TEXAS, HARRIS, AND NON-HARRIS
SELECT calendar_year,
	SUM(Outpatient_Surgical_Operations + Inpatient_Surgical_Operations) AS Total_Texas_Operations,
	SUM(Inpatient_Surgical_Operations + Outpatient_Surgical_Operations) FILTER (WHERE county = 'HARRIS') AS Total_Harris_Operations,
	SUM(Inpatient_Surgical_Operations + Outpatient_Surgical_Operations) FILTER (WHERE county != 'HARRIS') AS Total_Non_Harris_Operations,
	ROUND((SUM(Inpatient_Surgical_Operations + Outpatient_Surgical_Operations) / COUNT(DISTINCT(county))),0) AS texas_surgery_average
FROM updated_surgery
GROUP BY calendar_year 
ORDER BY calendar_year;

-- QUERY THAT CALCULATES SURGERIES BY COUNTY BY CALENDAR YEAR
SELECT calendar_year, county, SUM(Outpatient_Surgical_Operations + Inpatient_Surgical_Operations) AS Operations
FROM updated_surgery
GROUP BY calendar_year, county
ORDER BY calendar_year, Operations DESC;

