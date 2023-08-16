# TP 1 (trabajo practico n°1)


library(tidyverse)

### Importation database de Cert Urbanisticos 
certificados_urbanisticos <- read_csv(file = "C:/Users/FloMar/Desktop/Proyecto-R-II/data/certificados_urbanisticos.csv",
                                      col_names = TRUE)

## (Nota: esta direccion de barra para importar /)

summary(certificados_urbanisticos)

head(certificados_urbanisticos)

install.packages("datos")

library(datos)

### Importation database calidad de aire promedio (separados por ;) 

calidad_aire_promedio2 <- read_csv2(file ="C:/Users/FloMar/Desktop/Proyecto-R-II/data/calidad_aire_promedio.csv",  
                                    col_names = TRUE)

## Cuantos certificados urbanisticos se registraron durante 2019 


summary(certificados_urbanisticos)
head(certificados_urbanisticos)

### Se crea una nueva base con los datos de 2019:

f_certificados_2019 <- filter(certificados_urbanisticos, ANIO=="2019")

### A partir de la base anterior Se crea una nueva base con los datos del barrio de Palermo: (con 37 obs)

f_certificados_2019_palermo <- filter(f_certificados_2019, BARRIO=="PALERMO")

### Se ejecuta una selección de columnas en una nueva base de datos mas reducida

s_certificados_2019_palermo_sec019 <- select(f_certificados_2019_palermo, BARRIO, COMUNA, MANZANA, PARCELA, SECCION)

### Se crea una nueva variable(columna en el ultimo dataset= Ciudad CABA)

s_certificados_2019_palermo_sec019_modif <- mutate(s_certificados_2019_palermo_sec019, CIUDAD="CABA")


head(s_certificados_2019_palermo_sec019_modif)


s_certificados_2019_palermo_sec019_modif %>% 
  pivot_wider(names_from = "PARCELA",
              values_from = "MANZANA")
head(s_certificados_2019_palermo_sec019_modif)



