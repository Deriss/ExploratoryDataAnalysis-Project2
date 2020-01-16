NEI = readRDS("summarySCC_PM25.rds")
BaltimoreData = subset(NEI, fips == "24510")
#reshaping data
library(reshape2)
meltdata = melt(BaltimoreData, id = c("type","year"),measure.vars = "Emissions")
plotdata = dcast(meltdata,type + year ~ variable, fun.aggregate = sum)
#plot with ggplot2
library(ggplot2)
png(filename = "plot3.png")
qplot(year,Emissions, data = plotdata,
                     color = type, 
                     geom = c("point","line"),
                     main = "Baltimore PM2.5 Emissions",
                     ylab = "PM2.5 Emissions")
dev.off()