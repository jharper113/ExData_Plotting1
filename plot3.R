#  Coursera Class 4: Exploratory Graphs
#  Project 1 Script
#  PLOT 3
# --------------------------------------

# Intialization
    suppressWarnings(try(rm(list=ls()),silent=TRUE))   #clears the workspace
    WorkOrHome <- "home"  # "work" or "home"

# Set working directory
    #homedir <- "/Users/harper/Dropbox/03_School/Coursera_04_ExploratoryDataAnalysis/homework1"
    #workdir <- "c:/Users/jharper/Dropbox/03_School/Coursera_04_ExploratoryDataAnalysis/homework1"
    #ifelse(WorkOrHome == "home", 
    #       setwd(homedir),  #mac directory  
    #       setwd(workdir))  #work directory  

# Load the data and clean it for subsetting
    # TIPS FOR LARGE DATA SETS:
    #     limit number of rows using nrows parameter
    #     specify the classes for each column to speed things up
    #     set NA value  (here, equal to ?)
    #     set comment.char = ""  (if there are no comments)
    dataset <- read.csv("./household_power_consumption.txt", 
                        sep=";", 
                        header = TRUE,
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                        comment.char = "",
                        na.strings="?")

# subset "character" date first, combine date and tiem, then convert to POSIXlt
    dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
    dataset$TimeStamp <- paste(dataset$Date, dataset$Time)
    dataset$TimeStamp <- strptime(x=dataset$TimeStamp, format = "%d/%m/%Y %H:%M:%S")  

# plot the data
    plot(
      x = dataset$TimeStamp,
      y = dataset$Sub_metering_1,  
      type = "l",  #stands for "line graph"
      xlab = "",  # removes the xlable
      ylab = "Energy sub metering"
    )
    # add more line plots 
    lines(x = dataset$TimeStamp, y = dataset$Sub_metering_2, col = "red")
    lines(x = dataset$TimeStamp, y = dataset$Sub_metering_3, col = "blue")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1,
           #cex = .8,
           col = c("black","red","blue"))

# Re-Plot the data and output to file
    png(filename = "plot3.png") 
    plot(
      x = dataset$TimeStamp,
      y = dataset$Sub_metering_1,  
      type = "l",  #stands for "line graph"
      xlab = "",  # removes the xlable
      ylab = "Energy sub metering"
    )
    lines(x = dataset$TimeStamp, y = dataset$Sub_metering_2, col = "red")
    lines(x = dataset$TimeStamp, y = dataset$Sub_metering_3, col = "blue")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1,
           #cex = .8,
           col = c("black","red","blue"))
    dev.off()  #important!!!



