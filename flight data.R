# group summaries with summarise()

summarise(flights, delay= mean(dep_delay, na.rm = TRUE))
by_day <- group_by(flights, year, month, day) 
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest, count = n(), dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dest != "HNL")
delay

ggplot(data = delay, mapping = aes(x =dist, y = delay))+
  geom_point(aes(size= count), alpha = 1/3)+
  geom_smooth(se = FALSE)

## using pipe %>%

delay <- flights %>%
  group_by(dest)%>%
  summarise( count = n(), dist = mean(distance), na.rm = TRUE,
             delay = mean(arr_delay, na.rm = TRUE))%>%
  filter(count >20, dest != "HNL")

##missing values

flights %>%
  group_by(year, month, day)%>%
  summarise(mean= mean(delay))

flights %>%
  group_by(year, month, day)%>%
  summarise(mean= mean(dep_delay, na.rm = TRUE))

##removing rows with missing values

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled

not_cancelled %>%
  group_by(year, month, day)%>%
  summarise(mean= mean(dep_delay))

##counts

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(delay = mean(arr_delay))
delay

ggplot(data = delays, mapping = aes(x = delay))+
  geom_freqpoly(binwidth = 10)
##number of flights per average delay

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n())

ggplot(data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)



delays %>% 
  filter(n > 25) %>% 
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)


batting <- as.tibble(Lahman::Batting)
batting
view(batting)

batter <- batting%>%
  group_by(playerID)%>%
  summarise(ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
            ab = sum(AB, na.rm = TRUE))
batter  
batter%>%
  filter(ab > 100)%>%
  ggplot(mapping = aes(x = ab, y = ba))+
  geom_point()+
  geom_smooth(se = FALSE)
 batter%>%
   arrange(desc(ba))
 
 not_cancelled
not_cancelled%>%
 group_by( year, month, day)%>%
  summarise(arr_delay1 = mean(arr_delay),
            arr_dealy2 = mean(arr_delay[arr_delay > 0]))

not_cancelled%>%
  group_by(dest)%>%
  summarise(distance_sd = sd(distance))%>%
  arrange(desc(distance_sd))

not_cancelled%>%
  group_by(year, month, day)%>%
  summarise( first= min(dep_time),
             last = max(dep_time))
  day <- not_cancelled %>% 
  group_by(year, month, day) %>% 
  mutate(r = min_rank(desc(dep_time))) %>% 
  filter(r %in% range(r))
day
view(day)

##destinations with the most carriers
not_cancelled%>%
  group_by(dest)%>%
  summarise(carriers = n_distinct(carrier))%>%
  arrange(desc(carriers))

#count
not_cancelled %>%
  count(dest)
  


