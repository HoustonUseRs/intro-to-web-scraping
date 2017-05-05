
### learning objective #1 is to teach people how to see the useful patterns in the structure behind the websites with data they want


### learning objective #2 is to show them one particular tool for using that structure to grab the data


things that will be of interest but that we won't directly teach are: 
* Scraping PDFs (we can mention for this they can use tabula and its drivers)
* Scraping pages with logins, data loaded through PHP, Javascript (we can mention for this they can use selenium and its drivers)
* Advanced crawling (we can mention for this they can use something like scrapy spiders)


Example websites: 

http://www.houstontx.gov/civicart/artbyzipcode.html
http://cohweb.houstontx.gov/FIN_FeeSchedule/
https://www.tsl.texas.gov/arc/genfirst.html
https://www.houstontx.gov/courts/fine_and_fees.html
http://www.houstontx.gov/solidwaste/holiday.html

something else before (Ez mode)
text grabbing only
one other one with good table and no crawling
nba attendance ( A LITTLE HARDER)
slightly not as nice table
crawling

Steps:
Pick page
Look at and inspect page
browser developer tools (chrome)
importance of a unique selector
test/iterate often
What info do you want to grab?

start with a quick initial scrape for content off simple page

repeat with

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

you can do this in R, python, javascript

Selenium later



End product
a dataframe? getting some data? or a visualization from scraped data?

Types of selectors
http://selectorgadget.com/

scraping vs crawling




Potential questions
PDF?
https://ropensci.org/blog/2016/03/01/pdftools-and-jeroen



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





Email
