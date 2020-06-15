## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at both the datasets
head(NEI)
head(SCC)

## Fetching data for Baltimore City, Maryland
baltimoreData <- subset(NEI, fips == "24510")
head(baltimoreData)

## Fetching sum of emissions from all sources for each year for Baltimore
sumdata <- with(baltimoreData, tapply(Emissions, year, sum, na.rm = TRUE))
sumdata

## Creating a data frame to store the sumdata in a tabular form
sumdatadf <- data.frame(Year = names(sumdata), Total.Sum = sumdata)
sumdatadf

## Plotting the base plot
png('plot2.png')

barplot(sumdatadf$Total.Sum, main = "Total PM2.5 emissions in the Baltimore City", 
        names.arg = c(1999, 2002, 2005, 2008), xlab = "Year", ylab = "Total Emission")

dev.off()