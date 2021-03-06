% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{census_DA_2019}
\alias{census_DA_2019}
\title{Key Winnipeg demographics information for DAs with shapefiles.
Data is at the finest geographical resolution
(Dissemination Area---DA) available.}
\format{A data frame with 13 columns:
\describe{
\item{shape_area}{Area in kms^2.}
\item{type}{Geography type/granularity. Dissemination area.}
\item{dwellings}{Dwellings.}
\item{households}{Households.}
\item{geo_uid}{Unique DA indentifier.}
\item{population}{Population.}
\item{cd_uid}{CD identifier.}
\item{csd_uid}{DSG identifier.}
\item{ct_uid}{CT identifier.}
\item{cma_uid}{CMA (Winnipeg) identifier.}
\item{region_name}{Region name.}
\item{area_sq_km}{Area_sq_km.}
\item{geometry}{Geometrical boudary in sfc multipolygon format.}
\item{}{}
}}
\source{
Statistics Canada via [cancensus](https://mountainmath.github.io/cancensus/articles/cancensus.html) package.
\url{https://cran.r-project.org/web/packages/cancensus/index.html}
}
\usage{
census_DA_2019
}
\description{
Key Winnipeg demographics information for DAs with shapefiles.
Data is at the finest geographical resolution
(Dissemination Area---DA) available.
}
\examples{
\dontrun{
 census_DA_2019
}
}
\keyword{datasets}
