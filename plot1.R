source("io.R")

dataset.url <- paste(
    c("https://d396qusza40orc.cloudfront.net",
      "exdata%2Fdata%2Fhousehold_power_consumption.zip"),
    collapse="/")
data <- loadProjectData(dataset.url)

png("plot1.png")

hist(
    data$Global_active_power,
    col="red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)")

dev.off()
