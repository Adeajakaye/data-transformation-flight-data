##filter row with filter()

install.packages("tidyverse")
library(tidyverse)

library(nycflights13)

flights
filter(flights, month ==1, day==1)
dec25 <- filter(flights, month ==12, day ==25)
dec25

filter(flights, month ==1 | month ==12)

nov_dec <- filter(flights, month %in% c(11, 12))
nov_dec

filter(flights, arr_delay <= 120, dep_delay <= 120)
delay <- filter(flights, !(arr_delay <= 120 & dep_delay <= 120))
delay

##missing value

df <- tibble(x =c(1, 2, NA, 3))
df

filter(df, x > 1)
filter(df, is.na(x) | x < 3)
##exercise
##1. flights that has arrival delay of 1 or 2 hours

filter(flights, arr_delay <= 60 | arr_delay <= 120)

##2 flights that flew to houston
houston <- filter(flights, dest == "HOU" | dest == "IOU")
houston

##exercise 3 flights opreated by america, united or delta

filter(flights, carrier == "united"| carrier == "delta" | carrier == "united")

##exercise 4 flights thst departed in july, ausgust and september

filter(flights, month == 7 & month == 8 & month == 9)

##exercise 5, flights that arrived more than 2 hours late but didnt leave late

asd <- filter(flights, arr_time > 120 & dep_delay == 0)
asd

##exercise 6, flights that were delayed by aleast one hour

filter(flights, dep_delay <= 60)

filter(flights, between(month, 1, 2))

filter(flights, is.na(dep_time))
