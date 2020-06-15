## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at both the datasets
head(NEI)
head(SCC)

## Fetching data for Baltimore City, Maryland
baltimoreData <- subset(NEI, fips == "24510")
head(baltimoreData)


## Aggregating baltimoreData using sum by year and type
plotData <- aggregate(Emissions ~ year + type, baltimoreData, sum)


## Plot
png('plot3.png')

qplot(year, Emissions, data = plotData, color = type, geom = "smooth")

dev.off()