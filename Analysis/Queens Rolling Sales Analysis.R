# Title: Queens Rolling Sales Analysis
# Author: Benjamin Reddy/Yao Steven Jason
# Taken from pages 49-50 of O'Neil and Schutt
# Date: February 21, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

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

write.csv(qns, "qns.csv")
write.csv(qns.sale, "qns.sale.csv")
write.csv(qns.homes, "qns.homes.csv")