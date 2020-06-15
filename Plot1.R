## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at both the datasets
head(NEI)
head(SCC)

## Fetching sum of emissions from all sources for each year
sumdata <- with(NEI, tapply(Emissions, year, sum, na.rm = TRUE))

## Creating a data frame to store the sumdata in a tabular form
sumdatadf <- data.frame(Year = names(sumdata), Total.Sum = sumdata)

## Plotting the base plot
png('plot1.png')

barplot(sumdatadf$Total.Sum, main = "Total PM2.5 emission from all sources for each years", 
        names.arg = c(1999, 2002, 2005, 2008), xlab = "Year", ylab = "Total Emission")

dev.off()