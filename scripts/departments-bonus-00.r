library(rvest)
library(dplyr)
library(stringr)

depts_url <- "http://www.houstontx.gov/departments.html"

depts_html <- depts_url %>%
  read_html()

name <- depts_html %>%
  html_nodes('.table150 a:nth-child(3) , .table150 a:nth-child(1)') %>%
  html_text() %>%
  gsub("\\n|\\s{2,}", " ", .) %>%
  trimws()

email <- depts_html %>%
  html_nodes('.table150 a:nth-child(3) , .table150 a:nth-child(1)') %>%
  html_attr("href")

dept <- depts_html %>%
  html_nodes('br~ br+ a') %>%
  html_text() %>%
  gsub("\\n|\\s{2,}", " ", .) %>%
  trimws()

website <- depts_html %>%
  html_nodes('br~ br+ a') %>%
  html_attr("href")

# get phone number
phone_number <- depts_url %>%
  read_html() %>%
  html_nodes(".table150 p") %>%
  html_text() %>%
  stringr::str_extract("[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}") %>%
  unlist()

df <- data.frame(Names = name,
                 Phone = phone,
                 Email = email,
                 Dept = dept,
                 Website = website)