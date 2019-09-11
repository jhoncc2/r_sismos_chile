# Cargar los datos de Enfermedades Transmitidas por alimentos
#library(xlsx)

## TODO
# Guardar todos los excel como CSV, luego cargarlos con read.csv, y finalmente hacer rbind entre todas
# las tablas generadas.

library(readxl)
directorio_padre <- "../Datasets brotes ETA/"

generarEtas <- function() {
  eta2011 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2011, ".xlsx", sep=""))
  eta2012 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2012, ".xlsx", sep=""))
  eta2013 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2013, ".xlsx", sep=""))
  eta2014 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2014, ".xlsx", sep=""))
  eta2015 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2015, ".xlsx", sep=""))
  eta2016 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2016, ".xlsx", sep=""))
  eta2017 <- read_xlsx(paste(directorio_padre, "Bases de brotes ETA ", 2017, ".xlsx", sep=""))
  (etas <- rbind(eta2011, eta2012, eta2013, eta2014, eta2015, eta2016, eta2017))
}

etas <- generarEtas()

if (FALSE) { # forma antigua de hacerlo
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
}