## data transformation with mutate()

flight_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
mutate(flight_sml, gain = dep_delay - arr_delay, speed =distance/ air_time * 60)

mutate(flight_sml, gain = dep_delay-  arr_delay, hour = air_time/60, gain_per_hour=+
  gain/hour)

transmute(flights, gain = dep_delay - arr_delay, hour = air_time/60, gain_per_hour=+
            gain/hour)
          
transmute(flights, dep_time, hour= dep_time%/% 100, minute = dep_time%%100)
##lag()  and Lead()
 x <- (1 :10)
x 
lag(x)
lead(x)

##cumualative and rolling aggregate

x
cumsum(x)
cummean(x)
cummin(x)
cummax(x)

##ranking

y <- c(1,2,3,3, NA, 4, 5)
y

min_rank(y)
min_rank(desc(y))

row_number(y)
dense_rank(y)
percent_rank(y)
cume_dist(y)

##exercise
##1,
mutate(flights, dep_hour = dep_time%/%100, shced_hour = sched_dep_time %/% 100)
transmute(flights, dep_time, sched_dep_time, dep_hour = dep_time%/%100, shced_hour =
            sched_dep_time %/% 100)

transmute(flights, dep_time, sched_dep_time, dep_hour = dep_time%/%100, shced_hour =
            sched_dep_time %/% 100, dep_minute = dep_time %%100, =
            sched_minute = sched_dep_time %%100)

##2,
mutate(flights,dep_time, air_time = arr_time - dep_time)
transmute(flights,  air_time, time =arr_time - dep_time)

##3
select(flights, dep_time, sched_dep_time, dep_delay)

##4 most delayed flight
delay <- select(flights, dep_delay)
delay
min_rank(delay)

1:3 + 1:10
         