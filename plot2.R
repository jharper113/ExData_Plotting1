#  Coursera Class 4: Exploratory Graphs
#  Project 1 Script
#  PLOT 2
# --------------------------------------
# Intialization
    suppressWarnings(try(rm(list=ls()),silent=TRUE))   #clears the workspace
    WorkOrHome <- "home"  # "work" or "home"

# Set working directory    
    #homedir <- "/Users/harper/Dropbox/03_School/Coursera_04_ExploratoryDataAnalysis/homework1"
    #workdir <- "c:/Users/jharper/Dropbox/03_School/Coursera_04_ExploratoryDataAnalysis/homework1"
    #ifelse(WorkOrHome == "home", 
    #     setwd(homedir),  #mac directory  
    #     setwd(workdir))  #work directory  

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
      y = dataset$Global_active_power,  
      type = "l",  #stands for "line graph"
      xlab = "",  # removes the xlable
      ylab = "Global Active Power (kilowatts)"
    )

# Re-Plot the data and output to file
    png(filename = "plot2.png") 
    plot(
      x = dataset$TimeStamp,
      y = dataset$Global_active_power,  
      type = "l",  #stands for "line graph"
      xlab = "",  # removes the xlable
      ylab = "Global Active Power (kilowatts)"
    )
    dev.off()  #important!!!



