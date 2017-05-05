# Intro to Web Scraping

## Outline

#### What is webscraping?

Put simply, **scraping** is extracting data - text or numbers - *from* the web *to* a file

#### Why might you need to scrape?

* you want information from a lot of similar pages
* you want information structured in a way that you can easily use to analyze or make other things
* harvesting things...
  * emails/contact info
  * images
  * downloading files/pdfs, etc.

_and_

* no API

for: 

* visualization
* maps, charts, etc
* dashboard
* analysis
* text processing

"scraping" allows us to "scrape" information that we want from existing websites to build things using information available on the web.

## Flow of the workshop
how to scrape, without any coding
this will help us learn the steps and principles that can be applied in whatever language -- Python, R, node, etc. you wish to work in
3 examples coding in R
simple text-grabbing to save to a file
as you might do for an NLP project
pull data from a webpage into a csv file
as you might do for more general data analysis projects, or for visualization projects
pull data from several pages of the same structure into a csv file
as you might do for more general data analysis projects, or for visualization projects
this is a simple example of "crawling"
how to tell when a page might require an additional step to scrape

this chunk should go somewhere else
More advanced topics that are useful to know for scraping that we will not be covering but will share resources for:
how to scrape
content behind a login
pages where the content has been written by JavaScript
content that you have to click or fill out a form to get to without the website URL updating
these other kinds of pages will require a web browser to be simulated and controlled 
perhaps we can have a chart for this

Tools/Set up
Chrome
Selector Gadget
R
RStudio

## Workflow/Introduction to the steps
To understand the steps of web scraping, let's start thinking about how we might manually "scrape" or what we might do for one-off situations where we want data off a webpage.
For a human
How might we manually "scrape" one page for specific chunks of information?  What are the common scenarios?
The manual version of what we are about to do now, is, going to a website we want information from, going to a section that we want, selecting the text that we want, and then copying and pasting it into a plain text file to save it.

#### What are the discrete steps?

pick a page
load page in browser
look at the page
decide what information we want
select it
copy it
open a new plain text file
paste it
save it


Break/practice/learn some CSS selecting with:
https://flukeout.github.io/


### First example, scraping for text

Do together
pick the page and assign the URL to a variable

Then, allow time for people to scrape for texts from various elements as practice

Bring the pieces of information together

### Second example, scraping 
maybe http://www.houstontx.gov/departments.html


try to grab links and the link addresses from the department table
this will require showing how selector gadget will not nicely select the table for us
`read_html(depts) %>% html_nodes('.table150 a') %>% html_attr('href')`


### Third example
http://www.espn.com/nba/attendance
https://github.com/pandafulmanda/stuffs/blob/master/get_and_plot_attendance.r -- make a simpler version of this without mapping, just using looping.


### Next level stuff
For sites that need a simulated browser to get the content you want to scrape, that is achieved using something called Selenium.

Next steps, finding help, and resources

