library(dplyr)
library(readxl)

#### Import data
data <- read.csv2("data/2021_2022_stats.csv")
head(data)

#### Check dataset
sapply(data, class)
names(data)
summary(data)
head(data)
sum(is.na(data))

data[,4:18] <- sapply(data[,4:18],as.numeric)


#### Add columns
data <- data %>% mutate(GF_90 = GF/MP,
                        xGF_90 = xG/MP,
                        GA_90 = GA/MP,
                        xGA_90 = xGA/MP,
                        GD_90 = GF_90-GA_90,
                        xGD_90 = xGD.90,
                        )
data_goals <- data %>% select(Squad,Country,LgRk,GF_90,xGF_90,GA_90,xGA_90,GD_90,xGD_90)

# write.csv(x = data_goals,file = "data/df_goals.csv")
