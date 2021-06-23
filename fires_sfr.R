library(plotly)

df <- read.csv2(file.choose())
df$hover <- with(df,
                 paste(Commune, '<br>',
                       "Date:", df$Alerte,
                       '<br>',
                       "Surface (ha):", df$Surface.parcourue..m2.))

l <- list(color = toRGB("white"),
          width = 2)

g <- list(scope = 'europe',
          showEPSG = TRUE)

fig <- df %>% plot_geo(locationmode = 'country names')

fig <- fig %>% add_trace(z = ~Surface.parcourue..m2.,
                         text = ~hover,
                         locations = df$Commune,
                         color = ~Surface.parcourue..m2./10000,
                         colors = 'Reds')
fig <- fig %>% colorbar(title = "Surface brulée (ha)")
fig <- fig %>% layout(title = 'Test',
                      geo = g)

fig