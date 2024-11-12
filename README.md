# Harris-County-Hospitals

## PURPOSE

The purpose of this project is to help uncover patterns or trends that may not be immediately obvious within Texas' Healthcare Facilities (Hospitals).
## DATA SELECTION

The data used for this project was found on the Texas Department of State Health Services website. From here the following Texas Hospital Data was collected, Facility and Bed Counts, Chairty Care, Surgical Operations, Admissions, Inpatient Days and Length of Stay. The website offered records from 2017 through 2022, but only records from 2017 through 2019 were used. The reason for this being is that in 2022 the world experienced Covid-19. An unprecedented virus that impacted the Healthcare Industry and would have an unusual impact on the numbers recorded for those years specially for Charity Care, Surgical Operations and Admissions.


This section should provide an overview of the data sources, variables, and measures, as well as the data cleaning, processing, and transformation steps
#### ADMISSIONS
From the original data set the following columns were found in the set, County, Facility, Measure Name, Measure Value, and Year. Under the Measure Name column there were three distinct column values, Inpatient Days, Average Length of Stay, and Admissions. Because of the different values in the Measure Name column there were repeating values under the Facility column and by extension multiple repeating County column values. In short, a facility would occupy three different rows due to the three different Measure Name values. To make this data set more sufficient a query was ran where each Measure Name value was made into a new column where the corresponding Measure Value was assigned. This in turn deleted repeating Measure Name values into only one instance with the correspoding Measure Name made into a column.

For this analysis the only data needed was the Admissions for each County in Texas. A seperate quary was ran where all the additions were added and grouped by the County the facility recides in. They were also grouped by the calendar year.

#### BEDS

From the original data set the following columns were found, County, City, HHS_Region, Facility, Ownership Type, Metro Status, License Type, License Bed, and Calendar Year. For this analysis only the quantity of beds were necessary. A query was ran to sum up the quantity of beds in each County for each Calendar Year.


#### CHARITY

From the original data set the following columns were found, HHS_Region, County, Facility, Measure Name, Measure Value, and Calendar Year. Within the Measure Name column there were five distinct values given, Total Uncompensated Care, Total Net Patient Revenue, Total Gross Patient Revenue, Total Charity Care Charges, and Total Bad Debt Charges. To make this data set more efficient and easier to read a query was ran to make each of the five distinct measure name values into their own columns with the appropriate measure value.

For this analysis only the Total Uncompensated Care data was needed. The Total Uncompensated Care is defined as, 'Care for which no payment is expected or no charge is given. It is the sum of bad debt and charity care taken in  by a hosputal or other health care organization in providing medical care to patients who are uninsured or are unable to pay.'. It is for this reason that this measure is the most important to define as 'Charity'. A query was ran to add up all Total Uncompensated Care given by facilities within a county within a given year.


#### SURGERY

From the Surgery Data Set the following columns were found, HHS_Region, County, Facility, Measure Name, Measure Value, and Calendar Year. Under the Measure Name column there were three distinct values which are, Outpatient Surgical Operations, Number of Operating Rooms, and Inpatient Surgical Operations. To make this data set more efficient and easier to read a query was ran to make each of the three distinct measure name values into their own columns with corresponding measure value.

For this analsis the amount of surgeries was needed. To accomplish this Outpatient Surgical Operations and Inpatient Surgical Operations were added together for each County and Calendar Year.

## METHODS

#### ADMISSIONS

The Bar Chart was used for admmissions for side by side comparisons between the Top 5 Texas Counties with the most admissions per year. Aside from being the same Counties and the same rank between 2017 and 2019, one thing that stuck out was how many more admissions Harris County had compared to the other four. One reason this my be the case is due to the population size of Harris. In 2023, Harris County had a population above 4 million. The 2nd rank Admission's county was Dallas County, which in 2023 had a population of 2 million. This double in population size can also be seen in the double of amount of admissions Harris County has compared to Dallas County.
  
#### BEDS

The Scatter Plot chart has two variables, Beds and Total Uncompensated Care (Charity). This chart is helpful in spotting possible correlations and outliers. From the chart you can see the trend that the more beds a county has the more Total Uncompensated Care (Charity) they will have. Using the two variables, Beds and Total Uncompensated Care, a few outliers pop up, mainly five of them. Upon further research, these five are the biggest counties in the state. This is due to the location of these five counties being near the most populous cities of Texas. Which are Houston, Dallas, San Antonio and Texas.

#### CHARITY

The Histogram Chart is useful for this case to show the distribution of Total Uncompensated Care in Texas per County. With this graph we were able to recognize that nearly half of Texas's Total Uncompensated Care is spread amoung five Counties.

#### SURGERY

The Pie Chart was used because it helps visualize the percentage of Harris County surgeries in the state of Texas.
## FINDINGS

A pattern that kept popping up is the correlation between a County's Population vs a County's Measurement. Take for example the Admissions Chart. In 2019, Harris County had double the amount of Admissions compared to Dallas County, the 2nd Rank for that year. During this year, Harris County also had double the population of Dallas County, with Harris County having about 4 million people and Dallas having 2 million people. Since Harris County has such a major difference in population compared to other Counties in Texas, their yearly numbers for Admissions, Beds, Total Uncompensated Care and Surgeries will be higher than the rest.

## DASHBOARD
[Dashboard Link](https://public.tableau.com/app/profile/agustin.garcia3499/viz/HarrisCompare/Pie)


![Dashboard](https://github.com/user-attachments/assets/85a3a6ae-ac55-40b9-b3fe-e418d098f0f6)
