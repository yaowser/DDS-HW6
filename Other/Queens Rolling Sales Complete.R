# Author: Benjamin Reddy/Yao Steven Jason
# Taken from pages 49-50 of O'Neil and Schutt

#require(gdata)
#require(plyr) #Added by Monnie McGee
#install the gdata and plyr packages and load in to R.
#Working directory is locally linked and pushed to GitHub.
library(plyr)
library(gdata)
setwd(".\\Data")

# Saved the file as a csv to use read.csv to import the rolling sales for Queens, 
# skipping 4 header lines from the original file.
qns <- read.csv("rollingsales_queens.csv",skip=4,header=TRUE)

#split gather and clean?

#Check the data attributes.
head(qns)
summary(qns)
str(qns) # Very handy function!

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

#split between clean and analysis?

#We attach the data set qns to the new column sale.price.n to make a histogram on frequency.

attach(qns)
hist(sale.price.n) 
detach(qns)

#Keep only the sales if they are not equal to 0, meaning that they were sold.
#We plot the scatterplot of gross sqft vs sale price and the log(gross sqft) vs log(sale price).
#The log-log plot fits the data better, so that is used for future scatter plots.

qns.sale <- qns[qns$sale.price.n!=0,]
plot(qns.sale$gross.sqft,qns.sale$sale.price.n)
plot(log10(qns.sale$gross.sqft),log10(qns.sale$sale.price.n))

#For now, let's look at 1-, 2-, and 3-family homes.
#A new column homes is formed where we are searching the word 'Family' from building class category to filter the sale price for 1-, 2-, and 3-family homes.
#Dimensions of homes is checked.
#The log-log plot of gross sqft and sale price is plot for 1-, 2-, and 3-family homes.
#The summary output of family homes less than price 100,000 is made.
qns.homes <- qns.sale[which(grepl("FAMILY",qns.sale$building.class.category)),]
dim(qns.homes)
plot(log10(qns.homes$gross.sqft),log10(qns.homes$sale.price.n))
summary(qns.homes[which(qns.homes$sale.price.n<100000),])


#Remove outliers that seem like they weren't actual sales.
#If the log of family homes is less or equal to 5, these are outliers.
#Only the family homes where it is not outliers are kept.
#The log-log scatter plot of gross sqft vs sale price are plotted.
qns.homes$outliers <- (log10(qns.homes$sale.price.n) <=5) + 0
qns.homes <- qns.homes[which(qns.homes$outliers==0),]
plot(log10(qns.homes$gross.sqft),log10(qns.homes$sale.price.n))

