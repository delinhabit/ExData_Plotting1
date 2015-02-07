source("load.R")

dataset.url <- paste(
    c("https://d396qusza40orc.cloudfront.net",
      "exdata%2Fdata%2Fhousehold_power_consumption.zip"),
    collapse="/")
data <- loadProjectData(dataset.url)

png("plot3.png")

plot(
    Sub_metering_1 ~ DateTime,
    data = data,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering",
    col = "black")
lines(Sub_metering_2 ~ DateTime, data = data, col = "red")
lines(Sub_metering_3 ~ DateTime, data = data, col = "blue")
legend(
    "topright",
    lwd = 1,
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

invisible(dev.off())
