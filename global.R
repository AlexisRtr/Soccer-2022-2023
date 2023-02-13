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
