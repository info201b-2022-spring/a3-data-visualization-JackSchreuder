# things
library(dplyr)
library(ggplot2)

incarc_df <- read.csv("incarceration_trends.csv")
state_df <- incarc_df %>% group_by(state, year) %>% summarise(total_incarcerated = sum(total_pop))
highest_pop_states <- state_df %>% group_by(state) %>%
  summarise(total_incarc = sum(total_incarcerated)) %>%
  arrange(desc(total_incarc)) %>%
  slice_head(n=5)