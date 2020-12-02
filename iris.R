hadsst <- read.table('./datasets/HadSST.3.1.1.0_annual_globe_ts.txt')
# read.csv(file='HadSST.3.1.1.0_annual_globe_ts.csv')
iris <- read.delim('./datasets/Iris.txt', sep=";")

# View(hadsst)
hadsst_subset <- subset(hadsst, 1)

plot(hadsst_subset,
     ylab='sea/surface median temperature anomaly',
     xlab='Année',
     type='x',
     col='black')
