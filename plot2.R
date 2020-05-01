## Useful constants to load rows for 2007-02-01 and 2007-02-02 only
skip <- 66637
nrows <- 2880
names <- c("date","time","global_active_power",
           "global_reactive_power", "voltage", "global_intensity",
           "sub_metering_1","sub_metering_2","sub_metering_3")

## Load the data (Supposes that the dataset is in the same folder)
household_data <- read.table("household_power_consumption.txt", sep = ";", skip = skip, nrows = nrows, col.names = names)

## Converts the dates to date format
household_data$date <- as.Date(household_data$date, format = "%d/%m/%Y")

## Add a column merging time and date
household_data <- mutate(household_data, full_date = as.POSIXct(paste(date,time)))

## Plot the required graph
png("plot2.png")
with(household_data, plot(x= full_date, y=global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
