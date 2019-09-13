# Cargar los datos de Enfermedades Transmitidas por alimentos
library(xlsx)
directorio_padre <- "../Datasets brotes ETA/"
eta2011 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2011, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)
eta2012 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2012, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)
eta2013 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2013, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)
eta2014 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2014, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)
eta2015 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2015, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)
eta2016 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2016, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)
eta2017 <- read.xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2017, ".xlsx", sep=""),
                     sheetIndex=1, header=TRUE)