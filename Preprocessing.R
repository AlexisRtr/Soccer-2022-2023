library(dplyr)

#### Import data
data <- read.csv2("data/22_23_Football_Stats.csv")
head(data)

#### Check dataset
names(data)

summary(data)


#### Subset
sub_data <- data %>% select(Player,Nation,Pos,Squad,Age,MP,Starts,Goals,G.Sh,Shots,Assists)
head(sub_data)

sub_data %>% filter(Squad == "Rennes")
