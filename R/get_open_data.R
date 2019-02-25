#' City of Winnipeg Open Data API
#'
#' This function uses the \code{RSocrata} package to get Winnipeg
#' City data from the Winnipeg Open Data site \code{data.winnipeg.ca}.
#' Users with a City of Winnipeg open data account can also use their
#' login credentials to have full (non-throttled) access to the API.
#'
#' @importFrom RSocrata read.Socrata
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
#'     levels (\code{"river James"}), vehicle for hire contravention
#'     (\code{"contravention"}).
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
get_open_data <- function(type = c("parking", "2018 polling geoms",
                                   "air quality", "tax parcels",
                                   "trees", "building permits",
                                   "plow schedule", "parking bans",
                                   "parks", "park assets",
                                   "council expenses", "public notices",
                                   "mosquito traps", "address coords",
                                   "permit details", "burials",
                                   "dispositions", "311",
                                   "lane closures"),
                          app_token = NA,
                          email = NA,
                          password  = NA,
                          ...){
    type <- match.arg(type)
    if('RSocrata' %in% rownames(installed.packages()) == FALSE){
        stop("The 'RSocrata' package needs to be installed first")
    }

    if(type == "parking"){
        datasetID <- "c2m5-vayh"
    } else if(type == "2018 polling geoms"){
        datasetID <- "7cfr-9tgh"
    } else if(type == "air quality"){
        datasetID <- "f5p2-7r36"
    } else if(type == "tax parcels"){
        datasetID <- "94a6-v8ue"
    } else if(type == "trees"){
        datasetID <- "d3jk-hb6j"
    } else if(type == "building permits"){
        datasetID <- "m4wt-mqkb"
    } else if(type == "plow schedule"){
        datasetID <- "mfzv-893p"
    } else if(type == "parking bans"){
        datasetID <- "tix9-r5tc"
    } else if(type == "parks"){
        datasetID <- "tug6-p73s"
    } else if(type == "park assets"){
        datasetID <- "9qbp-pngj"
    } else if(type == "council expenses"){
        datasetID <- "mgde-4fua"
    } else if(type == "public notices"){
        datasetID <- "gnxp-9hpt"
    } else if(type == "mosquito traps"){
        datasetID <- "du7c-8488"
    } else if(type == "address coords"){
        datasetID <- "w4xz-nc35"
    } else if(type == "permit details"){
        datasetID <- "5uac-hgtk"
    } else if(type == "burials"){
        datasetID <- "iibp-28fx"
    } else if(type == "dispositions"){
        datasetID <- "qevm-pxyq"
    } else if(type == "311"){
        datasetID <- "9w2n-uhf9"
    } else if (type == "by-law"){
        datasetID <- "eye3-guud"
    } else if (type == "collection days"){
        datasetID <- "6rcy-9uik"
    } else if (type == "311 channels"){
        datasetID <- "485c-dk3k"
    } else if (type == "school enrolments"){
        datasetID <- "ukha-ify8"
    } else if (type == "river levels"){
        datasetID <- "tgrf-v2zc"
    } else if (type == "waste tonnage"){
        datasetID <- "fgza-8s5e"
    } else if (type == "river James"){
        datasetID <- "q8w3-jhjb"
    } else if (type == "contravention"){
        datasetID <- "rzfe-3um4"
    } else{
        datasetID <- type
    }


    jsonID <- paste0("https://data.winnipeg.ca/resource/",
                     datasetID,
                     ".json")
    if(is.na(app_token)){
        RSocrata::read.socrata(jsonID)
    } else {
        RSocrata::read.socrata(jsonID,
                               app_token = app_token,
                               email = email,
                               password = password)
    }

}
