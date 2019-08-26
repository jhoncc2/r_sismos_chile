source("./cargar_sismos_con_region.r")
source("./cargar_etas.r")

sismos <- cargar_sismos_con_region()

cant_etas_2011 <- data.frame("Año"=eta2011$Año.estadistico, "Región"=eta2011$Región.de.consumo,
                             "Cantidad"=eta2011$Región.de.consumo)

cant_etas_2012 <- data.frame("Año"=eta2012$Año.estadistico, "Región"=eta2012$Región.de.consumo,
                             "Cantidad"=eta2012$Región.de.consumo)

cant_etas_2013 <- data.frame("Año"=eta2013$Año.estadistico, "Región"=eta2013$Región.de.consumo,
                             "Cantidad"=eta2013$Región.de.consumo)

cant_etas_2014 <- data.frame("Año"=eta2014$Año.estadistico, "Región"=eta2014$Región.de.consumo,
                             "Cantidad"=eta2014$Región.de.consumo)

cant_etas_2015 <- data.frame("Año"=eta2015$Año.estadistico, "Región"=eta2015$Región.de.consumo,
                             "Cantidad"=eta2015$Región.de.consumo)

cant_etas_2016 <- data.frame("Año"=eta2016$Año.estadistico, "Región"=eta2016$Región.de.consumo,
                             "Cantidad"=eta2016$Región.de.consumo)

cant_etas_2017 <- data.frame("Año"=eta2017$Año.estadistico, "Región"=eta2017$Región.de.consumo,
                             "Cantidad"=eta2017$Región.de.consumo)

cant_etas_2011 <- aggregate(Cantidad ~ Año + Región, cant_etas_2011, function(a) {sum(a>0)})
cant_etas_2012 <- aggregate(Cantidad ~ Año + Región, cant_etas_2012, function(a) {sum(a>0)})
cant_etas_2013 <- aggregate(Cantidad ~ Año + Región, cant_etas_2013, function(a) {sum(a>0)})
cant_etas_2014 <- aggregate(Cantidad ~ Año + Región, cant_etas_2014, function(a) {sum(a>0)})
cant_etas_2015 <- aggregate(Cantidad ~ Año + Región, cant_etas_2015, function(a) {sum(a>0)})
cant_etas_2016 <- aggregate(Cantidad ~ Año + Región, cant_etas_2016, function(a) {sum(a>0)})
cant_etas_2017 <- aggregate(Cantidad ~ Año + Región, cant_etas_2017, function(a) {sum(a>0)})

cant_etas <- rbind(cant_etas_2011, cant_etas_2012, cant_etas_2013, cant_etas_2014,
                   cant_etas_2015, cant_etas_2016, cant_etas_2017)

library(ggplot2)  # cargamos la librería

ggplot(cant_etas[cant_etas$Región == 4, ]) + # asociamos un data frame a ggplot
  geom_bar(aes(x = Año, y = Cantidad), stat="identity") +   # creamos un grafico de barras como una capa
  #coord_flip() +  # transformamos el grafico invirtiendo los ejes de coordenadas (sólo visualmente)
  ggtitle("Reportes de ETA anuales\npara la Región de Coquimbo") + # título
  xlab("Año") + ylab("Cantidad de ETA reportadas ese año")  # etiquetas

ggplot(cant_etas[cant_etas$Región == 1, ]) + # asociamos un data frame a ggplot
  geom_bar(aes(x = Año, y = Cantidad), stat="identity") +   # creamos un grafico de barras como una capa
  #coord_flip() +  # transformamos el grafico invirtiendo los ejes de coordenadas (sólo visualmente)
  ggtitle("Reportes de ETA anuales\npara la Región de Tarapacá") + # título
  xlab("Año") + ylab("Cantidad de ETA reportadas ese año")  # etiquetas

ggplot(cant_etas[cant_etas$Región == 2, ]) + # asociamos un data frame a ggplot
  geom_bar(aes(x = Año, y = Cantidad), stat="identity") +   # creamos un grafico de barras como una capa
  #coord_flip() +  # transformamos el grafico invirtiendo los ejes de coordenadas (sólo visualmente)
  ggtitle("Reportes de ETA anuales\npara la Región de Antofagasta") + # título
  xlab("Año") + ylab("Cantidad de ETA reportadas ese año")  # etiquetas

ggplot(cant_etas[cant_etas$Región == 3, ]) + # asociamos un data frame a ggplot
  geom_bar(aes(x = Año, y = Cantidad), stat="identity") +   # creamos un grafico de barras como una capa
  #coord_flip() +  # transformamos el grafico invirtiendo los ejes de coordenadas (sólo visualmente)
  ggtitle("Reportes de ETA anuales\npara la Región de Atacama") + # título
  xlab("Año") + ylab("Cantidad de ETA reportadas ese año")  # etiquetas

ggplot(cant_etas[cant_etas$Región == 5, ]) + # asociamos un data frame a ggplot
  geom_bar(aes(x = Año, y = Cantidad), stat="identity") +   # creamos un grafico de barras como una capa
  #coord_flip() +  # transformamos el grafico invirtiendo los ejes de coordenadas (sólo visualmente)
  ggtitle("Reportes de ETA anuales\npara la Región de Valparaíso") + # título
  xlab("Año") + ylab("Cantidad de ETA reportadas ese año")  # etiquetas
