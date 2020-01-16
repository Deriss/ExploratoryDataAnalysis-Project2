NEI = readRDS("summarySCC_PM25.rds")
BaltimoreData = subset(NEI, fips == "24510")
aggregated = tapply(BaltimoreData$Emissions, BaltimoreData$year,sum)
png(filename = "plot2.png")
plot(as.numeric(names(aggregated)), aggregated, ylab = "PM2.5 emissions", 
                                                xlab= "Year", 
                                                main = "Baltimore Total PM2.5 Emissions",
                                                pch=19, 
                                                ylim = c(0,3300))   
dev.off()