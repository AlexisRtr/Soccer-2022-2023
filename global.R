library(shinydashboard)
library(shiny)
library(ggplot2)


linear_reg <- function(df, var.x, var.y, group, name){
  print("Linear graph EXE")
  
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
  return(g)
}

linear_reg_without_line <- function(df, var.x, var.y, group, name){
  print("Linear graph EXE")
  
  x <- rlang::sym(var.x)
  y <- rlang::sym(var.y)
  gr <- rlang::sym(group)
  
  g <- ggplot(data = df, aes(!!x, !!y, !!gr)) +
    geom_point(aes(col = !!gr)) +
    geom_line(aes(col = !!gr)) +
    geom_smooth(method = lm, se = FALSE)
  print(g)
  png(filename = paste0("output/",var.x,"_",var.y,name,".png"),
      width = 1000,
      height = 800)
  dev.off()
  return(g)
}


violin_plot <- function(df, var.x, var.y){
  
  x <- rlang::sym(var.x)
  y <- rlang::sym(var.y)
  
  g <- ggplot(data = df, aes(!!x, !!y)) +
    geom_violin(aes(fill = !!x))+
    geom_jitter(height = 0, width = 0.1)
  
  png(filename = paste0("output/violin_plot", var.x,"_",var.y,".png"),
      width = 1000,
      height = 800)
  dev.off()
}


#### TOP TEAMS OVER/UNDER PERFORMED
top_team <- function(var.criteria){
  # top <- data_goals %>% select(Squad, Country, LgRk, var.criteria) %>%  top_n(5,var.criteria) %>% arrange(desc(var.criteria))
  top <- data_goals %>% select(Squad, Country, LgRk, var.criteria) %>% arrange(desc(var.criteria))
  print(top)
  return(top[1:5,])
}

