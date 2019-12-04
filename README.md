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
    + "web analytics"
    + "river james"
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
    + "ticket adjudication results"
    + "transit on-time"
    + "transit on-time hist"
    + "transit pass-ups"
    + "fipa requests"
    + "capex"
    + "survey parcel"
    + "boundary"
    + "population"
    
- `get_transit` provies a wrapper for making calls to the [Winnipeg Transit APIs](https://api.winnipegtransit.com/home/api/v3), and flattens the result into a tidy dataframe. Requires an API key available from [https://api.winnipegtransit.com/home/api/v3](https://api.winnipegtransit.com/home/api/v3). Currently available API `type` options include:
    + "stops" for returning stops near a specified location

The package also contains internal fixed data sets. Load these data sets in the usual way `data(transport_mode)`. Currently included data sets:

- `transport_mode` Mode of transportation data from Statistics Canada's 2016 Census. (See: [City of Winnipeg open data](https://dev.socrata.com/foundry/data.winnipeg.ca/ijxa-tybv).)
- `census_commute_2019` Census commute data from Statistics Canada for Winnipeg CMA 2019 at the DA level. Downloaded using von Bergmann, Shkolnik and Jacobs' [cancensus](https://mountainmath.github.io/cancensus/) package v0.2.0 on 2019-10-01.
- `wpg_electoral_wards_2018` Winnipeg electoral wards following 2018 election with shapefile geometries.
- `neighbourhoods_2017` Boundaries of neighbourhood characterization areas (aka NCA) used to delineate neighbourhoods for city planning purposes.
- `active_trans_ntwk_2019` Boundaries and data for Winnipeg's active transport cycling network.
- `census_demo_2019` Data for key Winnipeg demographics information (100% data and total data from Statistics Canada). Data is at the finest geographical resolution (Dissemination Area---DA) available. Admittedly not complete, and based on variables of interest in my work. Downloaded using von Bergmann, Shkolnik and Jacobs' [cancensus](https://mountainmath.github.io/cancensus/) package v0.2.0 on 2019-10-01.
- `census_DA_2019` Boundary shape file with id for Statistics Canada 2019 DA data. Downloaded using von Bergmann, Shkolnik and Jacobs' [cancensus](https://mountainmath.github.io/cancensus/) package v0.2.0 on 2019-10-01.
- `crime_aug_2019` Winnipeg police crime statistics pulled on 2019-12-02 from [here](https://www.winnipeg.ca/police/crimestat/viewMap.stm).
- `yrly_crime_2018` Statistics Canada. Table 35-10-0181-01   Incident-based crime statistics, by detailed violations, police services in Winnipeg, Manitoba. Pulled on 2019-12-02 from DOI: [https://doi.org/10.25318/3510018101-eng](https://doi.org/10.25318/3510018101-eng).


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
This function uses the `RSocrata` package to get Winnipeg
City data from the Winnipeg Open Data site `data.winnipeg.ca`.
Users with a City of Winnipeg open data account can also use their
login credentials to have full (non-throttled) access to the API.
``` r
\dontrun{
    get_open_data("parking", app_token = SOME_API_TOKEN,
    email = FAKE_EMAIL,
    password = FAKE_PASSWORD)
\dontrun{
    get_open_data("river james")
}
```

### `get_transit`
This function uses the `rjson` package to get Winnipeg
City Transit data from the [Winnipeg Transit API v3](https://api.winnipegtransit.com/home/api/v3/services/variants). 
It also flattens that data from json to a tidy dataframe. 
Users must have registered for their own (free) API key to use.
``` r
\dontrun{
    get_transit(option_vec = c("lat=49.8951",
                "lon=-97.1384", "distance=1000",
                "walking=true", "usage=short"),
                api_key = transit_API)
}
```
