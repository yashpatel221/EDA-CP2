## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Looking at both the datasets
head(NEI)
head(SCC)


## Merging NEI amd SCC by SCC column
mergeData <- merge(NEI, SCC, by = "SCC")
head(mergeData)

## Finding data from mergeData with "Short.Name" column containing the word "coal"
coalMatches  <- grepl("coal", mergeData$Short.Name, ignore.case=TRUE)


## Fetching data from mergeData with "Short.Name" column containing the word "coal"
mergeDataSub <- mergeData[coalMatches, ]


## Calculating the sum of Emissions for each year in mergedData
sumdata <- with(mergeDataSub, tapply(Emissions, year, sum, na.rm = TRUE))


## Creating the data frame and storing the sum of emissions of each year in tabular form
sumdatadf <- data.frame(Year = names(sumdata), Total.Sum = sumdata)


## Plotting the graph
png('plot4.png')

barplot(sumdatadf$Total.Sum, main = "Emissions from coal combustion-related sources",
        names.arg = c(1999, 2002, 2005, 2008), xlab = "Year", ylab = "Total Emission")

dev.off()