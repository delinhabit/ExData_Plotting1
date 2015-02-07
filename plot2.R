source("load.R")

data <- loadProjectData()

png("plot2.png")

plot(
    Global_active_power ~ DateTime,
    data = data,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")

invisible(dev.off())
