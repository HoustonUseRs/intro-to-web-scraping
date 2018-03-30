# Intro to Web Scraping

## What is web scraping?

Put simply, **scraping** is extracting data - text or numbers - *from* the web *to* a file.

## Why might you need to scrape?

When you want:

* Information from a lot of similar pages
* Information structured in a way that you can easily use to analyze or make other things
* To harvest things...
  * Emails/contact info
  * Images
  * Downloading files/pdfs, etc.

for:

* Visualizations
  * Maps, charts, etc
* Dashboards
* Analysis
* Text processing

"Scraping" allows us to "scrape" information that we want from existing websites.  Some sites will have an existing way for you to easily get the information or data through a file downloads or through something called an API.  With other sites, we may not be so lucky and being able to scrape empowers us to turn any web page into a source of data.

## What we will do today

1. Scrape for text manually
1. Scrape for emails using code
1. Scrape a table of data using code

Along the way, we will learn the steps of scraping, and how to scrape using the following tools:

* Chrome
  * Selector Gadget
* R
* RStudio

While our examples are in R, the same approach can be automated with most other languages such as Python or JavaScript.

## Scrape for text manually

To understand the steps of web scraping, let's start by thinking about how we might manually "scrape" or what we might do for one-off situations where we want data off a webpage.

The easiest approach would be to simply copy and paste the text directly from the page. How might we manually "scrape" one page for specific chunks of information?

Let's take ____ for example.

### What are the discrete steps?

1. Pick a page
1. Load the page
1. Look at the page
1. Decide what information we want
1. Select the location
1. Copy the information
1. Open a new plain text file
1. Paste the information
1. Save the file

For this simple use case of grabbing the current headlines for analysis, manually scraping the information is efficient.  However, if we were to want to grab the latest headlines each day, repeating these steps manually everyday would become tedious and we might forget.  At that point, automating the scraping with code would be more effective.

Another reason we would want to code to scrape is if we are grabbing multiple separate areas of text on a page, or if we want to grab the link addresses or image urls, etc.

## Scrape for emails using code

Let's scrape [http://www.houstontx.gov/departments.html](http://www.houstontx.gov/departments.html) for the emails of the heads of the departments.

Along with the steps from before, we will need to add one step, which is to find a way to tell the computer what information to select.

1. Pick a page
1. Load the page
1. Look at the page
1. Decide what information we want
1. **Determine a "selector" for where the information is**
1. Select the location
1. Copy the information
1. Open a new plain text file
1. Paste the information
1. Save the file

### Look at the page

Let's load the page in Chrome.  We can see that if we hover over the first person's link, the lower left hand of our browser displays an email link.  There's no easy way for us to manually get the email link address for each person by copying and pasting as before.

Getting a grasp on how the computer sees the page will help us communicate to it what part or parts of the page to select to grab information from.  Let's "inspect" the page.

The code we see when we inspect the page is what the browser translates into the webpage as we see it right now.  For this webpage, the code that we are seeing is what our code for automated scraping will download from the Internet to scrape information from.

We can see the HTML, or the code for the content of the page here.  If we inspect the code specifically for the name of the first person by right clicking on it and choosing the "Inspect" option, we see the HTML for just that link highlighted.

We can see both the text of the link in between the `<a>` and `</a>` things, but also, we can see the link address that it links to by the `href=` thing.  Let's inspect the name of the second person by right clicking on it and choosing the "Inspect" option as before.  We see a similar pattern with the second person's name and email link.

The code for pretty much any link on any website will look similar.  The `<a>` and `</a>` things are the opening and closing tags.  The `href=` thing is called an attribute, where the attribute is named `href` and the value is the link address itself.  This unit of HTML, with the opening and closing tags, the attributes, and the content the tag encloses, is called an HTML element.

If we glance at the HTML around the HTML for the links, we will see a similar pattern of open and closing tags for content, along with different attributes for that content on the opening tags.

In addition to `a`/link elements, HTML has `table` elements, list elements, paragraph elements, heading elements of different importance, and many more.  So far, we've only mentioned how a website codes for it's content.

For it's appearance, such as the color of links, or the font to use for the paragraphs, websites use CSS.  CSS works with selections and appearance rules for those selections.  That is, it has selectors that match for specific elements or element, and then it declares how those things should be styled in between the curly brackets.

We can use these same selectors to communicate what selections to scrape from.  There are other options for selectors, but CSS selectors for scraping is both powerful and flexible.

Now that we've looked at the page and understand it's structure a bit, we can think about what information we're wanting to scrape, and how we can select for them.  The Inspector will help us, but we can also use the Selector Gadget plugin to help us further.

### Determine a "selector" for where the information is

Let's turn it on.  If we click on an element, what we clicked on will turn green.  However, the selector for that element can be used to select all elements that match.  Those additional matches are now in yellow.  We can click on elements we want to exclude of the yellow ones, and they will turn red once the selector box updates to exclude them.  You can click the `?` on the Selector Gadget at anytime for a reminder of how it works.

Notice how the text in the left box changes with our different clicks.  That is the selector that will select for the green and yellow elements.  The `clear` button is very handy if you want to start over with making your selector.

To select for just the links per person, we click on the first person's link, and click on a yellow link in the top section to exclude links outside of the people boxes.  We get something like `.table150 a`.  Let's make a note of this selector.  

Try some other selections and look at the selectors as you update your selections.  You may notice some patterns.

Let's take some selectors and try them in R.

### Scraping information R

```
# Let's tell R to remember the url.
depts_url <- 'http://www.houstontx.gov/departments.html'

link_addresses <- depts_url %>%
# First, we need to load the page.
  read_html() %>%
# Let's select an `html_node`
  html_node('.table150 a') %>%
# and look at the text.
  html_text()

# We can also grab the attribute `href` to get the link address as well!
link_addresses <- depts_url %>%
  read_html() %>%
  html_node('.table150 a') %>%
  html_attr('href')

# Switching `html_node` to `html_nodes` gets back all the matching link elements!
link_addresses <- depts_url %>%
  read_html() %>%
  html_nodes('.table150 a')

# So, we can get all the text values of the link elements
link_addresses <- depts_url %>%
  read_html() %>%
  html_nodes('.table150 a') %>%
  html_text()

# or, all the link address from the `href` attribute.
link_addresses <- depts_url %>%
  read_html() %>%
  html_nodes('.table150 a') %>%
  html_attr('href')

# To grab just the emails, we can either grab just the odd values from this list
odd_locations <- link_addresses %>%
  length() %>%
  seq(1, ., 2)

email_addresses <- link_addresses[odd_locations]

# or, we can adjust the CSS selector.
link_addresses <- depts_url %>%
  read_html() %>%
  html_nodes('.table150 a:first-of-type') %>%
  html_attr('href')
```

Now, we can code the bolded steps:

1. Pick a page
1. **Load the page**
1. Look at the page
1. Decide what information we want
1. Determine a "selector" for where the information is
1. **Select the location**
1. **Copy the information**
1. **Open a new plain text file**
1. **Paste the information**
1. **Save the file**

```r
# Let's tell R to remember the url.
depts_url <- 'http://www.houstontx.gov/departments.html'

link_addresses <- depts_url %>%
# Step 2, Load the page
  read_html() %>%
# Step 6, Select the location
  html_nodes('.table150 a') %>%
# Step 7, Copy the information
  html_attr('href')

# Step 8, Open a new plain text file 
fileConn<-file("output.txt")

# Step 9 & 10, Paste the information and save the file
writeLines(link_addresses, fileConn)

# Close the file
close(fileConn)
```

The small adjustment we made to the CSS selector shows how powerful selectors can be.  This [interactive tutorial](https://flukeout.github.io/) teaches us about CSS selectors and helps us get practice.


## [Scrape a table of data using code](./README_3.md)



### Next level stuff

### When these tools aren't enough

Check out https://www.governmentjobs.com/careers/houston . The page has a table-like structure like the previous page we looked at but with one exception- it includes a login. We could scrape the table as is, but if we wanted to access user specific data, we need to figure out how to login during our scraping session. Luckily, there is a tool we can use called Selenium. Selenium is a piece of software that is able to automate browsers. With it, we can simulate clicking buttons, filling in forms, pressing certain keys etc. Let's look at what we can do with Selenium....



#### Finding help &  Extra Resources

Review what you learned today and more with this rvest [Data Camp tutorial](https://www.datacamp.com/community/news/web-scraping-in-r-rvest-tutorial-43z6wf5u86)


Learn to scrape data in Python using [Beautiful Soup and Pandas](https://pythonprogramminglanguage.com/web-scraping-with-pandas-and-beautifulsoup/) 

Advanced Web Crawling with Scrapy

Scraping PDF documents with Tabula
