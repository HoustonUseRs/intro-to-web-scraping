library(rvest)
library(dplyr)
library(stringr)
url <- "http://www.houstontx.gov/departments.html"

dat <- url %>%
  read_html() %>%
  html_nodes(".table150") %>%
  html_nodes("p") %>%
  html_nodes("a") %>%
  html_text() %>%
  gsub("\\n|\\s{2,}", " ", .) %>%
  trimws()

dat2 <- url %>%
  read_html() %>%
  html_nodes(".table150") %>%
  html_nodes("p") %>%
  html_nodes("a") %>%
  html_attr("href")

dat <- dat[!dat == ""]
contact_name <- dat[seq(1 ,by =2, length(dat))]  
dept <- dat[!dat %in% names]
email <- dat2[seq(1 ,by =2, length(dat2))]
website <- dat2[!dat2 %in% emails]
  
dat3 <- url %>%
  read_html() %>%
  html_nodes(".table150") %>%
  html_nodes("p") %>%
  html_text() %>%
  str_extract("[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}") %>%
  unlist() 

phone <- dat3[!is.na(dat3)]

df <- data.frame(Names = contact_name,
                 Phone = phone,
                 Email = email,
                 Dept = dept,
                 Website = website)