# create plot showing total emissions by year for Baltimore, Maryland (fips 24510)
plot2 <- function() {
  # read raw data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # create total emissions by year
  agg <- aggregate(NEI$Emissions[NEI$fips=="24510"], by=list(year=NEI$year[NEI$fips=="24510"]), FUN=sum, na.rm=TRUE)
  # make plot of total emissions by year
  png("plot2.png", height=480, width=480)
  plot(agg$year, agg$x, xlab="Year", ylab="Tot Baltimore Emissions")
  dev.off()
}