# Harris-County-Hospitals

## PURPOSE

## DATA SELECTION

The data used for this project was found on the Texas Department of State Health Services website. From here the following Texas Hospital Data was collected, Facility and Bed Counts, Chairty Care, Surgical Operations, Admissions, Inpatient Days and Length of Stay. The website offered records from 2017 through 2022, but only records from 2017 through 2019 were used. The reason for this being is that in 2022 the world experienced Covid-19. An unprecedented virus that impacted the Healthcare Industry and would have an unusual impact on the numbers recorded for those years specially for Charity Care, Surgical Operations and Admissions.


This section should provide an overview of the data sources, variables, and measures, as well as the data cleaning, processing, and transformation steps
#### ADMISSIONS
From the original data set the following columns were found in the set, County, Facility, Measure Name, Measure Value, and Year. Under the Measure Name column there were three distinct column values, Inpatient Days, Average Length of Stay, and Admissions. Because of the different values in the Measure Name column there were repeating values under the Facility column and by extension multiple repeating County column values. In short, a facility would occupy three different rows due to the three different Measure Name values. To make this data set more sufficient a query was ran where each Measure Name value was made into a new column where the corresponding Measure Value was assigned. This in turn deleted repeating Measure Name values into only one instance with the correspoding Measure Name made into a column.

For this analysis the only data needed was the Admissions for each County in Texas. A seperate quary was ran where all the additions were added and grouped by the County the facility recides in. They were also grouped by the calendar year.

#### BEDS

From the original data set the following columns were found, County, City, HHS_Region, Facility, Ownership Type, Metro Status, License Type, License Bed, and Calendar Year. For this analysis only the quantity of beds were necessary. A query was ran to sum up the quantity of beds in each County for each Calendar Year.


#### CHARITY



## METHODS

#### ADMISSIONS
#### BEDS
#### CHARITY
#### SURGERY

## FINDINGS

## DASHBOARD
[Dashboard Link](https://public.tableau.com/app/profile/agustin.garcia3499/viz/HarrisCompare/Pie)
![Dashboard](https://github.com/user-attachments/assets/85a3a6ae-ac55-40b9-b3fe-e418d098f0f6)
