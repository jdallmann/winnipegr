#' Search Data Sets Available from City of Winnipeg Open Data API
#'
#' This function uses the \code{jsonlite} package to get and search/grep current
#' metadata on the data sets available on the City of Winnipeg Open Data site
#' \code{data.winnipeg.ca}. It returns a data frame with descriptions of data, and
#' code to retrieve data sets using get_open_data, or through the open data
#' Socrata API.
#'
#' @importFrom  jsonlite fromJSON
#' @importFrom  dplyr as_tibble
#' @importFrom  dplyr mutate
#' @importFrom  dplyr filter
#' @importFrom  dplyr select
#' @importFrom  magrittr %>%
#' @importFrom  lubridate ymd
#'
#' @export
#'
#' @param contains Optional expression to grep fields in metadata with.
#' @param updated_after Optional date string representing the earliest the
#'     data set being searched has been updated.
#' @param updated_before Optional date string representing the most recent the
#'     data set being searched has been updated.
#' @param issued_after Optional date string representing the earliest the
#'     data set being search could have been initially issued.
#' @param issued_before Optional date string representing the latest the
#'     data set being search could have been initially issued.
#'
#' @return A dataframe containing the open data set(s) matching input parameters.
#'
#' @examples
#' \dontrun{
#'     # Returns all metadata as a data frame
#'     search_open_data()
#'
#'     # Examines data sets whose title or description contains 'trees'
#'     # ignoring case
#'     search_open_data('trees')
#'
#'     # Get recently updated data sets
#'     search_open_data(updated_after = '2019-01-01')
#'
#'     # Return API short codes for searched data sets
#'     search_open_data(contains = 'parking')$identifier[1]
#' }
#'
search_open_data <- function(contains = NA,
                          updated_after = '2015-01-01',
                          updated_before = as.character(Sys.Date()),
                          issued_after  = '2015-01-01',
                          issued_before = as.character(Sys.Date())){
    if(!requireNamespace("jsonlite", quietly = TRUE)){
        stop("The 'jsonlite' package needs to be installed first")
    }

    # Get open data
    openData <-  jsonlite::fromJSON("https://data.winnipeg.ca/data.json?$order=issued%20DESC")


    openData <- dplyr::as_tibble(openData$dataset) %>%
        dplyr::select(title, issued, modified,
                      license, description, identifier,
                      type = `@type`, landingPage,
                      theme, keyword, contactPoint) %>%
        dplyr::mutate(modified = lubridate::ymd(modified),
               issued = lubridate::ymd(issued),
               contactPoint = openData$dataset$contactPoint$fn,
               type = openData$dataset$`@type`,
               identifier = gsub("^.+views/", "", identifier)) %>%
        dplyr::filter(modified >= as.Date(updated_after),
                      modified <= as.Date(updated_before),
                      issued >= as.Date(issued_after),
                      issued <= as.Date(issued_before))

    if(is.na(contains)){
        openData
    } else {
        rows_to_return <- grep(contains, openData$contactPoint, ignore.case = T)
        rows_to_return <- c(rows_to_return,
                            grep(contains, paste(openData$keyword), ignore.case = T))
        rows_to_return <- c(rows_to_return,
                            grep(contains, openData$description, ignore.case = T))
        rows_to_return <- c(rows_to_return,
                            grep(contains, openData$title, ignore.case = T))
        rows_to_return <- c(rows_to_return,
                            grep(contains, openData$theme, ignore.case = T))
        openData[unique(rows_to_return), ]
    }

}
