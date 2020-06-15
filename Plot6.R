## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at both the datasets
head(NEI)
head(SCC)


## Fetching data of motor vehicles for Baltimore City and Los Angeles
baltimoreData <- subset(NEI, fips == "24510" & type == "ON-ROAD")
losAngelesData <- subset(NEI, fips == "06037" & type == "ON-ROAD")

## Binding baltimoreData and losAngelesData by row
bothData <- rbind(baltimoreData, losAngelesData)

## Aggregating bothData using sum by year and fips
plotData <- aggregate(Emissions ~ year + fips, bothData, sum)


## Replacing fips value ot city name
plotData[plotData == "06037"] <- "Los Angeles"
plotData[plotData == "24510"] <- "Baltimore"


## Plotting the graph
png('plot6.png')

ggplot(plotData, aes(year, Emissions)) + geom_bar(stat = "identity") + 
        facet_grid(.~fips) + ggtitle("Emissions from motor vehicle sources in Baltimore and L.A.") +
        xlab("Year") + ylab("Total Emissions")

dev.off()