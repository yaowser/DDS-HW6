# DDS-HW6
This depository is Homework 6 for Doing Data Science 6306 Section 401 Tuesdays at 9:30 - 11:00 PM EST, Cohort 2017 Spring semester at SMU -- "DDS-HW6" for short. Authors: Yao Yao, Jason Cessna, Steven Stevenson. This project was submitted through GitHub on RStudio version 1.0.136.

There are 4 directories in this depository: Data, Analysis, Paper, and Other

# Reason for analysis

The log-log scatter plot of 1-, 2-, and 3-family homes in Queens for more than $100,000 was analyzed to show a density distribution of price vs total square feet. More could be found in the .pdf located in the paper directory.

# Data directory:

We have the original data set from http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page, where data was retrieved for last 12 months of rolling sales for Queens. "rollingsales_queens.xls" was then converted into "rollingsales_queens.csv" and both are attached.

"Queens Rolling Sales Gather.R" has the working directory as ./Data where we gathered the data

There are variable descriptions for all the data manipulated for this project in "Data Variable Descriptions Used in Project.Rmd". That file was then knitted as a .pdf for version control.

"Queens Rolling Sales Clean.R" cleaned the data and is run after the gathering process

"Queens Rolling Sales Makefile.txt" is the full composition of the R code from beginning to end, which combined the gather, clean, and analysis procedures.

"qns.csv" is the raw gathered file from reading the original "rollingsales_queens.csv" file, generated from "Queens Rolling Sales Gather.R"

"qns.sale.csv" is the cleaned data that distinguishes the buildings for sale from "qns.csv", generated from "Queens Rolling Sales Clean.R"

"qns.homes.csv" is the cleaned data that distinguishes the 1-, 2-, and 3-family homes from "qns.sale.csv" to perform the analysis, generated from "Queens Rolling Sales Analysis.R"

# Analysis directory:

"Queens Rolling Sales Analysis.R" was the code that analyzed the data after it was gathered and cleaned.

# Paper Directory:

"Queens Rolling Sales.Rmd" is the original .rmd file that was knitted to combine annotation with code and conclusions.

"Queens_Rolling_Sales.pdf" is the final knitted file that combined the complete code with annotation and conclusions from analysis.

"plyr_1.8.4.tar.gz" is the plyr library version used for the R code.

"gdata_2.17.0.tar.gz" is the plyr library version used for the R code.

# Other Directory:

"Queens Rolling Sales Complete.R" is the complete R file with gather, clean, and analysis together

"Queens Rolling Sales Makefile Original.txt" is the original makefile from the assignment

"R_rollingsales_brooklyn.txt" is the original text file containing the R code from the assignment

"rollingsales_bronx_clean.csv" is how a cleaned data set looks like after the clean code is ran

"rollingsales_brooklyn.csv" is the original excel sheet from the assignment to accompany the original R code from the assignment
