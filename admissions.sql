/*

	county - text
	facility - text
	measure_name - text
	measure_value - int
	year - int



*/

-- QUERY CREATING texas_admissions TABLE
CREATE TABLE texas_admissions(

	county text,
	facility text,
	measure_name text,
	measure_value int,
	calendar_year int

);

-- CREATES TABLE THAT IS FORMATTED TO MAKE DISTINCT measure_name values INTO INDIVIDUAL COLUMNS
CREATE TABLE updated_admissions AS
	SELECT calendar_year, county ,facility,
		MAX(measure_value) FILTER (WHERE measure_name = 'Inpatient Days') AS Inpatient_Days,
		MAX(measure_value) FILTER (WHERE measure_name = 'Average Length of Stay') AS Average_Length_of_Stay,
		MAX(measure_value) FILTER (WHERE measure_name = 'Admissions') AS Admissions
	FROM texas_admissions
	GROUP BY calendar_year, facility, calendar_year, county
	ORDER BY calendar_year, facility, calendar_year, county;

-- QUERY THAT CALCULATES YEARLY HARRIS ADMISSIONS
SELECT calendar_year,
	SUM(admissions) AS total_admissions,
	SUM(admissions) FILTER (WHERE county = 'HARRIS') AS total_harris_admissions,
	SUM(admissions) FILTER (WHERE county != 'HARRIS') AS total_non_harris_admissions,
	ROUND((SUM(admissions) / COUNT(DISTINCT(county))),0) AS texas_admissions_average,
	COUNT(DISTINCT(county)) AS number_county
FROM updated_admissions
GROUP BY calendar_year
ORDER BY calendar_year;

-- QUERY THAT CALCULATES ADMISSIONS PER COUNTY PER YEAR
SELECT calendar_year, county, SUM(admissions) AS total_admissions
FROM updated_admissions
GROUP BY calendar_year, county
ORDER BY calendar_year, total_admissions DESC;
