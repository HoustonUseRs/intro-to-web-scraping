library(rvest)
library(purrr)
library(readr)
library(ggmap)
library(leaflet)
library(dplyr)

results_url <- 'https://www.har.com/montrose/homes-for-sale/91?bedroom_min=1&full_bath_min=1&listing_price_max=600000'

places_urls <- results_url %>%
  read_html() %>%
  html_nodes('.mpi_info .address') %>%
  html_attr('href')

scrape_for_house <- function(place_url) {
  place_html <- place_url %>%
    read_html()

  address1 <- place_html %>%
    html_node('.property_title') %>%
    html_node(xpath='text()') %>%
    html_text()

  address2 <- place_html %>%
    html_node('.property_address') %>%
    html_node(xpath='text()') %>%
    html_text()

  address <- paste0(address1, ' ', address2)

  photos <- place_html %>%
    html_nodes('.slides li a') %>%
    html_attr('href')

  price <- place_html %>%
    html_nodes('.mpi_price') %>%
    html_text() %>%
    parse_number()

  status <- place_html %>%
    html_node(xpath='//div[text()="Listing Status:"]') %>%
    html_node(xpath='../div[2]') %>%
    html_node('.pull-left') %>%
    html_text()

  year <- place_html %>%
    html_node(xpath='//div[text()="Year Built:"]') %>%
    html_node(xpath='../div[2]') %>%
    html_text() %>%
    gsub(' /Appraisal District', '', .) %>%
    parse_number()

  bedrooms <- place_html %>%
    html_node(xpath='//div[text()="Bedrooms:"]') %>%
    html_node(xpath='../div[2]') %>%
    html_text() %>%
    gsub(' Bedroom(s)', '', .) %>%
    parse_number()

  baths <- place_html %>%
    html_node(xpath='//div[text()="Baths:"]') %>%
    html_node(xpath='../div[2]') %>%
    html_text()

  size <- place_html %>%
    html_node(xpath='//div[text()="Building Sqft.:"]') %>%
    html_node(xpath='../div[2]') %>%
    html_node('#divBldgsqft1') %>%
    html_text() %>%
    gsub(' /Appraisal District', '', .) %>%
    parse_number()

  lot_size_node <- place_html %>%
    html_node(xpath='//div[text()="Lot Size:"]')

  lot_size <- NA

  if (!is.na(lot_size_node)) {
    lot_size <- lot_size_node %>%
      html_node(xpath='../div[2]') %>%
      html_text() %>%
      gsub(' Sqft. /Appraisal District', '', .) %>%
      parse_number()
  }

  style <- place_html %>%
    html_node(xpath='//div[text()="Style:"]') %>%
    html_node(xpath='../div[2]') %>%
    html_text()

  location <- address  %>%
    gsub('\\#.', '', .) %>%
    trimws() %>%
    geocode(., source='dsk')

  place_data <- list(
    address=address,
    lat=location$lat,
    long=location$lon,
    photo=photos[1],
    price=price,
    url=place_url,
    year=year,
    status=status,
    bedrooms=bedrooms,
    baths=baths,
    size=size,
    lot_size=lot_size,
    style=style
  )

  return(place_data)
}

make_label <- function(place_data) {
  return(paste0(place_data$address, '\n\n', 'Price:', place_data$price))
}

places_data <- places_urls %>%
  map(scrape_for_house) %>%
  bind_rows()

prices <- places_data %>%
  pluck(., 'price')

min_price <- prices %>%
  min()

max_price <- prices %>%
  max()

leaflet(data = places_data) %>% addTiles() %>%
  addCircleMarkers(
    ~long,
    ~lat,
    radius = ~(lot_size %>%
                 is.na() %>%
                 ifelse(0, lot_size)
               )/500,
    color = ~colorNumeric("Blues", domain = (min_price/2000):(max_price/1000 + 1))(price/1000),
    fillOpacity = 1,
    popup = ~paste0(
      '<a href="', url, '">',
        '<img src="', photo, '" width="250"/>',
        '<p>', address, '</p>',
        '<p>$', price, ' for ', size, ' sqft</p>',
        '<p>Lot Size: ', lot_size, ' sqft</p>',
      '</a>'
    ),
    label = ~paste0(address)
  )
