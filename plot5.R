# create plot showing total emissions by year
plot5 <- function() {
  # read raw data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # merge the two together
  m <- merge(NEI, SCC, by="SCC")
  # create total emissions by year
  agg <- aggregate(NEI$Emissions[m$fips=="24510" & (m$EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | m$EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" | m$EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" | m$EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles")], by=list(year=NEI$year[m$fips=="24510" & (m$EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | m$EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" | m$EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" | m$EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles")]), FUN=sum, na.rm=TRUE)
  # make plot of total emissions by year
  png("plot5.png", height=480, width=480)
  plot(agg$year, agg$x, xlab="Year", ylab="Baltimore Motor Vehicle Emissions")
  dev.off()
}