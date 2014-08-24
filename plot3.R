# create plot showing total emissions by type and year for Baltimore, Maryland (fips 24510)
plot3 <- function() {
  library(ggplot2)
  # read raw data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # make a factor out of the emission type column
  NEI$ftype <- factor(NEI$type)
  # create total emissions by year
  agg <- aggregate(NEI$Emissions[NEI$fips=="24510"], by=list(year=NEI$year[NEI$fips=="24510"],type=NEI$ftype[NEI$fips=="24510"]), FUN=sum, na.rm=TRUE)
  # make plot of total emissions by year
  qplot(year, x, data = agg, facets = . ~ type, ylab="Emissions")
  ggsave("plot3.png", height=3.6, width=8, dpi=100)
}
