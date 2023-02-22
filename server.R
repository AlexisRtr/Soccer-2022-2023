

server <- function(input, output, session) {
  
  #### Dataset
  # output$goals_table = DT::renderDataTable({
  #   data_goals
  # })
  
  output$goals_table = renderDataTable({
    data_goals
  })
  
  #### Plots
  
  output$plot_xG_realG <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg(df = temp,
               var.x = "GD_90",
               var.y = "xGD_90",
               group =  "Country",
               name = "_App")
  })
  
  output$plot_xG_ranking <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg_without_line(df = temp,
               var.x = "LgRk",
               var.y = "xGD_90",
               group =  "Country",
               name = "_App")
  })
  
  output$plot_xGF_realG <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg(df = temp,
               var.x = "GF_90",
               var.y = "xGF_90",
               group =  "Country",
               name = "_App")
  })
  
  output$plot_xGF_ranking <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg_without_line(df = temp,
                            var.x = "LgRk",
                            var.y = "xGF_90",
                            group =  "Country",
                            name = "_App")
  })
  
  output$plot_xGA_realG <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg(df = temp,
               var.x = "GA_90",
               var.y = "xGA_90",
               group =  "Country",
               name = "_App")
  })
  
  output$plot_xGA_ranking <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg_without_line(df = temp,
                            var.x = "LgRk",
                            var.y = "xGA_90",
                            group =  "Country",
                            name = "_App")
  })
  
  output$input_country <- renderText({
    input$input.country
  })
  
  output$plot_violin <- renderPlot({
    req(input$input.country)
    violin_plot(df = data, var.x = "Country", var.y = "xGD_90")
  })
  
  output$top_diff_GF_team <- renderTable({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    options = list(
      pageLength = 5
    )
    # top_team(var.criteria = "diff_GF")
    temp %>% select(Squad, Country, LgRk, diff_GF) %>%  top_n(5,diff_GF) %>% arrange(desc(diff_GF))
  })
  
  output$top_diff_GA_team <- renderTable({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    options = list(
      pageLength = 5
    )
    # top_team(var.criteria = "diff_GA")
    temp %>% select(Squad, Country, LgRk, diff_GA) %>%  top_n(-5,diff_GA) %>% arrange((diff_GA))
  })
  
  output$top_diff_GD_team <- renderTable({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    options = list(
      pageLength = 5
    )
    # top_team(var.criteria = "diff_GD")
    temp %>% select(Squad, Country, LgRk, diff_GD) %>%  top_n(5,diff_GD) %>% arrange(desc(diff_GD))
  })
  
  
  output$worst_diff_GF_team <- renderTable({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    options = list(
      pageLength = 5
    )
    # top_team(var.criteria = "diff_GF")
    temp %>% select(Squad, Country, LgRk, diff_GF) %>%  top_n(-5,diff_GF) %>% arrange((diff_GF))
  })
  
  output$worst_diff_GA_team <- renderTable({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    options = list(
      pageLength = 5
    )
    # top_team(var.criteria = "diff_GA")
    
    temp %>% select(Squad, Country, LgRk, diff_GA) %>%  top_n(5,diff_GA) %>% arrange(desc(diff_GA))
  })
  
  output$worst_diff_GD_team <- renderTable({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    options = list(
      pageLength = 5
    )
    # top_team(var.criteria = "diff_GD")
    temp %>% select(Squad, Country, LgRk, diff_GD) %>%  top_n(-5,diff_GD) %>% arrange((diff_GD))
  })
  
  output$table <- renderDataTable(iris)
}
