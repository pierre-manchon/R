hadsst <- read.table('./datasets/HadSST.3.1.1.0_annual_globe_ts.txt')
# read.csv(file='HadSST.3.1.1.0_annual_globe_ts.csv')
iris <- read.delim('./datasets/Iris.txt', sep=";")

# View(hadsst)

hadsst_subset <- hadsst[c(1, 2)]
hadsst_v1 <- hadsst[1]
hadsst_v2 <- hadsst[c(1, 2)]
hadsst_v3 <- hadsst[c(1, 3)]
hadsst_v4 <- hadsst[c(1, 4)]

# plot(hadsst_v1, hadsst_v2, type = "o")
# lines(hadsst_v1, hadsst_v3, type = "o", col = "red")
# lines(hadsst_v1, hadsst_v4, type = "o", col = "green")

med_temp_surf_mer_1900_1950 <- plot(hadsst_subset,
                                   main='Anomalie de la température médiane de la mer/surface par année',
                                   ylab='Anomalie de la température médiane de la mer/surface',
                                   xlab='Année',
                                   type='o',
                                   col='black')

ggplot(hadsst, aes(x = hadsst_v1, y = hadsst_v2, col = line)) + geom_line()