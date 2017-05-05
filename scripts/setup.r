
#' Assign the variable `setup_packages` a function as follows:
#+ eval=FALSE
setup_packages <- function(){
  
#' `c` is a function that means "concatenate".  In this case, we are concatenating multiple strings
#' into a data structure known as a vector in R.
#' 
#' Assign to `packages_workshop` a vector of packages used in the workshop.
#+ eval=FALSE
  packages_workshop <- c('rvest')
#' Also, assign to `packages_utils` a vector of packages being used in this setup script only.
#+ eval=FALSE
  packages_utils <- c('purrr')
  
#' The `installed.packages` function returns a dataframe of packages that are installed.
#' Assign to `installed_packages_as_vector` a vector of installed packages by name.
#+ eval=FALSE
  installed_packages_as_vector <- installed.packages()[,"Package"]

#' `setdiff` is a nifty function that can get the differences between things, such as two vectors.
#' Any element in the first argument that's missing from the second will be returned in a vector.
#' 
#' First, we concatenate the two vectors of packages that need to be installed.
#' Then, we get the difference of packages needed from what is already installed.
#' `packages_to_install` is assigned the difference.
#+ eval=FALSE
  packages_to_install <- setdiff(c(packages_workshop, packages_utils), installed_packages_as_vector)
  
#' If there is more than 0 packages to install,
#+ eval=FALSE
  if(length(packages_to_install) > 0){
    
#' put a nice message in the console,
#+ eval=FALSE
    message(paste0("Installing ", packages_to_install))
    
#' and then install them!
#+ eval=FALSE
    install.packages(packages_to_install)
  }
}

#' Assign to `setup_for_workshop` a function as follows:
#+ eval=FALSE
setup_for_workshop <- function(){
#' Assign to `working_path` our path for the workshop.
#+ eval=FALSE
  working_path <- './intro-to-web-scraping-201705'
  source_url_path <- 'https://raw.githubusercontent.com/HoustonUseRs/intro-to-web-scraping/master/'
  
#' Call the functions we previously defined.
#+ eval=FALSE
  setup_packages()

#' Create a directory if it doesn't already exist.
#+ eval=FALSE
  dir.create(file.path(working_path), showWarnings = FALSE)  
#' `setwd` sets our working directory to the `working_path`.
#+ eval=FALSE
  setwd(working_path)

#' Put a nice message in the console.
#+ eval=FALSE
  message(paste0("Setting our working directory to ", working_path))
  
#' Just something silly.
#+ eval=FALSE
  writeLines(readLines(paste0(source_url_path, 'scripts/congrats-cat.txt')))
}

#' Call the full setup function.
#+ eval=FALSE
setup_for_workshop()
