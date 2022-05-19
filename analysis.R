# things
library(dplyr)
library(ggplot2)

# incarc_df <- read.csv("incarceration_trends.csv")
state_df <- incarc_df %>% group_by(state, year) %>% summarise(total_incarcerated = sum(total_pop),
                                                              black_tot = sum(black_jail_pop),
                                                              white_tot = sum(white_jail_pop),
                                                              latinx_pop = sum(latinx_jail_pop),
                                                              aapi_pop = sum(aapi_jail_pop))

mean_total <- mean(state_df$total_incarcerated, na.rm = TRUE)
mean_white <- mean(state_df$white_tot, na.rm=TRUE)
mean_black <- mean(state_df$black_tot, na.rm=TRUE)
mean_latinx <- mean(state_df$latinx_pop, na.rm=TRUE)
mean_aapi <- mean(state_df$aapi_pop, na.rm=TRUE)

nation_df <- incarc_df %>% group_by(year) %>% summarise(total_inc = sum(total_pop),
                                                        black_tot = sum(black_jail_pop, na.rm=TRUE),
                                                        white_tot = sum(white_jail_pop, na.rm=TRUE),
                                                        latinx_pop = sum(latinx_jail_pop, na.rm=TRUE),
                                                        aapi_pop = sum(aapi_jail_pop, na.rm=TRUE))
nation_df <- nation_df %>% filter(year >= 1985)

most_tot <- max(nation_df$total_inc)
most_black <- max(nation_df$black_tot)
most_white <- max(nation_df$white_tot)
most_latinx <- max(nation_df$latinx_pop)
most_aapi <- max(nation_df$aapi_pop)

max_tot_year <- (filter(nation_df, total_inc == most_tot))$year
max_black_year <- (filter(nation_df, black_tot == most_black))$year
max_white_year <- (filter(nation_df, white_tot == most_white))$year
max_latinx_year <- (filter(nation_df, latinx_pop == most_latinx))$year
max_aapi_year <- (filter(nation_df, aapi_pop == most_aapi))$year

highest_nat_tot <- paste0(most_tot, ", ", max_tot_year)
highest_black <- paste0((most_black), ", ", max_black_year)
highest_white <- paste0(most_white, ", ", max_white_year)
highest_latinx <- paste0(most_latinx, ", ", max_latinx_year)
highest_aapi <- paste0(most_aapi, ", ", max_aapi_year)