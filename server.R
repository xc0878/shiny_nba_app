shinyServer(function(input, output) {

    # ranking of team stats
    output$plot1 <- renderPlot(
        team_stats %>%
            group_by(year, team) %>%
            filter(year == input$season) %>%
            select(x = team, y = input$stats_choice) %>%
            ggplot(
                aes(x = reorder(x, y),
                    y = y)) +
            geom_bar(stat = "identity", fill = rainbow(30)) +
            coord_flip() +
            labs(x = '', y = as.character(input$stats_choice) )
            )
    
    output$plot2 <- renderPlot(
        team_stats %>%
            filter(team == input$selected_team_1 | team == input$selected_team_2) %>%
            select(team, x = year, y = input$stats_choice1) %>%
            ggplot(
                aes(x = x,
                    y = y)) + 
            geom_point() + aes(color = team) + geom_smooth() +
            labs(x = '', y = '')
        
    )

    
# team_stats %>%
#     filter(team=="ATL" | team=="BOS") %>%
#     
#     tesadasts %>%
#         ggplot(aes(x = year, y = win_pct)) + geom_point() +
#         aes(color = team) + geom_smooth()
})
# 
# colnames(team_stats)
# team_stats %>%
#     group_by(year, team) %>%
#     filter(year == '2019', team == "ATL" | team == "BOS") %>%
#     ggplot(
#         aes(team, y = c(win_pct)) +ge
#     geom_col()
#     )
# 
# colnames(team_stats)
# 
# tesadasts = team_stats %>%
#     group_by(year, team) %>%
#     filter(team == "ATL" | team == "BOS") %>%
#     select(year, team, win_pct, team_pct_2ptgfm_asstd,team_pct_pts_3pt)
# 
# 
# tesadasts %>%
#     filter(team == "ATL" | team == "BOS") %>%
#     ggplot(
#         geom_col(aes(x = team, y = win_pct, fill =  win_pct), position = 'dodge'))
# 
# 
# 
# mpg %>%
#     ggplot(aes(x = manufacturer, y = hwy)) + geom_point()
# 
# tesadasts %>%
#     ggplot(aes(x = year, y = win_pct)) + geom_point() +
#         aes(color = team) + geom_smooth()



