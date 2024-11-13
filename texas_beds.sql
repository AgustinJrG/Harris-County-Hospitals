/*

	county - text
	city - text
	hhs_region - int
	facility - text
	ownership - text
	metro_status - text
	license_type - text
	license_bed - text
	licensed_beds - int
	year - int

*/


-- QUERY THAT CREATES texas_beds TABLE
CREATE TABLE texas_beds(

	county text,
	city text,
	hhs_region int,
	facility text,
	ownership text,
	metro_status text,
	license_type text,
	license_bed text,
	licensed_beds int,
	calendar_year int

);

-- QUERY THAT CALCULATES THE DIFFERENT BEDS FOR EACH CALENDAR YEAR
SELECT calendar_year,
	SUM(licensed_beds) AS total_licensed_beds,
	SUM(licensed_beds) FILTER (WHERE county = 'HARRIS') AS total_harris_licensed_beds,
	SUM(licensed_beds) FILTER (WHERE county != 'HARRIS') AS total_non_harris_licensed_beds,
	ROUND((SUM(licensed_beds) / COUNT(DISTINCT(county))),0) AS texas_beds_average
FROM texas_beds
GROUP BY calendar_year
ORDER BY calendar_year;

-- QUERY THAT CALCULATES THE AMOUNT OF BEDS PER COUNTY PER YEAR
SELECT calendar_year, county, SUM(licensed_beds) AS beds
FROM texas_beds
GROUP BY calendar_year, county
ORDER BY calendar_year, beds DESC;