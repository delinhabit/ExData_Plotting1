source("io.R")

loadProjectData <- function(url, filename = "household_power_consumption.txt") {
    dataset.filename <- downloadData(url)

    readData(dataset.filename, filename) %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(
            Date = dmy(Date),
            Time = hms(Time),
            Global_active_power = as.numeric(Global_active_power),
            Global_reactive_power = as.numeric(Global_reactive_power))
}