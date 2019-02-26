#' Mode of transportation characteristics organized by neighbourhoods,
#' neighbourhood clusters, wards, community areas, and custom areas
#' including downtown and the entire city for the City of Winnipeg.
#'
#' @source Statistics Canada via (Winnipeg Open Data)[https://data.winnipeg.ca/].
#' \url{https://data.winnipeg.ca/Census/Census-Mode-Of-Transportation/ijxa-tybv}
#' @format A data frame with 31 columns:
#' \describe{
#'  \item{bicycle_X}{People of type X who travel via bicycle.}
#'  \item{boundary_name}{...}
#'  \item{boundary_number}{...}
#'  \item{boundary_type}{...}
#'  \item{car_X}{People of type X who travel via car.}
#'  \item{census_year}{...}
#'  \item{motorcycle_X}{People of type X who travel via motorcycle}
#'  \item{other_X}{People of type X who travel via other means.}
#'  \item{passenger_X}{People of type X who travel via passenger.}
#'  \item{public_X}{People of type X who travel via public transport.}
#'  \item{taxi_X}{People of type X who travel via taxi.}
#'  \item{total}{...}
#'  \item{total_X}{Total in group X.}
#'  \item{walk_X}{People of type X who walk as means of transportation.}
#' }
#' @examples
#' \dontrun{
#'  transport_mode
#' }
"transport_mode"
