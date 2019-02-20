#' Winnipeg WPA Paystation
#'
#' This function uses the \code{RSocrata} package to get Winnipeg
#' WPA Paystation data from the Winnipeg Open Data site
#' \code{data.winnipeg.ca}.
#'
#' @importFrom RSocrata read.Socrata
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
get_WPA_stations <- function(){
    RSocrata::read.socrata(
        "https://data.winnipeg.ca/resource/c2m5-vayh.json"
    )
}
