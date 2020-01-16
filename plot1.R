NEI <- readRDS("summarySCC_PM25.rds")
png(filename = "plot1.png")
Emissiontable = tapply(NEI$Emissions,NEI$year,sum)
plot(as.numeric(names(Emissiontable)),Emissiontable, ylab = "PM2.5 emissions",
                                                     xlab= "Year",
                                                     ylim=c(0,7500000),
                                                     main = "US Total PM2.5 Emissions",
                                                     pch = 19)
dev.off()
