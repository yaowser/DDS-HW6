# Title: Queens Rolling Sales Clean
# Author: Benjamin Reddy/Yao Steven Jason
# Taken from pages 49-50 of O'Neil and Schutt
# Date: February 21, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

#require(gdata)
#require(plyr) #Added by Monnie McGee
#install the gdata and plyr packages and load in to R.
library(plyr)
library(gdata)

#Using libraries gdata and plyr, clean/format the data with regular expressions.
#Using "[^[:digit:]]", we are only keeping and converting the numericals for new column names sale.price, gross.sqft, and land.sqft.
#Column name year.built is converted to numeric.
#Using gsub, we replaces nonnumericals with a missing values.
#The number of empty values are then counted.
#The row names of dataset qns are then converted into lowercase.
qns$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", qns$SALE.PRICE))
count(is.na(qns$SALE.PRICE.N))

names(qns) <- tolower(names(qns)) # make all variable names lower case
#Get rid of leading digits
qns$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", qns$gross.square.feet))
qns$land.sqft <- as.numeric(gsub("[^[:digit:]]","", qns$land.square.feet))
qns$year.built <- as.numeric(as.character(qns$year.built))