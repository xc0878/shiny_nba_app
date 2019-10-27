
ui <- dashboardPage( skin = "green",
                     #App name
                     dashboardHeader(
                         title = "NBA Stats 2014-2019", titleWidth = 300),
                     #Sidebar Items
                     dashboardSidebar(
                         sidebarMenu(
                             menuItem("Team Ranking",tabName= "chart1"),
                             # tab item for team stats
                             menuItem("Team Comparison", tabName= "chart2")
                             #tab item for player stats
                         )
                     ),
                    #team ranking
                     dashboardBody(
                         tabItems(
                             tabItem(tabName = "chart1",
                                     fluidPage(
                                         h1("Team Ranking"),
                                         box(title="Select Season",
                                             width = 5,
                                             selectizeInput(inputId ="season", label=NULL, seasons_choice)),
                                         
                                         box(title="Select Team Stat", width = 5, selectizeInput(inputId ="stats_choice", label=NULL, stats_choice)),
                                         
                                         
                                         box(width=12, title="Ranking of Team Stats",
                                             solidHeader = TRUE,
                                             plotOutput("plot1",height = 500)))),
                             

                             # team comparison
                             tabItem(tabName = "chart2",
                                     fluidPage(
                                         h1("Team Comparison"),
                                         box(title="Team 1", width = 3, selectizeInput(inputId ="selected_team_1", label=NULL, nba_teams_choice)),

                                         box(title="Select Team Stat", width = 3, selectizeInput(inputId ="stats_choice1", label=NULL, stats_choice)),
                                         box(title="Team 2", width = 5, selectizeInput(inputId ="selected_team_2", label=NULL, nba_teams_choice)),
                                         

                                         box(width= 12, title = "Team Comparison",
                                             solidHeader =TRUE,
                                             plotOutput("plot2", height = 500))
                                     ))
                         )
                     ))
