# Load data, filter it and convert data types
dataFilePath <- '../household_power_consumption.txt'

consumption <- read.table(dataFilePath, header = TRUE, sep = ';')

consumption <- consumption[consumption$Date %in% c('1/2/2007', '2/2/2007'), ]

consumption$Global_active_power = as.numeric(consumption$Global_active_power)
consumption$Global_reactive_power = as.numeric(consumption$Global_reactive_power)
consumption$Voltage = as.numeric(consumption$Voltage)
consumption$Global_intensity = as.numeric(consumption$Global_intensity)
consumption$Sub_metering_1 = as.numeric(consumption$Sub_metering_1)
consumption$Sub_metering_2 = as.numeric(consumption$Sub_metering_2)
consumption$DateTime = as.POSIXct(paste(consumption$Date, consumption$Time), format='%d/%m/%Y %H:%M:%S')

# Create plot
png(filename='plot3.png', width=504)
layout(matrix(c(1,1), ncol=1))
plot(
  x = consumption$DateTime,
  y = consumption$Sub_metering_1,
  type='l',
  col='black',
  main='',
  xlab='',
  ylab='Energy sub metering'
)
points(
  x = consumption$DateTime,
  y = consumption$Sub_metering_2,
  type='l',
  col='red',
)
points(
  x = consumption$DateTime,
  y = consumption$Sub_metering_3,
  type='l',
  col='blue',
)
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=1)
dev.off()
