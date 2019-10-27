library(tidyverse)

df = tbl_df(read.csv("./df_cleaned_shots.csv")) 
df1 = df %>%
  select(year, player, team, contains("pct_pts"), contains("pct_fgm"))

df2 = df1 %>%
  mutate(assist_ratio = pct_fgm_asstd/pct_fgm_unasstd)

colnames(df2)

df3 = df2 %>%
  group_by(year, team) %>%
  summarise(mean_pct_pts_2pt = mean(pct_pts_2pt),
            mean_pct_pts_mr = mean(pct_pts_mr),
            mean_pct_pts_3pt = mean(pct_pts_3pt),
            mean_pct_pts_fstbrk = mean(pct_pts_fstbrk),
            mean_pct_pts_off_tos = mean(pct_pts_off_tos),
            mean_pct_pts_inthept = mean(pct_pts_inthept),
            mean_assist_ratio = mean(assist_ratio),
            )


write.csv(df3, file = "df3.csv", row.names = FALSE)

df4 = tbl_df(read.csv("./df3.csv", stringsAsFactors = FALSE))

df4 %>%
  colnames()


barplot()

?selectInput


library(tidyverse)

mtcars = tbl_df(mtcars)
mtcars

data_long

datestta <- data.frame(col1 = rep(c("A", "B", "C", "B", "C", "A", "A", "B", "B", "A", "C")),
                   col2 = rep(c(2012, 2012, 2012, 2013, 2013, 2014, 2014, 2014, 2015, 2015, 2015)), 
                   col3 = rep(c("Up", "Down", "Up", "Up", "Down", "Left", "Right", "Up", "Right", "Down", "Up")),
                   col4 = rep(c("Y", "N", "N", "N", "Y", "N", "Y", "Y", "Y", "N", "Y")))

datestta

datestta = gather(datestta, key = type_col, value = categories)

datestta_long <- tidyr::gather(datestta, key = type_col, value = categories)

ggplot(datestta_long, aes(x = categories)) +
  geom_bar() + 
  facet_wrap(~ type_col, scales = "free_x")



df <- data.frame(trt = c("a", "b", "c"), outcome = c(2.3, 1.9, 3.2))
ggplot(df, aes(trt, outcome)) +
  geom_col()




s <- 
  "A       B        C       G       Xax
0.451   0.333   0.034   0.173   0.22        
0.491   0.270   0.033   0.207   0.34    
0.389   0.249   0.084   0.271   0.54    
0.425   0.819   0.077   0.281   0.34
0.457   0.429   0.053   0.386   0.53    
0.436   0.524   0.049   0.249   0.12    
0.423   0.270   0.093   0.279   0.61    
0.463   0.315   0.019   0.204   0.23
"
d <- read.delim(textConnection(s), sep="")

library(ggplot2)
library(reshape2)
d <- melt(d, id.vars="Xax")

# Everything on the same plot
ggplot(d, aes(Xax,value, col=variable)) + 
  geom_point() + 
  stat_smooth() 

# Separate plots
ggplot(d, aes(Xax,value)) + 
  geom_point() + 
  stat_smooth() +
  facet_wrap(~variable)


df %>% tidyr::gather("id", "value", 1:4) %>% 
  ggplot(., aes(Xax, value))+
  geom_point()+
  geom_smooth(method = "lm", se=FALSE, color="black")+
  facet_wrap(~id)




ersets = team_stats %>%
  group_by(year, team) %>%
  filter(year == '2019', team == "ATL" | team == "BOS")

ersets



transposed_team_stats = read.csv("./transposed_team_stats.csv", stringsAsFactors = FALSE)


tf1 = tbl_df(transposed_team_stats)

tf1 %>%
  filter()



nmonths = 24
x = seq(as.Date("2015/1/1"), by = "month", length.out = nmonths)

prescription1 <- data.frame(
  x,
  Percent.Change = 25 + runif(nmonths,1,100)
)

prescription2 <- data.frame(
  x,
  Percent.Change = 75 + runif(nmonths,1,50)
)

cols = c("dates", "Difference")
colnames(prescription1) = cols
colnames(prescription2) = cols

prescription1



dat1 <- data.frame(
  sex = factor(c("Female","Female","Male","Male")),
  time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(13.53, 16.81, 16.24, 17.42)
  
dat1 %>%
  ggplot(
    x = sex
  )


test_data <-
  data.frame(
    var0 = 100 + c(0, cumsum(runif(49, -20, 20))),
    var1 = 150 + c(0, cumsum(runif(49, -10, 10))),
    date = seq(as.Date("2002-01-01"), by="1 month", length.out=100)
  )

test_data %>%
  ggplot(
    aes(date)) +
  geom_line(aes(y = var0)) +
  geom_line(aes(y = var1))



team_stats %>%
  filter(year == '2019') %>%
  gather(key, value, win_pct, team_pct_pts_2pt,team_pct_pts_mr) %>%
  ggplot(aes(x=team, y = value, colour=key)) +
  geom_line()
