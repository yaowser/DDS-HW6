# Title: Queens Rolling Sales Gather
# Author: Benjamin Reddy/Yao Steven Jason
# Taken from pages 49-50 of O'Neil and Schutt
# Date: February 21, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

#Working directory is linked on GitHub.
setwd(".\\Data")

# Saved the file as a csv to use read.csv to import the rolling sales for Queens, 
# skipping 4 header lines from the original file.
qns <- read.csv("rollingsales_queens.csv",skip=4,header=TRUE)

#Check the data attributes.
head(qns)
summary(qns)
str(qns)