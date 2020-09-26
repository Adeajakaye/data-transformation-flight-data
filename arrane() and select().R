##arrange row

library(tidyverse)
library(nycflights13)
flights

arrange(flights, month, day, year)
arrange(flights, month, arr_time)
arrange(flights, desc(dep_delay))

df <- tibble(x =c(1,2,4,3,NA))
df

arrange(df, x)
arrange(df, desc(x))

##exercie
##1, arrange missing values to start
arrange(df, is.na(df))
arrange(flights, is.na(flights))

##2,most delayed flights
arrange(flights, desc(dep_delay))
##flights that left earliest
arrange(flights, desc(dep_time))

##3, fastest flights
arrange(flights, desc(time_hour))

##selecting colunm with select()
select(flights, year, dep_delay)

select(flights, year, origin, carrier)

select(flights, year: day)

select(flights, year, origin, dest, everything())

select(flights, -(year:day))

rename(flights, tail_num = tailnum)

##exercise
##1, select, dep_time, arr_delay, dep_time, and arr_time
select(flights, year, dep_time, arr_delay, dep_delay, arr_time)
select(flights, contains("time"))
select(flights, year, month, ends_with("delay"))

##2,what happens if you add mutiple variable to select call
select(flights, year, year, day, carrier)
select(flights, year, month, day, day)
##3,
select(flights, contains("TIME"))
##4
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))
view(flights)

