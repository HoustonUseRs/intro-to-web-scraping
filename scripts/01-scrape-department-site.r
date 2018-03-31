library(rvest)
library(dplyr)

depts_url <- 'http://www.houstontx.gov/departments.html'

# Step 2, Load the page
depts_html <- depts_url %>%
  read_html()

link_addresses <- depts_html %>%
# Step 6, Select the location
  html_nodes('.table150 a:first-of-type') %>%
# Step 7, Copy the information
  html_attr('href')

# Step 8, Open a new plain text file 
fileConn<-file("output.txt")

# Step 9 & 10, Paste the information and save the file
writeLines(link_addresses, fileConn)

# Close the file
close(fileConn)
