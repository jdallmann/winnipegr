#' Mode of transportation characteristics organized by neighbourhoods,
#' neighbourhood clusters, wards, community areas, and custom areas
#' including downtown and the entire city for the City of Winnipeg.
#'
#' @source Statistics Canada via (Winnipeg Open Data)[https://data.winnipeg.ca/].
#' \url{https://data.winnipeg.ca/Census/Census-Mode-Of-Transportation/ijxa-tybv}
#' @format A data frame with 31 columns:
#' \describe{
#'  \item{bicycle_female}{Females who travel via bicycle.}
#'  \item{bicycle_male}{Males who travel via bicycle.}
#'  \item{bicycle_total}{Total who travel via bicycle.}
#'  \item{boundary_name}{...}
#'  \item{boundary_number}{...}
#'  \item{boundary_type}{...}
#'  \item{car_female}{Females who travel via car.}
#'  \item{car_male}{...}
#'  \item{car_total}{...}
#'  \item{census_year}{...}
#'  \item{motorcycle_female}{Females who travel via motorcycle.}
#'  \item{motorcycle_male}{Males who travel via motorcycle.}
#'  \item{motorcycle_total}{Total motorcycle travellers.}
#'  \item{other_female}{Females who travel via other means.}
#'  \item{other_male}{Males who travel via other means.}
#'  \item{other_total}{Total indivuduals traveling via other means.}
#'  \item{passenger_female}{...}
#'  \item{passenger_male}{...}
#'  \item{passenger_total}{...}
#'  \item{public_female}{Females who travel via public transport.}
#'  \item{public_male}{...}
#'  \item{public_total}{...}
#'  \item{taxi_female}{Females who travel via taxi.}
#'  \item{taxi_male}{Males who travel via taxi.}
#'  \item{taxi_total}{Total who travel via taxi.}
#'  \item{total}{...}
#'  \item{total_female}{Total in group female.}
#'  \item{total_male}{Total in group male.}
#'  \item{walk_female}{Females who walk as means of transportation.}
#'  \item{walk_male}{Males who walk as means of transportation.}
#'  \item{walk_total}{Total who walk as means of transportation.}
#' }
#' @examples
#' \dontrun{
#'  transport_mode
#' }
"transport_mode"


#' Census commute data for Winnipeg CMA 2019 with sf geography at the DA level.
#'
#' @source Statistics Canada via (cancensus)[https://mountainmath.github.io/cancensus/articles/cancensus.html] package.
#' \url{https://cran.r-project.org/web/packages/cancensus/index.html}
#' @format A data frame with 26 columns:
#' \describe{
#'  \item{area_km}{Shape area}
#'  \item{dwellings}{Number of dwellings}
#'  \item{households}{Number of households}
#'  \item{population}{Population}
#'  \item{region}{Region name}
#'  \item{leaving_time_total}{v_CA16_5831: Total - Time leaving for work for the employed labour force aged 15 years and over in private households with a usual place of work or no fixed workplace address - 25% sample data}
#'  \item{leaving_time_5}{v_CA16_5834: Between 5 a.m. and 5:59 a.m.}
#'  \item{leaving_time_6}{v_CA16_5837: Between 6 a.m. and 6:59 a.m.}
#'  \item{leaving_time_7}{v_CA16_5840: Between 7 a.m. and 7:59 a.m.}
#'  \item{leaving_time_8}{v_CA16_5843: Between 8 a.m. and 8:59 a.m.}
#'  \item{leaving_time_9to1159}{v_CA16_5846: Between 9 a.m. and 11:59 a.m.}
#'  \item{leaving_time_rest}{v_CA16_5849: Between 12 p.m. and 4:59 a.m.}
#'  \item{commute_mode_total}{v_CA16_5792: Total - Main mode of commuting for the employed labour force aged 15 years and over in private households with a usual place of work or no fixed workplace address - 25% sample data}
#'  \item{commute_mode_driver}{v_CA16_5795: Car, truck, van - as a driver}
#'  \item{commute_mode_passenger}{v_CA16_5798: Car, truck, van - as a passenger}
#'  \item{commute_mode_walked}{v_CA16_5804: Walked}
#'  \item{commute_mode_bicycle}{v_CA16_5807: Bicycle}
#'  \item{commute_mode_public_transit}{v_CA16_5801: Public transit}
#'  \item{commute_mode_other}{v_CA16_5810: Other method}
#'  \item{duration_total}{v_CA16_5813: Total - Commuting duration for the employed labour force aged 15 years and over in private households with a usual place of work or no fixed workplace address - 25% sample data}
#'  \item{duration_lt_15}{v_CA16_5816: Less than 15 minutes}
#'  \item{duration_15to29}{v_CA16_5819: 15 to 29 minutes}
#'  \item{duration_30to44}{v_CA16_5822: 30 to 44 minutes}
#'  \item{duration_45to59}{v_CA16_5825: 45 to 59 minutes}
#'  \item{duration_60plus}{v_CA16_5828: 60 minutes and over}
#'  \item{geometry}{sf geometry for use in sf methods of mapping}
#' }
#' @examples
#' \dontrun{
#'  census_commute_2019
#' }
"census_commute_2019"


#' Winnipeg 2018 Electoral Wards
#'
#' @source (Winnipeg Open Data)[https://data.winnipeg.ca/].
#' \url{https://data.winnipeg.ca/Council-Services/Electoral-Ward/ede3-teb8}
#' @format A data frame with 6 columns:
#' \describe{
#'  \item{councillor}{Self-explanatory.}
#'  \item{name}{Ward name.}
#'  \item{number}{Ward number.}
#'  \item{phone}{Councillor phone number.}
#'  \item{website}{Councillor website.}
#'  \item{geometry}{Shapefile geometry.}
#' }
#' @examples
#' \dontrun{
#'  transport_mode
#' }
"wpg_electoral_wards_2018"


#' Boundaries of neighbourhood characterization areas (aka NCA)
#' as polygons. Neighbourhood characterization areas are used
#' to delineate neighbourhoods for city planning purposes.
#'
#' @source (Winnipeg Open Data)[https://data.winnipeg.ca/].
#' \url{https://data.winnipeg.ca/City-Planning/Neighbourhood/fen6-iygi}
#' @format A data frame with 3 columns:
#' \describe{
#'  \item{id}{Neighbourhood id number.}
#'  \item{name}{Neighbourhood name.}
#'  \item{geometry}{Neighbourhood shapefile geometry.}

#' }
#' @examples
#' \dontrun{
#'  transport_mode
#' }
"neighbourhoods_2017"
