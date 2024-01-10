require(tidyverse)
require(baseballr)

#investigating clutch stat


clutch_df <- fg_batter_leaders(pos = "np") |> 
  select(PlayerName, playerid, Clutch)

#clutch_mean
clutch_mean = mean(clutch_df$Clutch, na.rm = TRUE)

#clutch_quantiles

clutch_quantiles = quantile(clutch_df$Clutch, probs = c(0.025,0.975), na.rm = TRUE)

#clutch_bar_chart
clutch_bar_chart <- clutch_df |> 
  ggplot(aes(x = Clutch)) +
  geom_freqpoly() +
  geom_vline(xintercept = clutch_quantiles, color = "red")
clutch_bar_chart

#looking at extremes

most_clutch <- clutch_df |> 
  filter(Clutch > clutch_quantiles[2]) |> 
  arrange(desc(Clutch))

most_clutch

#Is Bryce Harper a consistently clutch player?

harper_seasons = 2012:2023

fg_bat_leaders(startseason = 2021, endseason = 2023)
  
