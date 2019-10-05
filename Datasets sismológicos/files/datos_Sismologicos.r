dataSismo <- read.csv("/Datasets sismológicos/files/all.csv", sep = "|", header = TRUE, skip = 4)
dataSismo$Time <- substr(dataSismo$Time, 0, 10)
dataSismo$Time <- as.Date(dataSismo$Time)
SistmosDate <- data.frame(EventID = dataSismo$EventID, Latitude = dataSismo$Latitude, Longitude = dataSismo$Longitude, +
+ Depth = dataSismo$Depth, Magnitude = dataSismo$Magnitude, year = as.numeric(format(dataSismo$Time, format = "%Y")), +
+ month = as.numeric(format(dataSismo$Time, format = "%m")), day = as.numeric(format(dataSismo$Time, format = "%d")), +
+ EventLocationName = dataSismo$EventLocationName)
write.csv(SistmosDate, file = "datosSismologicos.csv", row.names = TRUE)