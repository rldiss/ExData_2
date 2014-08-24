# create plot showing total emissions from coal combustion-related sources
plot4 <- function() {
  # read raw data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # create total emissions by year
  agg <- aggregate(NEI$Emissions[NEI$SCC=="10100101"], by=list(year=NEI$year[NEI$SCC=="10100101"]), FUN=sum, na.rm=TRUE)
  # make plot of total coal combustion-related emissions by year
  png("plot4.png", height=480, width=480)
  plot(agg$year, agg$x, xlab="Year", ylab="Tot Coal Combustion-related Emissions")
  dev.off()
}