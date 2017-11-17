#Output
#Unemployment
#Inflation
#Real Interest

setwd("/Projects/Research/us_model/us_model/us_model")
library("vars")
import_csv <- read.csv('us_model.csv', stringsAsFactors = FALSE)  # read csv file 
#summary(import_csv)
#Adjust variables#
log_gdp <-log(import_csv$GDP_Y)
log_pie <-log(import_csv$Inflation)
unemp <-import_csv$Unemployment
nom_interest <-import_csv$Nominal_Interest_Rate
#Set timeseries#
us_model <-cbind(log_gdp,log_pie,unemp,nom_interest)
us_model.data <-ts(us_model,start=2000,frequency = 4)
us_model.data


plot(us_model.data$unemp,us_model.data$log_pie)

plot(us_model.data, nc=1, xlab = "Year") #plot to see timeseries

#Reorder so ...
#us_emp <- us_emp[, c("prod", "log_e", "U", "rw")]
#us_emp

#Run VAR#
p1ct <- VAR(us_model.data, p = 2, type = "both")
p1ct

