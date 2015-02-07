source("load.R")

dataset.url <- paste(
    c("https://d396qusza40orc.cloudfront.net",
      "exdata%2Fdata%2Fhousehold_power_consumption.zip"),
    collapse="/")
data <- loadProjectData(dataset.url)

png("plot2.png")

plot(
    Global_active_power ~ DateTime,
    data = data,
    type="l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")

invisible(dev.off())
