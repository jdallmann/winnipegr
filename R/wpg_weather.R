#' Winnipeg Weather
#'
#' This function uses the \code{reim} package to load Winnipeg
#' weather abstracting station names. Measurements can be
#' converted to metric using \code{meathermetrics}
#'
#' @importFrom riem riem_measures
#' @importFrom weathermetrics fahrenheit.to.celsius inches_to_metric
#' @importFrom magrittr %>%
#' @importFrom dplyr mutate rename
#'
#' @export
#'
#' @param station a Winnipeg weather station name in English
#' @param start the start date of the weather period
#' @param end the end date of the weather period
#' @param metric whether the output should be in metric
#'
#' @return hourly Winnipeg weather data set including precipitation
#'    and temperature
#'
#' @examples
#' \dontrun{
#'     wpg_weather(station = "forks",
#'                 start = '2018-01-01',
#'                 end = '2018-02-28',
#'                 metric = TRUE)
#'     wpg_weather(station = "airport",
#'                 start = '2018-01-01')
#' }
#'
wpg_weather <- function(station = c("wpg", "forks", "airport"),
                        start = as.character(Sys.Date() - 365),
                        end = as.character(Sys.Date()),
                        metric = TRUE){
    station <- match.arg(station)
    if('riem' %in% rownames(installed.packages()) == FALSE){
        stop("The 'riem' package needs to be installed first")
    }

    if('riem' %in% rownames(installed.packages()) == FALSE){
        stop("The 'weathermetrics' package needs to be installed first")
    }
    if(station == "wpg"){
        station <- "CXWI"
    } else if(station == "forks"){
        station <- "CXWN"
    } else {
        station <- "CYWG"
    }

    weather <- riem::riem_measures(station,
                                   date_start = start,
                                   date_end = end) %>%
        rename(date = valid,
               precip = p01i,
               tmp = tmpf)

    if(metric == TRUE){
        weather <- weather %>%
            mutate(tmp = weathermetrics::fahrenheit.to.celsius(tmp),
                   precip = weathermetrics::inches_to_metric(precip, unit = "mm"))

    }

    return(weather)
}
