

server <- function(input, output, session) {
  
  #### Dataset
  output$goals_table = DT::renderDataTable({
    data_goals
  })
  
  #### Plots
  
  output$plot1 <- renderPlot({
    req(input$input.country)
    temp <- data_goals %>% filter(Country %in% input$input.country) 
    linear_reg(df = temp,
               var.x = "xGD_90",
               var.y = "GD_90",
               group =  "Country",
               name = "_App")
  })
  
  output$input_country <- renderText({
    input$input.country
  })
}
