library(rvest)
library(purrr)
library(readr)
library(ggmap)
library(leaflet)
library(dplyr)

# Let's tell R to remember the url.
depts_url <- 'http://www.houstontx.gov/departments.html'

depts_html <- depts_url %>%
  read_html()

people_htmls <- depts_html %>%
  html_nodes('.table150')

parse_person_html <- function (person_html) {

  name <- person_html %>%
    html_node('p a:first-of-type') %>%
    html_text() %>%
    trimws()

  email <- person_html %>%
    html_node('p a:first-of-type') %>%
    html_attr('href') %>%
    gsub('mailto:|\\?.+', '', .)

  dept <- person_html %>%
    html_node('p a:last-of-type') %>%
    html_text() %>%
    gsub("\\n|\\s{2,}", " ", .) %>%
    trimws()

  website <- person_html %>%
    html_node('p a:last-of-type') %>%
    html_attr('href')

  phone <- person_html %>%
    html_text() %>%
    stringr::str_extract("[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}") %>%
    unlist()

  role <- person_html %>%
    html_nodes(xpath='p[last()]/text()') %>%
    do.call(paste0, .) %>%
    gsub("[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}", '', .) %>%
    trimws()

  return(list(
    name=name,
    email=email,
    phone=phone,
    dept=dept,
    role=role,
    website=website
  ))
}

people_data <- people_htmls %>%
  map(parse_person_html) %>%
  bind_rows()
