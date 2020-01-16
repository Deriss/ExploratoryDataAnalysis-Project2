#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find SSC number for coal
library(stringr)
CoalNumbers = grep("Coal", SCC$SCC.Level.Three)
CoalSCC = SCC$SCC[CoalNumbers]

#select rows where SSC number is in CoalSSC
CoalData = subset(NEI,NEI$SCC %in% CoalSCC)

#plot
Coaltable = tapply(CoalData$Emissions, CoalData$year,sum)
png(filename = "Plot4.png")
plot(as.numeric(names(Coaltable)), Coaltable, ylab = "Total PM2.5 emissions",
                                              xlab= "Year",
                                              main = "US Coal related PM2.5 Emissions",
                                              pch=19,
                                              ylim = c(0,600000))   
dev.off()
