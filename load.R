library(dplyr)
library(lubridate)
source("io.R")

loadProjectData <- function() {
    dataset.url <- paste(
        c("https://d396qusza40orc.cloudfront.net",
          "exdata%2Fdata%2Fhousehold_power_consumption.zip"),
        collapse="/")
    dataset.filename <- downloadData(dataset.url)

    readData(dataset.filename, "household_power_consumption.txt") %>%
        tbl_df %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(
            Date = dmy(Date),
            Time = hms(Time),
            DateTime = Date + Time,
            Global_active_power = as.numeric(Global_active_power),
            Global_reactive_power = as.numeric(Global_reactive_power),
            Voltage = as.numeric(Voltage),
            Sub_metering_1 = as.numeric(Sub_metering_1),
            Sub_metering_2 = as.numeric(Sub_metering_2),
            Sub_metering_3 = as.numeric(Sub_metering_3))
}
