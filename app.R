library(shiny)
library(shinydashboard)

source("data/default_user_data.R")

# with user auth,
# handle anomalities within user_auth
# ifelse(user_auth() returns user_data as char in example above,
#        load source(user_data),
#        return failed password source with link to retry,
#        allow only 3 retries then ask for security key)


# Define UI for application that draws a histogram
ui <- ui_data


# Define server logic required to draw a histogram
server <- function(input, output){
  # output$messageMenu <- dynamicMenu
  # server_data
}

# Run the application 
shinyApp(ui = ui, server = server)

