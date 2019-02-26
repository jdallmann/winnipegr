#' Winnipeg WPA Paystations
#'
#' This function uses the \code{RSocrata} package to get Winnipeg
#' WPA Paystation data from the Winnipeg Open Data site
#' \code{data.winnipeg.ca}.
#'
#' @import RSocrata
#'
#' @export
#'
#' @return A dataframe containing data for all WPA parking
#'     stations in Winnipeg such as \code{available_space},
#'     \code{hourly_rate}, \code{timelimit}, location, and
#'     others.
#'
#' @examples
#' \dontrun{
#'     get_WPA_stations()
#' }
#'
#'

get_WPA_stations <- function(){
    # library(RSocrata)
    if(!requireNamespace("RSocrata", quietly = TRUE)){
        stop("The 'RSocrata' package needs to be installed first")
    }
    read.socrata(
        "https://data.winnipeg.ca/resource/c2m5-vayh.json"
    )
}
