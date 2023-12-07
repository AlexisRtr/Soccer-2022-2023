library(ggplot2)
library(ggpubr)
library(dplyr)
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(tidyr)

a <- data_goals %>% select(Squad, Country, LgRk, diff_GF) %>%  top_n(-5,diff_GF) %>% arrange((diff_GF))

data_ENG <- data_goals %>% filter(Country == "ENG")
apply(class, data_ENG)
  
# create a dataset
data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) )
)
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  # theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")
#######################################################################
gather(data, category, goals, control:cond2, factor_key=TRUE)

violin_plot <- function(df, var.x, var.y){
  
  x <- rlang::sym(var.x)
  y <- rlang::sym(var.y)
  
  g <- ggplot(data = df, aes(!!x, !!y)) +
    geom_violin(aes(fill = !!x))+
    geom_jitter(height = 0, width = 0.1)

  png(filename = paste0("output/violin_plot",var.x,"_",var.y,".png"),
      width = 1000,
      height = 800)
  dev.off()
}
violin_plot(df = data, var.x = "Country", var.y = "xGD_90")


ggplot(data, aes(factor(Country), xGD_90, Country))+
  geom_violin(aes(fill = Country))+
  geom_jitter(height = 0, width = 0.1)


ggplot(data, aes(factor(Country), xGD_90, Country))+
  geom_boxplot(aes(fill = Country))+
  geom_jitter(height = 0, width = 0.1)


data_ENG %>%
ggplot(data = data_ENG, aes(x=Country, y=xGD_90, fill=Squad)) +
  geom_violin() +
  # scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  # theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")


ggplot(data = data, aes(LgRk ,xGD.90)) +
  geom_point(aes(col = Country)) +
  geom_line(aes(col = Country))+
  geom_smooth(method = lm, se = FALSE)


ggplot(data = data, aes(LgRk ,xGD.90)) +
  geom_point(aes(col = Country)) +
  geom_line(aes(col = Country))+
  geom_smooth(method = lm, se = FALSE)
mod.global = lm(formula = LgRk ~ xGD.90, data = data)
summary(mod.global)

ggplot(data = data, aes(LgRk ,GD.90)) +
  geom_point(aes(col = Country)) +
  geom_line(aes(col = Country))+
  geom_smooth(method = lm, se = FALSE)


ggplot(data = data, aes(xGD.90, GD.90,group = Country)) +
  geom_point(aes(col = Country)) +
  geom_line(aes(col = Country))+
  geom_abline(slope = 1)

ggplot(data = data, aes(xGD.90, GD.90,group = Country)) +
  geom_point(aes(col = Country)) +
  geom_line(aes(col = Country))+
  geom_abline(slope = 1)

linear_reg <- function(df, var.x, var.y, group, name){

  x <- rlang::sym(var.x)
  y <- rlang::sym(var.y)
  gr <- rlang::sym(group)
  
  g <- ggplot(data = df, aes(!!x, !!y, !!gr)) +
          geom_point(aes(col = !!gr)) +
          geom_line(aes(col = !!gr)) +
          geom_abline(slope = 1) +
          geom_smooth(method = lm, se = FALSE)
  print(g)
  png(filename = paste0("output/",var.x,"_",var.y,name,".png"),
      width = 1000,
      height = 800)
  dev.off()
}

linear_reg(df = data_goals, 
           var.x = "xGD_90", 
           var.y = "GD_90", 
           group = "Country", 
           name = "_Global")

mod.global = lm(formula = xGD.90 ~ GD.90, data = data)
summary(mod.global)

data_ENG <- data_goals %>% filter(Country == "ENG")
linear_reg(df = data_ENG, var.x = "xGD_90", var.y = "GD_90", name = "_ENG")
mod.ENG = lm(formula = xGD.90 ~ GD.90, data = data_ENG)
summary(mod.ENG)

data_FRA <- data %>% filter(Country == "FRA")
linear_reg(data_FRA)
mod.FRA = lm(formula = xGD.90 ~ GD.90, data = data_FRA)
summary(mod.FRA)

data_ESP <- data %>% filter(Country == "ESP")
linear_reg(data_ESP)
mod.ESP = lm(formula = xGD.90 ~ GD.90, data = data_ESP)
summary(mod.ESP)

data_ITA <- data %>% filter(Country == "ITA")
linear_reg(data_ITA)
mod.ITA = lm(formula = xGD.90 ~ GD.90, data = data_ITA)
summary(mod.ITA)

data_GER <- data %>% filter(Country == "GER")
linear_reg(data_ITA)
mod.GER = lm(formula = xGD.90 ~ GD.90, data = data_GER)
summary(mod.GER)


