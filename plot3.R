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
png("plot3.png", width = 480, height = 480)
with(household_data, plot(x= full_date, y=sub_metering_1, type="l",xlab = "", ylab = "Energy sub metering"))
with(household_data, lines(x = full_date, y=sub_metering_2, type="l", col="red"))
with(household_data, lines(x = full_date, y=sub_metering_3, type="l", col="blue"))
legend("topright", lty = c(1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()