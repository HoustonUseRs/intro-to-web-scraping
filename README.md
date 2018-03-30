Hi,

We're excited you'll be joining us tomorrow for the Intro to Web Scraping Workshop, 10 AM at [Station Houston](https://www.google.com/maps/dir/''/station+houston/data=!4m5!4m4!1m0!1m2!1m1!1s0x8640bf4316cf7ae7:0x777b3c7c5a011a56?sa=X&ved=0ahUKEwjLrqari5PaAhUDRa0KHUD5A_4Q9RcIqAEwDg)!

If you get a chance to, please set up your computer following the instructions below.  If not, or if you run into any trouble at all, join us early between 9 and 10 AM and we'll get you set up and ready to go.

Also, we've included details about finding Station Houston and parking below for first time visitors.

See you there tomorrow!

## Setup

If you've set up for our Intro to R workshop, skip steps 2 and 3.

### Mac

1. [Add to Chrome the Selector Gadget plugin](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb?hl=en)
2. [Download and install R](https://cran.r-project.org/bin/macosx/R-3.4.4.pkg)
3. [Download and install RStudio](https://download1.rstudio.org/RStudio-1.1.442.dmg)
4. Copy and paste this into RStudio, press enter to run

```
install.packages(c('tidyverse'))
working_path <- '~/intro-to-web-scraping-201803'
dir.create(file.path(working_path), showWarnings = FALSE)
setwd(working_path)
```

### Windows

1. [Add to Chrome the Selector Gadget plugin](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb?hl=en)
2. [Download and install R](https://cran.r-project.org/bin/windows/base/R-3.4.4-win.exe)
3. [Download and install RStudio](https://download1.rstudio.org/RStudio-1.1.442.exe)
4. Copy and paste this into RStudio, press enter to run

```
install.packages(c('tidyverse'))
working_path <- '~/intro-to-web-scraping-201803'
dir.create(file.path(working_path), showWarnings = FALSE)
setwd(working_path)
```

### Ubuntu

1. [Add to Chrome the Selector Gadget plugin](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb?hl=en)
2. [Download and install R](https://cran.r-project.org/bin/linux/ubuntu/README.html)
3. [Download and install RStudio](https://download1.rstudio.org/rstudio-1.1.442-amd64.deb)
4. Copy and paste this into RStudio, press enter to run

```
install.packages(c('tidyverse'))
working_path <- '~/intro-to-web-scraping-201803'
dir.create(file.path(working_path), showWarnings = FALSE)
setwd(working_path)
```

## How to find Station

[<strong>Address</strong><br/>Station Houston<br/>1301 Fannin St #2440<br/>Houston, TX 77002](https://www.google.com/maps/dir/''/station+houston/data=!4m5!4m4!1m0!1m2!1m1!1s0x8640bf4316cf7ae7:0x777b3c7c5a011a56?sa=X&ved=0ahUKEwjLrqari5PaAhUDRa0KHUD5A_4Q9RcIqAEwDg)

The Station building entrance is [located on Polk Street](https://www.google.com/maps/@29.7539371,-95.3653969,3a,75y,215.35h,92.01t/data=!3m6!1e1!3m4!1sWXeizZckOW8SmgHA9EMVeA!2e0!7i13312!8i6656). 

![Station entrance](https://houstonusers.github.io/intro-to-web-scraping/assets/station-houston.png)

## Parking

* Street parking is available and unfortunately not free :(.
* The "Green Street" parking structure across the street on Fannin is available.  There are vouchers at Station to reduce the cost to $5.
* The building is about 2 blocks east of the MetroRail Bell Station stop.
