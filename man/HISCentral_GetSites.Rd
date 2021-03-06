% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HISCentral_GetSites.R
\name{HISCentral_GetSites}
\alias{HISCentral_GetSites}
\title{HISCentral_GetSites}
\usage{
HISCentral_GetSites(west = -180, south = -90, east = 180, north = 90,
  serviceID = NULL, keyword = NULL, IncludeServerDetails = TRUE)
}
\arguments{
\item{west}{The west longitude of the geographic
bounding box in decimal degrees. Allowed values are between -180.0 and +180.0}

\item{south}{The south latitude of the geographic
bounding box in decimal degrees. Allowed values are between -90.0 and +90.0}

\item{east}{The east longitude of the geographic
bounding box in decimal degrees. Allowed values are between -180.0 and +180.0}

\item{north}{The north latitude of the geographic
bounding box in decimal degrees. Allowed values are between -90.0 and +90.0}

\item{serviceID}{(optional): The ID of the service on HIS Central. To get the service ID,
use the id column in the output of the GetServices() function.}

\item{keyword}{(optional): The concept keyword (common name of variable) for
searching the sites on HIS Central. Examples include Temperature, Precipitation, Snow Depth,... If the Keyword is not
specified then sites with any variable will be returned.}

\item{IncludeServerDetails}{(optional): If set to TRUE, then the output will
include the servCode and servURL for each site. If set to FALSE, then we assume
that all sites are from the same server and the servURL and servCode are not included.}
}
\value{
a data.frame of sites. The data.frame has the following columns:
\itemize{
\item SiteName: The name of the site
\item SiteCode: A short unique code of the site
\item FullSiteCode: The complete unique code of the site in the format NETWORK:CODE.
              Use this value in the GetSiteInfo and GetValues functions
\item Latitude:  The WGS84 latitude in decimal degrees
\item Longitude: The WGS84 longitude in decimal degrees
\item ServCode: The code of the service in HIS Central. Same as the networkName in
                 the output from GetServices() function.
                 This column is only shown if IncludeServerDetails is TRUE.
\item ServURL:   The URL of the web service for this site as registered in HIS Central.
                 This column is only shown if IncludeServerDetails is TRUE.
}
}
\description{
This function gets the table of sites from the HIS Central catalog
}
\examples{
#Getting all sites from the (14.1E, 49.8N, 14.6E, 50.2N) bounding box from the GLDAS web service
sites <- HISCentral_GetSites(west=14.1, south=49.8, east=14.6, north=50.2, serviceID=262)
}
\keyword{waterml}

