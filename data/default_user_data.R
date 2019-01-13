# indiviual user script created for and updated for each user. 
# script is loaded into shiny app after is it called from 
# user authentication, should eventually contain everything
# passed into ui and server and look like 
# links to associated css file for theme
# ui <- ui_data
# server <- function(input, output){server_data}
# in the case of dynamic content, store messages, etc in lists
# create dataframes for each user to pull content from lists when
# app is loaded

# library(shiny)
# library(shinydashboard)
# check if it's necessary for each user

# Variables
{ 
  # UI
  
  header_dropdown_1 <- {
    dropdownMenu(
      type = "messages",
      messageItem(
        from = "Sales Dept",
        message = "Sales are steady this month."
      ),
      messageItem(
        from = "New User",
        message = "How do I register?",
        icon = icon("question"),
        time = "13:45"
      ),
      messageItem(
        from = "Support",
        message = "The new server is ready.",
        icon = icon("life-ring"),
        time = "2014-12-01"
      )
    ) 
  } # end of header_dropdown_1
  
  header_dropdown_2 <- {
    dropdownMenu(
      type = "notifications",
      notificationItem(
        text = "5 new users today",
        icon("users")
      ),
      notificationItem(
        text = "12 items delivered",
        icon("truck"),
        status = "success"
      ),
      notificationItem(
        text = "Server load at 86%",
        icon = icon("exclamation-triangle"),
        status = "warning"
      )
    )
  } # end of header_dropdown_2
  
  header_dropdown_3 <- {
    dropdownMenu(type = "tasks", badgeStatus = "success",
                 taskItem(value = 90, color = "green",
                          "Documentation"
                 ),
                 taskItem(value = 17, color = "aqua",
                          "Project X"
                 ),
                 taskItem(value = 75, color = "yellow",
                          "Server deployment"
                 ),
                 taskItem(value = 80, color = "red",
                          "Overall project"
                 )
    )
  }
  
  header <- {
    dashboardHeader(
      title = "Budget App",
      # include inbox, notifications, help
      
      # for dynamicMessages, use
      # dropdownMenuOutput("messageMenu")
      header_dropdown_1, # messsages
      header_dropdown_2, # notifications
      header_dropdown_3 # targets set by users
    )
    
    # to disable header, use
    # dashboardHeader(disable = TRUE)
    
  } # end of header tag
  
  # put services together in one tab and put sub items
  sidebar <- {
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("home")),
        menuItem("Profile", tabName = "profile", icon = icon("address-card")),
        menuItem("Budget", tabName = "budget", icon = icon("calculator")),
        menuItem("Budget 2", tabName = "budget2", icon = icon("money-check-alt")),
        # use badge* to display important info
        menuItem("Investment Portfolio", tabName = "portfolio", icon = icon("business-time"),
                 badgeLabel = "new", badgeColor = "green"),
        menuItem("Messages", tabName = "messages", icon = icon("envelope")),
        menuItem("Notifications", tabName = "notifications", icon = icon("exclamation-triangle")),
        menuItem("Settings", tabName = "settings", icon = icon("cogs")),
        menuItem("Help", tabName = "help", icon = icon("question-circle")),
        menuItem("Source code", icon = icon("file-code-o"),
                 href = "https://github.com/ebinabo/budget-app-skeleton")
      )
    )
  } # end of sidebar tag
  
  # tabItems
  {
    # Dashboard has summaries of other tabs
    # Tab 1 Content, Dashboard
    tabItem_1 <- {
      tabItem(tabName = "dashboard",
              h2("Dashboard tab content")
      )
    }
    
    # Tab 2 Content, Profile
    tabItem_2 <- {
      tabItem(tabName = "profile",
              h2("Proile tab content")
      )
    }
    
    # budget section should contain spending 
    # categories selected by user
    {
      # Tab 3 Content, Budget
      tabItem_3 <- {
        tabItem(tabName = "budget",
                h2("Budget tab content")
        )
      }
      
      # Tab 4 Content, Budget 2
      tabItem_4 <- {
        tabItem(tabName = "budget2",
                h2("Budget 2 tab content")
        )
      }
    } # budget tabs
    
    # Tab 5 Content, Portfolio
    tabItem_5 <- {
      tabItem(tabName = "portfolio",
              h2("Investment Portfolio tab content")
      )
    }
    
    # All messages, linked to from header messages
    # Tab 6 Content, Messages
    tabItem_6 <- {
      tabItem(tabName = "messages",
              h2("Linked content from header messages")
      )
    }
    
    # All notifications, linked to from header notifs
    # Tab 6 Content, Notifications
    tabItem_7 <- {
      tabItem(tabName = "notifications",
              h2("Linked content from header notifications")
      )
    }
    
    # Tab 7 Content, Settings
    tabItem_8 <- {
      tabItem(tabName = "settings",
              h2("Settings tab content")
      )
    }
    
    # Tab 8 Content, Help
    tabItem_9 <- {
      tabItem(tabName = "help",
              h2("Help tab content")
      )
    }
    
  }
  
  body <- {
    dashboardBody(
      tabItems(
        tabItem_1,
        tabItem_2,
        tabItem_3,
        tabItem_4,
        tabItem_5,
        tabItem_6,
        tabItem_7,
        tabItem_8,
        tabItem_9
      )
    )
  } # end of body tag
  
}


{
  # Server
  
  dynamicMenu <- renderMenu({
    # Code to generate each of the messageItems here, in a list. This assumes
    # that messageData is a data frame with two columns, 'from' and 'message'.
    msgs <- apply(messageData, 1, function(row) {
      messageItem(from = row[["from"]], message = row[["message"]])
    })
    
    # This is equivalent to calling:
    #   dropdownMenu(type="messages", msgs[[1]], msgs[[2]], ...)
    dropdownMenu(type = "messages", .list = msgs)
  })
  
}

dashboard <- dashboardPage(
  header,
  sidebar,
  body
)

selected_theme <- tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = user_data$theme)
)

ui_data <- fluidPage(
  # selected_theme,
  dashboard
)
















