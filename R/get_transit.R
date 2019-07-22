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
#'     "stops", "locations", "service-advisories", "routes",
#'     "streets", "system-messages", "trip-planner", "stop-features",
#'     "schedule", "statuses", "variants".
#' @param api_key Manditory api parameter for users with a city
#'     of Winnipeg Transit API account available at
#'     (https://api.winnipegtransit.com/home/api/v3)
#' @param option_vec Optional vector of options for API call. See
#' (https://api.winnipegtransit.com/home/api/v3) for relevant options.
#' @param stop Required stop parameter for "stop-features" or "schedule"
#' requests.
#' @param route Required route parameter for route "variants" requests.
#' See (https://api.winnipegtransit.com/home/api/v3/services/variants)
#' for possible values.
#' @param ... Additional parameters to pass to the Winnipeg Transit API.
#'
#' @return A dataframe containing the relvant data set.
#'
#' @examples
#' \dontrun{
#'     get_transit(option_vec = c("lat=49.8951,
#'         "lon=-97.1384"", "distance=1000",
#'         "walking=true", "usage=short"),
#'         api_key = transit_API)
#' }
#'
#'
#'
#'
get_transit <- function(option_vec = NA,
                        stop = NA,
                        route = NA, # For use with variants
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
    } else if(type == "variants"){
        paste0("variants/", route, "/destinations")
    } else if(type %in% c("stops", "locations", "service-advisories",
                          "routes", "streets", "system-messages",
                          "trip-planner")){
        type
    }

    api_call <- paste0(
        api_call,
        type_API_str,
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
    } else prsd_json
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
