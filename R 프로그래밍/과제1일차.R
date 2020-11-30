#과제1
a<-1:100
a<-a[a%%3==0]
a
b<-1:99
b<-b[b%%4==0]
b
union(a,b)
intersect(a,b)
setdiff(a,b)

data(airquality)
str(airquality)


max(airquality$Wind)
subset(airquality$Ozone, Wind == max(airquality$Wind), select =c(Wind,Month,Day))
mean(airquality$Ozone)
airquality

airquality[airquality$Ozone %in% c(NA), c('Ozone')] <-0
mean(airquality$Ozone)

quakes
str(quakes)
max(quakes$mag)
subset(quakes, mag == max(quakes$mag))
subset(quakes$mag, mag == max(quakes$mag),select = 'lat','long','mag','depth','stations')
