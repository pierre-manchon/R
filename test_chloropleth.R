library(rgdal)
library(ggplot2)
library(maptools)

getwd()

# je charge les donnees promethees du csv
df_feux <- read.csv2(file.choose())

# je charge les donnes des communes du shapefile
df_communes = readOGR(dsn=getwd(), layer='communes-20190101')

# je fait une jointure du shapefile et des donnees promethees sur les champs du code insee
df_feux_communes = df_communes %>%
  merge(x=df_communes, y=df_feux, by.x="insee", by.y="Code.INSEE", duplicateGeoms=TRUE)

# je supprime les data frames précédents car je n'ai ai plus besoin (libère de la ram)
rm(df_feux)
rm(df_communes)

# je ne selectionne que les champs utiles
df_feux_communes <- df_feux_communes[c("insee", "nom", "surf_ha", "ï..AnnÃ.e", "NumÃ.ro", "DÃ.partement", "Code.du.carreau.DFCI",
                                       "Alerte", "Surface.parcourue..m2.")]

# je renomme les noms des champs pour que ce soit plus lisible
names(df_feux_communes) <- c("insee_com", "nom_com", "surf_ha_com", "annee", "num", "dep", "code_dfci", "alerte", "surf_parcourue_m2")

# si la valeur du champ surf_parcourue_m2 est NA ça veut dire que la jointure ne s'est pas faite sur cette ligne et donc qu'il n'y a pas eu
# de feux sur cette commune. Du coup j'y attribue la valeur 0 pour ensuite supprimer ces lignes et aléger le data frame.
df_feux_communes$surf_parcourue_m2[is.na(df_feux_communes$surf_parcourue_m2)] = 0

# je supprime toutes les lignes du data frame qui ne comportent pas de feux
df_feux_communes <- subset(df_feux_communes, df_feux_communes$surf_parcourue_m2 != 0)

ggplot() +
  geom_polygon(data = df_feux_communes,
               ) + theme_void() + coord_map()
