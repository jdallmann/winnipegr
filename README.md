# winnipegr

This R package provides an abstraction layer for easily accessing openly available data sets for Winnipeg, MB, Canada. It includes the following functions for downloading data:

- `wpg_weather` for sourcing Winnipeg weather from stations from: Winnipeg 'CXWI', Winnipeg Forks 'CXWN', and Winnipeg International Airport 'CYWG'.
- `get_WPA_Stations` for sourcing available WPA parking station variables such as `available_space`, `hourly_rate`, `timelimit`, location, and others.
- `get_open_data` a wrapper for calling City of Winnipeg open data (https://data.winnipeg.ca/) using descriptive data set identifiers. Available options include: "parking", "2018 polling geoms", "air quality", "tax parcels", "trees", "building permits", "plow schedule", "parking bans", "parks", "park assets", "council expenses", "public notices", "mosquito traps", "address coords", "permit details", "burials", "dispositions", "311", "lane closures".

## Installation

In the future, you will be able to install the released version of winnipegr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("winnipegr")
```

But, for now you need to use `devtools`:
``` r
install_github("jdallmann/winnipegr")
```


## Example `wpg_weather`

Examples to come!

``` r
## basic example code
```

