# Cargar los datos de Enfermedades Transmitidas por alimentos

directorio_padre <- "../Datasets brotes ETA/"

generarEtas <- function() {
  eta2011 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2011, ".csv", sep=""),
                      header=TRUE, sep=",")
  eta2012 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2012, ".csv", sep=""),
                      header=TRUE, sep=",")
  eta2013 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2013, ".csv", sep=""),
                      header=TRUE, sep=",")
  eta2014 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2014, ".csv", sep=""),
                      header=TRUE, sep=",")
  eta2015 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2015, ".csv", sep=""),
                      header=TRUE, sep=",")
  eta2016 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2016, ".csv", sep=""),
                      header=TRUE, sep=",")
  eta2017 <- read.csv(paste(directorio_padre, "Bases de brotes ETA ", 2017, ".csv", sep=""),
                      header=TRUE, sep=",")
  (etas <- rbind(eta2011, eta2012, eta2013, eta2014, eta2015, eta2016, eta2017))
}

# Si están cargadas en internet se pueden traer con la url
# También se pueden traer de la carpeta en que están generadas
#etas <- generarEtas()
etas <- read.csv(paste(directorio_padre, "etas2011_2017.csv", sep=""))

# Agregar columnas de meses y días
agregarMesesYDias <- function(dataframe) {
  fechas_notificacion <- as.Date(dataframe$fecha.de.notificación, "%d-%m-%Y")
  fechas_notificacion <- data.frame(año.de.notificación=as.numeric(format(fechas_notificacion,
                                                                          format="%Y")),
                                    mes.de.notificación=as.numeric(format(fechas_notificacion,
                                                                          format="%m")),
                                    día.de.notificación=as.numeric(format(fechas_notificacion,
                                                                          format="%d")))
  fechas_ingestion <- as.Date(dataframe$Fecha.de.Ingestión, "%d-%m-%Y")
  fechas_ingestion <- data.frame(mes.de.ingestión=as.numeric(format(fechas_ingestion,
                                                                    format="%m")),
                                 día.de.ingestión=as.numeric(format(fechas_ingestion,
                                                                    format="%d")))
  # Se puede sacar una fecha continua para que sea graficable más fácil
  fecha_num <- data.frame(fecha.num=fechas_notificacion$año.de.notificación +
                            (fechas_notificacion$mes.de.notificación-1)/12 +
                            (fechas_notificacion$día.de.notificación-1)/24/12)
  
  fechas <- cbind(fechas_notificacion[, -1], fechas_ingestion, fecha_num)
  cbind(dataframe, fechas)
}

etas <- agregarMesesYDias(etas)

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