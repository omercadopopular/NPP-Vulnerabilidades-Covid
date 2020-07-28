library (geobr)
library(readxl)
library (stringr)
library (esquisse)
library (ggplot2)


estados <- read_state (code_state="all")
mapa_est <-  read_excel("C:/Users/Carlos/OneDrive - UC San Diego/NPP Vulnerabilidades Coronavirus/dados/dados mapa.xlsx", sheet = "outsheet")
mapa_estados <- merge (estados, mapa_est, group_by ="abbrev_state")


hospitalar <- ggplot(mapa_estados) +
  aes(fill = `Índice de Vulnerabilidade Hospitalar`) +
  geom_sf(size = 1L) +
  scale_fill_distiller(palette = "OrRd") +
  theme_void()

geral <- ggplot(mapa_estados) +
  aes(fill = `Índice de Vulnerabilidade ao Covid-19`) +
  geom_sf(size = 1L) +
  scale_fill_distiller(palette = "OrRd") +
  theme_void()

fiscal <- ggplot(mapa_estados) +
  aes(fill = `Índice de Vulnerabilidade Sócio-Fiscal`) +
  geom_sf(size = 1L) +
  scale_fill_distiller(palette = "OrRd") +
  theme_void()
