source("global.R")
source("Prepocessing_teams.R")


header <- dashboardHeader(
  title = "Dashboard Soccer 2021-2021"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(text = "Dataset", tabName = "dataset", icon = icon("chart-area")),
    menuItem(text = "Expected goals vs reality", tabName = "goals", icon = icon("chart-area"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dataset",
            fluidRow(
              h2("The dataset from ..."),
              DT::dataTableOutput("goals_table")
            )),
    
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
                     box(title = "Difference between expect goals VS reality", width = 4.5,
                         plotOutput("plot1", click = "plot_click"),
                         # verbatimTextOutput("input_country")
                         ),
                     box(title = "Difference xG VS G (defense/forward)", width = 4)
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