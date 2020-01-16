library(ggplot2)
library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

VehicleNumbers = grep("Vehicle",SCC$EI.Sector)
VehicleSCC = SCC$SCC[VehicleNumbers]
BaltimoreData = subset(NEI, fips == "24510")
Vehicledata = subset(BaltimoreData, BaltimoreData$SCC %in% VehicleSCC)
table = tapply(Vehicledata$Emissions, Vehicledata$year,sum)
png(filename = "Plot5.png")
plot(as.numeric(names(table)),table,ylab = "Total PM2.5 emissions",xlab= "Year",main = "Baltimore Vehicle related PM2.5 Emissions",pch=19, ylim  = c(0,400))   
dev.off()
     