# winnipegr
[![Travis build status](https://travis-ci.org/jdallmann/winnipegr.svg?branch=master)](https://travis-ci.org/jdallmann/winnipegr) 

This R package provides an abstraction layer for easily accessing openly available data sets for Winnipeg, MB, Canada. 


## Installation

In the future, you will be able to install the released version of winnipegr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("winnipegr")
```

But, for now you need to use `devtools`:
``` r
install.packages("devtools")
devtools::install_github("jdallmann/winnipegr")
```

## Retrieving Data
The package includes the following functions for downloading open data:

- `wpg_weather` for sourcing Winnipeg weather from stations from: Winnipeg 'CXWI', Winnipeg Forks 'CXWN', and Winnipeg International Airport 'CYWG'.
- `get_WPA_Stations` for sourcing available WPA parking station variables such as `available_space`, `hourly_rate`, `timelimit`, location, and others.
- `get_open_data` a wrapper for calling City of Winnipeg open data (https://data.winnipeg.ca/) using descriptive data set identifiers. This includes particularly rich Traffic Signal Inventory (TSI) data. The data is provided under [the Open Government Licence – Canada](https://open.canada.ca/en/open-government-licence-canada). Available options include: 
    + "parking"
    + "2018 polling geoms"
    + "air quality"
    + "tax parcels"
    + "trees"
    + "building permits"
    + "plow schedule" 
    + "parking bans"
    + "parks"
    + "park assets"
    + "council expenses"
    + "public notices"
    + "mosquito traps"
    + "address coords"
    + "permit details"
    + "burials"
    + "dispositions"
    + "311"
    + "lane closures"
    + "by-law investigations"
    + "collection days" 
    + "311 channels"
    + "school enrolments"
    + "river levels"
    + "waste tonnage"
    + "web analytics
    + "river James"
    + "contravention"
    + "TSI-cameras detail"
    + "TSI-pole and cabinet locations"
    + "TSI-locations"
    + "TSI-corridor box indications detail"
    + "TSI-corridor boxes detail"
    + "TSI-heads (displays) detail"
    + "TSI-hardware detail"
    + "TSI-pole and arms detail"
    + "TSI-bases detail trans"
    + "TSI-traffic signal malfunctions"
    + "TSI-traffic signal damage"
    + "TMC-confirmed incidents"
    + "transport mode"
    + "TMC-confirmed incidents"
    + "parking citations" 
    + "ticket adjudication results".
    + "transit on-time"
    + "transit on-time hist"
    + "transit pass-ups"

The package also contains internal fixed data sets. Load these data sets in the usual way `data(transport_mode)`. Currently included data sets:

- `transport_mode` Mode of transportation data from Statistics Canada's 2016 Census. (See: [City of Winnipeg open data](https://dev.socrata.com/foundry/data.winnipeg.ca/ijxa-tybv).)
- `census_commute_2019` Census commute data from Statistics Canada for Winnipeg CMA 2019 with sf geography at the DA level.


## Examples
### `wpg_weather`
This function uses the `reim` package to load Winnipeg
weather abstracting station names. Measurements have the option to 
be converted to metric using the `weathermetrics` package.

``` r
\dontrun{
    wpg_weather(station = "forks",
        start = '2018-01-01',
        end = '2018-02-28',
        metric = TRUE)
    wpg_weather(station = "airport",
        start = '2018-01-01')
}
```


### `get_open_data`
This function uses the \code{RSocrata} package to get Winnipeg
City data from the Winnipeg Open Data site \code{data.winnipeg.ca}.
Users with a City of Winnipeg open data account can also use their
login credentials to have full (non-throttled) access to the API.
``` r
\dontrun{
    get_open_data("parking", app_token = SOME_API_TOKEN,
    email = FAKE_EMAIL,
    password = FAKE_PASSWORD)
\dontrun{
    get_open_data("river James")
}
```
