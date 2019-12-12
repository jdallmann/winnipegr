winnipegr
[![Travis build status](https://travis-ci.org/jdallmann/winnipegr.svg?branch=master)](https://travis-ci.org/jdallmann/winnipegr) 

This R package provides an abstraction layer for easily accessing openly available data sets for Winnipeg, MB, Canada. 


#Installation

In the future, you will be able to install the released version of winnipegr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("winnipegr")
```

But, for now you need to use `devtools`:
``` r
install.packages("devtools")
devtools::install_github("jdallmann/winnipegr")
```

#Retrieving Data
The package includes the following functions for downloading open data:

- `get_weather` for sourcing Winnipeg weather from stations from: Winnipeg 'CXWI', Winnipeg Forks 'CXWN', and Winnipeg International Airport 'CYWG'.

- `get_WPA_Stations` for sourcing available WPA parking station variables such as `available_space`, `hourly_rate`, `timelimit`, location, and others.

- `get_open_data` a wrapper for calling City of Winnipeg open data (https://data.winnipeg.ca/) using descriptive data set identifiers. The data is provided under [the Open Government Licence – Canada](https://open.canada.ca/en/open-government-licence-canada). The `type` parameter takes any valid Winnipeg Open Data identifier code (usually of the form `7cfr-9tgh`), to search these use `search_open_data`. It is also possible to retrieve some data sets using descriptive tags, available options include:
<!---
    + "2018 polling geoms"
    + "311"
    + "311 channels"
    + "address coords"
    + "air quality"
    + "boundary"
    + "building permits"
    + "burials"
    + "by-law investigations"
    + "capex"
    + "collection days"
    + "contravention"
    + "council expenses"
    + "dispositions"
    + "fipa requests"
    + "lane closures"
    + "mosquito traps"
    + "park assets"
    + "parking"
    + "parking bans"
    + "parking citations"
    + "parks"
    + "permit details"
    + "plow schedule"
    + "population"
    + "public notices"
    + "river james"
    + "river levels"
    + "school enrolments"
    + "survey parcel"
    + "tax parcels"
    + "ticket adjudication results"
    + "TMC-confirmed incidents"
    + "transit on-time"
    + "transit on-time hist"
    + "transit pass-ups"
    + "transport mode"
    + "trees"
    + "TSI-bases detail trans"
    + "TSI-cameras detail"
    + "TSI-corridor box indications detail"
    + "TSI-corridor boxes detail"
    + "TSI-hardware detail"
    + "TSI-heads (displays) detail"
    + "TSI-locations"
    + "TSI-pole and arms detail"
    + "TSI-pole and cabinet locations"
    + "TSI-traffic signal malfunctions"
    + "TSI-traffic signal damage"
    + "waste tonnage"
    + "web analytics"
--->

| WINNIPEG              | OPEN DATA             | TAGS                  |
| ------------          | -----------------     | -----------------     |
|  "2018 polling geoms" |  "park assets"        |  "transit on-time hist"   |
|  "311"                |  "parking"            |  "transit pass-ups"  |
|  "311 channels"       |  "parking bans"       |  "transport mode"   |
|  "address coords"     |  "parking citations"  |  "trees"       |
|  "air quality"        |  "parks"              |  "TSI-bases detail trans"   |
|  "boundary"           |  "permit details"     |  "TSI-cameras detail"
|  "building permits"   |  "plow schedule"      |  "TSI-corridor box indications detail"   |
|  "burials"            |  "population"         |  "TSI-corridor boxes detail"     |
|  "by-law investigations" |  "public notices"  |  "TSI-hardware detail"   |
|  "capex"              |  "river james"        |  "TSI-heads (displays) detail"   |
|  "collection days"    |  "river levels"       |  "TSI-locations"   |
|  "contravention"      |  "school enrolments"  |  "TSI-pole and arms detail"   |
|  "council expenses"   |  "survey parcel"      |  "TSI-pole and cabinet locations"   |
|  "dispositions"       |  "tax parcels"        |  "TSI-traffic signal malfunctions"   |
|  "fipa requests"      |  "ticket adjudication results" |  "TSI-traffic signal damage"   |
|  "lane closures"      |  "TMC-confirmed incidents" |  "waste tonnage"   |
|  "mosquito traps"     |  "transit on-time"    |  "web analytics"  |



  


    
- `get_transit` provies a wrapper for making calls to the [Winnipeg Transit APIs](https://api.winnipegtransit.com/home/api/v3), and flattens the result into a tidy dataframe. Requires an API key available from [https://api.winnipegtransit.com/home/api/v3](https://api.winnipegtransit.com/home/api/v3). Currently available API `type` options include:
    + "stops" for returning stops near a specified location

The package also contains internal fixed data sets. Load these data sets in the usual way `data(transport_mode)`. Currently included data sets:

- `transport_mode` Mode of transportation data from Statistics Canada's 2016 Census. (See: [City of Winnipeg open data](https://dev.socrata.com/foundry/data.winnipeg.ca/ijxa-tybv).)
- `census_commute_2019` Census commute data from Statistics Canada for Winnipeg CMA 2019 at the DA level. Downloaded using von Bergmann, Shkolnik and Jacobs's [cancensus](https://mountainmath.github.io/cancensus/) package v0.2.0 on 2019-10-01.
- `wpg_electoral_wards_2018` Winnipeg electoral wards following 2018 election with shapefile geometries.
- `neighbourhoods_2017` Boundaries of neighbourhood characterization areas (aka NCA) used to delineate neighbourhoods for city planning purposes.
- `active_trans_ntwk_2019` Boundaries and data for Winnipeg's active transport cycling network.
- `census_demo_2019` Data for key Winnipeg demographics information (100% data and total data from Statistics Canada). Data is at the finest geographical resolution (Dissemination Area---DA) available. Admittedly not complete, and based on variables of interest in my work. Downloaded using von Bergmann, Shkolnik and Jacobs' [cancensus](https://mountainmath.github.io/cancensus/) package v0.2.0 on 2019-10-01.
- `census_DA_2019` Boundary shape file with id for Statistics Canada 2019 DA data. Downloaded using von Bergmann, Shkolnik and Jacobs' [cancensus](https://mountainmath.github.io/cancensus/) package v0.2.0 on 2019-10-01.
- `crime_aug_2019` Winnipeg police crime statistics pulled on 2019-12-02 from [here](https://www.winnipeg.ca/police/crimestat/viewMap.stm).
- `yrly_crime_2018` Statistics Canada. Table 35-10-0181-01   Incident-based crime statistics, by detailed violations, police services in Winnipeg, Manitoba. Pulled on 2019-12-02 from DOI: [https://doi.org/10.25318/3510018101-eng](https://doi.org/10.25318/3510018101-eng).


#Examples
##`get_weather`
This function uses the `reim` package to load Winnipeg
weather abstracting station names. Measurements have the option to 
be converted to metric using the `weathermetrics` package.

``` r
\dontrun{
    get_weather(station = "forks",
        start = '2018-01-01',
        end = '2018-02-28',
        metric = TRUE)
    get_weather(station = "airport",
        start = '2018-01-01')
}
```
##`search_open_data`
This function uses the `jsonlite` package to get and search/grep current 
metadata on the data sets available on the City of Winnipeg Open Data site
`data.winnipeg.ca`. It returns a data frame with descriptions of data, and 
code to retrieve data sets using get_open_data, or through the open data Socrata API.
``` r
\dontrun{
    Returns all metadata as a data frame
    search_open_data()

    Examines data sets whose title or description contains 'trees'
    ignoring case
    search_open_data('trees')

    Get recently updated data sets
    search_open_data(updated_after = '2019-01-01')

    Return API short codes for searched data sets
    search_open_data(contains = 'parking')$identifier[1]
}
```

##`get_open_data`
This function uses the `RSocrata` package to get Winnipeg
City data from the Winnipeg Open Data site `data.winnipeg.ca`.
Users with a City of Winnipeg open data account can also use their
login credentials to have full (non-throttled) access to the API.
``` r
\dontrun{
    get_open_data("parking", app_token = SOME_API_TOKEN,
                  email = FAKE_EMAIL,
                  password = FAKE_PASSWORD)
    
    get_open_data("river james")
    
    get_open_data(search_open_data("clerk")$identifier[1])
}
```

##`get_transit`
This function uses the `jsonlite` package to get Winnipeg
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
