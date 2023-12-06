source("global.R")
source("Prepocessing_teams.R")


header <- dashboardHeader(
  
  title = "Dashboard Soccer 2021-2021"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(text = "Dataset", tabName = "dataset", icon = icon("chart-area")),
    menuItem(text = "Dataset processed", tabName = "dataset_processed", icon = icon("chart-area")),
    menuItem(text = "Expected goals vs reality", tabName = "goals", icon = icon("chart-area"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dataset",
            fluidRow(
              h2("The dataset from ..."),
              # DT::dataTableOutput("goals_table")
              column(
                dataTableOutput(outputId = "table_goal"), width = 12
              )
            )
    ),
    
    tabItem(tabName = "dataset_processed",
            fluidRow(
              h2("The dataset is processed with results with expected goals and goals calculated per game:"),
              # DT::dataTableOutput("goals_table")
              column(
                dataTableOutput(outputId = "table_goal_processed"), 
                width = 12
              )
            )
    ),
    
    tabItem(tabName = "goals",
            fluidRow(
              column(width = 2,
                     box(title = "Parameters",width = 12,
                         checkboxGroupInput(inputId ="input.country" ,"Choose country:",
                                            choiceNames =  unique(data_goals$Country),
                                            choiceValues = unique(data_goals$Country),
                                            selected = unique(data_goals$Country)),
                         submitButton("Graph")
                     ),

              ),
              column(width = 9,
                     box(title = "Goal difference (GD) between expect goals VS reality", width = 4,
                         plotOutput("plot_xG_realG", click = "plot_click")
                         ),
                     box(title = "Goal scored (GF) between expect goals VS reality", width = 4,
                         plotOutput("plot_xGF_realG", click = "plot_click")
                     ),
                     box(title = "Goal against (GA) between expect goals VS reality", width = 4,
                         plotOutput("plot_xGA_realG", click = "plot_click")
                     )
              )
            ),
            fluidRow(
              column(width = 2,
              ),
              column(width = 9,
                     box(title = "Teams with best/worst goals difference (GD)", width = 4,
                         tableOutput('top_diff_GD_team'),
                         tableOutput('worst_diff_GD_team')
                     ),
                     box(title = "Teams which over/under scored goals for (GF)", width = 4,
                         tableOutput('top_diff_GF_team'),
                         tableOutput('worst_diff_GF_team')
                     ),
                     box(title = "Teams which over/under score against (GA)", width = 4,
                         tableOutput('top_diff_GA_team'),
                         tableOutput('worst_diff_GA_team')
                     )
              )
            ),
            
            fluidRow(
              column(width = 2,
              ),
              column(width = 9,
                     box(title = "Evolution of the xGoal difference (GD) with the ranking", width = 4,
                         plotOutput("plot_xG_ranking", click = "plot_click")),
                     box(title = "Evolution of the xGoal for (GF) with the ranking", width = 4,
                         plotOutput("plot_xGF_ranking", click = "plot_click")),
                     box(title = "Evolution of the xGoal against (GA) with the ranking", width = 4,
                         plotOutput("plot_xGA_ranking", click = "plot_click")
                     )
              )
            )
            
    )
  )
)


ui <- dashboardPage(
  header,
  sidebar,
  body
)