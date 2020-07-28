library (geobr)
library(readxl)
library (stringr)
library (esquisse)
library (ggplot2)
library(tidyverse)

estados <- read_state (code_state="all")

df <- read_excel("C:/Users/Carlos/OneDrive - UC San Diego/NPP Vulnerabilidades Coronavirus/dados/dados covid 01 06_goes.xlsx",  sheet = "outsheet") 

indice <- df %>% pull(abrev_state,geral)

#indice <- read_excel("C:/Users/r3722892/Google Drive/COVID/Aprendendo a fazer mapas/Goes/mapas 16 06.xlsx", 
#                     sheet = "mapa_vul") 
#fiscal <- read_excel("C:/Users/r3722892/Google Drive/COVID/Aprendendo a fazer mapas/Goes/mapas 16 06.xlsx", 
#                          sheet = "eixo_fisc")
#hosp <- read_excel("C:/Users/r3722892/Google Drive/COVID/Aprendendo a fazer mapas/Goes/mapas 16 06.xlsx", 
#                     sheet = "infr_hosp")


mapa_indice <- merge (estados, df$geral, group_by ="abbrev_state")
mapa_fiscal <- merge (estados, fiscal, group_by ="abbrev_state")
mapa_hosp <- merge (estados, hosp, group_by ="abbrev_state")

colnames(mapa_indice) [6] <- "Índice de Vulnerabilidade Geral"
colnames(mapa_fiscal) [6] <- "Índice de Vulnerabilidade Sócio/Fiscal"
colnames(mapa_hosp) [6] <- "Índice de Vulnerabilidade Hospitalar"

esquisser (mapa_indice)

ggplot(mapa_indice) +
 aes(fill = `Valor Final`, group = abbrev_state) +
 geom_sf(size = 1L) +
 scale_fill_distiller(palette = "OrRd") +
 theme_void()

esquisser (mapa_fiscal)
library(ggplot2)

ggplot(mapa_fiscal) +
 aes(fill = `Índice de Vulnerabilidade Sócio/Fiscal`) +
 geom_sf(size = 1L) +
 scale_fill_distiller(palette = "OrRd") +
 theme_void()


esquisser (mapa_hosp)
library(ggplot2)

ggplot(mapa_hosp) +
 aes(fill = `Índice de Vulnerabilidade Hospitalar`, group = abbrev_state) +
 geom_sf(size = 1L) +
 scale_fill_distiller(palette = "YlOrRd") +
 theme_void()




