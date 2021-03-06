downloadData <- function(url, filename = NULL) {
    # Download the data from the provided URL and return the path to the
    # downloaded file.
    #
    # Arguments
    #    url - the URL from wich to download the data file
    #    filename - the optional name of the destination file.
    #         If not provided we will infer the name from the URL
    #
    if (!file.exists("data")) {
        dir.create("data")
    }

    if (is.null(filename)) {
        filename <- inferFilenameFromUrl(url)
    }

    destfile = paste(c("data", filename), collapse="/")
    if (!file.exists(destfile)) {
        download.file(url, destfile = destfile, method = "curl")
    }

    destfile
}

inferFilenameFromUrl <- function(url) {
    # Infer the filename from the provided URL
    # Handles properly normal filenames but also urlencoded paths
    parts <- strsplit(url, "/", fixed = T)[[1]]
    filename.part <- parts[[length(parts)]]

    filename.parts <- strsplit(URLdecode(filename.part), "/", fixed = T)[[1]]
    filename <- filename.parts[[length(filename.parts)]]
    gsub(" ", "_", filename)
}

readData <- function(zipFilename, filename) {
    # Read the data located in the provided file inside the zip archive.
    #
    # Arguments:
    #    zipFilename - the name of the zip file containing data files
    #    filename - the name of the data file inside the zip
    #
    # Examples:
    # readData("data/household_power_consumption.zip",
    #          "household_power_consumption.txt")
    #
    conn <- unz(zipFilename, filename = filename)
    read.csv2(conn, dec = ".", stringsAsFactors = FALSE)
}
