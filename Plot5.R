## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at both the datasets
head(NEI)
head(SCC)


## Fetching data of motor vehicles for Baltimore City, Maryland
baltimoreData <- subset(NEI, fips == "24510" & type == "ON-ROAD")
head(baltimoreData)


## Calculating the sum of Emissions for each year in baltimoreData
sumdata <- with(baltimoreData, tapply(Emissions, year, sum, na.rm = TRUE))
head(sumdata)


## Creating the data frame and storing the sum of emissions of each year in tabular form
sumdatadf <- data.frame(Year = names(sumdata), Total.Sum = sumdata)


## Plotting the graph
png('plot5.png')

barplot(sumdatadf$Total.Sum, main = "Emissions from motor vehicle sources in Baltimore City",
        names.arg = c(1999, 2002, 2005, 2008), xlab = "Year", ylab = "Total Emission")

dev.off()