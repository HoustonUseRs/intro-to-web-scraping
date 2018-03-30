## Scrape multiple pages

We are now going to try an example that involves 'web crawling' - a practice that requires 'looping' through multiple web pages in an automated fashion instead of one page at a time. 

Let's take a look at some nba data. Go to this link:
http://www.espn.com/nba/attendance. 

This page presents a nice, detailed table on audience game attendance stats for different teams at different points in time. In fact, if you click on the drop down button next to 'Season', you'll see that this includes data all the way back to 2001.

So what if we wanted to do some cool analysis on audience game attendance over time? True, we could scrape the contents a year at a time... But what if the data contained 50+ years of info??? 

Luckily, rvest gives us the tools to 'crawl', or obtain data from several pages.

Let's first load the url of the website.

```espn_url <- 'http://www.espn.com/nba/attendance'```

Next, lets create a variable called ```espn_data```. Similar like we did in the last example, we are going to pipe read_html() to the url. Since the html attribute we are interested in is 'table', we will also assign that as an argument to html_node().

Since we want the data in a manageable format, we are going to also pipe ```html_table(header = TRUE)``` which will grab what we want and put it in a table, or more precisely, a dataframe.

```r
espn_html <- espn_year_url %>%
  read_html()

espn_year_data <- espn_html %>%
  html_node('table')
```

This is scraped data from only the year 2017. How do we go about scraping data from the other years?

If we go ahead and select different years from the drop down, the url we are presented with uses the template
'http://www.espn.com/nba/attendance/_/year/', with 'year' being the only variable that changes from year to year. 

By looping through the years, we can modify and update the url so that we can scrape all the available years.

Let's assign that url template to a variable. We also want to capture the range of years that we want. We can do that with the ```seq()``` function.
```r
espn_years_base_url <- 'http://www.espn.com/nba/attendance/_/year/'
years <- seq(2001, 2017)
```
Before we start looping through, lets create an empty dataframe. 
```espn_years_data <- data.frame()```

Now we are ready to build our loop function!
Our strategy is simple. We want to build out a script that performs the same actions used to  create 'espn_data', except by updating and adding on new year data to the previous year. 

```r
for (year in years) {
  espn_year_url <- paste0(espn_years_base_url, year)
  espn_year_data <- espn_year_url %>%
    read_html() %>%
    html_node('table') %>%
    html_table()
  espn_years_data <- rbind(espn_years_data, espn_year_data)
}

espn_years_data
```

We keep track of all of the different years by binding the rows of the current table being processed to the existing data frame. When the loop ends, we are left with a pretty comprehensive data frame that we can clean up, and analyze later. 

Since we are not going to be analyzing the data right away, let's save our resulting dataframe as a csv.

```write.csv(espn_years_data, file = "espn_years_data.csv")```

Another way to grab the urls for each year is to scrape for the values in the dropdown options like so:

```
espn_year_urls <- espn_html  %>%
  html_node('.tablesm') %>%
  html_nodes('option') %>%
  html_attr('value')
```

Now, you can loop over each url in a similar manner:

```
espn_years_data <- data.frame()
for (espn_year_url in espn_year_urls) {
  espn_year_data <- espn_year_url %>%
    paste0('http:', .) %>%
    read_html() %>%
    html_node('table') %>%
    html_table()
  espn_years_data <- rbind(espn_years_data, espn_year_data)
}
```

Congrats on building your first web crawler using R! Looping through web pages is super powerful, and will allow you to analyze large amounts of interesting data floating out there on the web. 




