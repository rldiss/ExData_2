# create plot showing total emissions by year
plot1 <- function() {
  # read raw data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # create total emissions by year
  agg <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum, na.rm=TRUE)
  # make plot of total emissions by year
  png("plot1.png", height=480, width=480)
  plot(agg$year, agg$x/1000000, xlab="Year", ylab="Tot Emissions (millions)")
  dev.off()
}