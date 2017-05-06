library(rvest)
library(dplyr)

depts_url <- 'http://www.houstontx.gov/departments.html'

depts_url %>%
  read_html()  %>%
  html_node('.table150 a') %>%
  html_text()

depts_url %>%
  read_html()  %>%
  html_nodes('.table150 a') %>%
  html_text()

link_addresses <- depts_url %>%
  read_html()  %>%
  html_nodes('.table150 a') %>%
  html_attr('href')

link_addresses


espn_url <- 'http://www.espn.com/nba/attendance'

espn_data <- espn_url %>%
  read_html() %>%
  html_node('table') %>%
  html_table(header=TRUE)


espn_years_base_url <- 'http://www.espn.com/nba/attendance/_/year/'
years <- seq(2001, 2017)

espn_years_data <- data.frame()

for (year in years) {
  espn_year_url <- paste0(espn_years_base_url, year)
  espn_year_data <- espn_year_url %>%
    read_html() %>%
    html_node('table') %>%
    html_table()
  espn_years_data <- rbind(espn_years_data, espn_year_data)
}

espn_years_data


