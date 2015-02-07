source("load.R")

data <- loadProjectData()

png("plot4.png")

par(mfrow = c(2, 2))

# Plot at (1, 1)
plot(Global_active_power ~ DateTime, data = data,
    type = "l", xlab = "", ylab = "Global Active Power")

# Plot at (1, 2)
plot(Voltage ~ DateTime, data = data,
     type = "l", xlab = "datetime", ylab = "Voltage")

# Plot at (2, 1)
plot(Sub_metering_1 ~ DateTime,
     data = data,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(Sub_metering_2 ~ DateTime, data = data, col = "red")
lines(Sub_metering_3 ~ DateTime, data = data, col = "blue")
legend(
    "topright",
    lwd = 1,
    bty = "n",
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot at (2, 2)
plot(Global_reactive_power ~ DateTime, data = data,
     type = "l", xlab = "datetime", ylab = "Global reactive power")

invisible(dev.off())
