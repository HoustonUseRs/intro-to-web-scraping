library(rvest)

espn_url <- "http://www.espn.com/nba/attendance"

espn_html <- espn_url %>%
  read_html()

espn_year_urls <- espn_html  %>%
  html_node(".tablesm") %>%
  html_nodes("option") %>%
  html_attr("value")

espn_years_data <- data.frame()
for (espn_year_url in espn_year_urls) {
  espn_year_data <- espn_year_url %>%
    paste0("http:", .) %>%
    read_html() %>%
    html_node("table") %>%
    html_table()
  espn_years_data <- rbind(espn_years_data, espn_year_data)
}

write.csv(espn_years_data, file = "espn_years_data.csv")
