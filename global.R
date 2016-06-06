library(googleVis)
library(xlsx)
library(reshape2)
library(dplyr)
library(ggplot2)

#read in the education file and assign it to a dataframe called dfEd
dfEd <- read.csv("education.csv", nrows=60)

#change the columns to pure text (aka "character")
dfEd[,2:3] <- as.data.frame(lapply(dfEd[,2:3], as.character))
#now make the text values numeric
for(i in 2:3) {
  dfEd[,i] <- as.character(dfEd[,i])
}
dfEd[,2:3] <- as.data.frame(lapply(dfEd[,2:3], as.numeric))
#select the desired countries
names(dfEd)[1]<-"Year"
#now put the Ed file into "long" form, using the melt function from package reshape2

dfEd2 <- melt(data=dfEd, id.vars="Year")

#read in the population table
# df_pop_all <- read.xlsx("Pop1.xlsx", sheetIndex=1, endRow=181, colIndex=c(1:10))
# names(df_pop_all)
# df_pop_all2 <- melt(data=df_pop_all,id.vars="Year")

#read in infant mortality
dfInf_Mort <- read.csv("infant mortality.csv", nrows=77)
# dfInf_Mort[,4:5] <- as.character(dfInf_Mort[,i])
# dfInf_Mort[,4:5] <- as.data.frame(lapply(dfInf_Mort[,4:5], as.numeric))
for(i in 6:7) {
  dfInf_Mort[,i] <- as.character(dfInf_Mort[,i])
}
#dfInf_Mort[,6:7] <- as.data.frame(lapply(dfInf_Mort[,6:7], as.character))

dfInf_Mort[,6:7] <- as.data.frame(lapply(dfInf_Mort[,6:7], as.numeric))



#melt infant mortality data "dfInf_Mort2
dfInf_Mort2 <- melt(data=dfInf_Mort, id.vars="year")
names(dfEd2)[1] <- "year"
names(dfEd2)[3] <- "hs_ed"
names(dfInf_Mort2)[3] <- "Inf_mort"

pc_Ed_inf <- left_join(dfEd2, dfInf_Mort2, by=c("year", "variable"))


# p1 <- gvisMotionChart(pc_Ed_inf, idvar="variable", timevar="year")
#  plot(p1)               
#  
 