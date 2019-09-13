library(ggplot2)

# Solo el último gráfico está asegurado que funcione, el resto no se sabe
a <- aggregate(fecha.num ~ Año.estadistico + Región.de.consumo + Deshidratación,
               etas,
               FUN=function(a) {sum(a > 0)})
colnames(a) <- c("Año", "Región", "Deshidratación", "Cantidad")

ggplot(a, aes(x=Región, y=Cantidad)) +
  facet_grid(Año ~ ) +
  coord_flip() +
  geom_bar(stat="identity")

ggplot(a, aes(x=Cantidad)) +
  geom_histogram() +
  #geom_bar(aes(x=Región, y=Cantidad), stat="identity") +
  coord_flip() +
  facet_grid(Año ~ Región)

ggplot(a[(a$Región == 1 | a$Región == 2 | a$Región == 3 | a$Región == 4) & a$Deshidratación == "SI", ],
       aes(x=Región, y=Cantidad)) +
  facet_grid(Año ~ Deshidratación) +
  geom_bar(stat="identity") +
  coord_flip()
