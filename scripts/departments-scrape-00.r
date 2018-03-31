library(rvest)

# Let's tell R to remember the url.
depts_url <- 'http://www.houstontx.gov/departments.html'

link_addresses <- depts_url %>%
  # Step 2, Load the page
  read_html() %>%
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
