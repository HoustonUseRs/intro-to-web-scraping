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

Tools/Set up
Chrome
Selector Gadget
R
RStudio

## Workflow/Introduction to the steps
To understand the steps of web scraping, let's start thinking about how we might manually "scrape" or what we might do for one-off situations where we want data off a webpage.

The easiest approach would be to simply copy and paste the text directly from the page. How might we manually "scrape" one page for specific chunks of information?  We need to enumerate the exact steps, in order to tell the computer.


#### What are the discrete steps?

1. pick a page
1. load page in browser
1. look at the page
1. decide what information we want
1. select it
1. copy it
1. open a new plain text file
1. paste it
1. save it


Break/practice/learn some CSS selecting with:
https://flukeout.github.io/


### First example, getting the text

Do together
pick the page and assign the URL to a variable

Then, allow time for people to scrape for texts from various elements as practice

Bring the pieces of information together

### Second example, selecting for specific text
maybe http://www.houstontx.gov/departments.html


try to grab links and the link addresses from the department table
this will require showing how selector gadget will not nicely select the table for us
`read_html(depts) %>% html_nodes('.table150 a') %>% html_attr('href')`


### Third example - introducing crawling
http://www.espn.com/nba/attendance
https://github.com/pandafulmanda/stuffs/blob/master/get_and_plot_attendance.r -- make a simpler version of this without mapping, just using looping.


### Next level stuff

#### When all this breaks down
For sites that need a simulated browser to get the content you want to scrape, that is achieved using something called Selenium.

#### finding help, and resources

