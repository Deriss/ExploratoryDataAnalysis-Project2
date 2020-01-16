library(ggplot2)
library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get SCC values related to vehicles
VehicleNumbers = grep("Vehicle",SCC$EI.Sector)
VehicleSCC = SCC$SCC[VehicleNumbers]
#subset for Baltimore
BaltimoreData = subset(NEI, fips == "24510")
Vehicledata = subset(BaltimoreData, BaltimoreData$SCC %in% VehicleSCC)
#Subset for Los Angeles county
LosAngelesData = subset(NEI, fips == "06037")
LAVehicledata = subset(LosAngelesData, LosAngelesData$SCC %in% VehicleSCC)
#merge both subsets
countiesdata = rbind(Vehicledata,LAVehicledata)
#reshape data
meltdata = melt(countiesdata, id = c('fips','year'),measure.vars= 'Emissions')
plotdata = dcast(meltdata, fips + year ~ variable,fun.aggregate = sum )
#plot
png(filename = "Plot6.png")
g = ggplot(data = plotdata, aes(year,Emissions))      
g + 
geom_point(aes(colour = fips)) + 
geom_line(aes(colour = fips)) + 
scale_colour_discrete(name = "County",labels = c("Los Angeles County","Baltimore")) + 
labs(y= 'Vehicle PM2.5 Emissions', title= 'PM 2.5 Vehicle Emissions Comparison')
dev.off()
