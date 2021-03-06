library(WaterML)

services <- GetServices()

test_result <- data.frame(server=character(0), sites_download_time=numeric(0), sites_download_status=character(0),
                          sites_parse_time=numeric(0), sites_parse_status=character(0),
                          num_sites=numeric(0), random_site_code=character(0),
                          stringsAsFactors=FALSE)


#special case: add the new NWISDV service
urls <- services$url
urls[length(urls)+1] <- "http://qa-hiscentral20.cloudapp.net/water1flow_DV/cuahsi_1_1.asmx"

for (i in 1:length(urls)) {
  server <- urls[i]

  if(nrow(test_result[test_result$server==server,]) > 0) {
    next
  }

  sites <- GetSites(server)
  sites_download_time <- attr(sites, "download.time")
  sites_download_status <- attr(sites, "download.status")
  sites_parse_time <- attr(sites, "parse.time")
  sites_parse_status <- attr(sites, "parse.status")
  random_site_code <- NA
  num_sites <- nrow(sites)
  if (num_sites > 0) {
    random_site_code <- sample(sites$FullSiteCode, size=1)
  }
  new_row <- c(server, as.numeric(sites_download_time),
                      sites_download_status,
                      as.numeric(sites_parse_time),
                      sites_parse_status,
                      num_sites, random_site_code)
  test_result[nrow(test_result)+1,] <- new_row
}
write.csv(test_result, "tests/getsites_test.csv")
