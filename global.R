library(shiny)
library(shinydashboard)
library(DT)
library(data.table)
library(plotly)
library(leaflet)

## will uncomment below
team_stats = read.csv("./team_stats.csv", stringsAsFactors = FALSE)
player_stats = read.csv("./player_stats.csv", stringsAsFactors = FALSE)
transposed_team_stats = read.csv("./transposed_team_stats.csv", stringsAsFactors = FALSE)

nba_teams_choice = unique(team_stats$team)
seasons_choice = unique(team_stats$year)
stats_choice = team_stats %>%
  select(-c(year, team )) %>%
  colnames()






