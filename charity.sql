/*

	hhs_region int
	county text
	facility text
	measure_name text
	measure_value bigint
	year int

*/

-- QUERY THAT CREATES texas_charity TABLE
CREATE TABLE texas_charity(

	hhs_region int,
	county text,
	facility text,
	measure_name text,
	measure_value bigint,
	calendar_year int


);


SELECT *
FROM texas_charity;

-- PIVOT TABLE
-- QUERY THAT CREATES COLUMNS OUT OF THE DIFFERENT measure_name VALUES. EACH COLUMN WILL HAVE THE APPROPRIATE VALUE.
CREATE TABLE updated_charity AS
	SELECT calendar_year, county,facility,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Uncompensated Care') AS Total_Uncompensated_Care,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Net Patient Revenue') AS Total_Net_Patient_Revenue,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Gross Patient Revenue') AS Total_Gross_Patient_Revenue,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Charity Care Charges') AS Total_Charity_Care_Charges,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Bad Debt Charges') AS Total_Bad_Debt_Charges
	
	FROM texas_charity
	GROUP BY calendar_year, county, facility
	ORDER BY calendar_year, county, facility;


-- QUERY THAT CALCULATES THE TOTAL FOR EACH measure_value VALUE FOR EACH YEAR
SELECT calendar_year, 
	SUM(total_uncompensated_care) AS total_texas_uncompensated_care,
	SUM(total_uncompensated_care) FILTER (WHERE county = 'HARRIS') AS total_harris_uncompensated_care,
	SUM(total_uncompensated_care) FILTER (WHERE county != 'HARRIS') AS total_non_harris_uncompensated_care,
	ROUND((SUM(total_uncompensated_care) / COUNT(DISTINCT(county))),0) AS texas_charity_average,
	COUNT(DISTINCT(county)) AS number_county
FROM updated_charity
GROUP BY calendar_year
ORDER BY calendar_year;


-- QUERY THAT CALCULATES THE total_uncompensated_care FOR EACH COUNTY FOR EACH YEAR
SELECT calendar_year, county, SUM(total_uncompensated_care) AS charity_given
FROM updated_charity
GROUP BY calendar_year, county
ORDER BY calendar_year, charity_given DESC;

