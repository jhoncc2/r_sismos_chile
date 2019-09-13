cargar_sismos_con_region <- function() {
  sismos <- read.csv("../Datasets sismológicos/files/all.csv",
                     header=TRUE, sep="|", quote="\"", dec=".", fill=TRUE, comment.char="#")
  sismos$Region_Name <- NA
  sismos$Region_Number <- NA
  for (i in 1:nrow(sismos)) {
    lat= sismos[i, "Latitude"]
    # Arica parte en -17.4605207
    if (lat > -19.074543) {
      sismos[i, "Region_Name"] <- "Región de Arica y Parinacota"
      sismos[i, "Region_Number"] <- 15
    }
    else if (lat > -21.4736859) {
      sismos[i, "Region_Name"] <- "Región de Tarapacá"
      sismos[i, "Region_Number"] <- 1
    }
    else if (lat > -25.877909) {
      sismos[i, "Region_Name"] <- "Región de Antofagasta"
      sismos[i, "Region_Number"] <- 2
    }
    else if (lat > -29.273360) {
      sismos[i, "Region_Name"] <- "Región de Atacama"
      sismos[i, "Region_Number"] <- 3
    }
    else if (lat > -32.103216) {
      sismos[i, "Region_Name"] <- "Región de Coquimbo"
      sismos[i, "Region_Number"] <- 4
    }
    else if (lat > -33.130581) {
      sismos[i, "Region_Name"] <- "Región de Valparaíso"
      sismos[i, "Region_Number"] <- 5
    }
    else if (lat > -34.070436) {
      sismos[i, "Region_Name"] <- "Región Metropolitana de Santiago"
      sismos[i, "Region_Number"] <- 13
    }
    else if (lat > -34.821344) {
      sismos[i, "Region_Name"] <- "Región del Libertador General Bernardo O’Higgins"
      sismos[i, "Region_Number"] <- 6
    }
    else if (lat > -36.276864) {
      sismos[i, "Region_Name"] <- "Región del Maule"
      sismos[i, "Region_Number"] <- 7
    }
    else if (lat > -36.651832) {
      sismos[i, "Region_Name"] <- "Región de Ñuble"
      sismos[i, "Region_Number"] <- 16
    }
    else if (lat > -37.833320) {
      sismos[i, "Region_Name"] <- "Región del Biobío"
      sismos[i, "Region_Number"] <- 8
    }
    else if (lat > -39.455727) {
      sismos[i, "Region_Name"] <- "Región de la Araucanía"
      sismos[i, "Region_Number"] <- 9
    }
    else if (lat > -40.543828) {
      sismos[i, "Region_Name"] <- "Región de Los Ríos"
      sismos[i, "Region_Number"] <- 14
    }
    else if (lat > -43.472729) {
      sismos[i, "Region_Name"] <- "Región de Los Lagos"
      sismos[i, "Region_Number"] <- 10
    }
    else if (lat > -49.098570) {
      sismos[i, "Region_Name"] <- "Región de Aysén del General Carlos Ibáñez del Campo"
      sismos[i, "Region_Number"] <- 11
    }
    else { # lat > -56.051547
      sismos[i, "Region_Name"] <- "Región de Magallanes y de la Antártica Chilena"
      sismos[i, "Region_Number"] <- 12
    }
  }
  sismos
  
  # Latitudes aproximadas de las regiones (Límites sur):
  # Arica y Parinacota: -17.4605207 -- -19.074543
  # Tarapacá: -21.4736859
  # Antofagasta: -25.877909
  # Atacama: -29.273360
  # Coquimbo: -32.103216
  # Valparaíso: -33.130581
  # Metropolitana: -34.070436
  # Bernardo O’Higgins: -34.821344
  # Maule: -36.276864
  # Ñuble: -36.651832
  # Biobío: -37.833320
  # Araucanía: -39.455727
  # Los Ríos: -40.543828
  # Los Lagos: -43.472729
  # Aysén: -49.098570
  # Magallanes: -56.051547
}
