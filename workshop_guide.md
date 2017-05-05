# Intro to Web Scraping


## Outline

#### What is webscraping?
>>>

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
Exact steps?
pick a page
load page in browser
look at the page
decide what information we want
select it
copy it
open a new plain text file
paste it
save it

~Challenge, tell the instructor to "scrape" a specific part of a page, worksheet
would it be crazy to print out webpages with sections outlined to challenge people to describe to instructor to select certain text?  this can really illustrate the central role that selectors play.
this need to communicate to someone else what to do requires this extra step of determine a selector and common agreement between the two parties on how to describe what to selector~

A little deeper dive
let's do this with the page for the first example.
pick a page
load page in browser
this step we will be able to code the computer to do something similar for us
look at the page
the computer will have a way of downloading the contents of the page and remembering it in a way that is easy for it to search through
maybe pull images from: http://wtf.tw/ref/duckett.pdf 
browser developer tools (chrome)
this code that we see in the inspector is what the browser translates into the webpage as we see it.
briefly, the anatomy of a webpage
point out HTML

this is the what, or the content of the page
this includes, what lists are in the content, what tables, what forms, what headings, what paragraphs, what links, what images, etc.
point out that the text that we saw in the page is there, but what else?
link addresses
image sources
point out how things have an opening and closing tag to wrap things inside of it
these are nodes
point out how the extra information like where a link links to has some name and then the value
these are attributes
point out CSS
this is how the page should look, or the styles of the page
point out the selectors
point out JavaScript tags, or JavaScript itself or just lightly mention that there's also JavaScript
this is how the page will behave, or the interactions of the page
Point out that it all just looks like different kinds of weird English.
also view source
this code is what the browser initially downloads from the internet, before it interprets it
here we can demonstrate a page that don't need a simulated browser, vs. ones that do:
http://www.houstontx.gov/departments.html vs https://www.governmentjobs.com/careers/houston
if the content you are looking for is not in view source, then we will need an extra step from what we are learning today in order to get the content that we want.
this means that the information that you want to scrape is being written into the HTML page using JavaScript, and we will need to scrape the content using a simulated browser to run the page as if it were actually loaded by a browser so that the JavaScript can run, write the content that we want to grab, and then we can grab the content.
If the content you are looking for is in the view source, then we can use the just the steps we are learning today to get the content that we want.
later when doing this in code, show how the contents of the html string matches we have in view source rather than inspect element.
decide what information we want
describe what to select
To tell the computer where this is, we will need a way to describe to the computer what part or parts of the page to select.
importance of a "good" selector
let's use selector gadget to help us
The type of selector we are using is the CSS selector.  This selector is what websites already use for people who make the websites to "select" different parts of the content to style differently from the default appearance.
The granularity we can get to with this type of selector is down to the HTML element/node.
test and iterate a couple times with making selectors by clicking on different areas
show the instructions from clicking on the `?`
we could write some down for when we actually code to scrape this page.
try typing in selectors as well into the text box to show examples
selecting by element, i.e. `p`, `table`, `h1`
select child of element, i.e. `div p`, `table a`
selecting a specific element that has an `id` attribute with `#putIDHere`
note
there's more than one way to select what we want
selector gadget isn't perfect, but should get us pretty close to what we need
have brief way to show example open of page with and without CSS
select it
Once we have a selector, we can code the computer to do this for us
copy it
What we'll tell the computer to do here instead is to pull just the text -- ignoring any other HTML code -- from what we've told it to select
open a new plain text file
This will have a direct code step translation
paste it
This will have a direct code step translation
save it
This will have a direct code step translation


Break/practice/learn some CSS selecting with:
https://flukeout.github.io/


First example, scraping for text

Do together
pick the page and assign the URL to a variable

Then, allow time for people to scrape for texts from various elements as practice

Bring the pieces of information together

Second example, scraping 
maybe http://www.houstontx.gov/departments.html


try to grab links and the link addresses from the department table
this will require showing how selector gadget will not nicely select the table for us
`read_html(depts) %>% html_nodes('.table150 a') %>% html_attr('href')`


Third example
http://www.espn.com/nba/attendance
https://github.com/pandafulmanda/stuffs/blob/master/get_and_plot_attendance.r -- make a simpler version of this without mapping, just using looping.


this note goes some where else.
For sites that need a simulated browser to get the content you want to scrape, that is achieved using something called Selenium.


Next steps, finding help, and resources





Email

