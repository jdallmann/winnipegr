#' Winnipeg Transit API
#'
#' The get_transit function reads in the Winnipeg Transit JSON data
#' the [Winnipeg Transit API v3](https://api.winnipegtransit.com/home/api/v3)
#' and flattens it into a tidy format. The API requires users to register
#' for an API key.
#'
#' @importFrom rjson fromJSON
#' @importFrom purrr reduce
#'
#' @export
#'
#' @param type Specifies with data set to download. Currently supports
#'     WPA parking station data (\code{"parking"}), 2018 election
#'     polling subdivision units (\code{"2018 polling geoms"}), air
#'     quality data (\code{"air quality"}), taxation assessment parcels
#'     (\code{"tax parcels"}), tree inventory (\code{"trees"}), building
#'     permits (\code{"building permits"}), snow plow schedule
#'     (\code{"plow schedule"}), parking ban schedule (\code{"parking bans"}),
#'     parks and open space (\code{"parks"}), park asset inventory
#'     (\code{"park assets"}), council member expenses
#'     (\code{"council expenses"}), (\code{"public notices"}), daily adult
#'     mosquito trap data (\code{"mosquito traps"}), (\code{"address coords"}),
#'     detailed building permit data (\code{"permit details"}), burial records
#'     (\code{"burials"}), public meeting dispositions (\code{"dispositions"}),
#'     311 service requests (\code{"311"}), lane closure
#'     (\code{"lane closures"}), by-law investigations (\code{"by-law"}),
#'     recycling, garbage and yard waste collection days
#'     (\code{"collection days"}), 311 interactions by channel
#'     (\code{"311 channels"}), (\code{"school enrolments"}),
#'     (\code{"river levels"}), residential garbage, recycling and yard waste
#'     tonnage reports (\code{"waste tonnage"}), Winnipeg City open data
#'     and website analytics (\code{"web analytics"}), James Avenue river
#'     levels (\code{"river James"}),
#'     \code{"vehicle for hire contravention"}, \code{"parking citations"},
#'     \code{"ticket adjudication results"}, \code{"TSI-cameras detail"},
#'     \code{"TSI-pole and cabinet locations"}, \code{"TSI-locations"},
#'     \code{"TSI-corridor box indications detail"},
#'     \code{"TSI-corridor boxes detail"},
#'     \code{"TSI-heads (displays) detail"}, \code{"TSI-hardware detail"},
#'     \code{"TSI-pole and arms detail"}, \code{"TSI-bases detail trans"},
#'     \code{"TSI-pole and arms detail"}, \code{"traffic signal malfunctions"},
#'     \code{"TSI-traffic signal damage"}, \code{"transport mode"},
#'     \code{"TMC-confirmed incidents"}, \code{"transit on-time"},
#'     \code{"transit on-time hist"}, \code{"transit pass-ups"}).
#'
#' @param app_token Optional app_token parameter for users with a city
#'     of Winnipeg Open Data account available at
#'     (https://data.winnipeg.ca/)
#' @param email Optional email parameter for users with a city
#'     of Winnipeg Open Data account available at
#'     (https://data.winnipeg.ca/)
#' @param password Optional password parameter for users with a city
#'     of Winnipeg Open Data account available at
#'     (https://data.winnipeg.ca/)
#'
#' @return A dataframe containing the relvant data set.
#'
#' @examples
#' \dontrun{
#'     get_open_data("trees")
#'     get_open_data("parking", app_token = SOME_API_TOKEN,
#'         email = FAKE_EMAIL,
#'         password = FAKE_PASSWORD)
#' }
#'
#'
#'
#'
get_transit <- function(option_vec = NA,
                        stop = NA,
                        type = "stops",
                        api_key = NA,
                        ...){
    if(is.na(api_key)){
        stop("No API key specified.")
    }
    stopifnot(type %in% c("stops"))
    api_call <- "https://api.winnipegtransit.com/v3/"

    type_API_str <- if(type == "stop-features"){
        paste0("stops/", stop, "/features")
    } else if(type == "schedule"){
        paste0("stops/", stop, "/schedule")
    } else if(type == "statuses"){
        "statuses/schedule"
    } else if(type %in% c("stops", "locations", "service-advisories",
                          "routes", "streets", "system-messages",
                          "trip-planner"){
        type
    }

    api_call <- paste0(
        api_call,
        ".json?api-key=",
        api_key,
        "&",
        paste(option_vec, collapse = "&")
    )

    prsd_json <- rjson::fromJSON(
        file = api_call
    )

    if(type == "stops" && !purrr::is_empty(prsd_json[[1]])){
        purrr::reduce(
            lapply(prsd_json[[1]], stop_flatten),
            rbind
        )
    } else if(type == "schedule"){
        # Next step...
    } else NA
}

#' Transit stop data flattener
#'
#' The stop_flatten helper-function flattens JSON from
#' [Winnipeg Transit API v3](https://api.winnipegtransit.com/home/api/v3)
#' into a tidy format.
#'
#' @export
#'
#' @param list is the result of the list that results form
#' parsing the Transit stops JSON data into R.
#'
#' @return A flattend dataframe containing stops data.
#'
#' @examples
#' \dontrun{
#'     stop_flatten(
#'          rjson::fromJSON(<API_call>)
#'          )
#' }
#'

stop_flatten <- function(list){
    data.frame(stop_number = list$key,
               stop_name = list$name,
               direction = list$direction,
               direct_dist = as.numeric(list$distances[[1]]),
               walking_dist = as.numeric(list$distances[[2]]),
               lat = as.numeric(list$centre$geographic[["latitude"]]),
               lon = as.numeric(list$centre$geographic[["longitude"]]),
               stringsAsFactors = FALSE)
}
